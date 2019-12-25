using Tortuga.Chain;

namespace HemaDrillBook.Services.UI
{
    public class PlayService : ServiceBase
    {
        public PlayService(SqlServerDataSource dataSource) : base(dataSource)
        {
        }

        //public async Task<int> UpdatePlayAsync(Play play, IUser currentUser)
        //{
        //    if (string.IsNullOrEmpty(play.VariantName))
        //        play.VariantName = null;

        //    if (play.PlayKey.HasValue)
        //        await CheckPermissionPlayAsync(play.PlayKey.Value, currentUser);
        //    else
        //        await CheckPermissionSectionAsync(play.SectionKey, currentUser);

        //    using (var dataSource = await DataSource(currentUser).BeginTransactionAsync())
        //    {
        //        if (play.PlayKey.HasValue) //Update
        //        {
        //            await dataSource.Update("Interpretations.Play", play).ExecuteAsync();
        //            //Replace all steps
        //            await dataSource.DeleteWithFilter("Interpretations.PlayStep", "PlayKey = @PlayKey", new { PlayKey = play.PlayKey.Value }).ExecuteAsync();
        //        }
        //        else
        //        {
        //            play.PlayKey = await dataSource.Insert("Interpretations.Play", play).ToInt32().ExecuteAsync();
        //        }

        //        foreach (var step in play.Steps)
        //        {
        //            step.PlayKey = play.PlayKey.Value;
        //            await dataSource.Insert("Interpretations.PlayStep", step).ExecuteAsync();
        //        }

        //        dataSource.Commit();
        //    }
        //    return play.PlayKey.Value;
        //}
    }
}
