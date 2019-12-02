using System.ComponentModel.DataAnnotations.Schema;

namespace HemaDrillBook.UI.Models
{
    public class CommentaryInput
    {
        public string? PublicNotes { get; set; }
        public string? PrivateNotes { get; set; }
        public int SectionKey { get; set; }
        public int UserKey { get; set; }

        [NotMapped]
        public string? ErrorDisplay { get; set; }
    }
}
