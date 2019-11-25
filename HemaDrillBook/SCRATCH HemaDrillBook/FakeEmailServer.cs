using Microsoft.AspNetCore.Identity.UI.Services;
using System.Diagnostics;
using System.Threading.Tasks;

namespace HemaDrillBook
{
    public class FakeEmailServer : IEmailSender
    {
        public FakeEmailServer()
        {
        }

        public Task SendEmailAsync(string email, string subject, string htmlMessage)
        {
            Debug.WriteLine("Email: " + email);
            Debug.WriteLine("Subject: " + subject);
            Debug.WriteLine("HtmlMessage: " + htmlMessage);
            return Task.CompletedTask;
        }
    }
}
