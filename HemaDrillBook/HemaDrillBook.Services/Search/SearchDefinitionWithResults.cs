using System;
using System.Collections.Generic;
using System.Linq;

namespace HemaDrillBook.Services.Search
{
	public class SearchDefinitionWithResults : SearchDefinition
	{
		public List<SearchResult>? Results { get; set; }

		public IEnumerable<(int BookKey, string? BookName)> DistinctBooks()
		{
			if (Results == null)
				throw new InvalidOperationException("Results are null.");
			return Results.Select(x => (x.BookKey, x.BookName)).Distinct();
		}

		public IEnumerable<(int PartKey, string? PartName)> DistinctParts(int bookKey)
		{
			if (Results == null)
				throw new InvalidOperationException("Results are null."); 
			return Results.Where(x => x.BookKey == bookKey).Select(x => (x.PartKey, x.PartName)).Distinct();
		}

		public IEnumerable<SearchResult> Plays(int partKey)
		{
			if (Results == null)
				throw new InvalidOperationException("Results are null."); 
			return Results.Where(x => x.PartKey == partKey);
		}
	}
}
