using HemaDrillBook.Models;
using HemaDrillBook.Services;
using HemaDrillBook.UI.Models;
using System;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Tortuga.Chain;

namespace HemaDrillBook.UI.Services
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

        public async Task<int> AddVideoAsync(VideoInput video, IUser currentUser)
        {
            CheckPermissionLoggedIn(currentUser);

            if (video == null)
                throw new ArgumentNullException(nameof(video), $"{nameof(video)} is null.");
            if (video.Url == null)
                throw new ArgumentNullException(nameof(video), $"{nameof(video)}.{video.Url} is null.");

            //https://www.youtube.com/watch?v=6ISOK-XtvYs

            if (video.Url.Contains("www.youtube.com") || video.Url.Contains("youtu.be"))
            {
                var uri = new Uri(video.Url);
                var query = HttpUtility.ParseQueryString(uri.Query);

                if (query.AllKeys.Contains("v"))
                {
                    video.VideoServiceVideoId = query["v"];
                }
                else
                {
                    video.VideoServiceVideoId = uri.Segments.Last();
                }

                video.VideoServiceKey = 1;
            }
            else
            {
                video.VideoServiceKey = 0;
            }

            if (string.IsNullOrWhiteSpace(video.Description))
                video.Description = null;
            if (string.IsNullOrWhiteSpace(video.Url))
                video.Url = null;
            if (string.IsNullOrWhiteSpace(video.Author))
                video.Author = null;

            return await DataSource(currentUser).Insert("Interpretations.Video", video).ToInt32().ExecuteAsync();
        }

        public async Task UpdateCommentaryAsync(CommentaryInput commentaryInput, IUser currentUser)
        {
            commentaryInput.UserKey = currentUser.UserKey!.Value;
            //Hack: Why is UserKey nullable?
            //Hack: Chain fails to Upsert when there are multiple PKs and one of them comes from the current user instead of the model

            //Null out empty string.
            if (commentaryInput.PublicNotes == "") commentaryInput.PublicNotes = null;
            if (commentaryInput.PrivateNotes == "") commentaryInput.PrivateNotes = null;

            await DataSource(currentUser).Upsert("Interpretations.Commentary", commentaryInput).ExecuteAsync();
        }
    }
}
