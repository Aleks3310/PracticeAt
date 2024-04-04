using System;
using System.Collections.Generic;

namespace PracticeAt;

public partial class Repair
{
    public int Repairid { get; set; }

    public int Orderid { get; set; }

    public int Workerid { get; set; }

    public int Materialid { get; set; }

    public decimal RepairCost { get; set; }

    public string? RepairTime { get; set; }

    public virtual Material Material { get; set; } = null!;

    public virtual Order Order { get; set; } = null!;

    public virtual ICollection<Payment> Payments { get; set; } = new List<Payment>();

    public virtual Worker Worker { get; set; } = null!;
}
