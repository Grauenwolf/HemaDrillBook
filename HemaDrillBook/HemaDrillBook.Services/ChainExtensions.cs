using System;
using System.Threading;
using System.Threading.Tasks;
using Tortuga.Chain;
using Tortuga.Chain.Appenders;

namespace HemaDrillBook.Services
{
    internal static class ClearCacheAppender
    {
        public static ILink<TResult> ClearCache<TResult>(this ILink<TResult> previousLink)
        {
            return new ClearCacheAppender<TResult>(previousLink);
        }
    }

    internal sealed class ClearCacheAppender<TResult> : Appender<TResult>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="InvalidateCacheAppender{TResult}"/> class.
        /// </summary>
        /// <param name="previousLink">The previous link.</param>
        /// <param name="cacheKey">The cache key.</param>
        /// <exception cref="ArgumentNullException">previousLink;previousLink is null.</exception>
        /// <exception cref="ArgumentException">cacheKey is null or empty.;cacheKey</exception>
        public ClearCacheAppender(ILink<TResult> previousLink) : base(previousLink)
        {
        }

        /// <summary>
        /// Execute the operation synchronously.
        /// </summary>
        /// <param name="state">User defined state, usually used for logging.</param>
        public override TResult Execute(object? state = null)
        {
            DataSource.Cache.Clear();

            return PreviousLink.Execute(state);
        }

        /// <summary>
        /// Execute the operation asynchronously.
        /// </summary>
        /// <param name="cancellationToken">The cancellation token.</param>
        /// <param name="state">User defined state, usually used for logging.</param>
        /// <returns></returns>
        public override async Task<TResult> ExecuteAsync(CancellationToken cancellationToken, object? state = null)
        {
            await DataSource.Cache.ClearAsync().ConfigureAwait(false);

            return await PreviousLink.ExecuteAsync(state).ConfigureAwait(false);
        }
    }
}
