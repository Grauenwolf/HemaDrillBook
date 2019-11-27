using HemaDrillBook.Services;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Threading.Tasks;

namespace HemaDrillBook.Tests
{
    [TestClass]
    public class BookServiceTests : TestBase
    {
        [TestMethod]
        public async Task GetBookNameMapAsync()
        {
            var bs = new BookService(DataSource);
            var rows = await bs.GetBookNameMapAsync(null);
            foreach (var row in rows)
            {
                Assert.IsFalse(string.IsNullOrWhiteSpace(row.BookSlug), "BookSlug shouldn't be null");
                Assert.IsFalse(string.IsNullOrWhiteSpace(row.BookName), "BookName shouldn't be null");
            }
        }

        [TestMethod]
        public async Task GetBookDetailAsync()
        {
            var bs = new BookService(DataSource);
            var books = await DataSource.From("Sources.Book").ToStringList("BookSlug").ExecuteAsync();
            foreach (var slug in books)
            {
                var row = await bs.GetBookDetailAsync(slug, null);
                Assert.IsFalse(string.IsNullOrWhiteSpace(row.BookSlug), "BookSlug shouldn't be null");
                Assert.IsFalse(string.IsNullOrWhiteSpace(row.BookName), "BookName shouldn't be null");

                if (row.WiktenauerUrl != null)
                {
                    try
                    {
                        var uri = new Uri(row.WiktenauerUrl);
                    }
                    catch (Exception ex)
                    {
                        throw new AssertFailedException("Cannot parse WiktenauerUrl", ex);
                    }
                }
            }
        }

        [TestMethod]
        public async Task GetAuthorsByBookAsync()
        {
            var bs = new BookService(DataSource);
            var books = await DataSource.From("Sources.Book").ToInt32List("BookKey").ExecuteAsync();
            foreach (var bookKey in books)
            {
                var rows = await bs.GetAuthorsByBookAsync(bookKey, null);
                foreach (var row in rows)
                {
                    Assert.IsFalse(string.IsNullOrWhiteSpace(row.AuthorSlug), "AuthorSlug shouldn't be null");
                    Assert.IsFalse(string.IsNullOrWhiteSpace(row.AuthorName), "AuthorName shouldn't be null");
                }
            }
        }

        [TestMethod]
        public async Task GetBookWeaponsAsync()
        {
            var bs = new BookService(DataSource);
            var books = await DataSource.From("Sources.Book").ToInt32List("BookKey").ExecuteAsync();
            foreach (var bookKey in books)
            {
                var rows = await bs.GetBookWeaponsAsync(bookKey, null);
                foreach (var row in rows)
                {
                    Assert.IsFalse(string.IsNullOrWhiteSpace(row.PrimaryWeaponName), "PrimaryWeaponName shouldn't be null");
                }
            }
        }

        [TestMethod]
        public async Task GetPartWeaponsAsync()
        {
            var bs = new BookService(DataSource);
            var parts = await DataSource.From("Sources.Part").ToInt32List("PartKey").ExecuteAsync();
            foreach (var partKey in parts)
            {
                var rows = await bs.GetPartWeaponsAsync(partKey, null);
                foreach (var row in rows)
                {
                    Assert.IsFalse(string.IsNullOrWhiteSpace(row.PrimaryWeaponName), "PrimaryWeaponName shouldn't be null");
                }
            }
        }

        [TestMethod]
        public async Task GetBookPartsAsync()
        {
            var bs = new BookService(DataSource);
            var books = await DataSource.From("Sources.Book").ToInt32List("BookKey").ExecuteAsync();
            foreach (var bookKey in books)
            {
                var rows = await bs.GetBookPartsAsync(bookKey, null);
                foreach (var row in rows)
                {
                    Assert.IsFalse(string.IsNullOrWhiteSpace(row.PartSlug), "PartSlug shouldn't be null");
                    Assert.IsFalse(string.IsNullOrWhiteSpace(row.PartName), "PartName shouldn't be null");
                }
            }
        }

        [TestMethod]
        public async Task GetBookAlternateNamesAsync()
        {
            var bs = new BookService(DataSource);
            var books = await DataSource.From("Sources.Book").ToInt32List("BookKey").ExecuteAsync();
            foreach (var bookKey in books)
            {
                var rows = await bs.GetBookAlternateNamesAsync(bookKey, null);
                foreach (var row in rows)
                {
                    Assert.IsFalse(string.IsNullOrWhiteSpace(row), "Name shouldn't be null");
                }
            }
        }
    }
}
