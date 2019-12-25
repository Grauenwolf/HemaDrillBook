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
        public string? ImageFileName { get; set; }

        [Parameter]
        public string? ImageName { get; set; }

        public string LinkUrl => Settings.Value.StorageBaseUrl + "/" + Settings.Value.ImageStorageContainer + "/" + ImageFileName;
        public string ThumbnailUrl => Settings.Value.StorageBaseUrl + "/" + Settings.Value.ThumbnailStorageContainer + "/" + ImageFileName;
    }
}
