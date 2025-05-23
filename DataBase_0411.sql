USE [master]
GO
/****** Object:  Database [WormHole]    Script Date: 2025/4/11 下午 09:27:01 ******/
CREATE DATABASE [WormHole]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WormHole', FILENAME = N'C:\Users\Tibame\WormHole.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WormHole_log', FILENAME = N'C:\Users\Tibame\WormHole_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WormHole] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WormHole].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WormHole] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WormHole] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WormHole] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WormHole] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WormHole] SET ARITHABORT OFF 
GO
ALTER DATABASE [WormHole] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [WormHole] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WormHole] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WormHole] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WormHole] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WormHole] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WormHole] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WormHole] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WormHole] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WormHole] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WormHole] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WormHole] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WormHole] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WormHole] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WormHole] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WormHole] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WormHole] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WormHole] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WormHole] SET  MULTI_USER 
GO
ALTER DATABASE [WormHole] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WormHole] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WormHole] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WormHole] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WormHole] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WormHole] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WormHole] SET QUERY_STORE = OFF
GO
USE [WormHole]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 2025/4/11 下午 09:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[ArticleID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Type] [bit] NOT NULL,
	[Create time] [datetime] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[WriterID] [int] NULL,
	[ReleaseBy] [int] NULL,
	[Picture] [binary](50) NULL,
 CONSTRAINT [PK_文章列表] PRIMARY KEY CLUSTERED 
(
	[ArticleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticleResponse]    Script Date: 2025/4/11 下午 09:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleResponse](
	[ArticleID] [int] NOT NULL,
	[Comment] [nvarchar](200) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_ArticleResponse] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BO_Managers]    Script Date: 2025/4/11 下午 09:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BO_Managers](
	[ManagerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Team] [nvarchar](50) NULL,
	[Permissions] [int] NULL,
	[Account] [nchar](10) NOT NULL,
	[Password] [nchar](10) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nchar](10) NULL,
	[Language] [nvarchar](50) NULL,
	[Status] [nvarchar](10) NULL,
	[CreateTime] [datetime] NULL,
 CONSTRAINT [PK_BO_Managers] PRIMARY KEY CLUSTERED 
