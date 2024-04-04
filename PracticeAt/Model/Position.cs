using System;
using System.Collections.Generic;

namespace PracticeAt;

public partial class Position
{
    public int Positionid { get; set; }

    public string PositionName { get; set; } = null!;

    public virtual ICollection<Worker> Workers { get; set; } = new List<Worker>();
}
