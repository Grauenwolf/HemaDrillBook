﻿using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace HemaDrillBook.Models
{
    public class PartDetail

    {
        public string PartUrlFragment => $"/b/{BookSlug}/p/{PartSlug}";
        public string BookUrlFragment => $"/b/{BookSlug}";

        public int BookKey { get; set; }
        public string? BookName { get; set; }
        public string? BookSlug { get; set; }

        [NotMapped]
        public PartSummary? Next { get; set; }

        [NotMapped]
        public PartSummary? Previous { get; set; }

        public int PartKey { get; set; }
        public string? PartName { get; set; }
        public string? PartSlug { get; set; }

        public SectionSummaryCollection Sections { get; } = new SectionSummaryCollection();
        public List<PlaySummary> Plays { get; } = new List<PlaySummary>();
        public List<WeaponPairSummary> Weapons { get; } = new List<WeaponPairSummary>();
    }
}