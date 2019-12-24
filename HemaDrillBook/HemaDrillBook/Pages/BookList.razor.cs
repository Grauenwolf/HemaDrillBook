using HemaDrillBook.Services.UI;
using Microsoft.AspNetCore.Components;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace HemaDrillBook.Pages
{
    partial class BookList
    {
#nullable disable
        [Inject] BookService BookService { get; set; }
#nullable restore

        protected override async Task ParametersSetAsync()
        {
            if (Model == null)
                Model = await BookService.GetBookNameMapAsync(true, User);
        }
    }
}
