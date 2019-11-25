using Microsoft.AspNetCore.Identity;

namespace HemaDrillBook
{
    // Add profile data for application users by adding properties to the ApplicationUser class
    //[NotMapped]
    public class ApplicationUser : IdentityUser, IUser
    {
        public string DisplayName { get; set; }

        public int? UserKey { get; set; }
    }
}
