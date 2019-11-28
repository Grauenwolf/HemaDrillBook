namespace HemaDrillBookTools.Services
{
    public interface ITag
    {
        int? Key { get; set; }
        string Name { get; set; }
        string AlternateName { get; set; }
        bool HasAlternateName { get; }
    }
}
