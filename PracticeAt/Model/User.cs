using System;
using System.Collections.Generic;

namespace PracticeAt;

public partial class User
{
    public int Userid { get; set; }

    public string Login { get; set; } = null!;

    public string Password { get; set; } = null!;

    public virtual ICollection<Worker> Workers { get; set; } = new List<Worker>();
}
