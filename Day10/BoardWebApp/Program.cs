using BoardWebApp.Data;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;

namespace BoardWebApp
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            builder.Services.AddControllersWithViews();

            builder.Services.AddDbContext<ApplicationDbContext>(option => option.UseSqlServer(
                builder.Configuration.GetConnectionString("DbConnection")
                )
            );

            //ASPNET Identity 서비스 추가
            builder.Services.AddIdentity<IdentityUser, IdentityRole>()
                .AddEntityFrameworkStores<ApplicationDbContext>()
                .AddDefaultTokenProviders();

            //패스워드 정책 변경 설정
            builder.Services.Configure<IdentityOptions>(
                opt =>
                {
                    opt.Password.RequiredLength = 4; // 글자길이
                    opt.Password.RequireNonAlphanumeric = false; //특수문자 사용여부
                    opt.Password.RequireDigit = false; //영문자 사용
                    opt.Password.RequireLowercase = false; // 소문자사용
                    opt.Password.RequireUppercase = false; // 대문자 사용

                });
            //권한설정
            builder.Services.AddAuthorization(options =>
            {
                options.AddPolicy("AdminRolePolicy", policy => policy.RequireRole("Admin"));


            });

            builder.Services.AddAuthorization(Options =>
            {
                Options.AddPolicy("EditRolePolicy", policy => policy.RequireClaim("Edit Role"));


                Options.AddPolicy("DeleteRolePolicy", policy => policy.RequireClaim("Delete Role"));



            });



            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthentication(); // 계정사용을 위한 추가
            app.UseAuthorization();  // 권한

            app.MapControllerRoute(
                name: "default",
                pattern: "{controller=Home}/{action=Index}/{id?}");

            app.Run();
        }
    }
}