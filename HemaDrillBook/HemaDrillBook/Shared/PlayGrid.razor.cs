using HemaDrillBook.Services.UI;
using Microsoft.AspNetCore.Components;

namespace HemaDrillBook.Shared
{
    partial class PlayGrid
    {
        protected const string agentStyle = "background-color:#C3DDB8";

        protected const string patientStyle = "background-color:#FFF5CC";

        [Parameter]
        public PlayDetail? Play { get; set; }
    }
}