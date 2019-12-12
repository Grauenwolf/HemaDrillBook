using HemaDrillBook.UI.Models;
using HemaDrillBook.UI.Services;
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
        protected CommentaryInput CommentaryInput { get; set; } = new CommentaryInput();
        protected bool MayEdit { get; set; }

        protected override void OnModelChanged()
        {
            if (Model?.MyCommentary != null)
            {
                CommentaryInput = new CommentaryInput()
                {
                    SectionKey = Model.MyCommentary.SectionKey,
                    PrivateNotes = Model.MyCommentary.PrivateNotes,
                    PublicNotes = Model.MyCommentary.PublicNotes
                };
            }
            else
            {
                CommentaryInput = new CommentaryInput();
            }
            MayEdit = false;
        }

        protected async void SubmitCommentary()
        {
            //These should never happen.
            if (Model == null)
            {
                CommentaryInput.ErrorDisplay = "Section not loaded.";
                return;
            }
            if (User == null)
            {
                CommentaryInput.ErrorDisplay = "User not logged in.";
                return;
            }

            try
            {
                //Save goes here
                await PlayService.UpdateCommentaryAsync(CommentaryInput, User);

                //Reset the page
                StateHasChanged();
                Navigation.NavigateTo(Model.SectionUrlFragment + "/t/commentary");
                Model = null; //need to refresh data
            }
            catch (Exception ex)
            {
                CommentaryInput.ErrorDisplay = "Unable to save: " + ex.Message;
            }
        }

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

            if (Model == null)
            {
                Model = await BookService.GetSectionDetailAsync(BookSlug, PartSlug, SectionSlug, User);

                PageTitle = Model.SectionName;

                if (IsAuthenticated)
                    MayEdit = await BookService.MayEditPartAsync(Model.PartKey, User);
            }
        }
    }
}
