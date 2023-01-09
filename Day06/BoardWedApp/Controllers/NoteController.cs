using BoardWedApp.Data;
using BoardWedApp.Models;
using Microsoft.AspNetCore.Mvc;

namespace BoardWedApp.Controllers
{
    public class NoteController : Controller
    {
        private readonly ApplicationDbContext _context;

        public NoteController(ApplicationDbContext context)
        {
            this._context = context;
        }

        public IActionResult Index()
        {
            IEnumerable<Note> list = _context.Notes.ToList(); //DB에서 데이터를 가져와서..
            
            return View(list);
            
        }

        /// <summary>
        /// GET 액션
        /// </summary>
        /// <returns></returns>
        public IActionResult Create()
        {
            return View();
        }

        /// <summary>
        /// POST 액션 (메서드) 
        /// </summary>
        /// <param name="note">프론트앤드에서 작정산 모델</param>
        /// <returns></returns>
        [HttpPost]
        [ValidateAntiForgeryToken]// 크로스사이트 요청 위조 막는 부분
        public IActionResult Create(Note note)
        {
            _context.Notes.Add(note); //INSERT 쿼리 실행
            _context.SaveChanges(); //트랜잭션 commit

           return RedirectToAction("Index","Note");

        }

		/// <summary>
		/// Edit 액션
		/// </summary>
		/// <param name="id">수정할 글 아이디</param>
		/// <returns></returns>
		[HttpGet]
		public IActionResult Edit(int? id)
		{
			if (id is null) { return NotFound(); }

			var note = _context.Notes.Find(id);

			return View(note);
		}
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(Note note)
        {
            _context.Notes.Update(note);
            _context.SaveChanges();

            return RedirectToAction("Index", "Note");
        }
        [HttpGet]
        public IActionResult Delete(int? id)
        {
            if (id is null) { return NotFound(); }
            var note = _context.Notes.Find(id);
            if(note == null) { return NotFound(); }
            _context.Notes.Remove(note);
            _context.SaveChanges();

            return RedirectToAction("index", "note");

        }
        public IActionResult Detail(int? id)
        {
            if (id is null)
            {
                return NotFound();
            }

            var note = _context.Notes.Find(id); // SELECT 쿼리
            if (note == null) { return NotFound(); }

            //조회수 +1
            note.ReadCount++;
            _context.Notes.Update(note); //update 쿼리
            _context.SaveChanges();

            return View(note);
        }

    }
}
