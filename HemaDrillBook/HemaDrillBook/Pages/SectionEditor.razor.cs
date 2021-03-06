﻿using HemaDrillBook.Services.UI;
using Microsoft.AspNetCore.Components;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HemaDrillBook.Pages
{
    partial class SectionEditor
    {
        [Inject] SectionService SectionService { get; set; } = null!;
        [Inject] PartService PartService { get; set; } = null!;

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
                if (Model.SectionKey.HasValue)
                    await SectionService.UpdateSectionEditAsync(Model, User);
                else
                    await SectionService.CreateSectionAsync(Model, User);
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

        protected void OnClick()
        {
            ParentUpdated();
        }

        protected void OnKeyUp()
        {
            ParentUpdated();
        }

        protected void ParentUpdated()
        {
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
            var newMode = Navigation.Uri.EndsWith("/new");

            if (string.IsNullOrEmpty(BookSlug) || string.IsNullOrEmpty(PartSlug) || (string.IsNullOrEmpty(SectionSlug) && !newMode))
            {
                ReturnToSection();
                return;
            }

            if (Model == null)
            {
                if (newMode)
                {
                    if (!string.IsNullOrEmpty(SectionSlug))
                    {
                        var parentSection = await SectionService.GetSectionEditAsync(BookSlug, PartSlug, SectionSlug, User);
                        Model = new SectionEdit()
                        {
                            ParentSectionKey = parentSection.SectionKey,
                            SectionName = "New Section",
                            PartKey = parentSection.PartKey
                        };
                    }
                    else
                    {
                        var part = await PartService.GetPartDetailAsync(BookSlug, PartSlug, User);
                        Model = new SectionEdit()
                        {
                            SectionName = "New Section",
                            PartKey = part.PartKey
                        };
                    }
                }
                else
                {
                    Model = await SectionService.GetSectionEditAsync(BookSlug, PartSlug, SectionSlug!, User);
                }

                ParentSections = await SectionService.PossibleParentsForSectionAsync(Model.PartKey, Model.SectionKey, User);

                if (newMode)//Place the new section at the end of the parent section
                {
                    Model.DisplayOrder = ParentSections
                        .Where(x => x.ParentSectionKey == Model.ParentSectionKey)
                        .Select(x => x.DisplayOrder)
                        .DefaultIfEmpty(0)
                        .Max() + 1;
                }

                ParentUpdated();
            }
        }

        public List<SectionForLists> ParentSections = new List<SectionForLists>();
    }
}
