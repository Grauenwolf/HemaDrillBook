using MailKit.Net.Smtp;
using MailKit.Security;
using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.Extensions.Options;
using MimeKit;
using MimeKit.Text;
using System.Threading.Tasks;

namespace HemaDrillBook
{
    public class EmailSender : IEmailSender
    {
        public EmailSender(IOptions<AuthMessageSenderOptions> options) : this(options.Value)
        {
        }

        public EmailSender(AuthMessageSenderOptions options)
        {
            Options = options;
        }

        public AuthMessageSenderOptions Options { get; }

        public async Task SendEmailAsync(string email, string subject, string htmlMessage)
        {
            var message = new MimeMessage();
            message.To.Add(MailboxAddress.Parse(email));
            message.From.Add(new MailboxAddress(Options.FromName, Options.FromEmailAddress));

            message.Subject = subject;
            //We will say we are sending HTML. But there are options for plaintext etc.
            message.Body = new TextPart(TextFormat.Html)
            {
                Text = htmlMessage
            };

            using (var emailClient = new SmtpClient())
            {
                await emailClient.ConnectAsync(Options.SmtpServer, Options.SmtpPort, SecureSocketOptions.Auto);

                //Remove any OAuth functionality as we won't be using it.
                emailClient.AuthenticationMechanisms.Remove("XOAUTH2");

                await emailClient.AuthenticateAsync("admin@hemadrillbook.org", Options.SmtpPassword);

                await emailClient.SendAsync(message);

                await emailClient.DisconnectAsync(true);
            }
        }
    }
}
