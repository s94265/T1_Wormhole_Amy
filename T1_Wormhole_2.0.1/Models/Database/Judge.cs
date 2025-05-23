﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace T1_Wormhole_2._0._1.Models.Database;

public partial class Judge
{
    public int JudgeId { get; set; }

    /// <summary>
    /// 遊戲名稱
    /// </summary>
    public string Title { get; set; }

    /// <summary>
    /// 官方售價
    /// </summary>
    public int? Price { get; set; }

    /// <summary>
    /// 蟲洞編推薦分數
    /// </summary>
    public int? Rate { get; set; }

    /// <summary>
    /// 遊戲平台類型
    /// </summary>
    public int? Type { get; set; }

    /// <summary>
    /// 推薦遊戲內容
    /// </summary>
    public string Content { get; set; }

    /// <summary>
    /// 遊戲圖
    /// </summary>
    public byte[] Picture { get; set; }
}