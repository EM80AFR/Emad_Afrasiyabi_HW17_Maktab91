using System.Data.Entity;
using Microsoft.AspNetCore.Mvc;
using Units_Management_System.Models;
using Units_Management_System.Models.ViewModels;

namespace Units_Management_System.Controllers
{
    public class InstituteController : Controller
    {
        private readonly UinitsManagementContext _uniContext;

        public InstituteController(UinitsManagementContext uniContext)
        {
            _uniContext = uniContext;
        }
        public IActionResult Question_3()
        {
            var result = _uniContext.Students.Include(x=>x.Lessons).Select(x => new Students_LessonsViewModel
            {
                FirstName = x.Name,
                LastName = x.Family,
                CourseName = string.Join("_", x.Lessons.Select(l => l.Title))
            }).ToList();
            return View(result);
        }
        public IActionResult Question_4()
        {
            var result = _uniContext.Teachers.Include(x=>x.Lessons).Select(x => new Teachers_LessonsViewModel
            {
                FirstName = x.Name,
                LastName = x.Family,
                CourseName = string.Join("_", x.Lessons.Select(l => l.Title))
            }).ToList();
            return View(result);
        }
        public IActionResult Question_5()
        {
            var result = _uniContext.Students.Include(x => x.Lessons).Select(x => new Students_TeachersViewModel()
            {
                FirstName = x.Name,
                LastName = x.Family,
                TeachersName = string.Join("_", x.Lessons.Select(l => l.TeacherPeresentation.Name+" "+l.TeacherPeresentation.Family+$"({l.Title})"))
            }).ToList();
            return View(result);
        }
    }
}
