using System;
using System.Collections.Generic;

namespace PracticeAt;

public partial class Measurement
{
    public int Measurementid { get; set; }

    public int Clientid { get; set; }

    public DateOnly MeasurementDate { get; set; }

    public decimal ShoulderWidth { get; set; }

    public decimal ChestWidth { get; set; }

    public decimal WaistSize { get; set; }

    public decimal HipCircumference { get; set; }

    public decimal ArmLength { get; set; }

    public virtual Client Client { get; set; } = null!;

    public virtual ICollection<Modernization> Modernizations { get; set; } = new List<Modernization>();
}
