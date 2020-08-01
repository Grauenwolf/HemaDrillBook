using HemaDrillBook.Services.UI;
using Microsoft.AspNetCore.Components;
using System.Threading.Tasks;

namespace HemaDrillBook.Pages
{
    partial class BookListPage
    {
        [Inject] BookService BookService { get; set; } = null!;

        protected override async Task ParametersSetAsync()
        {
            if (Model == null)
                Model = await BookService.GetBookNameMapAsync(true, User);
        }
    }
}
