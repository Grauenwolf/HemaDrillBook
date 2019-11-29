﻿using HemaDrillBook.Models;
using HemaDrillBook.Services;
using Microsoft.AspNetCore.Components;
using System;
using System.Threading.Tasks;

namespace HemaDrillBook.Pages
{
    public class SectionBase : EngineBase<SectionDetail>
    {
#nullable disable
        [Inject] BookService BookService { get; set; }
        [Inject] PlayService PlayService { get; set; }
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

        protected VideoInput VideoInput { get; set; } = new VideoInput();

        protected async void SubmitVideo()
        {
            //These should never happen.
            if (Model == null)
            {
                VideoInput.ErrorDisplay = "Section not loaded.";
                return;
            }
            if (User == null)
            {
                VideoInput.ErrorDisplay = "User not logged in.";
                return;
            }

            VideoInput.SectionKey = Model.SectionKey;

            try
            {
                //Save goes here
                await PlayService.AddVideoAsync(VideoInput, User);

                //Reset the page
                VideoInput = new VideoInput();
                StateHasChanged();
                Navigation.NavigateTo(Model.SectionUrlFragment + "/t/videos");
                Model = null; //need to refresh data
            }
            catch (Exception ex) when (ex.Message.Contains("UX_Video_NoDup"))
            {
                VideoInput.ErrorDisplay = "Unable to save: This video was already attached to this section." + ex.Message;
            }
            catch (Exception ex)
            {
                VideoInput.ErrorDisplay = "Unable to save: " + ex.Message;
            }
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
