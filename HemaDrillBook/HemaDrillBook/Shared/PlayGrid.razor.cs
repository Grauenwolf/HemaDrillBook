using HemaDrillBook.Services.UI;
using Microsoft.AspNetCore.Components;

namespace HemaDrillBook.Shared
{
    public class PlayGridBase : ComponentBase
    {
        [Parameter]
        public PlayDetail? Play { get; set; }

        protected const string agentStyle = "background-color:mistyrose";
        protected const string patientStyle = "background-color:khaki";
    }
}
