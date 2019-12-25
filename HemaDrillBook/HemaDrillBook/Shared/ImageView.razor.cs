using HemaDrillBook.Models;
using Microsoft.AspNetCore.Components;
using Microsoft.Extensions.Options;

namespace HemaDrillBook.Shared
{
    partial class ImageView

    {
#nullable disable

        [Inject]
        public IOptions<BlobStorageOptions> Settings { get; set; }

#nullable restore

        [Parameter]
        public int ImageKey { get; set; }

        [Parameter]
        public string? ImageFileName { get; set; }

        [Parameter]
        public string? ImageName { get; set; }

        public string ImageUrl => $"{Settings.Value.StorageBaseUrl}/{Settings.Value.ImageStorageContainer}/{ImageFileName}";
        public string PageUrl => $"/i/{ImageKey}";
        public string ThumbnailUrl => $"{Settings.Value.StorageBaseUrl}/{Settings.Value.ThumbnailStorageContainer}/{ImageFileName}";
    }
}
