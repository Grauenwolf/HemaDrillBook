using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace HemaDrillBook.Controller
{
    [Route("api/test")]
    [ApiController]
    [Authorize]
    public class TestController : ControllerBase
    {
        [HttpGet]
        [Route("hello")]
        public string Hello()
        {
            return "Hello World";
        }
    }
}
