using HemaDrillBook.Data;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace HemaDrillBook.Controllers
{
    public abstract class SecureController : ControllerBase
    {
        protected SecureController(UserManager<ApplicationUser> userManager)
        {
            m_UserManager = userManager;
        }

        readonly UserManager<ApplicationUser> m_UserManager;

        protected async Task<ApplicationUser> GetCurrentUserAsync()
        {
            return await m_UserManager.GetUserAsync(HttpContext.User);
        }
    }
}
