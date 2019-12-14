using HemaDrillBook.Services.UI;
using Microsoft.AspNetCore.Components;
using System;
using System.Collections.Generic;
using System.Linq;
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

        protected async Task SubmitChangesAsync()
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

        //protected void OnChange()
        //{
        //    ParentUpdatedAsync();
        //}

        protected void OnClick()
        {
            ParentUpdated();
        }

        //protected void OnBlur()
        //{
        //    ParentUpdatedAsync();
        //}

        //protected void OnKeyPress()
        //{
        //    ParentUpdatedAsync();
        //}

        protected void OnKeyUp()
        {
            ParentUpdated();
        }

        protected void ParentUpdated()
        {
            //if (Model != null && LastParentSectionKey != Model.ParentSectionKey)
            //{
            //    SectionsWithSameParent = await BookService.GetSectionsWithSameParentAsync(Model.PartKey, Model.ParentSectionKey, User);
            //    LastParentSectionKey = Model.ParentSectionKey;
            //    StateHasChanged();
            //}

            if (Model != null)
            {
                SectionsWithSameParent.Clear();
                SectionsWithSameParent.AddRange(ParentSections.Where(s => s.ParentSectionKey == Model.ParentSectionKey));
            }
        }

        ///// <summary>
        ///// Used for cache control of SectionsWithSameParent
        ///// </summary>
        //int? LastParentSectionKey;

        protected List<SectionForLists> SectionsWithSameParent = new List<SectionForLists>();

        protected void ReturnToSection()
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
            {
                Model = await BookService.GetSectionEditAsync(BookSlug, PartSlug, SectionSlug, User);
                ParentSections = await BookService.PossibleParentsForSectionAsync(Model.PartKey, Model.SectionKey, User);
                ParentUpdated();
            }
        }

        public List<SectionForLists> ParentSections = new List<SectionForLists>();
    }
}
