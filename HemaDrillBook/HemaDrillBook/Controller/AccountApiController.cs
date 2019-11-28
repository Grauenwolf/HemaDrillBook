using HemaDrillBook.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;

namespace HemaDrillBook.Controllers
{
    [Produces("application/json")]
    [Route("api/account")]
    public class AccountApiController : SecureController
    {
        private readonly UserManager<ApplicationUser> m_UserManager;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly SignInManager<ApplicationUser> _signInManager;
        //private readonly IEmailSender _emailSender;
        //private readonly ILogger _logger;

        public AccountApiController(UserManager<ApplicationUser> userManager,
            SignInManager<ApplicationUser> signInManager

            ) : base(userManager)
        {
            m_UserManager = userManager ?? throw new ArgumentNullException(nameof(userManager));
            _userManager = userManager;
            _signInManager = signInManager;
            //_emailSender = emailSender;
            //_logger = logger;
        }

        [HttpPost("logout")]
        public async void Logout()
        {
            await _signInManager.SignOutAsync();
            //_logger.LogInformation("User logged out.");
        }

        [HttpPost("login")]
        [AllowAnonymous]
        public async Task<bool> Login(LoginViewModel model)
        {
            if (ModelState.IsValid)
            {
                // This doesn't count login failures towards account lockout
                // To enable password failures to trigger account lockout, set lockoutOnFailure: true
                var result = await _signInManager.PasswordSignInAsync(model.UserName, model.Password, model.RememberMe, lockoutOnFailure: false);
                if (result.Succeeded)
                {
                    //_logger.LogInformation("User logged in.");
                    return true;
                }
                if (result.RequiresTwoFactor)
                {
                    return false;
                }
                if (result.IsLockedOut)
                {
                    //_logger.LogWarning("User account locked out.");
                    return false;
                }
                else
                {
                    ModelState.AddModelError(string.Empty, "Invalid login attempt.");
                    return false;
                }
            }

            // If we got this far, something failed, redisplay form
            return false;
        }

        [HttpGet("whoAmI")]
        public async Task<ApplicationUser> WhoAmI()
        {
            return await GetCurrentUserAsync();
        }
    }
}
