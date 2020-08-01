using HemaDrillBook.Services.UI;
using Microsoft.AspNetCore.Components;
using System.Threading.Tasks;

namespace HemaDrillBook.Pages
{
    partial class PartPage
    {
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
        public string? Tab
        {
            get => Get<string?>();
            set => Set(value, false);
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

            if (Model == null)
                Model = await PartService.GetPartDetailAsync(BookSlug, PartSlug, User);

            PageTitle = Model.PartName;
        }
    }
}
