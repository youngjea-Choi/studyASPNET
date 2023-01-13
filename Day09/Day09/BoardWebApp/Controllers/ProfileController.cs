﻿using BoardWebApp.Data;
using BoardWebApp.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.ValueGeneration.Internal;

namespace BoardWebApp.Controllers
{
   
    public class ProfileController : Controller
    {
        private readonly ApplicationDbContext _context;
        //파일 업로드 웹 환경
        private readonly IWebHostEnvironment _environment;

        public ProfileController(ApplicationDbContext context, IWebHostEnvironment environment)
        {
            _context = context;
            _environment = environment;
        }

        public IActionResult Index()
        {
            var list = _context.Profiles.ToList();
            return View(list);
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(TempProfile temp)
        {
            if(ModelState.IsValid)
            {
                //파일 업로드
                string upFileName = UploadImageFile(temp);

                //파일명 받아서 TempProfile의 내용을  Profile에 할당.
                Profile profile = new Profile
                {
                    Division = temp.Division,
                    Title = temp.Title,
                    Description = temp.Description,
                    Url = temp.Url,
                    FileName = upFileName
                };

                _context.Profiles.Add(profile);
                _context.SaveChanges();

                TempData["success"] = "프로필 저장완료";

                return RedirectToAction("Index", "Profile");
            }

            return View();
        }

        [HttpGet]
        public IActionResult Edit(int? id)
        {
            if(id is null) { return NotFound(); }

            var profile = _context.Profiles.Find(id);
            if(profile == null) { return NotFound(); }

            // 이미지 때문에 추가 작업 
            TempProfile temp = new TempProfile
            {
                Id = profile.Id,
                Division = profile.Division,
                Title = profile.Title,
                Description = profile.Description,
                Url = profile.Url,
                FileName = profile.FileName,

            };

            return View(temp);
        }

        [HttpPost]
        public IActionResult Edit(TempProfile temp)
        {
            if (ModelState.IsValid)
            {
                //파일 업로드
                string upFileName = UploadImageFile(temp);

                //새로 업로드된 파일이 없고, 이전 파일명이 있으면 그 파일명을 그대로 사용!!
                if(upFileName == string.Empty && temp.FileName != string.Empty)
                {
                    upFileName = temp.FileName;
                }


                Profile profile = new Profile
                {
                    Id= temp.Id,
                    Division = temp.Division,
                    Title = temp.Title,
                    Description = temp.Description,
                    Url = temp.Url,
                    FileName = upFileName,
                };

                _context.Profiles.Update(profile);
                _context.SaveChanges();

                TempData["success"] = "프로필 수정 완료";

                return RedirectToAction("Index", "Profile");
                
            }

            return View(temp);
        }

        #region < 업로드 메서드 - Routing에 관련 없음>
        /// <summary>
        /// 파일 업로드 메서드
        /// </summary>
        /// <param name="temp"></param>
        /// <returns></returns>
        private string UploadImageFile(TempProfile temp)
        {
            var resultFileName = string.Empty;

            if(temp.ProfileImage!= null)
            {
                string uploadFolder = Path.Combine(_environment.WebRootPath, "Uploads");
                resultFileName = Guid.NewGuid() + "_" + temp.ProfileImage.FileName;
                string filePath = Path.Combine(uploadFolder, resultFileName);

                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    temp.ProfileImage.CopyTo(fileStream);
                }
            }

            return resultFileName;
        }

        [HttpGet]
        public IActionResult Delete(int? id)
        {
            if(id is null) { return NotFound(); }

            var profile = _context.Profiles.Find(id);

            if(profile is null) { return NotFound(); }

            _context.Remove(profile);
            _context.SaveChanges();

            TempData["success"] = "프로필 삭제 완료";

            return RedirectToAction("Index", "Profile");
        }

        #endregion
    }
}
