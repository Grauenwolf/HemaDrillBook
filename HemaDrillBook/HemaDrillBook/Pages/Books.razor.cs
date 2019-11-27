using HemaDrillBook.Models;
using HemaDrillBook.Services;
using Microsoft.AspNetCore.Components;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace HemaDrillBook.Pages
{
    public class BooksBase : EngineBase
    {
#nullable disable
        [Inject] BookService BookService { get; set; }
#nullable restore

        protected List<BookNameMap>? Books { get; set; }

        protected override async Task ParametersSetAsync()
        {
            Books = await BookService.GetBookNameMapAsync(base.User);
        }
    }
}
