using HemaDrillBook.Models;
using System.Collections.Generic;
using System.Threading.Tasks;
using Tortuga.Chain;

namespace HemaDrillBook.Services.Api
{
    public class TagsApiService : ServiceBase
    {
        public TagsApiService(SqlServerDataSource dataSource) : base(dataSource)
        {
        }

        //TODO: Check for duplicates before inserting new rows.

        public async Task<int> AddFootworkAsync(Footwork footwork, IUser currentUser)
        {
            await CheckPermissionTagEditorAsync(currentUser);
            return await DataSource(currentUser).Insert("Tags.Footwork", footwork).ToInt32().ClearCache().ExecuteAsync();
        }

        public async Task<int> AddGuardAsync(Guard guard, IUser currentUser)
        {
            await CheckPermissionTagEditorAsync(currentUser);
            return await DataSource(currentUser).Insert("Tags.Guard", guard).ToInt32().ClearCache().ExecuteAsync();
        }

        public async Task<int> AddGuardModifierAsync(GuardModifier guardModifier, IUser currentUser)
        {
            await CheckPermissionTagEditorAsync(currentUser);
            return await DataSource(currentUser).Insert("Tags.GuardModifier", guardModifier).ToInt32().ClearCache().ExecuteAsync();
        }

        public async Task<int> AddMeasureAsync(Measure measure, IUser currentUser)
        {
            await CheckPermissionTagEditorAsync(currentUser);
            return await DataSource(currentUser).Insert("Tags.Measure", measure).ToInt32().ClearCache().ExecuteAsync();
        }

        public async Task<int> AddTargetAsync(Target target, IUser currentUser)
        {
            await CheckPermissionTagEditorAsync(currentUser);
            return await DataSource(currentUser).Insert("Tags.Target", target).ToInt32().ClearCache().ExecuteAsync();
        }

        public async Task<int> AddTechniqueAsync(Technique technique, IUser currentUser)
        {
            await CheckPermissionTagEditorAsync(currentUser);
            return await DataSource(currentUser).Insert("Tags.Technique", technique).ToInt32().ClearCache().ExecuteAsync();
        }

        public Task<List<Footwork>> GetFootworkAsync(IUser currentUser)
        {
            return DataSource(currentUser).From("Tags.Footwork").ToCollection<Footwork>().ClearCache().ExecuteAsync();
        }

        public Task<List<GuardModifier>> GetGuardModifiersAsync(IUser currentUser)
        {
            return DataSource(currentUser).From("Tags.GuardModifier").ToCollection<GuardModifier>().ClearCache().ExecuteAsync();
        }

        public Task<List<Guard>> GetGuardsAsync(IUser currentUser)
        {
            return DataSource(currentUser).From("Tags.Guard").ToCollection<Guard>().ClearCache().ExecuteAsync();
        }

        public Task<List<Measure>> GetMeasureAsync(IUser currentUser)
        {
            return DataSource(currentUser).From("Tags.Measure").ToCollection<Measure>().ClearCache().ExecuteAsync();
        }

        public Task<List<Target>> GetTargetsAsync(IUser currentUser)
        {
            return DataSource(currentUser).From("Tags.Target").ToCollection<Target>().ClearCache().ExecuteAsync();
        }

        public Task<List<Technique>> GetTechniquesAsync(IUser currentUser)
        {
            return DataSource(currentUser).From("Tags.Technique").ToCollection<Technique>().ClearCache().ExecuteAsync();
        }

        public Task<List<Weapon>> GetWeaponsAsync(IUser currentUser)
        {
            return DataSource(currentUser).From("Tags.Weapon").ToCollection<Weapon>().ClearCache().ExecuteAsync();
        }
    }
}
