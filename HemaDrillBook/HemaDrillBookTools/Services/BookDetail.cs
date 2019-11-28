using System.Collections.ObjectModel;

namespace HemaDrillBookTools.Services
{
    partial class BookDetailWithSections
    {
        public SectionSummary FindSection(int sectionKey)
        {
            foreach (var part in Parts)
            {
                var temp = FindSection(part.Sections, sectionKey);
                if (temp != null)
                    return temp;
            }
            return null;
        }

        SectionSummary FindSection(ObservableCollection<SectionSummary> sections, int sectionKey)
        {
            foreach (var section in sections)
            {
                if (section.SectionKey == sectionKey)
                    return section;
                var result = FindSection(section.Subsections, sectionKey);
                if (result != null)
                    return result;
            }
            return null;
        }
    }
}
