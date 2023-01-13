using BoardWebApp.Data;
using BoardWebApp.Models;
using MessagePack.Formatters;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace BoardWebApp.Controllers
{
    public class NoteController : Controller
    {
        private readonly ApplicationDbContext _context;

        public NoteController(ApplicationDbContext context)
        {
            _context = context;
        }

        /// <summary>
        /// 기본 리스트 조회화면
        /// </summary>
        /// <returns></returns>
        public IActionResult Index(int page = 1)
        {
            // EntityFramwork로 쿼리 없이 
            //IEnumerable<Note> list = _context.Notes.ToList(); // SELECT
            //var list = _context.Notes.FromSqlRaw($"SELECT TOP 5 * FROM NOTES").ToList();
            int totalCount = _context.Notes.FromSqlRaw($"SELECT * FROM NOTES").Count(); // 12
            int countNum = 10; //게시판 한 페이지에 뿌릴 게시글 수
            int totalPage = totalCount / countNum;
            if (totalCount % countNum > 0) totalPage++; //페이지수를 하나 더 증가
            if (totalPage < page) page = totalPage;

            int startPage = ((page - 1) / countNum) * countNum + 1; //1
            int endPage = startPage + countNum - 1; //10
            if (totalPage < endPage) endPage = totalPage;

            int startCount = ((page - 1) * countNum) + 1;
            int endCount = startCount + countNum - 1;

            //뷰에 마지막페이지 시작페이지 이전페이지 다음페이지 표시 위한 거
            ViewBag.StartPage = startPage;
            ViewBag.EndPage = endPage;
            ViewBag.Page = page;
            ViewBag.TotalPage = totalPage;

            var list = _context.Notes.FromSqlRaw($"EXECUTE dbo.USP_PagingNotes @StartCount={startCount}, @EndCount = {endCount}").ToList();

            ViewData["Title"] = "컨트롤러에서 온 게시판"; // ViewDate는 백앤드/프론트앤드 어디서든지 쓸수 있음.

            return View(list);
        }

        /// <summary>
        /// GET 액션(메서드)
        /// 
        /// </summary>
        /// <returns></returns>
        public IActionResult Create()
        {
            return View();
        }

        /// <summary>
        /// POST 액션(메서드)
        /// </summary>
        /// <param name="note">프론트앤드에서 작성한 모델</param>
        /// <returns>리스트로 다시 돌아감</returns>
        [HttpPost]
        [ValidateAntiForgeryToken] //크로스사이트 요청 위조 막는 부분
        public IActionResult Create(Note note)
        {
            _context.Notes.Add(note); //Insert 쿼리 실행
            _context.SaveChanges(); //트랜잭션 commit

            //처리 메세지 추가
            TempData["success"] = "저장되었습니다.";

            return RedirectToAction("Index", "Note");
        }

        /// <summary>
        /// Edit 액션
        /// </summary>
        /// <param name="id">수정할 글 아이디</param>
        /// <returns></returns>
        [HttpGet]
        public IActionResult Edit(int? id)
        {
			if (id is null){return NotFound();}

            var note = _context.Notes.Find(id);

            if(note is null) { return NotFound();}

            return View(note);
		}

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(Note note)
        {
            _context.Notes.Update(note);
            _context.SaveChanges();

            //수정메세지
            TempData["success"] = "수정되었습니다.";

            return RedirectToAction("Index", "Note");
        }

        [HttpGet]
        public IActionResult Delete(int? id)
        {
			if (id is null){return NotFound();}

            var note = _context.Notes.Find(id);

            if (note is null) { return NotFound(); }

            return View(note);
		}

        // Action이름이 Delete가 아니지만 Delete로 동작하게 해주는 기능..
        [HttpPost, ActionName("Delete")] //프론트애서 Delete 값을 받으면 동작..
        [ValidateAntiForgeryToken]
        public IActionResult DeleteConfirmed(int? id)
        {
            if (id is null) { return NotFound(); }

            var note = _context.Notes.Find(id);

            if (note is null) { return NotFound(); }

            _context.Notes.Remove(note); //DELETE 쿼리
            _context.SaveChanges();

            //삭제 메세지
            TempData["success"] = "삭제 되었습니다";

            return RedirectToAction("Index", "Note");
        }

        /// <summary>
        /// 상세보기
        /// </summary>
        /// <param name="id">게시글 번호</param>
        /// <returns></returns>
        [HttpGet] // Default 값임. 안써도 상관 없다.
        public IActionResult Detail(int? id)
        {            //null 처리
            if (id is null) { return NotFound(); }

            var note = _context.Notes.Find(id);  //SELECT 쿼리
            if(note == null) { return NotFound(); }

            note.ReadCount += 1;
            _context.Notes.Update(note); // UPDATE 쿼리
            _context.SaveChanges();

            return View(note);
        }

    }
}
     