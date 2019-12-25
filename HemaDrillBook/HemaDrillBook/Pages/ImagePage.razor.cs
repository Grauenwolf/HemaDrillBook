﻿using HemaDrillBook.Services.UI;
using Microsoft.AspNetCore.Components;
using System.Threading.Tasks;

namespace HemaDrillBook.Pages
{
    partial class ImagePage
    {
#nullable disable
        [Inject] ImageService ImageService { get; set; }
#nullable restore

        [Parameter]
        public string? ImageKey
        {
            get => Get<string?>();

            set => Set(value, true);
        }

        protected override async Task ParametersSetAsync()
        {
            if (Model == null && int.TryParse(ImageKey, out var imageKey))
                Model = await ImageService.GetImageDetail(imageKey, User);
        }
    }
}
