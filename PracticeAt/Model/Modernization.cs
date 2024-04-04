using System;
using System.Collections.Generic;

namespace PracticeAt;

public partial class Modernization
{
    public int Modernid { get; set; }

    public int Orderid { get; set; }

    public int Measurementid { get; set; }

    public int Workerid { get; set; }

    public int Materialid { get; set; }

    public decimal ModernCost { get; set; }

    public string ModernTime { get; set; } = null!;

    public virtual Material Material { get; set; } = null!;

    public virtual Measurement Measurement { get; set; } = null!;

    public virtual Order Order { get; set; } = null!;

    public virtual ICollection<Payment> Payments { get; set; } = new List<Payment>();

    public virtual Worker Worker { get; set; } = null!;
}
