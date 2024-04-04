using System;
using System.Collections.Generic;

namespace PracticeAt;

public partial class Provider
{
    public int Providerid { get; set; }

    public decimal Amount { get; set; }

    public DateOnly Date { get; set; }

    public string MaterialName { get; set; } = null!;

    public string ProviderName { get; set; } = null!;

    public string PhoneNumber { get; set; } = null!;

    public virtual ICollection<Material> Materials { get; set; } = new List<Material>();
}
