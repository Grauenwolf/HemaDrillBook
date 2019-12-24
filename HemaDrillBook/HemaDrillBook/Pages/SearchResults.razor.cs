using HemaDrillBook.Services.Search;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.WebUtilities;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HemaDrillBook.Pages
{
    partial class SearchResults
    {
#nullable disable
        [Inject] SearchService SearchService { get; set; }
#nullable restore

        public string? SearchParams { get; set; }

        protected override async Task ParametersSetAsync()
        {
            if (Model == null)
            {
                Model = new SearchDefinitionWithResults();
                await SearchService.PopulateSearchDefinitionAsync(Model, User);

                var uri = Navigation.ToAbsoluteUri(Navigation.Uri);
                SearchParams = uri.Query;

                var temp = QueryHelpers.ParseQuery(uri.Query).ToDictionary(x => x.Key, x => (IList<string>)x.Value);

                Model.Reset();
                Model.SetValues(temp);

                await SearchService.RunSearchAsync(Model, User);

                StateHasChanged();
            }
        }
    }
}
