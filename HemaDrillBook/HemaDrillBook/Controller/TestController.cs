using Microsoft.AspNetCore.Mvc;

namespace HemaDrillBook.Controller
{
    [Route("api/test")]
    [ApiController]
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
