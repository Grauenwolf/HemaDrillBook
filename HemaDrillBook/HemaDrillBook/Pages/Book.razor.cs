using HemaDrillBook.Models;
using HemaDrillBook.Services;
using Microsoft.AspNetCore.Components;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace HemaDrillBook.Pages
{
    public class BookBase : EngineBase
    {
#nullable disable
        [Inject] BookService BookService { get; set; }
        [Inject] protected NavigationManager Navigation { get; set; }
#nullable restore
        [Parameter] public string? BookSlug { get; set; }

        protected BookDetail? Book { get; set; }
        protected List<string>? BookNames { get; set; }
        protected List<AuthorSummary>? AuthorList { get; set; }
        protected List<PartSummary>? PartList { get; set; }
        protected List<WeaponPairSummary>? WeaponList { get; set; }

        protected override async Task ParametersSetAsync()
        {
            if (BookSlug == null)
            {
                Navigation.NavigateTo("/book");
                return;
            }

            Book = await BookService.GetBookDetailAsync(BookSlug, User);
            BookNames = await BookService.GetBookAlternateNamesAsync(Book.BookKey, User);
            AuthorList = await BookService.GetAuthorsByBookAsync(Book.BookKey, User);
            PartList = await BookService.GetBookPartsAsync(Book.BookKey, User);
            WeaponList = await BookService.GetBookWeaponsAsync(Book.BookKey, User);
        }
    }
}
