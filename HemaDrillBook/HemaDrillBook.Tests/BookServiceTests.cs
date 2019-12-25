using HemaDrillBook.Services.UI;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Threading.Tasks;

namespace HemaDrillBook.Tests
{
    [TestClass]
    public class BookServiceTests : TestBase
    {
        [TestMethod]
        public async Task GetBookNameMapAsync_True()
        {
            var service = new BookService(DataSource);
            var rows = await service.GetBookNameMapAsync(true, null);
            foreach (var row in rows)
            {
                Assert.IsFalse(string.IsNullOrWhiteSpace(row.BookSlug), "BookSlug shouldn't be null");
                Assert.IsFalse(string.IsNullOrWhiteSpace(row.BookName), "BookName shouldn't be null");
            }
        }

        [TestMethod]
        public async Task GetBookNameMapAsync_False()
        {
            var service = new BookService(DataSource);
            var rows = await service.GetBookNameMapAsync(false, null);
            foreach (var row in rows)
            {
                Assert.IsFalse(string.IsNullOrWhiteSpace(row.BookSlug), "BookSlug shouldn't be null");
                Assert.IsFalse(string.IsNullOrWhiteSpace(row.BookName), "BookName shouldn't be null");
            }
        }

        [TestMethod]
        public async Task GetBookDetailAsync()
        {
            var service = new BookService(DataSource);
            var books = await DataSource.From("Sources.Book").ToStringList("BookSlug").ExecuteAsync();
            foreach (var slug in books)
            {
                var row = await service.GetBookDetailAsync(slug, null);
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
            var service = new BookService(DataSource);
            var books = await DataSource.From("Sources.Book").ToInt32List("BookKey").ExecuteAsync();
            foreach (var bookKey in books)
            {
                var rows = await service.GetAuthorsByBookAsync(bookKey, null);
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
            var service = new BookService(DataSource);
            var books = await DataSource.From("Sources.Book").ToInt32List("BookKey").ExecuteAsync();
            foreach (var bookKey in books)
            {
                var rows = await service.GetBookWeaponsAsync(bookKey, null);
                foreach (var row in rows)
                {
                    Assert.IsFalse(string.IsNullOrWhiteSpace(row.PrimaryWeaponName), "PrimaryWeaponName shouldn't be null");
                }
            }
        }

        [TestMethod]
        public async Task GetPartWeaponsAsync()
        {
            var service = new PartService(DataSource);
            var parts = await DataSource.From("Sources.Part").ToInt32List("PartKey").ExecuteAsync();
            foreach (var partKey in parts)
            {
                var rows = await service.GetPartWeaponsAsync(partKey, null);
                foreach (var row in rows)
                {
                    Assert.IsFalse(string.IsNullOrWhiteSpace(row.PrimaryWeaponName), "PrimaryWeaponName shouldn't be null");
                }
            }
        }

        [TestMethod]
        public async Task GetPartPlaysAsync()
        {
            var service = new PartService(DataSource);
            var parts = await DataSource.From("Sources.Part").ToInt32List("PartKey").ExecuteAsync();
            foreach (var partKey in parts)
            {
                var rows = await service.GetPartPlaysAsync(partKey, null);
                foreach (var row in rows)
                {
                    Assert.IsFalse(string.IsNullOrWhiteSpace(row.PlayFullName), "PlayFullName shouldn't be null");
                    Assert.IsFalse(string.IsNullOrWhiteSpace(row.SectionUrlFragment), "SectionUrlFragment shouldn't be null");
                }
            }
        }

        [TestMethod]
        public async Task GetPartDetailAsync()
        {
            var service = new PartService(DataSource);
            var books = await DataSource.From("Sources.Book").ToStringList("BookSlug").ExecuteAsync();
            foreach (var bookSlug in books)
            {
                var parts = await DataSource.From("Sources.PartDetail", new { bookSlug }).ToStringList("PartSlug").ExecuteAsync();
                foreach (var partSlug in parts)
                {
                    var row = await service.GetPartDetailAsync(bookSlug, partSlug, null);
                }
            }
        }

        [TestMethod]
        public async Task GetSectionDetailAsync()
        {
            var service = new SectionService(DataSource);
            var books = await DataSource.From("Sources.Book").ToStringList("BookSlug").ExecuteAsync();
            foreach (var bookSlug in books)
            {
                var parts = await DataSource.From("Sources.PartDetail", new { bookSlug }).ToStringList("PartSlug").ExecuteAsync();
                foreach (var partSlug in parts)
                {
                    var sections = await DataSource.From("Sources.SectionDetail", new { bookSlug, partSlug }).ToStringList("SectionSlug").ExecuteAsync();

                    foreach (var sectionSlug in sections)
                    {
                        var row = await service.GetSectionDetailAsync(bookSlug, partSlug, sectionSlug, null);
                    }
                }
            }
        }

        [TestMethod]
        public async Task GetBookPartsAsync()
        {
            var service = new BookService(DataSource);
            var books = await DataSource.From("Sources.Book").ToInt32List("BookKey").ExecuteAsync();
            foreach (var bookKey in books)
            {
                var rows = await service.GetBookPartsAsync(bookKey, null);
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
            var service = new BookService(DataSource);
            var books = await DataSource.From("Sources.Book").ToInt32List("BookKey").ExecuteAsync();
            foreach (var bookKey in books)
            {
                var rows = await service.GetBookAlternateNamesAsync(bookKey, null);
                foreach (var row in rows)
                {
                    Assert.IsFalse(string.IsNullOrWhiteSpace(row), "Name shouldn't be null");
                }
            }
        }
    }
}
