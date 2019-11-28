namespace HemaDrillBook
{
    public class AuthMessageSenderOptions
    {
        public string? FromEmailAddress { get; set; }
        public string? FromName { get; set; }
        public string? SmtpPassword { get; set; }
        public string? BogusSetting { get; set; }
        public string? SmtpServer { get; set; }
        public int SmtpPort { get; set; }
    }
}
