using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.EntityFrameworkCore;
using T1_Wormhole_2._0._1;
using T1_Wormhole_2._0._1.Models.Database;
using T1_Wormhole_2._0._1.LoginScripts;
using Microsoft.AspNetCore.OData;
using Hangfire;
using Google;
using System.Security.Claims;
using T1_Wormhole_2._0._1.Filter;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddDataProtection();
builder.Services.AddSingleton<IPasswordHasher, PasswordHasher>();
builder.Services.AddScoped<IUserService, UserService>();
builder.Services.AddTransient<IEmailSender, EmailSender>();

builder.Services.AddControllersWithViews().AddOData(options => {
    options.Select()//�D���
           .Filter()//�z��
           .OrderBy()//�Ƨ�
           .Expand()//���p�d��
           .SetMaxTop(100)//�̦h100��
           .Count();//�p��ƶq
}).AddCookieTempDataProvider();

builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
    .AddCookie(option =>
    {
        option.LoginPath = "/Account/Login";
    });



var conStr = builder.Configuration.GetConnectionString("WormHole");

// �[�J Hangfire �A��
builder.Services.AddHangfire(config => config
    .SetDataCompatibilityLevel(CompatibilityLevel.Version_180)
    .UseSimpleAssemblyNameTypeSerializer()
    .UseRecommendedSerializerSettings()
    .UseSqlServerStorage(conStr));
// �[�J Hangfire Server
builder.Services.AddHangfireServer();

//�ҥ� NetTopologySuite
builder.Services.AddDbContext<WormHoleContext>(x =>
    x.UseSqlServer(conStr, sqlOptions => sqlOptions.UseNetTopologySuite()));
//�o�̼g�@�ӧP�w�Ϊ���k�æs�J�b�o��new���ܼƦW�١A�Ψӷ�@�n�J�᪺�{�Ҹ�U�������\�઺�����ܼ�

// �K�[ Session
builder.Services.AddDistributedMemoryCache(); // �ϥΰO����֨��x�s Session
builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromMinutes(20); // Session ���Ĵ� 20 ����
    options.Cookie.HttpOnly = true;
    options.Cookie.IsEssential = true; // �T�O Session Cookie �ŦX GDPR
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();

app.UseStaticFiles();
// �ҥ� Hangfire Dashboard
app.UseHangfireDashboard("/hangfire");
//,new DashboardOptions 
//{
//    Authorization = new[] {new ClaimBaseHangfireDashboardAuthorizationFilter("Admin") }
//});

app.UseRouting();
app.UseSession();
app.UseAuthentication();




app.Use(async (context, next) =>
{
    //try
    //{
        if (context.User.Identity.IsAuthenticated && context.User.FindFirst(ClaimTypes.Role)?.Value == "User")
        {
            var userId = context.User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (!string.IsNullOrEmpty(userId))
            {
                var dbContext = context.RequestServices.GetRequiredService<WormHoleContext>();
                var rewardService = context.RequestServices.GetRequiredService<IUserService>();
                var ConvertUserId = Convert.ToInt32(userId);

                // �ˬd�O�_���s�|��
                var sessionKey = $"Visit_{userId}";
                if (!context.Session.TryGetValue(sessionKey, out _))
                {
                    // ���յo��C����y
                    var GetReward = await rewardService.DailyRewardAsync(ConvertUserId);
                    if (GetReward)
                    {
                        context.Items["RewardMessage"] = "�w��o�C��n�J���y: 2�T����";
                    }
                    // �s�|�ܡA�O���� LoginRecord ��
                    else
                    {
                        var LoginRecord = new LoginRecord
                        {
                            UserId = ConvertUserId,
                            Time = DateTime.UtcNow.AddHours(8)
                        };
                        if (dbContext != null)
                        {
                            dbContext.LoginRecords.Add(LoginRecord);
                            await dbContext.SaveChangesAsync();
                        }
                    }
                    // �]�m Session �аO
                    context.Session.SetString(sessionKey, "Active");


                }
            }
        }
    //}
    //catch (Exception ex)
    //{
        
    //}
    await next();
});

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
