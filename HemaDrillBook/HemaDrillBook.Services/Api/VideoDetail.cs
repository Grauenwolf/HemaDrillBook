﻿using System;

namespace HemaDrillBook.Services.Api
{
    public class VideoDetail
    {
        public string? Author { get; set; }
        public int BookKey { get; set; }
        public string? BookSlug { get; set; }
        public int CreatedByUserKey { get; set; }
        public DateTime CreatedDate { get; set; }
        public string? Description { get; set; }
        public int PartKey { get; set; }
        public string? PartSlug { get; set; }
        public int SectionKey { get; set; }
        public string? SectionSlug { get; set; }
        public string SectionUrlFragment => $"/b/{BookSlug}/p/{PartSlug}/s/{SectionSlug}";
        public TimeSpan? StartTime { get; set; }
        public string? Url { get; set; }
        public int VideoKey { get; set; }
        public int VideoServiceKey { get; set; }
        public string? VideoServiceVideoId { get; set; }
    }
}
