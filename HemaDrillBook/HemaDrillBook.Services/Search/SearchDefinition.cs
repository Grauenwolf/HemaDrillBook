using System.Collections.Generic;

namespace HemaDrillBook.Services.Search
{
    public class SearchDefinition
    {
        const string BooksQueryKey = "b";
        const string FootworkQueryKey = "f";
        const string GuardsQueryKey = "g";
        const string MeasureQueryKey = "m";
        const string PartsQueryKey = "p";
        const string StartingGuardsQueryKey = "sg";
        const string TargetsQueryKey = "t";
        const string TechniquesQueryKey = "a";
        const string WeaponsQueryKey = "w";

        public SearchCriteriaCollection1<Book> Books { get; set; } = new SearchCriteriaCollection1<Book>();
        public SearchCriteriaCollection1<Footwork> Footwork { get; set; } = new SearchCriteriaCollection1<Footwork>();
        public SearchCriteriaCollection2<Guard> Guards { get; set; } = new SearchCriteriaCollection2<Guard>();
        public SearchCriteriaCollection1<Measure> Measure { get; set; } = new SearchCriteriaCollection1<Measure>();
        public SearchCriteriaCollection1<Part> Parts { get; set; } = new SearchCriteriaCollection1<Part>();
        public SearchCriteriaCollection2<Guard> StartingGuards { get; set; } = new SearchCriteriaCollection2<Guard>();
        public SearchCriteriaCollection1<Target> Targets { get; set; } = new SearchCriteriaCollection1<Target>();
        public SearchCriteriaCollection1<Technique> Techniques { get; set; } = new SearchCriteriaCollection1<Technique>();
        public SearchCriteriaCollection2<Weapon> Weapons { get; set; } = new SearchCriteriaCollection2<Weapon>();

        public string ToQueryString()
        {
            var queryParts = new List<string>();
            AddIfNotNull(Books.ToQueryString(BooksQueryKey));
            AddIfNotNull(Parts.ToQueryString(PartsQueryKey));
            AddIfNotNull(Footwork.ToQueryString(FootworkQueryKey));
            AddIfNotNull(Targets.ToQueryString(TargetsQueryKey));
            AddIfNotNull(Measure.ToQueryString(MeasureQueryKey));
            AddIfNotNull(Techniques.ToQueryString(TechniquesQueryKey));
            AddIfNotNull(Weapons.ToQueryString(WeaponsQueryKey));
            AddIfNotNull(Guards.ToQueryString(GuardsQueryKey));
            AddIfNotNull(StartingGuards.ToQueryString(StartingGuardsQueryKey));

            return string.Join("&", queryParts);

            void AddIfNotNull(string? value)
            {
                if (value != null)
                    queryParts.Add(value);
            }
        }

        public void Reset()
        {
            Books.Reset();
            Parts.Reset();
            Footwork.Reset();
            Targets.Reset();
            Measure.Reset();
            Techniques.Reset();
            Weapons.Reset();
            Guards.Reset();
            StartingGuards.Reset();
        }

        public void SetValues(IDictionary<string, IList<string>> queryParameters)
        {
            if (queryParameters.TryGetValue(BooksQueryKey, out var b))
                Books.SetValues(b);
            if (queryParameters.TryGetValue(PartsQueryKey, out var p))
                Parts.SetValues(p);
            if (queryParameters.TryGetValue(FootworkQueryKey, out var f))
                Footwork.SetValues(f);
            if (queryParameters.TryGetValue(TargetsQueryKey, out var t))
                Targets.SetValues(t);
            if (queryParameters.TryGetValue(MeasureQueryKey, out var m))
                Measure.SetValues(m);
            if (queryParameters.TryGetValue(TechniquesQueryKey, out var a))
                Techniques.SetValues(a);
            if (queryParameters.TryGetValue(WeaponsQueryKey, out var w))
                Weapons.SetValues(w);
            if (queryParameters.TryGetValue(GuardsQueryKey, out var g))
                Guards.SetValues(g);
            if (queryParameters.TryGetValue(StartingGuardsQueryKey, out var sg))
                StartingGuards.SetValues(sg);
        }
    }
}
