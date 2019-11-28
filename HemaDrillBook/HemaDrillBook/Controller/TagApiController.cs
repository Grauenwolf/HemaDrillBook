using HemaDrillBook.Data;
using HemaDrillBook.Models;
using HemaDrillBook.Services;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace HemaDrillBook.Controllers
{
    [Produces("application/json")]
    [Route("api/tag")]
    public class TagApiController : SecureController
    {
        private readonly TagsService m_TagsService;

        public TagApiController(TagsService tagsService, UserManager<ApplicationUser> userManager) : base(userManager)
        {
            m_TagsService = tagsService ?? throw new ArgumentNullException(nameof(tagsService));
        }

        [HttpPost("footwork/add")]
        public async Task<int> AddFootworkAsync([FromBody] Footwork footwork)
        {
            return await m_TagsService.AddFootworkAsync(footwork, await GetCurrentUserAsync());
        }

        [HttpPost("guard/add")]
        public async Task<int> AddGuardAsync([FromBody] Guard guard)
        {
            return await m_TagsService.AddGuardAsync(guard, await GetCurrentUserAsync());
        }

        [HttpPost("guardModifier/add")]
        public async Task<int> AddGuardModifierAsync([FromBody] GuardModifier guardModifier)
        {
            return await m_TagsService.AddGuardModifierAsync(guardModifier, await GetCurrentUserAsync());
        }

        [HttpPost("measure/add")]
        public async Task<int> AddMeasureAsync([FromBody] Measure measure)
        {
            return await m_TagsService.AddMeasureAsync(measure, await GetCurrentUserAsync());
        }

        [HttpPost("target/add")]
        public async Task<int> AddTargetAsync([FromBody] Target target)
        {
            return await m_TagsService.AddTargetAsync(target, await GetCurrentUserAsync());
        }

        [HttpPost("technique/add")]
        public async Task<int> AddTechniqueAsync([FromBody] Technique technique)
        {
            return await m_TagsService.AddTechniqueAsync(technique, await GetCurrentUserAsync());
        }

        [HttpGet("footwork")]
        public async Task<List<Footwork>> GetFootworkAsync()
        {
            return await m_TagsService.GetFootworkAsync(await GetCurrentUserAsync());
        }

        [HttpGet("guardModifier")]
        public async Task<List<GuardModifier>> GetGuardModifiersAsync()
        {
            return await m_TagsService.GetGuardModifiersAsync(await GetCurrentUserAsync());
        }

        [HttpGet("guard")]
        public async Task<List<Guard>> GetGuardsAsync()
        {
            return await m_TagsService.GetGuardsAsync(await GetCurrentUserAsync());
        }

        [HttpGet("measure")]
        public async Task<List<Measure>> GetMeasureAsync()
        {
            return await m_TagsService.GetMeasureAsync(await GetCurrentUserAsync());
        }

        [HttpGet("target")]
        public async Task<List<Target>> GetTargetsAsync()
        {
            return await m_TagsService.GetTargetsAsync(await GetCurrentUserAsync());
        }

        [HttpGet("technique")]
        public async Task<List<Technique>> GetTechniquesAsync()
        {
            return await m_TagsService.GetTechniquesAsync(await GetCurrentUserAsync());
        }

        [HttpGet("weapon")]
        public async Task<List<Weapon>> GetWeaponsAsync()
        {
            return await m_TagsService.GetWeaponsAsync(await GetCurrentUserAsync());
        }
    }
}
