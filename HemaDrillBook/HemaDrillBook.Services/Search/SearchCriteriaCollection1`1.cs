using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;

namespace HemaDrillBook.Services.Search
{
    public class SearchCriteriaCollection1<T> : Collection<T> where T : SearchCriteria1
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

            if (!int.TryParse(queryParameter, out var key1))
                return; //Couldn't parse component, this parameter is unusable

            foreach (var item in this)
                if (item.Key == key1)
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
                return queryKey + "=" + string.Join(",", this.Where(x => x.IsSelected).Select(x => x.Key.ToString()));

            return null;
        }
    }
}
