using HemaDrillBook.Services.UI;
using Microsoft.AspNetCore.Components;
using System.Threading.Tasks;

namespace HemaDrillBook.Pages
{
    partial class BookPage
    {
        [Inject] BookService BookService { get; set; } = null!;

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

            PageTitle = Model.BookName;
        }
    }
}
