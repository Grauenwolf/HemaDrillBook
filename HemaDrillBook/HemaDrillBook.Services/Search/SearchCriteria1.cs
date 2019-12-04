using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace HemaDrillBook.Services.Search
{
    public abstract class SearchCriteria1 : SearchCriteria
    {
        [NotMapped]
        internal abstract int Key { get; }
    }
}
