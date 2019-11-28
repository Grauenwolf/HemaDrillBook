namespace HemaDrillBook.Models
{
    public class PartSummary
    {
        public int PartKey { get; set; }
        public string? PartName { get; set; }
        public string? PartSlug { get; set; }
        public string? BookSlug { get; set; }

        public string PartUrlFragment => $"/b/{BookSlug}/p/{PartSlug}";
        public string BookUrlFragment => $"/b/{BookSlug}";
    }
}
