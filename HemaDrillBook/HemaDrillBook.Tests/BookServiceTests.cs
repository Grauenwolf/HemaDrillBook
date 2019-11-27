using HemaDrillBook.Services;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace HemaDrillBook.Tests
{
    [TestClass]
    public class BookServiceTests : TestBase
    {
        [TestMethod]
        public async Task BookService()
        {
            var bs = new BookService(DataSource);
            var rows = await bs.GetBookNameMapAsync(null);
            foreach (var row in rows)
            {
                Assert.IsFalse(string.IsNullOrWhiteSpace(row.BookSlug), "Slug shouldn't be null");
                Assert.IsFalse(string.IsNullOrWhiteSpace(row.BookName), "BookName shouldn't be null");
            }
        }
    }
}
