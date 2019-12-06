using HemaDrillBook.Models;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tortuga.Anchor;
using Tortuga.Chain;

namespace HemaDrillBook.Services.Search
{
    public class SearchService : ServiceBase
    {
        public SearchService(SqlServerDataSource dataSource) : base(dataSource)
        {
        }

        public async Task PopulateSearchDefinitionAsync(SearchDefinition searchDefinition, IUser? user)
        {
            var ds = DataSource(user);

            searchDefinition.Books.AddRange(await ds.Sql(@"SELECT bbp.BookKey, bbp.BookName, COUNT(*) AS Count FROM Search.BookByPlay bbp GROUP BY bbp.BookKey, bbp.BookName ORDER BY bbp.BookName").ToCollection<Book>().ExecuteAsync());

            searchDefinition.Footwork.AddRange(await ds.Sql(@"SELECT fbp.FootworkKey, fbp.FootworkName, fbp.AlternateFootworkName, COUNT(*) AS Count FROM Search.FootworkByPlay fbp GROUP BY fbp.FootworkKey, fbp.FootworkName, fbp.AlternateFootworkName ORDER BY fbp.FootworkName").ToCollection<Footwork>().ExecuteAsync());

            searchDefinition.Measure.AddRange(await ds.Sql(@"SELECT mbp.MeasureKey, mbp.MeasureName, mbp.AlternateMeasureName, COUNT(*) FROM Search.MeasureByPlay mbp GROUP BY mbp.MeasureKey, mbp.MeasureName, mbp.AlternateMeasureName ORDER BY mbp.MeasureName").ToCollection<Measure>().ExecuteAsync());

            searchDefinition.Guards.AddRange(await ds.Sql(@"SELECT gbp.GuardKey, gbp.GuardName, gbp.AlternateGuardName, gbp.GuardModifierKey, gbp.GuardModifierName, COUNT(*) AS Count FROM Search.GuardByPlay gbp GROUP BY gbp.GuardKey, gbp.GuardName, gbp.AlternateGuardName, gbp.GuardModifierKey, gbp.GuardModifierName").ToCollection<Guard>().ExecuteAsync());

            searchDefinition.StartingGuards.AddRange(await ds.Sql(@"SELECT gbp.GuardKey, gbp.GuardName, gbp.AlternateGuardName, gbp.GuardModifierKey, gbp.GuardModifierName, COUNT(*) AS Count FROM Search.GuardByPlay gbp WHERE IsStartingGuard=1 GROUP BY gbp.GuardKey, gbp.GuardName, gbp.AlternateGuardName, gbp.GuardModifierKey, gbp.GuardModifierName ORDER BY gbp.GuardName, gbp.GuardModifierName").ToCollection<Guard>().ExecuteAsync());

            searchDefinition.Targets.AddRange(await ds.Sql(@"SELECT tbp.TargetKey, tbp.TargetName, COUNT(*) FROM Search.TargetByPlay tbp GROUP BY tbp.TargetKey, tbp.TargetName ORDER BY tbp.TargetName").ToCollection<Target>().ExecuteAsync());

            searchDefinition.Techniques.AddRange(await ds.Sql(@"SELECT tbp.TechniqueKey, tbp.TechniqueName, tbp.AlternateTechniqueName, COUNT(*) FROM Search.TechniqueByPlay tbp GROUP BY tbp.TechniqueKey, tbp.TechniqueName, tbp.AlternateTechniqueName ORDER BY tbp.TechniqueName").ToCollection<Technique>().ExecuteAsync());

            searchDefinition.Parts.AddRange(await ds.Sql(@"SELECT pbp.PartKey, pbp.PartName, pbp.DisplayOrder, pbp.BookKey, COUNT(*) AS Count FROM Search.PartByPlay pbp GROUP BY pbp.PartKey, pbp.PartName, pbp.DisplayOrder, pbp.BookKey ORDER BY pbp.DisplayOrder").ToCollection<Part>().ExecuteAsync());

            searchDefinition.Weapons.AddRange(await ds.Sql(@"SELECT wbp.PrimaryWeaponKey, wbp.SecondaryWeaponKey, wbp.PrimaryWeaponName, wbp.SecondaryWeaponName, COUNT(*) FROM search.WeaponByPlay wbp GROUP BY wbp.PrimaryWeaponKey, wbp.SecondaryWeaponKey, wbp.PrimaryWeaponName, wbp.SecondaryWeaponName ORDER BY wbp.PrimaryWeaponName, wbp.SecondaryWeaponName").ToCollection<Weapon>().ExecuteAsync());
        }

