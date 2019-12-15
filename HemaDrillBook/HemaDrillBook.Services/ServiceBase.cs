using HemaDrillBook.Models;
using System;
using System.Threading.Tasks;
using Tortuga.Chain;

namespace HemaDrillBook.Services
{
    public abstract class ServiceBase
    {
        private readonly SqlServerDataSource m_DataSource;

        protected ServiceBase(SqlServerDataSource dataSource)
        {
            m_DataSource = dataSource ?? throw new ArgumentNullException(nameof(dataSource));
        }

        //protected async Task CheckPermissionBookAsync(int bookKey, IUser currentUser)
        //{
        //    if (currentUser == null || currentUser.UserKey == 0)
        //        throw new UnauthorizedAccessException("Please login.");

        //    var result = await DataSource(currentUser).From("Accounts.BookEditorDetail", new { bookKey, currentUser.UserKey }).AsCount().ExecuteAsync();

        //    if (result == 0)
        //        throw new UnauthorizedAccessException("Permission denied to edit this book.");
        //}

        protected async Task CheckPermissionPartAsync(int partKey, IUser? currentUser)
        {
            if (currentUser == null || currentUser.UserKey == 0)
                throw new UnauthorizedAccessException("Please login.");

            var result = await DataSource(currentUser).From("Accounts.PartEditorDetail", new { partKey, currentUser.UserKey }).AsCount().ExecuteAsync();

            if (result == 0)
                throw new UnauthorizedAccessException("Permission denied to edit this part or section.");
        }

        protected async Task CheckPermissionPlayAsync(int playKey, IUser currentUser)
        {
            if (currentUser == null || currentUser.UserKey == 0)
                throw new UnauthorizedAccessException("Please login.");

            var partKey = await DataSource(currentUser).From("Interpretations.PlayDetail", new { playKey }).ToInt32("PartKey").ExecuteAsync();
            await CheckPermissionPartAsync(partKey, currentUser);
        }

        protected async Task CheckPermissionSectionAsync(int sectionKey, IUser? currentUser)
        {
            if (currentUser == null || currentUser.UserKey == 0)
                throw new UnauthorizedAccessException("Please login.");

            var partKey = await DataSource(currentUser).From("Sources.SectionDetail", new { sectionKey }).ToInt32("PartKey").ExecuteAsync();
            await CheckPermissionPartAsync(partKey, currentUser);
        }

        protected void CheckPermissionLoggedIn(IUser? currentUser)
        {
            if (currentUser == null || currentUser.UserKey == 0)
                throw new UnauthorizedAccessException("Please login.");
        }

        public async Task<bool> MayEditPartAsync(int partKey, IUser? currentUser)
        {
            if (currentUser == null || currentUser.UserKey == 0)
                return false;

            var result = await DataSource(currentUser).From("Accounts.PartEditorDetail", new { partKey, currentUser.UserKey }).AsCount().ExecuteAsync();

            return (result > 0);
        }

        protected async Task CheckPermissionTagEditorAsync(IUser currentUser)
        {
            if (currentUser == null || currentUser.UserKey == 0)
                throw new UnauthorizedAccessException("Please login.");

            var result = await m_DataSource.From("Accounts.BookEditorDetail", new { currentUser.UserKey }).AsCount().ExecuteAsync();
            if (result == 0)
                throw new UnauthorizedAccessException("Permission denied to edit tags.");
        }

        //Disabled null check because of bug in Chain. See https://github.com/docevaad/Chain/issues/317 in Chain 3.1
        protected SqlServerDataSource DataSource(IUser? currentUser) => m_DataSource.WithUser(currentUser!);

        /*
        protected async Task CheckPermissionVideoAsync(int videoKey, IUser currentUser)
        {
            var result = await m_DataSource.From("dbo.VideoEditor", new { videoKey, currentUser.UserKey }).AsCount().ExecuteAsync();
            if (result == 0)
                throw new UnauthorizedAccessException("Permission denied to edit this record.");
        }
        */
    }
}
