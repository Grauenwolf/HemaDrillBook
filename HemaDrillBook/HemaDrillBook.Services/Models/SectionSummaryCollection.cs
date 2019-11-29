using System.Collections.Generic;
using System.Collections.ObjectModel;

namespace HemaDrillBook.Models
{
    public class SectionSummaryCollection : Collection<SectionSummary>
    {
        public SectionSummaryCollection()
        {
        }

        public SectionSummaryCollection(IList<SectionSummary> list) : base(list)
        {
        }

        //public bool IsFilteredByWeapon { get; set; }

        //public void FilterSectionsByWeapon(int weaponKey, int? secondaryWeaponKey)
        //{
        //    if (Count == 0)
        //        return;

        //    //fitler the current list
        //    var newList = new List<SectionSummary>();
        //    foreach (var section in this)
        //    {
        //        if (section.ContainsWeapon(weaponKey, secondaryWeaponKey))
        //            newList.Add(section);
        //    }
        //    this.Clear();
        //    this.AddRange(newList);

        //    //filter the child lists
        //    foreach (var section in this)
        //    {
        //        section.Subsections.FilterSectionsByWeapon(weaponKey, secondaryWeaponKey);
        //    }

        //    IsFilteredByWeapon = true;
        //}

        public IEnumerable<SectionSummary> WalkSections()
        {
            foreach (var section in this)
            {
                yield return section;

                foreach (var subsection in section.Subsections.WalkSections())
                    yield return subsection;
            }
        }

        public IEnumerable<VideoSummary> ChildVideos()
        {
            foreach (var section in this)
            {
                foreach (var video in section.Videos)
                    yield return video;

                foreach (var video in section.Subsections.ChildVideos())
                    yield return video;
            }
        }

        public IEnumerable<PlaySummary> ChildPlays()
        {
            foreach (var section in this)
            {
                foreach (var play in section.Plays)
                    yield return play;

                foreach (var play in section.Subsections.ChildPlays())
                    yield return play;
            }
        }
    }
}
