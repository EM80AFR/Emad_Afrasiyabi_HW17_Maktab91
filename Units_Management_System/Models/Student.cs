using System;
using System.Collections.Generic;

namespace Units_Management_System.Models;

public partial class Student
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string Family { get; set; } = null!;

    public virtual ICollection<Lesson> Lessons { get; set; } = new List<Lesson>();
}
