using System;
using System.Collections.Generic;

namespace PracticeAt;

public partial class Order
{
    public int Orderid { get; set; }

    public int Clientid { get; set; }

    public DateOnly OrderDate { get; set; }

    public string Description { get; set; } = null!;

    public string Status { get; set; } = null!;

    public virtual Client Client { get; set; } = null!;

    public virtual ICollection<Modernization> Modernizations { get; set; } = new List<Modernization>();

    public virtual ICollection<Payment> Payments { get; set; } = new List<Payment>();

    public virtual ICollection<Repair> Repairs { get; set; } = new List<Repair>();
}
