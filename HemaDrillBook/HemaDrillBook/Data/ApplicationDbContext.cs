using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace HemaDrillBook.Data
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
            // Customize the ASP.NET Identity model and override the defaults if needed.
            // For example, you can rename the ASP.NET Identity table names and more.
            // Add your customizations after calling base.OnModelCreating(builder);

            builder.Entity<ApplicationUser>().ToTable("AspNetUsers", schema: "Accounts");
            builder.Entity<IdentityUserRole<string>>().ToTable("AspNetUserRoles", schema: "Accounts");
            builder.Entity<IdentityUserLogin<string>>().ToTable("AspNetUserLogins", schema: "Accounts");
            builder.Entity<IdentityUserClaim<string>>().ToTable("AspNetUserClaims", schema: "Accounts");
            builder.Entity<IdentityRole>().ToTable("AspNetRoles", schema: "Accounts");
            builder.Entity<IdentityUserToken<string>>().ToTable("AspNetUserTokens", schema: "Accounts");

            builder.Entity<ApplicationUser>().Property(p => p.UserKey)
               .UseIdentityColumn();
            builder.Entity<ApplicationUser>().Property(p => p.UserKey)
                .Metadata.SetAfterSaveBehavior(PropertySaveBehavior.Ignore);
        }
    }
}
