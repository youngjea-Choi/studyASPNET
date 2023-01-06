using BoardWedApp.Data;
using BoardWedApp.Models;
using Microsoft.AspNetCore.Mvc;

namespace BoardWedApp.Controllers
{
    public class NoteController : Controller
    {
        private readonly ApplicationDbContext context;

        public NoteController(ApplicationDbContext context)
        {
            this.context = context;
        }

        public IActionResult Index()
        {
            IEnumerable<Note> list = context.Notes.ToList(); //DB에서 데이터를 가져와서..
            
            return View(list);
            
        }
    }
}
