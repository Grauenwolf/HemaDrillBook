﻿using HemaDrillBook.Models;
using HemaDrillBook.Services;
using Microsoft.AspNetCore.Components;
using System.Threading.Tasks;

namespace HemaDrillBook.Pages
{
    public class SectionBase : EngineBase<SectionDetail>
    {
#nullable disable
        [Inject] BookService BookService { get; set; }
        [Inject] protected NavigationManager Navigation { get; set; }
#nullable restore

        [Parameter]
        public string? BookSlug
        {
            get => Get<string?>();
            set => Set(value, true);
        }

        [Parameter]
        public string? PartSlug
        {
            get => Get<string?>();
            set => Set(value, true);
        }

        [Parameter]
        public string? SectionSlug
        {
            get => Get<string?>();
            set => Set(value, true);
        }

        [Parameter]
        public string? Tab
        {
            get => Get<string?>();
            set => Set(value, false);
        }

        protected override async Task ParametersSetAsync()
        {
            if (BookSlug == null)
            {
                Navigation.NavigateTo("/b");
                return;
            }
            if (PartSlug == null)
            {
                Navigation.NavigateTo("/b/" + BookSlug);
                return;
            }
            if (SectionSlug == null)
            {
                Navigation.NavigateTo("/b/" + BookSlug + "/s/" + SectionSlug);
                return;
            }

            if (Model == null)
                Model = await BookService.GetSectionDetailAsync(BookSlug, PartSlug, SectionSlug, User);
        }
    }
}