using HemaDrillBook.Services;
using System.Collections.Generic;

namespace HemaDrillBook.Services.UI
{
    public class PlayDetail : PlaySummary
    {
        public string? AAlternateGuardName { get; set; }
        public string? AGuardFullName => Formatter.MultiPart(AGuardName, AAlternateGuardName, AGuardModifierName);

        //public int? AGuardKey { get; set; }
        //public int? AGuardModifierKey { get; set; }
        public string? AGuardModifierName { get; set; }

        public string? AGuardName { get; set; }

        //public int? MeasureKey { get; set; }
        public string? MeasureName { get; set; }

        public string? PAlternateGuardName { get; set; }
        public string? PGuardFullName => Formatter.MultiPart(PGuardName, PAlternateGuardName, PGuardModifierName);

        //public int? PGuardKey { get; set; }
        //public int? PGuardModifierKey { get; set; }
        public string? PGuardModifierName { get; set; }

        public string? PGuardName { get; set; }
        public List<PlayStepDetail> Steps { get; } = new List<PlayStepDetail>();
    }
}
