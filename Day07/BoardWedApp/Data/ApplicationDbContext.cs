using BoardWedApp.Models;
using Microsoft.EntityFrameworkCore;

namespace BoardWedApp.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions options) : base(options)
        {

        }

        public DbSet<Note> Notes { get; set; }
    }
}
