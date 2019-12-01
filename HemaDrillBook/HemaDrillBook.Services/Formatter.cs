using System.Linq;

namespace HemaDrillBook
{
    static class Formatter
    {
        public static string? Join(string combiner, params string?[] names)
        {
            names = names.Where(x => !string.IsNullOrWhiteSpace(x)).ToArray();
            switch (names.Length)
            {
                case 0:
                    return null;

                case 1:
                    return names[0];

                case 2:
                    return $"{names[0]} {combiner} {names[1]}";

                default:
                    return string.Join(", ", names.Take(names.Length - 1)) + $", {combiner} {names[names.Length - 1]}";
            }
        }

        public static string? MultiPart(string? name, string? alternateName, string? modifier = null)
        {
            var result = name;
            if (alternateName != null)
                result += " (" + alternateName + ")";
            if (modifier != null)
                result += " " + modifier;

            return result?.Trim();
        }
    }
}
