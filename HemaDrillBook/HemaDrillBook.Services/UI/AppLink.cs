namespace HemaDrillBook.Services.UI
{
    public class AppLink
    {
        public string? ShortName(int maxLength)
        {
            if (Name == null)
                return null;
            if (Name.Length <= maxLength)
                return Name;
            return Name.Substring(0, maxLength - 3) + "...";
        }

        public string? Name { get; set; }
        public string? UrlFragment { get; set; }
    }
}
