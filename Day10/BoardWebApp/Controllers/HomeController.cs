using BoardWebApp.Data;
using BoardWebApp.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Query.Internal;
using System.Diagnostics;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace BoardWebApp.Controllers
{
    public class HomeController : Controller
    {
        //private readonly ILogger<HomeController> _logger;

        //이게 있어야 DB랑 연결
        private readonly ApplicationDbContext _context;

        public HomeController(ApplicationDbContext context)
        {
            _context = context;
        }

        //생성자


        //public HomeController(ILogger<HomeController> logger)
        //{
        //    _logger = logger;
        //}


        public IActionResult Index()
        {
            //DB에서 데이터 로드

            //Top위치에 넣을 데이터 로드
            var query = @"SELECT TOP 1 *
                            FROM Profiles 
                           WHERE Division = 'TOP' 
                        ORDER BY id desc";
            Profile top = _context.Profiles.FromSqlRaw(query).FirstOrDefault();
            if (top == null)
            {
                top = new Profile // DB에 데이터가 없을 때 가짜 데이터
                {
                    Title = "공사중입니다.",
                    Division = "Top",
                    Description = string.Empty,
                    Url = string.Empty,
                    FileName = string.Empty
                };
            }

            // Card1영역 데이터 로드
            query = @"SELECT TOP 1 *
                            FROM Profiles 
                           WHERE Division = 'Card1' 
                        ORDER BY id desc";

            Profile Card1 = _context.Profiles.FromSqlRaw(query).FirstOrDefault();
            if (Card1 == null)
            {
                Card1 = new Profile
                {
                    Title = "Card1 영역",
                    Division = "Card1",
                    Description = "Card1 영역입니다.",
                    Url = string.Empty,
                    FileName = string.Empty
                };
            }

            // Card2영역 데이터 로드
            query = @"SELECT TOP 1 *
                            FROM Profiles 
                           WHERE Division = 'Card2' 
                        ORDER BY id desc";

            Profile Card2 = _context.Profiles.FromSqlRaw(query).FirstOrDefault();
            if (Card2 == null)
            {
                Card2 = new Profile
                {
                    Title = "Card2 영역",
                    Division = "Card2",
                    Description = "Card2 영역입니다.",
                    Url = string.Empty,
                    FileName = string.Empty
                };
            }

            // Card3영역 데이터 로드
            query = @"SELECT TOP 1 *
                            FROM Profiles 
                           WHERE Division = 'Card3' 
                        ORDER BY id desc";

            Profile Card3 = _context.Profiles.FromSqlRaw(query).FirstOrDefault();
            if (Card3 == null)
            {
                Card3 = new Profile
                {
                    Title = "Card3 영역",
                    Division = "Card3",
                    Description = "Card3 영역입니다.",
                    Url = string.Empty,
                    FileName = string.Empty
                };
            }
            List<Profile> list = new List<Profile> { top,Card1 , Card2 , Card3 };
            
            return View(list);
        }

        [HttpGet]
        public IActionResult About()
        {
            // Card1영역 데이터 로드
           var query = @"SELECT TOP 1 *
                            FROM Profiles 
                           WHERE Division = 'Card1' 
                        ORDER BY id desc"
            ;

            Profile Card1 = _context.Profiles.FromSqlRaw(query).FirstOrDefault();
            if (Card1 == null)
            {
                Card1 = new Profile
                {
                    Title = "Card1 영역",
                    Division = "Card1",
                    Description = "Card1 영역입니다.",
                    Url = string.Empty,
                    FileName = string.Empty
                };
            }

            // Card2영역 데이터 로드
            query = @"SELECT TOP 1 *
                            FROM Profiles 
                           WHERE Division = 'Card2' 
                        ORDER BY id desc"
            ;

            Profile Card2 = _context.Profiles.FromSqlRaw(query).FirstOrDefault();
            if (Card2 == null)
            {
                Card2 = new Profile
                {
                    Title = "Card2 영역",
                    Division = "Card2",
                    Description = "Card2 영역입니다.",
                    Url = string.Empty,
                    FileName = string.Empty
                };
            }

            // Card3영역 데이터 로드
            query = @"SELECT TOP 1 *
                            FROM Profiles 
                           WHERE Division = 'Card3' 
                        ORDER BY id desc";

            Profile Card3 = _context.Profiles.FromSqlRaw(query).FirstOrDefault();
            if (Card3 == null)
            {
                Card3 = new Profile
                {
                    Title = "Card3 영역",
                    Division = "Card3",
                    Description = "Card3 영역입니다.",
                    Url = string.Empty,
                    FileName = string.Empty
                };
            }
            List<Profile> list = new List<Profile> {  Card1, Card2, Card3 };

            return View(list);
            //return View();
        }
        public IActionResult Privacy()
        {

            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}