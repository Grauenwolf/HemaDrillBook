﻿using HemaDrillBook.UI.Models;
using HemaDrillBook.UI.Services;
using Microsoft.AspNetCore.Components;
using System.Threading.Tasks;

namespace HemaDrillBook.Pages
{
    public class BookBase : EngineBase<BookDetail>
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

        protected override async Task ParametersSetAsync()
        {
            if (BookSlug == null)
            {
                Navigation.NavigateTo("/b");
                return;
            }

            if (Model == null)
                Model = await BookService.GetBookDetailAsync(BookSlug, User);
        }
    }
}