(
	[ManagerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 2025/4/11 下午 09:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[Title] [nvarchar](30) NULL,
	[EventContent] [nvarchar](500) NULL,
	[CreateTime] [smalldatetime] NULL,
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[Marquee] [nvarchar](50) NULL,
	[ManagerID] [int] NOT NULL,
	[Coin] [int] NULL,
	[Obtain] [int] NULL,
	[EventTimeStrat] [smalldatetime] NOT NULL,
	[EventTimeEnd] [smalldatetime] NOT NULL,
	[Type] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_SiteEvent] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventObtain]    Script Date: 2025/4/11 下午 09:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventObtain](
	[ObtainID] [int] NOT NULL,
	[EventID] [int] NOT NULL,
	[ObtainAmount] [int] NULL,
 CONSTRAINT [PK_EventObtain_1] PRIMARY KEY CLUSTERED 
(
	[ObtainID] ASC,
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ForumCoins]    Script Date: 2025/4/11 下午 09:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ForumCoins](
	[CoinID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CoinSource] [nvarchar](50) NOT NULL,
	[AccessTime] [datetime] NOT NULL,
	[CoinAmount] [int] NOT NULL,
	[Status] [nvarchar](10) NULL,
 CONSTRAINT [PK_ForumCoins_1] PRIMARY KEY CLUSTERED 
(
	[CoinID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 2025/4/11 下午 09:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[Account] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[EmailVerificationToken] [nvarchar](max) NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Obtain]    Script Date: 2025/4/11 下午 09:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Obtain](
	[ObtainID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Picture] [binary](50) NULL,
	[Price] [int] NOT NULL,
	[Condition] [nvarchar](50) NOT NULL,
	[ConditionType] [nvarchar](30) NULL,
	[ConditionValue] [int] NULL,
 CONSTRAINT [PK_Obtain] PRIMARY KEY CLUSTERED 
(
	[ObtainID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObtainStatus]    Script Date: 2025/4/11 下午 09:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObtainStatus](
	[ObtainID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Time] [smalldatetime] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_ObtainStatus] PRIMARY KEY CLUSTERED 
(
	[ObtainID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Participation]    Script Date: 2025/4/11 下午 09:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Participation](
	[EventID] [int] NOT NULL,
	[UersID] [int] NOT NULL,
	[JoinTime] [smalldatetime] NOT NULL,
	[Status] [nvarchar](10) NULL,
 CONSTRAINT [PK_EventJoin] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC,
	[UersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 2025/4/11 下午 09:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[PositiveRating] [int] NULL,
	[NegativeRating] [int] NULL,
	[ArticleID] [int] NOT NULL,
	[UserID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 2025/4/11 下午 09:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Nickname] [nvarchar](20) NULL,
	[Sex] [bit] NOT NULL,
	[Phone] [char](10) NOT NULL,
	[Brithday] [date] NOT NULL,
	[Photo] [binary](50) NULL,
	[SignatureLine] [nvarchar](100) NULL,
	[Status] [bit] NOT NULL,
	[Wallet] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserStatus]    Script Date: 2025/4/11 下午 09:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserStatus](
	[ID] [int] NOT NULL,
	[CommentCount] [int] NULL,
	[ReadCount] [int] NULL,
	[PostCount] [int] NULL,
	[Status] [bit] NOT NULL,
	[Level] [int] NOT NULL,
 CONSTRAINT [PK_使用者狀態表] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Article] ON 

INSERT [dbo].[Article] ([ArticleID], [Title], [Type], [Create time], [Content], [WriterID], [ReleaseBy], [Picture]) VALUES (1, N'《艾爾登法環：黃金樹之影》DLC 公開新預告，6 月正式登場！', 0, CAST(N'2025-04-01T11:26:00.000' AS DateTime), N'知名動作 RPG《艾爾登法環》（Elden Ring）即將迎來超大規模 DLC 「黃金樹之影」（Shadow of the Erdtree），官方今日公開全新預告片，揭露更多新敵人與地圖細節。DLC 預計於 2025 年 6 月 20 日 上市，玩家將進一步探索「幽影之地」，挑戰更高難度的戰鬥與傳說級 Boss。', NULL, 1, NULL)
INSERT [dbo].[Article] ([ArticleID], [Title], [Type], [Create time], [Content], [WriterID], [ReleaseBy], [Picture]) VALUES (2, N'《GTA 6》再爆新細節，官方暗示將於 2025 年春季發售', 0, CAST(N'2025-04-02T05:47:00.000' AS DateTime), N'Rockstar Games 今日發佈最新聲明，表示《GTA 6》的開發進度「順利進行」，並暗示遊戲將於 2025 年春季 正式發售。據內部消息透露，本作的地圖規模將是前作《GTA 5》的 兩倍以上，並擁有更加擬真的天氣系統與 NPC 行為 AI，讓玩家沉浸於全新罪惡都市（Vice City）的開放世界冒險。', NULL, 2, NULL)
INSERT [dbo].[Article] ([ArticleID], [Title], [Type], [Create time], [Content], [WriterID], [ReleaseBy], [Picture]) VALUES (3, N'薩爾達傳說：王國之淚》獲得 2024 年 GDC 最佳遊戲大獎！', 0, CAST(N'2025-04-03T02:10:00.000' AS DateTime), N'在剛剛落幕的 2024 年遊戲開發者大會（GDC Awards）上，任天堂的《薩爾達傳說：王國之淚》（The Legend of Zelda: Tears of the Kingdom）勇奪 「年度最佳遊戲」 殊榮。評審團表示，該作憑藉創新的建造系統、自由度極高的探索體驗，以及感人的劇情，再次將動作冒險遊戲推向新的高度。', NULL, 3, NULL)
INSERT [dbo].[Article] ([ArticleID], [Title], [Type], [Create time], [Content], [WriterID], [ReleaseBy], [Picture]) VALUES (4, N'《英雄聯盟》S15 賽季改動公開，全新地圖機制與英雄平衡調整', 0, CAST(N'2025-04-04T18:12:00.000' AS DateTime), N'Riot Games 公布了《英雄聯盟》（League of Legends）2025 年 S15 賽季的重大改動，包括 新地圖機制、裝備更新 和 數位英雄平衡調整。其中，新地圖將引入「動態環境變化」，不同遊戲階段將影響地形與視野戰略。此外，官方預告將推出 全新刺客英雄，並對部分老牌英雄如「易大師」與「卡特蓮娜」進行技能重製，以提升遊戲平衡性。', NULL, 4, NULL)
INSERT [dbo].[Article] ([ArticleID], [Title], [Type], [Create time], [Content], [WriterID], [ReleaseBy], [Picture]) VALUES (5, N'索尼正式公布 PlayStation 6 開發計劃，預計 2027 年推出！', 0, CAST(N'2025-04-05T09:16:00.000' AS DateTime), N'索尼互動娛樂（SIE）今日發表官方公告，正式確認 PlayStation 6 （PS6） 正在開發中，並計畫於 2027 年 發售。據傳，新一代主機將擁有 更強的光線追蹤技術、更快的 SSD 儲存 以及 更強大的 AI 遊戲助手，提升玩家的沉浸體驗。目前 PlayStation 6 仍處於早期開發階段，更多細節將於未來幾年內陸續公布。', NULL, 5, NULL)
INSERT [dbo].[Article] ([ArticleID], [Title], [Type], [Create time], [Content], [WriterID], [ReleaseBy], [Picture]) VALUES (6, N'《艾爾登法環》黃金樹之影 DLC 最強開荒攻略，讓你輕鬆闖蕩幽影之地！', 1, CAST(N'2025-04-03T13:12:00.000' AS DateTime), N'FromSoftware 即將推出《艾爾登法環》DLC「黃金樹之影」，這片全新的幽影之地充滿了未知的強敵與致命陷阱。為了幫助玩家順利開荒，我們整理了以下 必備攻略技巧：開荒重點建議優先升級血量與韌性：DLC 敵人攻擊力普遍偏高，提升生存率是關鍵。收集新武器「幽影騎士長劍」：這把武器具有高基礎攻擊力與特殊戰技「黑炎斬」，前期非常實用。利用環境地形戰鬥：新地圖擁有許多狹窄山道與陷阱，活用滾動與跳躍來規避攻擊。新 Boss「黑焰龍克雷歐」攻略：避免站在它的正前方，側面輸出更安全。注意黑焰噴吐攻擊，可利用場地內的殘骸作掩體。', 4, NULL, NULL)
INSERT [dbo].[Article] ([ArticleID], [Title], [Type], [Create time], [Content], [WriterID], [ReleaseBy], [Picture]) VALUES (7, N'《超級瑪莉歐兄弟 驚奇》終極攻略！5 大技巧助你輕鬆破關', 1, CAST(N'2025-04-04T17:11:00.000' AS DateTime), N'最近沉迷於《超級瑪莉歐兄弟 驚奇》（Super Mario Bros. Wonder），這款遊戲不僅關卡設計創新，還加入了許多有趣的 驚奇花（Wonder Flower）效果，讓遊戲變得更加不可預測！經過多次挑戰，我總結了 5 個實用技巧，幫助大家輕鬆過關、收集 100% 隱藏要素！1. 妥善運用大象變身，輕鬆打破障礙變身為「大象瑪莉歐」後，你可以 用鼻子噴水澆花，還能用身體撞破部分磚塊！有些隱藏道路或特殊道具都需要大象狀態才能取得，所以別忘了多利用這個能力！2. 善用「驚奇花」帶來的關卡變化每個關卡都有驚奇花，但有些觸發後會讓場景變得超混亂（例如地面變成水波、畫面倒轉、甚至直接進入音樂關卡 ）。如果想 100% 完成遊戲，一定要找到 所有驚奇花，這樣才能解鎖更多隱藏道路！小技巧：有些驚奇花是藏在難以發現的地方，例如 沿著看似普通的管道爬上去，或 撞擊某些沒有標記的磚塊。記得多嘗試不同的方式探索！3. 獨特徽章技能，讓冒險更輕鬆！《超級瑪莉歐兄弟 驚奇》加入了「徽章系統」，讓角色擁有特殊能力，例如「壁跳強化」（讓你跳得更高）或「隱形模式」（敵人不會發現你）。推薦徽章：滑翔帽徽章 - 可以長距離滑翔，適合跳躍關卡！連續蹬牆徽章 - 讓你能無限壁跳，不怕掉下去！水中衝刺徽章 - 在水關速度變超快，避免時間拖太久！記得根據關卡選擇適合的徽章，才能更順利通關！4. 關卡中的「隱藏出口」與隱藏關卡有些關卡不只一個出口，必須找到隱藏通道才能解鎖更多地圖！例如：第一世界某個關卡的水管 看似死路，但如果跳進水裡，會發現一條新路線！幽靈屋關卡 裡面常有假牆，試著靠近牆壁看看會不會穿過去！隱藏出口通常會帶你前往 祕密關卡或近路，讓你更快到達下一個世界！5. 善用多人模式，團隊合作更輕鬆這次的《超級瑪莉歐兄弟 驚奇》支援 最多 4 人連線合作，如果有朋友一起玩，許多高難度關卡會變得超簡單！合作技巧：如果同伴掉進洞裡，他會變成小幽靈，快點去碰他讓他復活！有些徽章（例如「爬牆徽章」）可以讓隊友更容易到達高處，幫助找隱藏道具！彼此間多配合，避免互相擠來擠去導致失誤！結語這次的《超級瑪莉歐兄弟 驚奇》真的超好玩，不管是單人挑戰還是跟朋友一起合作，都有滿滿的驚喜！希望這些攻略對大家有幫助，讓你能順利挑戰 100% 全收集！如果還有其他問題，歡迎留言一起討論！', 3, NULL, NULL)
INSERT [dbo].[Article] ([ArticleID], [Title], [Type], [Create time], [Content], [WriterID], [ReleaseBy], [Picture]) VALUES (8, N'《薩爾達傳說 王國之淚》新手必讀攻略：探索、戰鬥與建造技巧', 1, CAST(N'2025-04-05T12:05:00.000' AS DateTime), N'1. 開局資源管理與初期裝備
在剛進入遊戲時，資源有限，以下幾點能幫助你更快適應：

優先收集武器與盾牌：敵人掉落的武器耐久度普遍不高，可以利用「餘料建造」將岩石或尖刺附加在棍棒上，提高耐久與攻擊力。

蒐集食材與烹飪：初期血量低，建議隨時烹煮料理，例如將「蘋果」和「肉類」加熱提升回復效果，或加入「辣椒」來應對寒冷地區。

獲取初期裝備：在初始空島可以取得「破舊防寒衣」，前往寒冷地區時能有效減少體溫下降的影響。

2. 善用「究極手」建造載具
「究極手」是本作最強的創意工具，能幫助玩家建造載具來縮短移動距離。

木筏與風扇：在水域中，可以使用木板與風扇製作簡易船隻，快速橫渡湖泊或河流。

氣球與火焰裝置：結合氣球與火焰裝置，可以製作熱氣球，幫助玩家上升到高處。

四輪載具：利用大輪胎與操控桿，可以製作簡單的地面載具，讓探索更有效率。

3. 善用「倒轉乾坤」解決謎題與戰鬥
「倒轉乾坤」不僅能用來解謎，還能在戰鬥中創造優勢：

應對遠距離攻擊：當敵人射出火焰球或投擲武器時，使用「倒轉乾坤」可以讓攻擊回彈，對敵人造成傷害。

解決機關挑戰：當移動平台或滾動物件阻擋道路時，使用「倒轉乾坤」讓它回到原位，創造通行機會。

應對掉落危機：如果從高處掉落，及時施展「倒轉乾坤」，可以回到安全位置，避免摔死。

4. 打造最強武器與防具
本作的武器耐久度依然是影響戰鬥的關鍵，因此利用「餘料建造」強化裝備至關重要。

強化武器：將「魔像角」附加在武器上，可以提高攻擊力。金屬類材料（如鐵塊）則能提升耐久度。

提升防禦力：在「格魯德地區」可以取得「沙漠勇者套裝」，能有效減少沙漠高溫影響。在「雪山地區」，「防寒裝」能讓玩家在低溫環境下不消耗額外體力。

善用大妖精升級裝備：在世界各地的大妖精處可以使用怪物素材升級裝備，提供更高的防禦力與額外能力，例如「潛行套裝」能降低移動時的聲音，使敵人更難發現。

5. 應對 Boss 戰的關鍵技巧
遊戲中的 Boss 戰需要策略性應對，以下是幾個應對方法：

利用環境優勢：許多 Boss 會在特定環境戰鬥，例如「雷之神殿」的 Boss 會頻繁利用雷電攻擊，建議穿戴防雷裝備並利用絕緣地形作戰。

準備特殊箭矢：火焰箭、冰箭與炸彈箭在 Boss 戰中能提供額外傷害，例如在「水之神殿」，使用冰箭可以有效對抗水屬性敵人。

善用隊友技能：神廟夥伴可以在戰鬥中提供不同能力，例如「希多」的水盾能抵擋一次攻擊，而「尤娜」的蓄力衝刺能迅速造成傷害。

結語
《薩爾達傳說 王國之淚》提供了豐富的探索與戰鬥機制，只要善用「究極手」、「倒轉乾坤」與「餘料建造」，就能更有效率地應對各種挑戰。希望這篇攻略能幫助玩家更順利地闖蕩海拉魯，享受自由探索的樂趣。', 5, NULL, NULL)
INSERT [dbo].[Article] ([ArticleID], [Title], [Type], [Create time], [Content], [WriterID], [ReleaseBy], [Picture]) VALUES (9, N'《GTA 6》搶劫任務全攻略：最佳前置準備與完美執行計畫', 1, CAST(N'2025-04-01T22:49:00.000' AS DateTime), N'《GTA 6》帶來了全新的搶劫系統，玩家可以選擇不同方式執行犯罪行動，影響獎勵與逃亡難度。以下提供搶劫前的準備、最佳隊伍選擇，以及如何確保行動順利完成。

1. 搶劫前的準備
選擇合適的團隊

駭客：負責關閉監視器與降低警報時間，建議選擇高技能駭客，雖然分紅較高，但能減少意外發生的風險。

車手：負責撤離，駕駛技術越高，逃亡過程越順利，推薦使用高性能車輛或摩托車。

槍手：負責掩護，選擇經驗豐富的槍手能提高戰鬥成功率，避免隊員陣亡導致搶劫失敗。

前置任務

勘察目標地點：先行探查銀行或珠寶店內部，確認警衛位置與可能的逃脫路線。

收集武器與載具：準備消音武器以降低聲響，並確保逃亡車輛擁有足夠改裝提升速度與裝甲。

購買變裝道具：如蒙面或保全制服，能讓玩家更容易接近目標，不會被立即發現。

2. 搶劫執行步驟
低調潛入或高調強攻

低調方式：使用變裝潛入，盡量不開槍，快速進入金庫後撤離，適合小規模搶劫。

高調方式：直接持武器攻擊警衛，造成混亂後迅速打開金庫，適合高風險但高回報的行動。

金庫破解與快速取款

使用駭客快速關閉警報，避免吸引太多警力。

保持冷靜輸入密碼或使用爆破工具，確保不浪費過多時間。

撤離與甩開警方

提前準備逃亡路線，如利用下水道、天台或地鐵站躲避警方追捕。

變裝可降低警察搜索範圍，撤退後迅速換車可減少被鎖定的機會。

3. 最佳搶劫地點與獎勵
大銀行：最高回報，但安保等級極高，需要精心策劃。

珠寶店：中等風險，適合快速行動，回報穩定。

毒品倉庫：獎勵與風險取決於倉庫規模，通常涉及幫派衝突。

成功完成搶劫後，確保金錢安全存放，避免在街頭遭遇敵對幫派或警方突襲，這樣才能真正享受戰利品帶來的快感。', 6, NULL, NULL)
INSERT [dbo].[Article] ([ArticleID], [Title], [Type], [Create time], [Content], [WriterID], [ReleaseBy], [Picture]) VALUES (10, N'《艾爾登法環》DLC「黃金樹之影」的難度究竟有多高？', 1, CAST(N'2025-04-02T20:31:00.000' AS DateTime), N'大家最近都進入了《艾爾登法環》的「黃金樹之影」DLC了嗎？這次的敵人攻擊模式比本篇更複雜，Boss 戰幾乎沒有喘息空間，戰鬥節奏極快。不知道大家有沒有遇到哪個 Boss 讓你卡關最久？我目前覺得最難的是「黑焰君王」，他的連續黑炎波動根本沒時間閃避，一個不注意就被秒殺了。而且這次敵人幾乎都有二階段變身，讓戰鬥壓力更大。大家覺得這次的難度相比本篇如何？有沒有推薦的打法或裝備？', 5, NULL, NULL)
INSERT [dbo].[Article] ([ArticleID], [Title], [Type], [Create time], [Content], [WriterID], [ReleaseBy], [Picture]) VALUES (11, N'《GTA 6》的開放世界有多細節？NPC 互動太誇張了', 1, CAST(N'2025-04-04T22:11:00.000' AS DateTime), N'《GTA 6》的世界真的是目前最真實的開放世界之一，不知道大家有沒有發現 NPC 的行為細節變得非常豐富？我在遊戲裡隨便找了一家超市，結果看到店員下班後換上便服走進酒吧，喝完酒後還會回家休息。甚至有次在公路上撞到一台車，車主居然打電話報警，然後還對著警察指認我，直接讓我進了局子。這些細節讓整個城市的沉浸感大幅提升。大家有沒有發現什麼超有趣的 NPC 行為？還是有什麼意想不到的細節讓你驚艷？', 7, NULL, NULL)
INSERT [dbo].[Article] ([ArticleID], [Title], [Type], [Create time], [Content], [WriterID], [ReleaseBy], [Picture]) VALUES (12, N'《薩爾達傳說 王國之淚》究極手的創意發明分享', 1, CAST(N'2025-04-03T23:59:11.000' AS DateTime), N'《王國之淚》推出後，玩家們的創造力真的無極限，究極手幾乎讓這遊戲變成了一款沙盒遊戲。我最近自己嘗試做了一個飛行戰艦，裝上幾台風扇跟火焰發射器，結果還真的可以在空中戰鬥。看了其他玩家的作品後，我發現還有人做出變形機器人、戰車，甚至還有可以自動運作的農場系統，真的超誇張。大家有沒有自己做過什麼有趣的機械，或者有看到什麼讓你驚訝的創意發明？', 8, NULL, NULL)
INSERT [dbo].[Article] ([ArticleID], [Title], [Type], [Create time], [Content], [WriterID], [ReleaseBy], [Picture]) VALUES (13, N'《暗黑破壞神 4》賽季更新後職業平衡怎麼樣？', 1, CAST(N'2025-04-03T23:59:10.000' AS DateTime), N'這次《暗黑破壞神 4》的新賽季更新後，各職業的平衡似乎有了不小的變化。我自己是主玩死靈法師的，發現這次的召喚物流派變得更強了，骷髏兵存活率提升，而且傷害也變高了。但法師玩家好像就沒這麼幸運，聽說冰法的控制效果被削弱，導致輸出環境變差了。不知道大家覺得這次更新後最強的職業是什麼？有沒有哪個流派值得嘗試？', 9, NULL, NULL)
INSERT [dbo].[Article] ([ArticleID], [Title], [Type], [Create time], [Content], [WriterID], [ReleaseBy], [Picture]) VALUES (14, N'《決勝時刻：現代戰域》現在的作弊問題到底有沒有改善？', 1, CAST(N'2025-04-04T16:04:00.000' AS DateTime), N'這款遊戲的外掛問題一直是玩家詬病的問題，官方雖然一直在強調強化反外掛系統，但最近玩了一陣子，還是會遇到不少開透視或自瞄的玩家。尤其是在高分段排位賽，有時候明明躲在掩體後，還是會莫名被爆頭，讓人懷疑到底是技術太強還是有問題。不知道大家最近的遊戲體驗如何？官方這次的反外掛更新真的有幫助嗎？', 3, NULL, NULL)
INSERT [dbo].[Article] ([ArticleID], [Title], [Type], [Create time], [Content], [WriterID], [ReleaseBy], [Picture]) VALUES (15, N'《碧血狂殺 2》的線上模式還有救嗎？', 1, CAST(N'2025-04-01T07:11:00.000' AS DateTime), N'當年《碧血狂殺 2》推出線上模式時，大家對它的期待非常高，結果 Rockstar 好像根本不打算持續更新，導致遊戲模式變得越來越冷清。現在進入線上模式，很多伺服器都沒什麼玩家，活動獎勵也沒有太大變化，甚至還有不少外掛橫行。相比之下，《GTA Online》還是不斷有新內容，讓人覺得官方完全放棄了《碧血狂殺 2》的多人模式。大家覺得這款遊戲的線上模式還有救嗎？還是已經變成一款只能懷舊的遊戲了？', 10, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Article] OFF
GO
SET IDENTITY_INSERT [dbo].[ArticleResponse] ON 

INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (1, N'終於來了！！ 這次的幽影之地感覺超神秘，光看預告就知道 Boss 肯定變態強 6 月 20 號直接請假開刷！', 1, 10, CAST(N'2025-04-01T13:06:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (1, N'FromSoftware 又要逼我們受苦了（興奮） 期待新的戰技、武器還有更多碎片故事，黃金律法的秘密應該會有更深的解答吧？', 2, 11, CAST(N'2025-04-01T17:49:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (1, N'等這麼久終於有新內容了！希望這次的 DLC 不只是高難度折磨玩家，也能補完更多劇情細節，讓黃金樹的世界觀更完整。', 3, 12, CAST(N'2025-04-02T08:16:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (1, N'時間過得真快，還記得當初熬夜打碎星拉塔恩，轉眼又要迎來新挑戰了。希望這次幽影之地的探索感能更上一層樓！', 4, 3, CAST(N'2025-04-05T21:01:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (2, N'終於有確切時間了！！2025 春季，感覺還是有點遙遠，但只要是 Rockstar，我願意等！', 5, 4, CAST(N'2025-04-02T05:47:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (2, N'從《GTA 5》等到現在，這代應該是 Rockstar 的巔峰之作了吧？希望劇情、角色塑造能更上一層樓！', 6, 5, CAST(N'2025-04-02T09:04:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (2, N'地圖變大很棒，但更期待 AI 和互動細節能帶來更真實的沉浸感，讓這個開放世界真正『活起來』', 7, 6, CAST(N'2025-04-02T22:47:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (2, N'地圖兩倍大？這下真的要住進罪惡都市了　希望可以和朋友一起體驗更真實的開放世界！', 8, 7, CAST(N'2025-04-03T02:20:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (2, N'拜託千萬不要再延期啊！這麼多新技術，光想像就超興奮，GTA Online 也一定會更狂吧！', 9, 9, CAST(N'2025-04-04T15:07:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (2, N'看著 GTA 一路進化，這次的技術突破真的令人期待。希望不只是畫面進步，遊戲玩法和故事深度也能有驚喜！', 10, 4, CAST(N'2025-04-07T23:10:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (3, N'不意外！這遊戲自由度真的超高，隨便玩個幾百小時都不會膩，當年度最佳當之無愧！', 11, 10, CAST(N'2025-04-03T04:31:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (3, N'薩爾達又贏了！任天堂真的太猛了，能讓一款單機遊戲這麼有創意，其他廠商要加油啊', 12, 11, CAST(N'2025-04-03T06:18:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (3, N'這作的建造系統真的神，能自己發明各種玩法，難怪會拿年度最佳，完全實至名歸！', 13, 12, CAST(N'2025-04-03T14:10:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (3, N'薩爾達系列又一次證明了玩法創新的重要性，王國之淚不只是延續，更是突破，這個獎太應該了！', 14, 3, CAST(N'2025-04-05T18:48:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (3, N'玩這款遊戲時，真的會沉浸在海拉魯世界好幾個月，光是探索和解謎的樂趣就值回票價！', 15, 4, CAST(N'2025-04-08T00:03:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (3, N'任天堂果然是遊戲業界的標竿，能夠一次次推出這麼優秀的作品，證明好遊戲不只是畫面，更是創意與體驗。', 16, 5, CAST(N'2025-04-09T22:05:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (4, N'玩了這麼多年 LOL，每次大改都讓人又期待又怕受傷害 但看到易大師重製，這次應該真的有在認真調整平衡了？', 17, 6, CAST(N'2025-04-04T19:55:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (4, N'動態地圖感覺超刺激，打團戰會更燒腦了！但拜託 Riot 不要亂改卡特，不然我真的要哭了', 18, 7, CAST(N'2025-04-04T20:02:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (4, N'哇！新地圖還會變來變去，好酷啊！希望我最喜歡的英雄不要被削太慘', 19, 10, CAST(N'2025-04-05T04:11:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (4, N'新地圖機制聽起來很有趣，應該會讓比賽更有變數，但希望 Riot 這次的裝備更新不要又搞出什麼超級破壞平衡的東西…', 20, 9, CAST(N'2025-04-06T22:15:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (5, N'PS6 真的來了！雖然 PS5 還沒玩膩，但 2027 年感覺也不算太遠，好奇這次會有什麼真正顛覆性的改變！', 21, 12, CAST(N'2025-04-05T20:23:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (5, N'從第一代 PlayStation 玩到現在，每次新主機的進步都讓人驚艷，希望 PS6 不只是硬體提升，遊戲內容也能帶來更多創新。', 22, 3, CAST(N'2025-04-06T01:06:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (5, N'2027 年…希望到時候我還有時間打電動 不過更快的 SSD 和 AI 助手聽起來不錯，期待看看會怎麼改變遊戲體驗。', 23, 6, CAST(N'2025-04-08T07:08:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (6, N'這攻略太實用了！DLC 敵人攻擊力又變高，看來血量跟韌性真的得先拉起來，不然進幽影之地就是被秒殺的命', 24, 9, CAST(N'2025-04-03T22:41:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (6, N'幽影騎士長劍+黑炎斬感覺很帥，前期就有強力武器真的太香了，開局第一件事就是去找它！', 25, 4, CAST(N'2025-04-04T00:02:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (6, N'黑焰龍克雷歐感覺會是這次的惡夢級 Boss，黑焰噴吐聽起來就超難躲…希望場地內的掩體夠用，不然肯定是團滅現場', 26, 7, CAST(N'2025-04-07T13:27:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (7, N'這次《超級瑪莉歐兄弟 驚奇》的關卡設計真的充滿驚喜，希望這些小技巧能幫助大家順利通關！如果你們發現了更多隱藏出口或有有趣的玩法，歡迎一起交流，讓我們一起探索這款神作的所有細節！', 27, 3, CAST(N'2025-04-04T20:45:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (7, N'這攻略太有幫助了！之前一直找不到隱藏出口，沒想到有些水管跟假牆裡面真的有秘密，回去再試試！', 28, 9, CAST(N'2025-04-04T17:40:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (7, N'這遊戲真的滿滿童年回憶，沒想到還有這麼多隱藏要素！感謝整理，假日就來挑戰 100% 完成度！', 29, 12, CAST(N'2025-04-05T06:01:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (7, N'驚奇花的效果真的超狂，每次觸發都讓關卡變超不一樣 看到攻略才知道有些藏得那麼隱密，感謝分享！', 30, 3, CAST(N'2025-04-07T10:21:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (8, N'這篇攻略總結得很到位，尤其是『倒轉乾坤』的運用，戰鬥中簡直是逆轉乾坤！能把敵人的遠距離攻擊反彈回去，真的能給 Boss 戰帶來不小的幫助。', 31, 11, CAST(N'2025-04-05T12:46:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (8, N'我一直覺得『究極手』太難用了，但這篇攻略裡面講得很清楚，特別是氣球和火焰裝置的搭配，聽起來好像可以飛上去，那我應該再去練練看！', 32, 4, CAST(N'2025-04-05T16:15:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (8, N'關於『究極手』的建造技巧也寫得很好，特別是木筏與風扇的搭配，我以前完全沒想到可以用這個來跨越水域。這樣的創意真的為遊戲增添了不少樂趣。', 33, 11, CAST(N'2025-04-06T00:02:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (8, N'謝謝攻略！特別是Boss戰的建議，我一開始都被那些強力攻擊搞得很頭痛，後來用冰箭對水屬性Boss，真的事半功倍，省了不少時間。', 34, 9, CAST(N'2025-04-06T02:45:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (8, N'工作忙沒時間，每次玩幾小時都覺得進展慢，但這篇攻略教的載具和環境互動技巧，讓我可以更有效率的移動和挑戰，感覺遊戲體驗更順暢了！', 35, 3, CAST(N'2025-04-06T08:15:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (8, N'打 Boss 戰的技巧對我幫助超大！原來可以這樣利用『倒轉乾坤』反擊敵人，這讓我多打了幾個 Boss，還順便收集了好多道具，太棒了！', 36, 10, CAST(N'2025-04-07T01:55:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (9, N'這篇攻略對於準備搶劫任務非常全面，尤其是在隊伍選擇方面，駭客和車手的選擇至關重要，我每次選擇高技能的駭客都能成功減少警報時間，讓計劃更順利。對於高風險的高調搶劫，我也同意需要快速攻擊並盡量製造混亂，這樣能更快打開金庫。逃亡部分，確保準備好撤退路線真的很關鍵，尤其是利用下水道或天台這些意外通道，能有效躲避警方圍堵。如果再加上一些隊友間的默契合作，這樣的搶劫幾乎無往不利！', 37, 3, CAST(N'2025-04-05T10:09:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (11, N'我也注意到了！其實除了那種自然的行為，遊戲裡的警察也讓我印象深刻。有一次我在高速公路上超速，被警察追捕時，不但警察會追逐，還會透過無線電通知其他警員設置路障，讓逃脫變得更加困難。這些細節讓我有時候真的會花上好一段時間觀察 NPC，像是在現實中一樣，真的讓這個世界活了過來！', 38, 4, CAST(N'2025-04-05T02:45:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (11, N'這些細節真的讓我每次進遊戲都感覺像是進入了一個真實的城市！有一次我在市區逛街，看到一個 NPC 邊走邊看手機，差點撞到一棵樹。這樣的小事都做得很真實，甚至比我工作時穿梭在都市的感覺還真實。這些細節真的是讓忙碌的我得到片刻放鬆的最佳途徑！', 39, 9, CAST(N'2025-04-08T12:30:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (12, N'我最驚訝的是那些自動農場的創作！有玩家用究極手將風扇和水管組合在一起，做出一個自動灌溉系統，完全不需要手動干預，就能定期收穫。這種自動化的想法真是太聰明了，完全是沙盒遊戲的精神。', 40, 7, CAST(N'2025-04-04T03:09:01.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (12, N'我也做過一個自動化的機械裝置，利用究極手建造了一個超級重型的攻城塔，裝上了多個箭塔和火焰發射器，還設置了自動巡邏的機構，敵人根本無法靠近我。我甚至還在塔頂放了兩個氣球，讓它在空中懸浮，簡直像是空中堡壘。這種創造力無限的玩法真是太有趣了！', 41, 5, CAST(N'2025-04-04T06:03:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (12, N'我最近試著做了一台變形機器人，利用氣球和大輪胎的組合，竟然能夠在地面和空中自由切換，還能夠用手臂擊退敵人。看到其他玩家也做了類似的機器人，還能進行組隊作戰，這讓我更覺得究極手的自由度真的超越了我的想像。', 42, 10, CAST(N'2025-04-05T13:54:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (12, N'我最近也做了一個簡單的飛行器，雖然不能像那些大型戰艦那麼華麗，但飛行的過程中可以放鬆心情，感覺像是在現實中解壓。下班後玩這個簡單的創作，真的能讓我暫時忘記工作的壓力，太有趣了。', 43, 3, CAST(N'2025-04-06T05:10:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (12, N'我最近試著做了一台可以自動運行的賽車，利用風扇和火焰裝置來控制它的速度，還有跳躍裝置來避開障礙。雖然還有些不穩定，但每次開起來都超有成就感！這款遊戲讓我對機械設計充滿了興趣，還想挑戰更大的創作！', 44, 12, CAST(N'2025-04-09T04:59:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (12, N'我做了一台像迷你飛行器的東西，除了能飛行，還能發射冰箭和火焰箭！上次跟朋友對戰時，用它來進行空中轟炸，完全碾壓他。雖然現在還有很多問題（例如總是飛不穩），但這讓我覺得這遊戲超有創意，無聊的時候就會想動手試著改造。', 45, 9, CAST(N'2025-04-09T20:28:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (13, N'我也是玩死靈法師的，這次更新真的讓召喚流派變得非常強大！骷髏兵的存活率提升讓我在打團戰時更有保障，搭配上其他強力的亡靈技能，簡直能將敵人淹沒。不過，法師的確變得比較難打，特別是冰法的控制效果被削弱，導致我這幾場對抗法師時有些吃力。對我來說，死靈法師現在確實是最穩的選擇。', 46, 6, CAST(N'2025-04-04T03:21:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (13, N'這次的更新對某些職業的確帶來了很大的影響，像是聖騎士和野蠻人的坦克能力變強了，特別是在PVE中，聖騎士可以打得很穩，防禦能力幾乎不怕傷害。而對於法師來說，削弱的確讓冰法的表現下降，但我覺得火法還是非常強勢，尤其是火焰爆發的輸出非常高，還能快速清怪。', 47, 3, CAST(N'2025-04-04T06:19:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (13, N'我玩的是野蠻人，這次更新後，坦克的能力強化讓我在組隊副本裡更有優勢了，特別是一些高難度的副本，不容易被秒殺。雖然我不是那種高強度PVP玩家，但PVE的表現很穩定，還能配合隊友造成不錯的支援，這樣下班後玩起來比較輕鬆。', 48, 7, CAST(N'2025-04-04T07:19:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (13, N'從職業對抗角度來看，這次死靈法師的增強對比其他職業來說是過於強勢，尤其在高分段對局中，選擇召喚流法師已經成為一個必須考慮的戰術選擇。法師的削弱顯然對PVP有影響，冰法的控制減少讓我在對抗過程中需要更精確的技巧，火法雖然可以彌補這一點，但對於一些高操作要求的玩家來說，還是有些吃力。', 49, 9, CAST(N'2025-04-05T03:19:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (13, N'我本來是玩弓箭手的，但這次更新讓我轉向了死靈法師，召喚流派的確有點太強了，特別是在對抗高強度怪物時，骷髏兵的存活率大幅提升，我可以專心輸出，隊友也不會太容易被擊倒。每天忙碌工作後，這樣的遊戲體驗真的是解壓的好選擇。', 50, 10, CAST(N'2025-04-05T22:14:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (13, N'我一開始玩法師，主要是玩冰法，但是這次控制效果被削弱後，發現法師的輸出大幅降低，特別是面對多怪時，簡直有點難打。我嘗試過死靈法師的召喚流派，發現召喚骷髏兵的玩法真的是太好玩了，不需要自己上前硬拼，完全是遠程操作。我打算再多練幾個角色看看。', 51, 4, CAST(N'2025-04-06T05:13:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (13, N'我其實是新手玩家，玩的是野蠻人，這次更新對我來說是個好消息，因為坦克職業變強了，現在在副本中能更好地保護隊友，對我這種不太擅長操作的玩家來說，簡單穩定的玩法最適合了。等我再練一段時間，可能會轉死靈法師試試看！', 52, 5, CAST(N'2025-04-07T09:01:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (13, N'就我目前的實戰經驗來看，這次更新對比起來，死靈法師的確是最強的一個職業，尤其是召喚流派的強化讓它在團隊中非常有優勢。控制流的法師的削弱讓我有些失望，但如果搭配火法來組合，還是能找到不錯的發揮點。在高端對戰中，死靈法師現在已經成為主流選擇。', 53, 6, CAST(N'2025-04-08T22:09:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (13, N'我主要是玩法師，這次冰法的削弱讓我有點失望，尤其是原本靠控制來打出傷害的打法變得不太有效。不過，我也嘗試了火法，發現其實火法的輸出能力非常高，尤其是配合群體傷害技能，清怪的速度更快了。雖然還是希望冰法能稍微強化，但換個流派還是可以有不錯的體驗。', 54, 11, CAST(N'2025-04-09T10:11:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (14, N'真的很生氣！我都不懂為什麼官方一直說有在加強反外掛系統，結果每次高分段排位還是會遇到開透視或自瞄的玩家！明明我才躲在掩體後面，還是莫名其妙被爆頭，根本沒法玩得開心！這樣的遊戲體驗真的讓人失望，根本沒在做事！我快氣死了，為什麼不乾脆封掉那些作弊的玩家！', 55, 10, CAST(N'2025-04-06T11:32:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (14, N'其實這個問題一直以來都困擾著不少玩家，尤其是在高分段，外掛問題比較常見。官方確實做了一些反外掛更新，但效果似乎有限，因為作弊者也在不斷地進化。從我自己的經驗來看，儘管有些外掛玩家會被處理，但要完全清除這些問題還需要更多的時間與努力。我個人建議，大家還是要提高警覺，保持冷靜，不要讓這些不公平的情況破壞遊戲體驗，最好是向官方反映，集體反映的聲音比較有可能引起重視。', 56, 4, CAST(N'2025-04-07T21:07:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (10, N'這個 DLC 真的是太難了吧！我也卡在黑焰君王那裡，根本沒有時間喘息，反應慢了一秒就直接被秒掉了，超級氣！他變身後攻擊更狠，根本就沒有生還的機會。根本沒辦法像本篇那樣輕鬆過關，真的是超級難度！希望能有更多的提示或者可以直接跳過這一關的選項。', 57, 11, CAST(N'2025-04-02T22:18:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (10, N'作為一個職業玩家，這次的 DLC 讓我感受到了無比的挑戰，特別是在面對黑焰君王時。他的黑炎波動和二階段變身對反應速度的要求非常高，根本不能犯錯。我推薦使用高爆發的近戰攻擊，並配合能避免傷害的瞬間技能，這樣可以有效對抗他的攻擊。這次的難度提升無疑是對技巧和反應的挑戰，也是測試操作極限的一部分。', 58, 6, CAST(N'2025-04-02T22:46:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (10, N'這個 DLC 完全挑戰了我的耐性，尤其是黑焰君王。像我這樣忙碌的上班族，根本沒太多時間訓練技巧，所以只能反覆嘗試不同的武器和策略。最推薦的是帶上高防的盾牌，避免不必要的傷害，然後搭配一些高爆發的魔法來對抗這個快速變化的 Boss。希望官方能對難度做點調整，對我們這些沒太多時間練習的玩家來說，實在有點太難了。', 59, 7, CAST(N'2025-04-03T00:13:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (10, N'老實說，這次的 DLC 真的是讓我大呼過癮，也讓我重拾挑戰的激情。雖然我工作忙，但下班後總是能在遊戲裡找到紓壓的快感。黑焰君王確實強得過分，不過我換上了高防禦的裝備，搭配盾牌，稍微能應付一點。他的二階段變身真的是讓人措手不及，還得不停調整策略。希望能有更多類似的挑戰，讓人上癮！', 60, 12, CAST(N'2025-04-03T09:28:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (10, N'年紀大了反應比較慢，這次的 DLC 確實讓我有些吃力，尤其是面對黑焰君王那麼快速的攻擊，實在有點應付不過來。不過，我發現保持冷靜，利用盾牌格擋是有效的，但還是覺得變化太快，真的是老玩家的挑戰。雖然難度增加，但也算是個不錯的挑戰，會讓我想多試幾次。', 61, 3, CAST(N'2025-04-03T12:34:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (10, N'完全同感，黑焰君王真的是我卡關最久的，覺得自己每次都已經熟悉他的招式，結果還是被秒殺。試過好多不同的武器和技能搭配，終於找到了用遠程攻擊和高防禦裝備來應對，這樣稍微能撐久點，但還是很難啊。這次的 DLC 真的讓我有點挫敗感。', 62, 10, CAST(N'2025-04-03T20:01:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (10, N'這次的 DLC 確實對於操作精細度要求高，尤其是黑焰君王的攻擊節奏完全沒有喘息空間。我個人使用的是快速反應型裝備，並且結合一些瞬間移動的技能來應對，這樣就能在二階段變身時能快速反擊。他的攻擊力確實很強，對我來說，保持快速的反應是關鍵。這次更新的難度對高端玩家來說是挑戰，也讓比賽更具觀賞性。', 63, 5, CAST(N'2025-04-04T06:06:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (10, N'我也是卡在黑焰君王那裡。對我來說，最有效的辦法是保持高敏捷，避免近距離對抗。用雙手弓箭不僅能在遠距離消耗他的血量，還能避開他的黑炎攻擊，當他變身後，則可以用範圍技能控制場面。最重要的是要注意在戰鬥中，保持冷靜，不要被他的高速度擊中。', 64, 9, CAST(N'2025-04-05T14:29:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (10, N'同樣是卡在黑焰君王那裡，這個 Boss 簡直讓我崩潰！尤其是他那二階段變身後，攻擊速度直接加快，根本沒辦法停下來喘息。雖然我換了弓箭遠程攻擊，但還是很難避免被那個黑炎波動打中。真的是進步太快，我這種新手玩家都快被打得失去信心了，有沒有人能給點更好的建議？', 65, 11, CAST(N'2025-04-06T15:37:00.000' AS DateTime))
INSERT [dbo].[ArticleResponse] ([ArticleID], [Comment], [ID], [UserID], [CreateTime]) VALUES (10, N'這次的 DLC 難度上升對我來說有些太高了，尤其是黑焰君王的攻擊快得讓我難以反應過來。作為一個年紀比較大的玩家，我試著用重型裝備來提高生存機會，還是得耐心慢慢來。儘管這樣的遊戲讓我很有成就感，但也希望能有些調整讓我們這些年長的玩家不至於因為反應慢而卡住。', 66, 4, CAST(N'2025-04-09T00:24:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ArticleResponse] OFF
GO
SET IDENTITY_INSERT [dbo].[BO_Managers] ON 

INSERT [dbo].[BO_Managers] ([ManagerID], [Name], [Team], [Permissions], [Account], [Password], [Email], [PhoneNumber], [Language], [Status], [CreateTime]) VALUES (1, N'JG', NULL, NULL, N'Borneol   ', N'Borneol   ', N'a1991818@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[BO_Managers] ([ManagerID], [Name], [Team], [Permissions], [Account], [Password], [Email], [PhoneNumber], [Language], [Status], [CreateTime]) VALUES (2, N'TOP', NULL, NULL, N'Sam       ', N'Sam       ', N'fantasy871014@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[BO_Managers] ([ManagerID], [Name], [Team], [Permissions], [Account], [Password], [Email], [PhoneNumber], [Language], [Status], [CreateTime]) VALUES (3, N'MID', NULL, NULL, N'Amy       ', N'Amy       ', N's94265555@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[BO_Managers] ([ManagerID], [Name], [Team], [Permissions], [Account], [Password], [Email], [PhoneNumber], [Language], [Status], [CreateTime]) VALUES (4, N'AD', NULL, NULL, N'AhDuon    ', N'AhDuon    ', N'cychung1120@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[BO_Managers] ([ManagerID], [Name], [Team], [Permissions], [Account], [Password], [Email], [PhoneNumber], [Language], [Status], [CreateTime]) VALUES (5, N'SUP', NULL, NULL, N'Alissa    ', N'Alissa    ', N'yuanniekiki@gmail.com', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[BO_Managers] OFF
GO
SET IDENTITY_INSERT [dbo].[Event] ON 

INSERT [dbo].[Event] ([Title], [EventContent], [CreateTime], [EventID], [Marquee], [ManagerID], [Coin], [Obtain], [EventTimeStrat], [EventTimeEnd], [Type]) VALUES (N'攻略徵文活動', NULL, NULL, 1, NULL, 2, NULL, NULL, CAST(N'2025-04-06T10:00:00' AS SmallDateTime), CAST(N'2025-04-13T10:00:00' AS SmallDateTime), N'徵文活動')
INSERT [dbo].[Event] ([Title], [EventContent], [CreateTime], [EventID], [Marquee], [ManagerID], [Coin], [Obtain], [EventTimeStrat], [EventTimeEnd], [Type]) VALUES (N'2025母親節活動', NULL, NULL, 2, NULL, 3, NULL, NULL, CAST(N'2025-05-01T10:00:00' AS SmallDateTime), CAST(N'2025-05-11T10:00:00' AS SmallDateTime), N'徵文活動')
INSERT [dbo].[Event] ([Title], [EventContent], [CreateTime], [EventID], [Marquee], [ManagerID], [Coin], [Obtain], [EventTimeStrat], [EventTimeEnd], [Type]) VALUES (N'2025聖誕節活動', NULL, NULL, 3, NULL, 4, NULL, NULL, CAST(N'2025-12-24T10:00:00' AS SmallDateTime), CAST(N'2025-12-25T23:59:00' AS SmallDateTime), N'留言活動')
INSERT [dbo].[Event] ([Title], [EventContent], [CreateTime], [EventID], [Marquee], [ManagerID], [Coin], [Obtain], [EventTimeStrat], [EventTimeEnd], [Type]) VALUES (N'2026線上跨年活動參與', NULL, NULL, 4, NULL, 5, NULL, NULL, CAST(N'2025-12-31T11:30:00' AS SmallDateTime), CAST(N'2026-01-01T00:30:00' AS SmallDateTime), N'留言活動')
SET IDENTITY_INSERT [dbo].[Event] OFF
GO
INSERT [dbo].[EventObtain] ([ObtainID], [EventID], [ObtainAmount]) VALUES (5, 1, 1)
INSERT [dbo].[EventObtain] ([ObtainID], [EventID], [ObtainAmount]) VALUES (6, 2, 1)
INSERT [dbo].[EventObtain] ([ObtainID], [EventID], [ObtainAmount]) VALUES (7, 3, 1)
INSERT [dbo].[EventObtain] ([ObtainID], [EventID], [ObtainAmount]) VALUES (8, 4, 1000)
GO
SET IDENTITY_INSERT [dbo].[ForumCoins] ON 

INSERT [dbo].[ForumCoins] ([CoinID], [UserID], [CoinSource], [AccessTime], [CoinAmount], [Status]) VALUES (1, 3, N'攻略徵文活動參與', CAST(N'2025-04-13T12:00:00.000' AS DateTime), 5, N'已發放')
INSERT [dbo].[ForumCoins] ([CoinID], [UserID], [CoinSource], [AccessTime], [CoinAmount], [Status]) VALUES (2, 7, N'攻略徵文活動參與', CAST(N'2025-04-13T12:00:00.000' AS DateTime), 5, N'已發放')
INSERT [dbo].[ForumCoins] ([CoinID], [UserID], [CoinSource], [AccessTime], [CoinAmount], [Status]) VALUES (3, 5, N'攻略徵文活動參與', CAST(N'2025-04-13T12:00:00.000' AS DateTime), 5, N'已發放')
INSERT [dbo].[ForumCoins] ([CoinID], [UserID], [CoinSource], [AccessTime], [CoinAmount], [Status]) VALUES (4, 10, N'攻略徵文活動參與', CAST(N'2025-04-13T12:00:00.000' AS DateTime), 5, N'已發放')
INSERT [dbo].[ForumCoins] ([CoinID], [UserID], [CoinSource], [AccessTime], [CoinAmount], [Status]) VALUES (5, 5, N'攻略徵文活動參與第一名', CAST(N'2025-04-13T12:00:00.000' AS DateTime), 100, N'已發放')
INSERT [dbo].[ForumCoins] ([CoinID], [UserID], [CoinSource], [AccessTime], [CoinAmount], [Status]) VALUES (6, 3, N'2025母親節徵文活動參與', CAST(N'2025-05-13T12:00:00.000' AS DateTime), 5, N'已發放')
INSERT [dbo].[ForumCoins] ([CoinID], [UserID], [CoinSource], [AccessTime], [CoinAmount], [Status]) VALUES (7, 11, N'2025母親節徵文活動參與', CAST(N'2025-05-13T12:00:00.000' AS DateTime), 5, N'已發放')
INSERT [dbo].[ForumCoins] ([CoinID], [UserID], [CoinSource], [AccessTime], [CoinAmount], [Status]) VALUES (8, 6, N'2025母親節徵文活動參與', CAST(N'2025-05-13T12:00:00.000' AS DateTime), 5, N'已發放')
INSERT [dbo].[ForumCoins] ([CoinID], [UserID], [CoinSource], [AccessTime], [CoinAmount], [Status]) VALUES (9, 10, N'2025母親節徵文活動參與', CAST(N'2025-05-13T12:00:00.000' AS DateTime), 5, N'已發放')
INSERT [dbo].[ForumCoins] ([CoinID], [UserID], [CoinSource], [AccessTime], [CoinAmount], [Status]) VALUES (10, 12, N'2025母親節徵文活動參與', CAST(N'2025-05-13T12:00:00.000' AS DateTime), 5, N'已發放')
INSERT [dbo].[ForumCoins] ([CoinID], [UserID], [CoinSource], [AccessTime], [CoinAmount], [Status]) VALUES (11, 11, N'2025母親節徵文活動第一名', CAST(N'2025-05-13T12:00:00.000' AS DateTime), 100, N'已發放')
INSERT [dbo].[ForumCoins] ([CoinID], [UserID], [CoinSource], [AccessTime], [CoinAmount], [Status]) VALUES (12, 3, N'2025聖誕節留言活動參與', CAST(N'2025-05-13T12:00:00.000' AS DateTime), 2, N'已發放')
INSERT [dbo].[ForumCoins] ([CoinID], [UserID], [CoinSource], [AccessTime], [CoinAmount], [Status]) VALUES (13, 6, N'2025聖誕節留言活動參與', CAST(N'2025-12-26T12:00:00.000' AS DateTime), 2, N'已發放')
INSERT [dbo].[ForumCoins] ([CoinID], [UserID], [CoinSource], [AccessTime], [CoinAmount], [Status]) VALUES (14, 10, N'2025聖誕節留言活動參與', CAST(N'2025-12-26T12:00:00.000' AS DateTime), 2, N'已發放')
INSERT [dbo].[ForumCoins] ([CoinID], [UserID], [CoinSource], [AccessTime], [CoinAmount], [Status]) VALUES (15, 12, N'2025聖誕節留言活動參與', CAST(N'2025-12-26T12:00:00.000' AS DateTime), 2, N'已發放')
INSERT [dbo].[ForumCoins] ([CoinID], [UserID], [CoinSource], [AccessTime], [CoinAmount], [Status]) VALUES (16, 11, N'2025聖誕節留言活動參與', CAST(N'2025-12-26T12:00:00.000' AS DateTime), 2, N'已發放')
INSERT [dbo].[ForumCoins] ([CoinID], [UserID], [CoinSource], [AccessTime], [CoinAmount], [Status]) VALUES (17, 5, N'2025聖誕節留言活動參與', CAST(N'2025-12-26T12:00:00.000' AS DateTime), 2, N'已發放')
INSERT [dbo].[ForumCoins] ([CoinID], [UserID], [CoinSource], [AccessTime], [CoinAmount], [Status]) VALUES (18, 9, N'2025聖誕節留言活動第一名', CAST(N'2025-12-26T12:00:00.000' AS DateTime), 100, N'已發放')
INSERT [dbo].[ForumCoins] ([CoinID], [UserID], [CoinSource], [AccessTime], [CoinAmount], [Status]) VALUES (19, 3, N'2026線上跨年活動參與', CAST(N'2026-01-01T01:00:00.000' AS DateTime), 2, N'發放中')
INSERT [dbo].[ForumCoins] ([CoinID], [UserID], [CoinSource], [AccessTime], [CoinAmount], [Status]) VALUES (20, 4, N'2026線上跨年活動參與', CAST(N'2026-01-01T01:00:00.000' AS DateTime), 2, N'發放中')
INSERT [dbo].[ForumCoins] ([CoinID], [UserID], [CoinSource], [AccessTime], [CoinAmount], [Status]) VALUES (21, 5, N'2026線上跨年活動參與', CAST(N'2026-01-01T01:00:00.000' AS DateTime), 2, N'發放中')
INSERT [dbo].[ForumCoins] ([CoinID], [UserID], [CoinSource], [AccessTime], [CoinAmount], [Status]) VALUES (22, 6, N'2026線上跨年活動參與', CAST(N'2026-01-01T01:00:00.000' AS DateTime), 2, N'發放中')
INSERT [dbo].[ForumCoins] ([CoinID], [UserID], [CoinSource], [AccessTime], [CoinAmount], [Status]) VALUES (23, 7, N'2026線上跨年活動參與', CAST(N'2026-01-01T01:00:00.000' AS DateTime), 2, N'發放中')
INSERT [dbo].[ForumCoins] ([CoinID], [UserID], [CoinSource], [AccessTime], [CoinAmount], [Status]) VALUES (24, 8, N'2026線上跨年活動參與', CAST(N'2026-01-01T01:00:00.000' AS DateTime), 2, N'發放中')
INSERT [dbo].[ForumCoins] ([CoinID], [UserID], [CoinSource], [AccessTime], [CoinAmount], [Status]) VALUES (25, 9, N'2026線上跨年活動參與', CAST(N'2026-01-01T01:00:00.000' AS DateTime), 2, N'發放中')
INSERT [dbo].[ForumCoins] ([CoinID], [UserID], [CoinSource], [AccessTime], [CoinAmount], [Status]) VALUES (26, 10, N'2026線上跨年活動參與', CAST(N'2026-01-01T01:00:00.000' AS DateTime), 2, N'發放中')
INSERT [dbo].[ForumCoins] ([CoinID], [UserID], [CoinSource], [AccessTime], [CoinAmount], [Status]) VALUES (27, 11, N'2026線上跨年活動參與', CAST(N'2026-01-01T01:00:00.000' AS DateTime), 2, N'發放中')
INSERT [dbo].[ForumCoins] ([CoinID], [UserID], [CoinSource], [AccessTime], [CoinAmount], [Status]) VALUES (28, 12, N'2026線上跨年活動參與', CAST(N'2026-01-01T01:00:00.000' AS DateTime), 2, N'發放中')
SET IDENTITY_INSERT [dbo].[ForumCoins] OFF
GO
INSERT [dbo].[Login] ([Account], [Password], [Email], [EmailConfirmed], [EmailVerificationToken]) VALUES (N'DonkeyKong', N'', N'DonkeyKong@gmail.com', 1, N'3d02eb67-1221-4fbb-ad47-c9e23712cacb')
INSERT [dbo].[Login] ([Account], [Password], [Email], [EmailConfirmed], [EmailVerificationToken]) VALUES (N'Kirby', N'', N'Kirby@hotmail.com', 1, N'7b71fe55-9f73-44da-8dc0-e228b1778ff3')
INSERT [dbo].[Login] ([Account], [Password], [Email], [EmailConfirmed], [EmailVerificationToken]) VALUES (N'Link', N'', N'Link@gmail.com', 1, N'5e455d75-9191-4eee-ae2e-81689e6a5fbd')
INSERT [dbo].[Login] ([Account], [Password], [Email], [EmailConfirmed], [EmailVerificationToken]) VALUES (N'Luigi', N'', N'Luigi@gmail.com', 1, N'962c7289-374f-4d8b-a579-354307745eee')
INSERT [dbo].[Login] ([Account], [Password], [Email], [EmailConfirmed], [EmailVerificationToken]) VALUES (N'Mario', N'', N'Mario@gmail.com', 1, N'44458243-ee62-44a4-a04e-2fec17811dc6')
INSERT [dbo].[Login] ([Account], [Password], [Email], [EmailConfirmed], [EmailVerificationToken]) VALUES (N'Nessness', N'', N'Nessness@hotmail.com', 1, N'29719152-cdec-4354-9d05-13ee95095131')
INSERT [dbo].[Login] ([Account], [Password], [Email], [EmailConfirmed], [EmailVerificationToken]) VALUES (N'Pikachu', N'', N'Pikachu@hotmail.com', 1, N'f1a36185-9295-4ec0-8b7d-133b5bbd49ce')
INSERT [dbo].[Login] ([Account], [Password], [Email], [EmailConfirmed], [EmailVerificationToken]) VALUES (N'Samus', N'', N'Samus@gmail.com', 1, N'2dc7740d-cdde-4de4-89bd-1fd306387e58')
INSERT [dbo].[Login] ([Account], [Password], [Email], [EmailConfirmed], [EmailVerificationToken]) VALUES (N'Yoshi', N'', N'Yoshi@gmail.com', 1, N'cf3674be-82be-44e0-9aa2-2f416193d6df')
INSERT [dbo].[Login] ([Account], [Password], [Email], [EmailConfirmed], [EmailVerificationToken]) VALUES (N'Zelda', N'', N'Zelda@gmail.com', 1, N'54325e74-dc5a-4f3f-83d9-0e01612628cb')
GO
SET IDENTITY_INSERT [dbo].[Obtain] ON 

INSERT [dbo].[Obtain] ([ObtainID], [Type], [Name], [Picture], [Price], [Condition], [ConditionType], [ConditionValue]) VALUES (1, 1, N'首發者', NULL, 0, N'第一位發文者', NULL, NULL)
INSERT [dbo].[Obtain] ([ObtainID], [Type], [Name], [Picture], [Price], [Condition], [ConditionType], [ConditionValue]) VALUES (2, 1, N'蟲洞新手冒險家', NULL, 0, N'發文5次', NULL, NULL)
INSERT [dbo].[Obtain] ([ObtainID], [Type], [Name], [Picture], [Price], [Condition], [ConditionType], [ConditionValue]) VALUES (3, 1, N'蟲洞冒險家', NULL, 0, N'發文20次', NULL, NULL)
INSERT [dbo].[Obtain] ([ObtainID], [Type], [Name], [Picture], [Price], [Condition], [ConditionType], [ConditionValue]) VALUES (4, 1, N'蟲洞資深冒險家', NULL, 0, N'發文50次', NULL, NULL)
INSERT [dbo].[Obtain] ([ObtainID], [Type], [Name], [Picture], [Price], [Condition], [ConditionType], [ConditionValue]) VALUES (5, 2, N'攻略王', NULL, 0, N'攻略徵文活動參與第一名', NULL, NULL)
INSERT [dbo].[Obtain] ([ObtainID], [Type], [Name], [Picture], [Price], [Condition], [ConditionType], [ConditionValue]) VALUES (6, 2, N'我阿嬤都比你厲害', NULL, 0, N'2025母親節活動第一名', NULL, NULL)
INSERT [dbo].[Obtain] ([ObtainID], [Type], [Name], [Picture], [Price], [Condition], [ConditionType], [ConditionValue]) VALUES (7, 2, N'Oh Jesus', NULL, 0, N'2025聖誕節活動第一名', NULL, NULL)
INSERT [dbo].[Obtain] ([ObtainID], [Type], [Name], [Picture], [Price], [Condition], [ConditionType], [ConditionValue]) VALUES (8, 2, N'2026 Happy New Year', NULL, 0, N'2026線上活動參與', NULL, NULL)
INSERT [dbo].[Obtain] ([ObtainID], [Type], [Name], [Picture], [Price], [Condition], [ConditionType], [ConditionValue]) VALUES (9, 1, N'揮金如土', NULL, 0, N'花掉10000 coin', NULL, NULL)
INSERT [dbo].[Obtain] ([ObtainID], [Type], [Name], [Picture], [Price], [Condition], [ConditionType], [ConditionValue]) VALUES (10, 3, N'我花了50coin', NULL, 50, N'花50coin', NULL, NULL)
INSERT [dbo].[Obtain] ([ObtainID], [Type], [Name], [Picture], [Price], [Condition], [ConditionType], [ConditionValue]) VALUES (11, 3, N'錢多買個稱號還好吧', NULL, 100, N'花100coin', NULL, NULL)
INSERT [dbo].[Obtain] ([ObtainID], [Type], [Name], [Picture], [Price], [Condition], [ConditionType], [ConditionValue]) VALUES (12, 3, N'我就帥', NULL, 30, N'花30coin', NULL, NULL)
INSERT [dbo].[Obtain] ([ObtainID], [Type], [Name], [Picture], [Price], [Condition], [ConditionType], [ConditionValue]) VALUES (13, 3, N'OAQ', NULL, 10, N'花10coin', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Obtain] OFF
GO
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (1, 3, CAST(N'2025-04-01T07:11:00' AS SmallDateTime), 1)
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (2, 3, CAST(N'2025-05-04T12:28:00' AS SmallDateTime), 1)
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (2, 4, CAST(N'2025-05-11T13:09:00' AS SmallDateTime), 1)
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (2, 5, CAST(N'2025-05-02T12:23:00' AS SmallDateTime), 1)
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (2, 6, CAST(N'2025-05-09T18:28:00' AS SmallDateTime), 1)
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (2, 7, CAST(N'2025-06-04T22:47:00' AS SmallDateTime), 1)
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (2, 10, CAST(N'2025-09-30T22:50:00' AS SmallDateTime), 1)
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (2, 12, CAST(N'2025-07-18T11:32:00' AS SmallDateTime), 1)
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (3, 3, CAST(N'2025-08-21T03:41:00' AS SmallDateTime), 1)
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (3, 5, CAST(N'2025-07-31T07:11:00' AS SmallDateTime), 1)
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (5, 5, CAST(N'2025-04-13T12:00:00' AS SmallDateTime), 1)
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (6, 11, CAST(N'2025-05-11T12:00:00' AS SmallDateTime), 1)
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (7, 9, CAST(N'2025-12-26T12:00:00' AS SmallDateTime), 1)
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (8, 3, CAST(N'2025-12-31T23:52:00' AS SmallDateTime), 1)
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (8, 4, CAST(N'2026-01-01T00:01:00' AS SmallDateTime), 1)
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (8, 5, CAST(N'2025-12-31T23:40:00' AS SmallDateTime), 1)
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (8, 6, CAST(N'2026-01-01T00:01:00' AS SmallDateTime), 1)
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (8, 7, CAST(N'2025-12-31T23:59:00' AS SmallDateTime), 1)
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (8, 8, CAST(N'2025-12-31T23:52:00' AS SmallDateTime), 1)
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (8, 9, CAST(N'2025-12-31T23:44:00' AS SmallDateTime), 1)
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (8, 10, CAST(N'2025-12-31T23:50:00' AS SmallDateTime), 1)
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (8, 11, CAST(N'2025-12-31T23:40:00' AS SmallDateTime), 1)
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (8, 12, CAST(N'2025-12-31T23:43:00' AS SmallDateTime), 1)
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (9, 3, CAST(N'2026-09-30T19:20:00' AS SmallDateTime), 1)
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (10, 3, CAST(N'2025-08-25T15:43:00' AS SmallDateTime), 2)
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (10, 5, CAST(N'2025-05-20T12:00:00' AS SmallDateTime), 1)
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (10, 11, CAST(N'2025-05-20T12:01:00' AS SmallDateTime), 1)
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (11, 3, CAST(N'2025-10-05T09:17:00' AS SmallDateTime), 1)
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (12, 3, CAST(N'2025-06-14T17:17:00' AS SmallDateTime), 2)
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (12, 4, CAST(N'2025-10-15T02:33:00' AS SmallDateTime), 1)
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (12, 6, CAST(N'2025-06-13T13:16:00' AS SmallDateTime), 1)
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (13, 8, CAST(N'2025-08-01T10:04:00' AS SmallDateTime), 1)
INSERT [dbo].[ObtainStatus] ([ObtainID], [UserID], [Time], [Count]) VALUES (13, 9, CAST(N'2025-09-11T09:21:00' AS SmallDateTime), 1)
GO
INSERT [dbo].[Participation] ([EventID], [UersID], [JoinTime], [Status]) VALUES (1, 3, CAST(N'2025-04-06T18:07:00' AS SmallDateTime), NULL)
INSERT [dbo].[Participation] ([EventID], [UersID], [JoinTime], [Status]) VALUES (1, 5, CAST(N'2025-04-06T11:23:00' AS SmallDateTime), NULL)
INSERT [dbo].[Participation] ([EventID], [UersID], [JoinTime], [Status]) VALUES (1, 7, CAST(N'2025-04-07T16:11:00' AS SmallDateTime), NULL)
INSERT [dbo].[Participation] ([EventID], [UersID], [JoinTime], [Status]) VALUES (1, 9, CAST(N'2025-04-12T03:24:00' AS SmallDateTime), NULL)
INSERT [dbo].[Participation] ([EventID], [UersID], [JoinTime], [Status]) VALUES (2, 4, CAST(N'2025-05-10T10:00:00' AS SmallDateTime), NULL)
INSERT [dbo].[Participation] ([EventID], [UersID], [JoinTime], [Status]) VALUES (2, 11, CAST(N'2025-05-08T23:00:00' AS SmallDateTime), NULL)
INSERT [dbo].[Participation] ([EventID], [UersID], [JoinTime], [Status]) VALUES (2, 12, CAST(N'2025-05-11T09:53:00' AS SmallDateTime), NULL)
INSERT [dbo].[Participation] ([EventID], [UersID], [JoinTime], [Status]) VALUES (3, 3, CAST(N'2025-12-25T12:08:00' AS SmallDateTime), NULL)
INSERT [dbo].[Participation] ([EventID], [UersID], [JoinTime], [Status]) VALUES (3, 5, CAST(N'2025-12-25T23:59:00' AS SmallDateTime), NULL)
INSERT [dbo].[Participation] ([EventID], [UersID], [JoinTime], [Status]) VALUES (3, 7, CAST(N'2025-12-24T10:10:00' AS SmallDateTime), NULL)
INSERT [dbo].[Participation] ([EventID], [UersID], [JoinTime], [Status]) VALUES (3, 9, CAST(N'2025-12-24T15:10:00' AS SmallDateTime), NULL)
INSERT [dbo].[Participation] ([EventID], [UersID], [JoinTime], [Status]) VALUES (3, 10, CAST(N'2025-12-24T12:10:00' AS SmallDateTime), NULL)
INSERT [dbo].[Participation] ([EventID], [UersID], [JoinTime], [Status]) VALUES (3, 12, CAST(N'2025-12-25T08:32:00' AS SmallDateTime), NULL)
INSERT [dbo].[Participation] ([EventID], [UersID], [JoinTime], [Status]) VALUES (4, 3, CAST(N'2025-12-31T23:52:00' AS SmallDateTime), NULL)
INSERT [dbo].[Participation] ([EventID], [UersID], [JoinTime], [Status]) VALUES (4, 4, CAST(N'2026-01-01T00:01:00' AS SmallDateTime), NULL)
INSERT [dbo].[Participation] ([EventID], [UersID], [JoinTime], [Status]) VALUES (4, 5, CAST(N'2025-12-31T23:40:00' AS SmallDateTime), NULL)
INSERT [dbo].[Participation] ([EventID], [UersID], [JoinTime], [Status]) VALUES (4, 6, CAST(N'2026-01-01T00:01:00' AS SmallDateTime), NULL)
INSERT [dbo].[Participation] ([EventID], [UersID], [JoinTime], [Status]) VALUES (4, 7, CAST(N'2025-12-31T23:59:00' AS SmallDateTime), NULL)
INSERT [dbo].[Participation] ([EventID], [UersID], [JoinTime], [Status]) VALUES (4, 8, CAST(N'2025-12-31T23:52:00' AS SmallDateTime), NULL)
INSERT [dbo].[Participation] ([EventID], [UersID], [JoinTime], [Status]) VALUES (4, 9, CAST(N'2025-12-31T23:44:00' AS SmallDateTime), NULL)
INSERT [dbo].[Participation] ([EventID], [UersID], [JoinTime], [Status]) VALUES (4, 10, CAST(N'2025-12-31T23:50:00' AS SmallDateTime), NULL)
INSERT [dbo].[Participation] ([EventID], [UersID], [JoinTime], [Status]) VALUES (4, 11, CAST(N'2025-12-31T23:40:00' AS SmallDateTime), NULL)
INSERT [dbo].[Participation] ([EventID], [UersID], [JoinTime], [Status]) VALUES (4, 12, CAST(N'2025-12-31T23:43:00' AS SmallDateTime), NULL)
GO
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 1, 3)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 1, 5)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 2, 10)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 2, 7)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 2, 4)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 3, 11)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 3, 3)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 4, 3)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 4, 10)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 4, 12)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 5, 11)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 5, 3)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 5, 8)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 5, 12)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 5, 9)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 6, 3)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 6, 5)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 6, 11)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 6, 8)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 7, 3)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 7, 10)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 8, 11)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 8, 5)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 8, 3)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 8, 8)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 8, 10)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 9, 3)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 9, 9)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 9, 7)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 10, 3)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 10, 6)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 11, 3)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 11, 4)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 11, 10)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 11, 8)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 11, 7)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 12, 5)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 12, 11)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 13, 3)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 13, 10)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (0, 1, 14, 6)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (0, 1, 14, 3)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 14, 9)
INSERT [dbo].[Rating] ([PositiveRating], [NegativeRating], [ArticleID], [UserID]) VALUES (1, 0, 15, 3)
GO
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([UserID], [Email], [Name], [Nickname], [Sex], [Phone], [Brithday], [Photo], [SignatureLine], [Status], [Wallet]) VALUES (3, N'Mario@gmail.com', N'瑪莉歐', N'Mario', 0, N'0987654321', CAST(N'1981-10-11' AS Date), NULL, NULL, 0, NULL)
INSERT [dbo].[UserInfo] ([UserID], [Email], [Name], [Nickname], [Sex], [Phone], [Brithday], [Photo], [SignatureLine], [Status], [Wallet]) VALUES (4, N'DonkeyKong@gmail.com', N'森喜剛', N'DonkeyKong', 0, N'0980753812', CAST(N'1976-03-24' AS Date), NULL, NULL, 0, NULL)
INSERT [dbo].[UserInfo] ([UserID], [Email], [Name], [Nickname], [Sex], [Phone], [Brithday], [Photo], [SignatureLine], [Status], [Wallet]) VALUES (5, N'Link@gmail.com', N'林克', N'Link', 0, N'0924679463', CAST(N'1976-03-24' AS Date), NULL, NULL, 0, NULL)
INSERT [dbo].[UserInfo] ([UserID], [Email], [Name], [Nickname], [Sex], [Phone], [Brithday], [Photo], [SignatureLine], [Status], [Wallet]) VALUES (6, N'Samus@gmail.com', N'薩姆斯', N'Samus', 0, N'0932749710', CAST(N'1990-09-01' AS Date), NULL, NULL, 0, NULL)
INSERT [dbo].[UserInfo] ([UserID], [Email], [Name], [Nickname], [Sex], [Phone], [Brithday], [Photo], [SignatureLine], [Status], [Wallet]) VALUES (7, N'Yoshi@gmail.com', N'耀西', N'Yoshi', 1, N'0968264046', CAST(N'2000-12-31' AS Date), NULL, NULL, 0, NULL)
INSERT [dbo].[UserInfo] ([UserID], [Email], [Name], [Nickname], [Sex], [Phone], [Brithday], [Photo], [SignatureLine], [Status], [Wallet]) VALUES (8, N'Kirby@hotmail.com', N'卡比', N'Kirby', 1, N'0976994124', CAST(N'2010-10-16' AS Date), NULL, NULL, 0, NULL)
INSERT [dbo].[UserInfo] ([UserID], [Email], [Name], [Nickname], [Sex], [Phone], [Brithday], [Photo], [SignatureLine], [Status], [Wallet]) VALUES (9, N'Pikachu@hotmail.com', N'皮卡丘', N'Pikachu', 0, N'0912864098', CAST(N'1997-05-21' AS Date), NULL, NULL, 0, NULL)
INSERT [dbo].[UserInfo] ([UserID], [Email], [Name], [Nickname], [Sex], [Phone], [Brithday], [Photo], [SignatureLine], [Status], [Wallet]) VALUES (10, N'Luigi@gmail.com', N'路易吉', N'Luigi', 0, N'0987123456', CAST(N'1981-03-14' AS Date), NULL, NULL, 0, NULL)
INSERT [dbo].[UserInfo] ([UserID], [Email], [Name], [Nickname], [Sex], [Phone], [Brithday], [Photo], [SignatureLine], [Status], [Wallet]) VALUES (11, N'Zelda@gmail.com', N'薩爾達', N'Zelda', 1, N'0928593557', CAST(N'2006-07-06' AS Date), NULL, NULL, 0, NULL)
INSERT [dbo].[UserInfo] ([UserID], [Email], [Name], [Nickname], [Sex], [Phone], [Brithday], [Photo], [SignatureLine], [Status], [Wallet]) VALUES (12, N'Nessness@hotmail.com', N'奈斯', N'Ness', 0, N'0926883400', CAST(N'2010-06-28' AS Date), NULL, NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
GO
/****** Object:  Index [IX_ForumCoins]    Script Date: 2025/4/11 下午 09:27:02 ******/
CREATE NONCLUSTERED INDEX [IX_ForumCoins] ON [dbo].[ForumCoins]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Login]    Script Date: 2025/4/11 下午 09:27:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Login] ON [dbo].[Login]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_User_1]    Script Date: 2025/4/11 下午 09:27:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_User_1] ON [dbo].[UserInfo]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ForumCoins] ADD  CONSTRAINT [DF_ForumCoins_AccessTime]  DEFAULT (getdate()) FOR [AccessTime]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_BO_Managers] FOREIGN KEY([ReleaseBy])
REFERENCES [dbo].[BO_Managers] ([ManagerID])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_BO_Managers]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_User] FOREIGN KEY([WriterID])
REFERENCES [dbo].[UserInfo] ([UserID])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_User]
GO
ALTER TABLE [dbo].[ArticleResponse]  WITH CHECK ADD  CONSTRAINT [FK_ArticleResponse_Article] FOREIGN KEY([ArticleID])
REFERENCES [dbo].[Article] ([ArticleID])
GO
ALTER TABLE [dbo].[ArticleResponse] CHECK CONSTRAINT [FK_ArticleResponse_Article]
GO
ALTER TABLE [dbo].[ArticleResponse]  WITH CHECK ADD  CONSTRAINT [FK_ArticleResponse_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserInfo] ([UserID])
GO
ALTER TABLE [dbo].[ArticleResponse] CHECK CONSTRAINT [FK_ArticleResponse_User]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_SiteEvent_BO_Managers] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[BO_Managers] ([ManagerID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_SiteEvent_BO_Managers]
GO
ALTER TABLE [dbo].[EventObtain]  WITH CHECK ADD  CONSTRAINT [FK_EventObtain_Obtain] FOREIGN KEY([ObtainID])
REFERENCES [dbo].[Obtain] ([ObtainID])
GO
ALTER TABLE [dbo].[EventObtain] CHECK CONSTRAINT [FK_EventObtain_Obtain]
GO
ALTER TABLE [dbo].[EventObtain]  WITH CHECK ADD  CONSTRAINT [FK_EventObtain_SiteEvent] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
ALTER TABLE [dbo].[EventObtain] CHECK CONSTRAINT [FK_EventObtain_SiteEvent]
GO
ALTER TABLE [dbo].[ForumCoins]  WITH CHECK ADD  CONSTRAINT [FK_ForumCoins_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserInfo] ([UserID])
GO
ALTER TABLE [dbo].[ForumCoins] CHECK CONSTRAINT [FK_ForumCoins_User]
GO
ALTER TABLE [dbo].[ObtainStatus]  WITH CHECK ADD  CONSTRAINT [FK_ObtainStatus_Obtain] FOREIGN KEY([ObtainID])
REFERENCES [dbo].[Obtain] ([ObtainID])
GO
ALTER TABLE [dbo].[ObtainStatus] CHECK CONSTRAINT [FK_ObtainStatus_Obtain]
GO
ALTER TABLE [dbo].[ObtainStatus]  WITH CHECK ADD  CONSTRAINT [FK_ObtainStatus_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserInfo] ([UserID])
GO
ALTER TABLE [dbo].[ObtainStatus] CHECK CONSTRAINT [FK_ObtainStatus_User]
GO
ALTER TABLE [dbo].[Participation]  WITH CHECK ADD  CONSTRAINT [FK_EventJoin_SiteEvent] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
ALTER TABLE [dbo].[Participation] CHECK CONSTRAINT [FK_EventJoin_SiteEvent]
GO
ALTER TABLE [dbo].[Participation]  WITH CHECK ADD  CONSTRAINT [FK_EventJoin_User] FOREIGN KEY([UersID])
REFERENCES [dbo].[UserInfo] ([UserID])
GO
ALTER TABLE [dbo].[Participation] CHECK CONSTRAINT [FK_EventJoin_User]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_Article] FOREIGN KEY([ArticleID])
REFERENCES [dbo].[Article] ([ArticleID])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_Article]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserInfo] ([UserID])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_User]
GO
ALTER TABLE [dbo].[UserInfo]  WITH CHECK ADD  CONSTRAINT [FK_UserInfo_Login] FOREIGN KEY([Email])
REFERENCES [dbo].[Login] ([Email])
GO
ALTER TABLE [dbo].[UserInfo] CHECK CONSTRAINT [FK_UserInfo_Login]
GO
ALTER TABLE [dbo].[UserStatus]  WITH CHECK ADD  CONSTRAINT [FK_UserStatus_User] FOREIGN KEY([ID])
REFERENCES [dbo].[UserInfo] ([UserID])
GO
ALTER TABLE [dbo].[UserStatus] CHECK CONSTRAINT [FK_UserStatus_User]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文章ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Article', @level2type=N'COLUMN',@level2name=N'ArticleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文章標題' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Article', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文章類型(新聞/討論)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Article', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文章創建時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Article', @level2type=N'COLUMN',@level2name=N'Create time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文章內容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Article', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文章創作者ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Article', @level2type=N'COLUMN',@level2name=N'WriterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新聞發布者ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Article', @level2type=N'COLUMN',@level2name=N'ReleaseBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文章ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ArticleResponse', @level2type=N'COLUMN',@level2name=N'ArticleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'留言' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ArticleResponse', @level2type=N'COLUMN',@level2name=N'Comment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'留言ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ArticleResponse', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'留言者ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ArticleResponse', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理員ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BO_Managers', @level2type=N'COLUMN',@level2name=N'ManagerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理員姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BO_Managers', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理員群組' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BO_Managers', @level2type=N'COLUMN',@level2name=N'Team'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理員權限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BO_Managers', @level2type=N'COLUMN',@level2name=N'Permissions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理員帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BO_Managers', @level2type=N'COLUMN',@level2name=N'Account'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理員密碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BO_Managers', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理員電子郵箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BO_Managers', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理員手機' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BO_Managers', @level2type=N'COLUMN',@level2name=N'PhoneNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'語言' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BO_Managers', @level2type=N'COLUMN',@level2name=N'Language'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理員狀態' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BO_Managers', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理員創建時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BO_Managers', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活動標題' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活動內容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'EventContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活動建立時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活動ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'EventID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活動跑馬燈' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'Marquee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理者ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'ManagerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活動發放貨幣' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'Coin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活動發放稱號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'Obtain'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活動開始時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'EventTimeStrat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活動結束時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'EventTimeEnd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活動類別' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'稱號ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventObtain', @level2type=N'COLUMN',@level2name=N'ObtainID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活動ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventObtain', @level2type=N'COLUMN',@level2name=N'EventID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'稱號數量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventObtain', @level2type=N'COLUMN',@level2name=N'ObtainAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'論壇幣ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ForumCoins', @level2type=N'COLUMN',@level2name=N'CoinID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ForumCoins', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'論壇幣獲得來源' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ForumCoins', @level2type=N'COLUMN',@level2name=N'CoinSource'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'論壇幣獲得時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ForumCoins', @level2type=N'COLUMN',@level2name=N'AccessTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'論壇幣數量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ForumCoins', @level2type=N'COLUMN',@level2name=N'CoinAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'論壇幣處理狀態' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ForumCoins', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Login', @level2type=N'COLUMN',@level2name=N'Account'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Login', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'電子郵箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Login', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'稱號ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Obtain', @level2type=N'COLUMN',@level2name=N'ObtainID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'稱號類型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Obtain', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'稱號名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Obtain', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'稱號獲取條件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Obtain', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'條件類型(尚未決定)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Obtain', @level2type=N'COLUMN',@level2name=N'ConditionType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'條件類型的值(尚未確定)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Obtain', @level2type=N'COLUMN',@level2name=N'ConditionValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'稱號ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ObtainStatus', @level2type=N'COLUMN',@level2name=N'ObtainID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ObtainStatus', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'稱號獲得時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ObtainStatus', @level2type=N'COLUMN',@level2name=N'Time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'稱號數量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ObtainStatus', @level2type=N'COLUMN',@level2name=N'Count'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活動ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Participation', @level2type=N'COLUMN',@level2name=N'EventID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Participation', @level2type=N'COLUMN',@level2name=N'UersID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活動參與時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Participation', @level2type=N'COLUMN',@level2name=N'JoinTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活動參加狀態' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Participation', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'好評數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rating', @level2type=N'COLUMN',@level2name=N'PositiveRating'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'負評數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rating', @level2type=N'COLUMN',@level2name=N'NegativeRating'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文章ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rating', @level2type=N'COLUMN',@level2name=N'ArticleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rating', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者電子郵箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者顯示暱稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'Nickname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者生理性別' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者電話' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者生日' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'Brithday'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'頭像' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'Photo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'簽名檔' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'SignatureLine'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否為登入狀態' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'論壇幣數量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'Wallet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserStatus', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者留言數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserStatus', @level2type=N'COLUMN',@level2name=N'CommentCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者閱讀數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserStatus', @level2type=N'COLUMN',@level2name=N'ReadCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者發文數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserStatus', @level2type=N'COLUMN',@level2name=N'PostCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者是否達瀏覽數上限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserStatus', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者等級' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserStatus', @level2type=N'COLUMN',@level2name=N'Level'
GO
USE [master]
GO
ALTER DATABASE [WormHole] SET  READ_WRITE 
GO
