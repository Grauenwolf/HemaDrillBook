namespace HemaDrillBookTools.Services
{
    partial class Measure : ITag
    {
        public string MeasureFullName => Formatter.MultiPart(MeasureName, AlternateMeasureName);

        public int? Key { get => MeasureKey; set => MeasureKey = value; }
        public string Name { get => MeasureName; set => MeasureName = value; }
        public string AlternateName { get => AlternateMeasureName; set => AlternateMeasureName = value; }
        public bool HasAlternateName => true;
    }
}
