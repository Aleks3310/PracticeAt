using System;
using System.Collections.Generic;

namespace PracticeAt;

public partial class Payment
{
    public int Paymentid { get; set; }

    public int Orderid { get; set; }

    public DateOnly PaymentDate { get; set; }

    public int? Modernid { get; set; }

    public int? Repairid { get; set; }

    public decimal PaymentAmount { get; set; }

    public virtual Modernization? Modern { get; set; }

    public virtual Order Order { get; set; } = null!;

    public virtual Repair? Repair { get; set; }
}
