using System;
using System.Collections.Generic;

namespace PracticeAt;

public partial class Material
{
    public int Materialid { get; set; }

    public string Name { get; set; } = null!;

    public string Unit { get; set; } = null!;

    public decimal Quantity { get; set; }

    public decimal UnitCost { get; set; }

    public int Providerid { get; set; }

    public virtual ICollection<Modernization> Modernizations { get; set; } = new List<Modernization>();

    public virtual Provider Provider { get; set; } = null!;

    public virtual ICollection<Repair> Repairs { get; set; } = new List<Repair>();
}
