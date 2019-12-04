using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace HemaDrillBook.Services.Search
{
    public abstract class SearchCriteria2 : SearchCriteria
    {
        [NotMapped]
        internal abstract int Key1 { get; }

        [NotMapped]
        internal abstract int? Key2 { get; }
    }
}
