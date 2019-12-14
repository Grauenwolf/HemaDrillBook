using HemaDrillBook.Services.UI.Models;
using HemaDrillBook.UI.Services;
using Microsoft.AspNetCore.Components;
using System;
using System.Threading.Tasks;

namespace HemaDrillBook.Pages
{
    public class SectionEditorBase : EngineBase<SectionEdit>
    {
#nullable disable
        [Inject] BookService BookService { get; set; }
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

        protected async void SubmitChanges()
        {
            //These should never happen.
            if (Model == null)
            {
                ReturnToSection();
                return;
            }
            if (User == null)
            {
                ReturnToSection();
                return;
            }

            //Capture the new SectionSlug just in case it changed.
            string targetUrl = "/b/" + BookSlug + "/p/" + PartSlug + "/s/" + Model.SectionSlug;
            try
            {
                //Save goes here
                await BookService.UpdateSectionEditAsync(Model, User);
            }
            catch (Exception ex)
            {
                Model.ErrorDisplay = "Unable to save: " + ex.Message;
            }

            //Reset the page
            StateHasChanged();
            Model = null; //need to refresh data

            Navigation.NavigateTo(targetUrl);
        }

        private void ReturnToSection()
        {
            if (string.IsNullOrEmpty(BookSlug))
            {
                Navigation.NavigateTo("/b");
                return;
            }
            if (string.IsNullOrEmpty(PartSlug))
            {
                Navigation.NavigateTo("/b/" + BookSlug);
                return;
            }
            if (string.IsNullOrEmpty(SectionSlug))
            {
                Navigation.NavigateTo("/b/" + BookSlug + "/p/" + PartSlug);
                return;
            }

            Navigation.NavigateTo("/b/" + BookSlug + "/p/" + PartSlug + "/s/" + SectionSlug);
        }

        protected override async Task ParametersSetAsync()
        {
            if (string.IsNullOrEmpty(BookSlug) || string.IsNullOrEmpty(PartSlug) || string.IsNullOrEmpty(SectionSlug))
            {
                ReturnToSection();
                return;
            }

            if (Model == null)
                Model = await BookService.GetSectionEditAsync(BookSlug, PartSlug, SectionSlug, User);
        }
    }
}
