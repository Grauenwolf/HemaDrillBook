using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading;
using System.Threading.Tasks;
using Tortuga.Chain;

namespace HemaDrillBook
{
    public class ChainIdentityStore : IUserStore<ApplicationUser>
    //IUserLoginStore<ApplicationUser>,
    //IUserClaimStore<ApplicationUser>,
    //IUserPasswordStore<ApplicationUser>,
    //IUserSecurityStampStore<ApplicationUser>,
    //IUserEmailStore<ApplicationUser>,
    //IUserLockoutStore<ApplicationUser>,
    //IUserPhoneNumberStore<ApplicationUser>,
    //IQueryableUserStore<ApplicationUser>,
    //IUserTwoFactorStore<ApplicationUser>,
    //IUserAuthenticationTokenStore<ApplicationUser>,
    //IUserAuthenticatorKeyStore<ApplicationUser>,
    //IUserTwoFactorRecoveryCodeStore<ApplicationUser>
    {
        static Tortuga.Chain.SqlServerDataSource s_DataSource;

        public ChainIdentityStore()
        {
            if (s_DataSource == null)
            {
                s_DataSource = new Tortuga.Chain.SqlServerDataSource("Server=.;Database=Scratch;User Id=HemaWeb;Password=tqgWpP$yxzkq}yxoBSvtsmsFT7_&#$!~<vVtynywf{tyI;MultipleActiveResultSets=true");
                s_DataSource.TestConnection();
            }
        }

        const string UserTable = "dbo.AspNetUsers";

        async Task<IdentityResult> IUserStore<ApplicationUser>.CreateAsync(ApplicationUser user, CancellationToken cancellationToken)
        {
            await s_DataSource.Insert(UserTable, user).ExecuteAsync(cancellationToken);
            return IdentityResult.Success;
        }

        async Task<IdentityResult> IUserStore<ApplicationUser>.DeleteAsync(ApplicationUser user, CancellationToken cancellationToken)
        {
            await s_DataSource.Delete(UserTable, user).ExecuteAsync(cancellationToken);
            return IdentityResult.Success;
        }

        void IDisposable.Dispose()
        {
            //no-opt
        }

        async Task<ApplicationUser> IUserStore<ApplicationUser>.FindByIdAsync(string userId, CancellationToken cancellationToken)
        {
            return await s_DataSource.From(UserTable, new { ID = userId }).ToObject<ApplicationUser>(RowOptions.AllowEmptyResults).ExecuteAsync(cancellationToken);
        }

        async Task<ApplicationUser> IUserStore<ApplicationUser>.FindByNameAsync(string normalizedUserName, CancellationToken cancellationToken)
        {
            return await s_DataSource.From(UserTable, new { NormalizedUserName = normalizedUserName }).ToObject<ApplicationUser>().ExecuteAsync(cancellationToken);
        }

        Task<string> IUserStore<ApplicationUser>.GetNormalizedUserNameAsync(ApplicationUser user, CancellationToken cancellationToken)
        {
            return Task.FromResult(user.NormalizedUserName);
        }

        Task<string> IUserStore<ApplicationUser>.GetUserIdAsync(ApplicationUser user, CancellationToken cancellationToken)
        {
            return Task.FromResult(user.Id);
        }

        Task<string> IUserStore<ApplicationUser>.GetUserNameAsync(ApplicationUser user, CancellationToken cancellationToken)
        {
            return Task.FromResult(user.UserName);
        }

        Task IUserStore<ApplicationUser>.SetNormalizedUserNameAsync(ApplicationUser user, string normalizedName, CancellationToken cancellationToken)
        {
            user.NormalizedUserName = normalizedName;
            return Task.CompletedTask;
        }

        Task IUserStore<ApplicationUser>.SetUserNameAsync(ApplicationUser user, string userName, CancellationToken cancellationToken)
        {
            user.UserName = userName;
            return Task.CompletedTask;
        }

        async Task<IdentityResult> IUserStore<ApplicationUser>.UpdateAsync(ApplicationUser user, CancellationToken cancellationToken)
        {
            user.ConcurrencyStamp = Guid.NewGuid().ToString();
            await s_DataSource.Update(UserTable, user).ExecuteAsync(cancellationToken);
            return IdentityResult.Success;
        }
    }
}
