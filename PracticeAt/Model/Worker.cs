using System;
using System.Collections.Generic;

namespace PracticeAt;

public partial class Worker
{
    public int Workerid { get; set; }

    public string LastName { get; set; } = null!;

    public string FirstName { get; set; } = null!;

    public string? Patronymic { get; set; }

    public DateOnly BirthDate { get; set; }

    public string PassportSeries { get; set; } = null!;

    public string PassportNumber { get; set; } = null!;

    public string Address { get; set; } = null!;

    public string PhoneNumber { get; set; } = null!;

    public int Positionid { get; set; }

    public int Userid { get; set; }

    public virtual ICollection<Modernization> Modernizations { get; set; } = new List<Modernization>();

    public virtual Position Position { get; set; } = null!;

    public virtual ICollection<Repair> Repairs { get; set; } = new List<Repair>();

    public virtual User User { get; set; } = null!;
}