        public async Task RunSearchAsync(SearchDefinitionWithResults model, IUser? user)
        {
            var sql = new StringBuilder(@"SELECT
       pd.BookKey,
       pd.PartKey,
       pd.SectionKey,
       pd.BookName,
       pd.PartName,
       pd.SectionName,
       pd.VariantName,
       pd.BookSlug,
       pd.PartSlug,
       pd.SectionSlug,
       pd.PageReference
	 FROM Interpretations.PlayDetail pd WHERE 1=1 ");

            if (model.Books.Any(x => x.IsSelected) || model.Parts.Any(x => x.IsSelected))
            {
                var fragments = new List<string>();

                if (model.Books.Any(x => x.IsSelected))
                {
                    var selectedKeys = string.Join(", ", model.Books.Where(x => x.IsSelected).Select(x => x.BookKey.ToString()));
                    fragments.Add($@" EXISTS (SELECT * FROM Search.BookByPlay bbp WHERE bbp.BookKey IN ({selectedKeys}) AND bbp.PlayKey = pd.PlayKey) ");
                }
                if (model.Parts.Any(x => x.IsSelected))
                {
                    var selectedKeys = string.Join(", ", model.Parts.Where(x => x.IsSelected).Select(x => x.PartKey.ToString()));
                    fragments.Add($@" EXISTS (SELECT * FROM Search.PartByPlay pbp WHERE pbp.PartKey IN ({selectedKeys}) AND pbp.PlayKey = pd.PlayKey) ");
                }

                var fragmentSql = string.Join(" OR ", fragments);
                sql.AppendLine($@" AND ( {fragmentSql} ) ");
            }

            if (model.Weapons.Any(x => x.IsSelected))
            {
                var fragments = new List<string>();
                foreach (var item in model.Weapons.Where(x => x.IsSelected))
                {
                    if (item.SecondaryWeaponKey == null)
                        fragments.Add($" (EXISTS( SELECT * FROM Search.WeaponByPlay wbp WHERE wbp.PrimaryWeaponKey = {item.PrimaryWeaponKey} AND wbp.SecondaryWeaponKey IS NULL AND wbp.PlayKey = pd.PlayKey)) ");
                    else
                        fragments.Add($" (EXISTS( SELECT * FROM Search.WeaponByPlay wbp WHERE wbp.PrimaryWeaponKey = {item.PrimaryWeaponKey} AND wbp.SecondaryWeaponKey = {item.SecondaryWeaponKey} AND wbp.PlayKey = pd.PlayKey)) ");
                }

                var fragmentSql = string.Join(" OR ", fragments);
                sql.AppendLine($@" AND ( {fragmentSql} ) ");
            }

            if (model.StartingGuards.Any(x => x.IsSelected))
            {
                var fragments = new List<string>();
                foreach (var item in model.StartingGuards.Where(x => x.IsSelected))
                {
                    if (item.GuardModifierKey == null)
                        fragments.Add($" EXISTS (SELECT * FROM Search.GuardByPlay gbp WHERE gbp.GuardKey = {item.GuardKey} AND gbp.IsStartingGuard = 1 AND gbp.PlayKey = pd.PlayKey) ");
                    else
                        fragments.Add($" EXISTS (SELECT * FROM Search.GuardByPlay gbp WHERE gbp.GuardKey = {item.GuardKey} AND gbp.GuardModifierKey = {item.GuardModifierKey} AND gbp.IsStartingGuard = 1 AND gbp.PlayKey = pd.PlayKey) ");
                }

                var fragmentSql = string.Join(" OR ", fragments);
                sql.AppendLine($@" AND ( {fragmentSql} ) ");
            }

            if (model.Measure.Any(x => x.IsSelected))
            {
                var selectedKeys = string.Join(", ", model.Measure.Where(x => x.IsSelected).Select(x => x.MeasureKey.ToString()));
                sql.AppendLine($@" AND EXISTS (SELECT * FROM Search.MeasureByPlay mbp WHERE mbp.MeasureKey IN ({selectedKeys}) AND mbp.PlayKey = pd.PlayKey) ");
            }

            if (model.Footwork.Any(x => x.IsSelected))
            {
                var selectedKeys = string.Join(", ", model.Footwork.Where(x => x.IsSelected).Select(x => x.FootworkKey.ToString()));
                sql.AppendLine($@" AND EXISTS (SELECT * FROM Search.FootworkByPlay fbp WHERE fbp.FootworkKey IN ({selectedKeys}) AND fbp.PlayKey = pd.PlayKey) ");
            }

            if (model.Techniques.Any(x => x.IsSelected))
            {
                var selectedKeys = string.Join(", ", model.Techniques.Where(x => x.IsSelected).Select(x => x.TechniqueKey.ToString()));
                sql.AppendLine($@" AND EXISTS (SELECT * FROM Search.TechniqueByPlay tbp WHERE tbp.TechniqueKey IN ({selectedKeys}) AND tbp.PlayKey = pd.PlayKey) ");
            }

            if (model.Targets.Any(x => x.IsSelected))
            {
                var selectedKeys = string.Join(", ", model.Targets.Where(x => x.IsSelected).Select(x => x.TargetKey.ToString()));
                sql.AppendLine($@" AND EXISTS (SELECT * FROM Search.TargetByPlay tbp WHERE tbp.TargetKey IN ({selectedKeys}) AND tbp.PlayKey = pd.PlayKey) ");
            }

            if (model.Guards.Any(x => x.IsSelected))
            {
                var fragments = new List<string>();
                foreach (var item in model.Guards.Where(x => x.IsSelected))
                {
                    if (item.GuardModifierKey == null)
                        fragments.Add($" EXISTS (SELECT * FROM Search.GuardByPlay gbp WHERE gbp.GuardKey = {item.GuardKey} AND gbp.PlayKey = pd.PlayKey) ");
                    else
                        fragments.Add($" EXISTS (SELECT * FROM Search.GuardByPlay gbp WHERE gbp.GuardKey = {item.GuardKey} AND gbp.GuardModifierKey = {item.GuardModifierKey} AND gbp.PlayKey = pd.PlayKey) ");
                }

                var fragmentSql = string.Join(" OR ", fragments);
                sql.AppendLine($@" AND ( {fragmentSql} ) ");
            }

            sql.AppendLine(@"ORDER BY pd.BookName, pd.PartName, pd.SectionName, pd.VariantName");

            model.Results = new List<SearchResult>();
            var sqlTemp = sql.ToString();
            model.Results.AddRange(await DataSource(user).Sql(sql.ToString()).ToCollection<SearchResult>().ExecuteAsync());
        }
    }
}
