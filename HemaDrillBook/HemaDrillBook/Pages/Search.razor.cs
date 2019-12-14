using HemaDrillBook.Services.Search;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.WebUtilities;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HemaDrillBook.Pages
{
    public class SearchBase : EngineBase<SearchDefinition>
    {
#nullable disable
        [Inject] SearchService SearchService { get; set; }
#nullable restore

        public string? ErrorDisplay { get; set; }

        protected override async Task ParametersSetAsync()
        {
            if (Model == null)
            {
                Model = new SearchDefinition();
                await SearchService.PopulateSearchDefinitionAsync(Model, User);
            }
            var uri = Navigation.ToAbsoluteUri(Navigation.Uri);

            var temp = QueryHelpers.ParseQuery(uri.Query).ToDictionary(x => x.Key, x => (IList<string>)x.Value);
            Model.Reset();
            Model.SetValues(temp);

            //TODO: Run query;

            StateHasChanged();
        }

        protected void RunSearch()
        {
            //These should never happen.
            if (Model == null)
            {
                ErrorDisplay = "Search not loaded.";
                return;
            }

            Navigation.NavigateTo("/search/results?" + Model?.ToQueryString());
        }
    }
}
