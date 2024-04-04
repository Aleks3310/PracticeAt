using System;
using System.Collections.Generic;

namespace PracticeAt;

public partial class Client
{
    public int Clientid { get; set; }

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string? Patronymic { get; set; }

    public string Email { get; set; } = null!;

    public string PhoneNumber { get; set; } = null!;

    public virtual ICollection<Measurement> Measurements { get; set; } = new List<Measurement>();

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
}
