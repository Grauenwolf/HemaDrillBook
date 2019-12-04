using System;

namespace HemaDrillBook.Services.Search
{
    public class Measure : SearchCriteria1
    {
        public int MeasureKey { get; set; }
        public string? MeasureName { get; set; }
        public string? AlternateMeasureName { get; set; }
        internal override int Key => MeasureKey;

        public string? MeasureFullName => Formatter.MultiPart(MeasureName, AlternateMeasureName);
    }
}
