using System;
using System.Collections.Generic;

namespace Units_Management_System.Models;

public partial class Lesson
{
    public int Id { get; set; }

    public string Title { get; set; } = null!;

    public int Units { get; set; }

    public int TeacherPeresentationId { get; set; }

    public virtual Teacher TeacherPeresentation { get; set; } = null!;

    public virtual ICollection<Student> Students { get; set; } = new List<Student>();
}
