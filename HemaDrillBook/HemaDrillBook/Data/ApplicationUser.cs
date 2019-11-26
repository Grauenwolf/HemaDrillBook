using HemaDrillBook.Models;
using Microsoft.AspNetCore.Identity;

namespace HemaDrillBook.Data
{
    /// <summary>
    /// Adds profile data to ASP.NET Identity
    /// Implements the <see cref="IdentityUser" />
    /// Implements the <see cref="IUser" />
    /// </summary>
    /// <seealso cref="IdentityUser" />
    /// <seealso cref="IUser" />
    public class ApplicationUser : IdentityUser, IUser
    {
        /// <summary>
        /// Gets or sets the display name.
        /// </summary>
        /// <value>The display name.</value>
        /// <remarks>If this is null, the user cannot share their commentary/videos.</remarks>
        public string DisplayName { get; set; }

        /// <summary>
        /// This is the primary key for users in the database, with the exception of ASP.NET Identity tasks.
        /// </summary>
        /// <value>The user key.</value>
        public int? UserKey { get; set; }
    }
}
