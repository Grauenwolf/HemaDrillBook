using HemaDrillBook.Models;
using HemaDrillBook.Services;
using Microsoft.AspNetCore.Components;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace HemaDrillBook.Pages
{
    public class IndexBase : EngineBase<List<BookNameMap>>
    {
#nullable disable
        [Inject] BookService BookService { get; set; }
#nullable restore

        protected override async Task ParametersSetAsync()
        {
            if (Model == null)
                Model = await BookService.GetBookNameMapAsync(false, User);
        }
    }
}
