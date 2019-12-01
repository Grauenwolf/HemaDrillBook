//using HemaDrillBook.Models;
//using HemaDrillBook.Services;
//using HemaDrillBook.UI.Models;
//using System.Collections.Generic;
//using System.Threading.Tasks;
//using Tortuga.Chain;

//namespace HemaDrillBook.UI.Services
//{
//    public class TagsService : ServiceBase
//    {
//        public TagsService(SqlServerDataSource dataSource) : base(dataSource)
//        {
//        }

//        //TODO: Check for duplicates before inserting new rows.

//        public async Task<int> AddFootworkAsync(Footwork footwork, IUser currentUser)
//        {
//            await CheckPermissionTagEditorAsync(currentUser);
//            return await DataSource(currentUser).Insert("Tags.Footwork", footwork).ToInt32().ExecuteAsync();
//        }

//        public async Task<int> AddGuardAsync(Guard guard, IUser currentUser)
//        {
//            await CheckPermissionTagEditorAsync(currentUser);
//            return await DataSource(currentUser).Insert("Tags.Guard", guard).ToInt32().ExecuteAsync();
//        }

//        public async Task<int> AddGuardModifierAsync(GuardModifier guardModifier, IUser currentUser)
//        {
//            await CheckPermissionTagEditorAsync(currentUser);
//            return await DataSource(currentUser).Insert("Tags.GuardModifier", guardModifier).ToInt32().ExecuteAsync();
//        }

//        public async Task<int> AddMeasureAsync(Measure measure, IUser currentUser)
//        {
//            await CheckPermissionTagEditorAsync(currentUser);
//            return await DataSource(currentUser).Insert("Tags.Measure", measure).ToInt32().ExecuteAsync();
//        }

//        public async Task<int> AddTargetAsync(Target target, IUser currentUser)
//        {
//            await CheckPermissionTagEditorAsync(currentUser);
//            return await DataSource(currentUser).Insert("Tags.Target", target).ToInt32().ExecuteAsync();
//        }

//        public async Task<int> AddTechniqueAsync(Technique technique, IUser currentUser)
//        {
//            await CheckPermissionTagEditorAsync(currentUser);
//            return await DataSource(currentUser).Insert("Tags.Technique", technique).ToInt32().ExecuteAsync();
//        }

//        public Task<List<Footwork>> GetFootworkAsync(IUser currentUser)
//        {
//            return DataSource(currentUser).From("Tags.Footwork").ToCollection<Footwork>().ExecuteAsync();
//        }

//        public Task<List<GuardModifier>> GetGuardModifiersAsync(IUser currentUser)
//        {
//            return DataSource(currentUser).From("Tags.GuardModifier").ToCollection<GuardModifier>().ExecuteAsync();
//        }

//        public Task<List<Guard>> GetGuardsAsync(IUser currentUser)
//        {
//            return DataSource(currentUser).From("Tags.Guard").ToCollection<Guard>().ExecuteAsync();
//        }

//        public Task<List<Measure>> GetMeasureAsync(IUser currentUser)
//        {
//            return DataSource(currentUser).From("Tags.Measure").ToCollection<Measure>().ExecuteAsync();
//        }

//        public Task<List<Target>> GetTargetsAsync(IUser currentUser)
//        {
//            return DataSource(currentUser).From("Tags.Target").ToCollection<Target>().ExecuteAsync();
//        }

//        public Task<List<Technique>> GetTechniquesAsync(IUser currentUser)
//        {
//            return DataSource(currentUser).From("Tags.Technique").ToCollection<Technique>().ExecuteAsync();
//        }

//        public Task<List<Weapon>> GetWeaponsAsync(IUser currentUser)
//        {
//            return DataSource(currentUser).From("Tags.Weapon").ToCollection<Weapon>().ExecuteAsync();
//        }
//    }
//}
