using HemaDrillBook.Models;
using System;
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

        //Disabled null check because of bug in Chain. See https://github.com/docevaad/Chain/issues/317 in Chain 3.1
        protected SqlServerDataSource DataSource(IUser? currentUser) => m_DataSource.WithUser(currentUser!);

        /*
        protected async Task<bool> CanEditBookAsync(int bookKey, IUser currentUser)
        {
            if (currentUser == null)
                return false;
            var result = await m_DataSource.From("dbo.BookEditor", new { bookKey, currentUser.UserKey }).AsCount().ExecuteAsync();
            return (result > 0);
        }

        protected async Task CheckPermissionTagEditorAsync(IUser currentUser)
        {
            var result = await m_DataSource.From("dbo.BookEditor", new { currentUser.UserKey }).AsCount().ExecuteAsync();
            if (result == 0)
                throw new UnauthorizedAccessException("Permission denied to edit this record.");
        }

        protected async Task CheckPermissionBookAsync(int bookKey, IUser currentUser)
        {
            var result = await m_DataSource.From("dbo.BookEditor", new { bookKey, currentUser.UserKey }).AsCount().ExecuteAsync();
            if (result == 0)
                throw new UnauthorizedAccessException("Permission denied to edit this record.");
        }

        protected async Task CheckPermissionSectionAsyc(int sectionKey, IUser currentUser)
        {
            var result = await m_DataSource.From("dbo.SectionEditor", new { sectionKey, currentUser.UserKey }).AsCount().ExecuteAsync();
            if (result == 0)
                throw new UnauthorizedAccessException("Permission denied to edit this record.");
        }

        protected async Task CheckPermissionVideoAsync(int videoKey, IUser currentUser)
        {
            var result = await m_DataSource.From("dbo.VideoEditor", new { videoKey, currentUser.UserKey }).AsCount().ExecuteAsync();
            if (result == 0)
                throw new UnauthorizedAccessException("Permission denied to edit this record.");
        }

        protected async Task CheckPermissionPlayAsync(int playKey, IUser currentUser)
        {
            var result = await m_DataSource.From("dbo.PlayEditor", new { playKey, currentUser.UserKey }).AsCount().ExecuteAsync();
            if (result == 0)
                throw new UnauthorizedAccessException("Permission denied to edit this record.");
        }
        */
    }
}
