﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace T1_Wormhole_2._0._1.Models.Database;

public partial class EventObtain
{
    /// <summary>
    /// 稱號ID
    /// </summary>
    public int ObtainId { get; set; }

    /// <summary>
    /// 活動ID
    /// </summary>
    public int EventId { get; set; }

    /// <summary>
    /// 稱號數量
    /// </summary>
    public int? ObtainAmount { get; set; }

    public virtual Event Event { get; set; }

    public virtual Obtain Obtain { get; set; }
}