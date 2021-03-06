﻿using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HemaDrillBook.Services.UI
{
    public class VideoInput
    {
        [Url]
        [Required(ErrorMessage = "URL is requires")]
        [StringLength(500, ErrorMessage = "Url is too long")]
        public string? Url { get; set; }

        [StringLength(250, ErrorMessage = "Description is too long")]
        public string? Description { get; set; }

        [StringLength(250, ErrorMessage = "Author is too long")]
        public string? Author { get; set; }

        public TimeSpan? StartTime { get; set; }

        [NotMapped]
        public string? StartTimeString
        {
            get
            {
                if (StartTime.HasValue)
                    return StartTime.ToString();
                return "";
            }
            set
            {
                var temp = value;

                //Fixup for time parsing
                if (!string.IsNullOrEmpty(temp))
                {
                    var parts = temp.Split(':');
                    if (parts.Length == 1) //we only have seconds
                        temp = "00:00:" + temp;
                    else if (parts.Length == 2) //we only have minutes and seconds
                        temp = "00:" + temp;
                }

                if (TimeSpan.TryParse(temp, out var time))
                    StartTime = time;
                else
                    StartTime = null;
            }
        }

        public int SectionKey { get; set; }
        public int VideoServiceKey { get; set; }
        public string? VideoServiceVideoId { get; set; }

        [NotMapped]
        public string? ErrorDisplay { get; set; }

        /*
         *
         * 	<table class="gridtable">
		<tr><th>URL</th><th>Description (optional)</th><th>Author (optional)</th><th>Start Time (optional, H:MM:SS)</th></tr>
		<tr>
			<td><input type="text" id="url" /></td>
			<td><input type="text" id="description" /></td>
			<td><input type="text" id="author" /></td>
			<td><input type="text" id="startTime" /></td>
			<td>
				<input id="showTradeScreen" type="button" value="Save" onclick="addVideo(
    @Model.SectionKey, readValue('url'), readValue('description'), readValue('author'), readValue('startTime'))" />
			</td>
		</tr>
		<tr><td colspan="4">Example start time: 1 min, 45 seconds would be "0:1:45".</td></tr>
	</table>
         */
    }
}
