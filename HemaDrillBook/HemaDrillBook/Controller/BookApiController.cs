using HemaDrillBook.Api.Models;
using HemaDrillBook.Api.Services;
using HemaDrillBook.Data;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace HemaDrillBook.Controllers
{
    [Produces("application/json")]
    [Route("api/book")]
    public class BookApiController : SecureController
    {
        private readonly BookApiService m_BookService;

        //private readonly VideoService m_VideoService;
        private readonly PlayApiService m_PlayService;

        public BookApiController(BookApiService bookService, /*VideoService videoService,*/ PlayApiService playService, UserManager<ApplicationUser> userManager) : base(userManager)
        {
            //m_VideoService = videoService ?? throw new ArgumentNullException(nameof(videoService));
            m_BookService = bookService ?? throw new ArgumentNullException(nameof(bookService));
            m_PlayService = playService ?? throw new ArgumentNullException(nameof(playService));
        }

        [HttpGet("{bookKey}")]
        public async Task<BookSummary> GetBook([FromRoute] int bookKey)
        {
            return await m_BookService.GetBookSummaryAsync(bookKey, await GetCurrentUserAsync());
        }

        [HttpGet("{bookKey}/detail")]
        public async Task<BookDetailWithSections> GetBookDetailAsync([FromRoute] int bookKey)
        {
            return await m_BookService.GetBookDetailWithSectionsAsync(bookKey, await GetCurrentUserAsync());
        }

        [HttpGet("")]
        public async Task<List<BookSummary>> GetAllBooksAsync()
        {
            return await m_BookService.GetBooksAsync(await GetCurrentUserAsync());
        }

        [HttpGet("{BookKey}/{SectionKey}")]
        public async Task<SectionDetail> GetSectionDetail([FromRoute] int SectionKey)
        {
            return await m_BookService.GetSectionDetailAsync(SectionKey, await GetCurrentUserAsync());
        }

        /*
		[HttpPost("addVideo")]
		public async Task<int> AddVideo([FromBody] NewVideo video)
		{
			return await m_VideoService.AddVideo(video, await GetCurrentUserAsync());
		}

		[HttpPost("updateVideo")]
		public async Task UpdateVideo([FromBody] UpdatedVideo video)
		{
			await m_VideoService.UpdateVideoAsync(video, await GetCurrentUserAsync());
		}
        */

        [HttpPost("updatePlay")]
        public async Task<int> UpdatePlay([FromBody] Play play)
        {
            return await m_PlayService.UpdatePlayAsync(play, await GetCurrentUserAsync());
        }
    }
}
