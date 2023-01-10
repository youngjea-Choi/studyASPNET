using BoardWebApp.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace BoardWebApp.Controllers
{
    public class AccountController : Controller
    {

        private readonly UserManager<IdentityUser> userManager;
        private readonly SignInManager<IdentityUser> signInManager;

        public AccountController(UserManager<IdentityUser> userManager, SignInManager<IdentityUser> signInManager)
        {
            this.userManager = userManager ?? throw new ArgumentNullException(nameof(userManager));
            this.signInManager = signInManager ?? throw new ArgumentNullException(nameof(signInManager));

        }

        //회원가입 첫화면 들어갈때 액션(매서드)
        [HttpGet]
        public IActionResult Register()
        {
            return View();
        }

        //회원가입 버튼 누른 후 DB 처리 액션(매서드)
        [HttpPost]
        //async 비동기 처리
        public IActionResult Register(RegisterModel model)
        {
            if (ModelState.IsValid) // 입력필수값이 다 입력되었으면 true 아니면 false
            {
                var user = new IdentityUser
                {
                    Id = model.Id,
                    UserName = model.UserName,
                    Email = model.Email,
                    PhoneNumber = model.PhoneNumber,
                };
            }

            return View(model);
        }

    }
}