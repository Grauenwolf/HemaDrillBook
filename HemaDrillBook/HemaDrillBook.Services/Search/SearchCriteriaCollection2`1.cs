using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;

namespace HemaDrillBook.Services.Search
{
    public class SearchCriteriaCollection2<T> : Collection<T> where T : SearchCriteria2
    {
        public void SetValues(IList<string> queryParameters)
        {
            foreach (var item in queryParameters)
                foreach (var subItem in item.Split(","))
                    SetValues(subItem);
        }

        void SetValues(string queryParameter)
        {
            //intentionally being very generous here. We don't want errors when someone hand-modifies a query string.

            var parts = queryParameter.Split('-');
            int key1 = 0;
            int? key2 = null;

            if (parts.Length >= 1)
                if (!int.TryParse(parts[0], out key1))
                    return; //Couldn't parse first component, this parameter is unusable

            if (parts.Length >= 2)
                if (int.TryParse(parts[1], out var temp)) //if this fails, assume 2nd component was null
                    key2 = temp;

            foreach (var item in this)
                if (item.Key1 == key1 && item.Key2 == key2)
                {
                    item.IsSelected = true;
                    return;
                }
        }

        public void Reset()
        {
            foreach (var item in this)
                item.IsSelected = false;
        }

        public string? ToQueryString(string queryKey)
        {
            if (this.Any(x => x.IsSelected))
                return queryKey + "=" + string.Join(",", this.Where(x => x.IsSelected).Select(x => x.Key2.HasValue ? $"{x.Key1}-{x.Key2}" : x.Key1.ToString()));

            return null;
        }
    }
}
