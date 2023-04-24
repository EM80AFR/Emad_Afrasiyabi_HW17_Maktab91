using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Units_Management_System.Models;

public partial class UinitsManagementContext : DbContext
{
    public UinitsManagementContext()
    {
    }

    public UinitsManagementContext(DbContextOptions<UinitsManagementContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Lesson> Lessones { get; set; }

    public virtual DbSet<Student> Students { get; set; }

    public virtual DbSet<Teacher> Teachers { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("      Data Source=EM-PC\\EM_SQLSERVER;Initial Catalog=Uinits_Management;TrustServerCertificate=True;Integrated Security=True;\n");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Lesson>(entity =>
        {
            entity.Property(e => e.TeacherPeresentationId).HasColumnName("Teacher_Peresentation_Id");
            entity.Property(e => e.Title).HasMaxLength(50);

            entity.HasOne(d => d.TeacherPeresentation).WithMany(p => p.Lessons)
                .HasForeignKey(d => d.TeacherPeresentationId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Lessones_Teahers");
        });

        modelBuilder.Entity<Student>(entity =>
        {
            entity.Property(e => e.Family).HasMaxLength(50);
            entity.Property(e => e.Name).HasMaxLength(50);

            entity.HasMany(d => d.Lessons).WithMany(p => p.Students)
                .UsingEntity<Dictionary<string, object>>(
                    "StudentsCourse",
                    r => r.HasOne<Lesson>().WithMany()
                        .HasForeignKey("LessonId")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK_Students_Courses_Courses"),
                    l => l.HasOne<Student>().WithMany()
                        .HasForeignKey("StudentId")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK_Students_Courses_Students"),
                    j =>
                    {
                        j.HasKey("StudentId", "LessonId");
                        j.ToTable("Students_Courses");
                        j.IndexerProperty<int>("StudentId").HasColumnName("Student_Id");
                        j.IndexerProperty<int>("LessonId").HasColumnName("Lesson_Id");
                    });
        });

        modelBuilder.Entity<Teacher>(entity =>
        {
            entity.Property(e => e.Family).HasMaxLength(50);
            entity.Property(e => e.Name).HasMaxLength(50);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
