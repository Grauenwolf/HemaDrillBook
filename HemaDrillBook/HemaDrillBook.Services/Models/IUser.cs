namespace HemaDrillBook.Models
{
    /// <summary>
    /// Used to track which user is modifying data.
    /// </summary>
    /// <remarks>This is implemented by ApplicationUser in the website's ASP.NET Identity layer</remarks>
    public interface IUser
    {
        int? UserKey { get; }
    }
}
