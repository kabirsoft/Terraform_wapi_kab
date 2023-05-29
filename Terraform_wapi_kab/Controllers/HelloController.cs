using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Terraform_wapi_kab.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HelloController : ControllerBase
    {
        [HttpGet]
        public ActionResult<string> Get()
        {
            return "Hello terraform";
        }
    }
}
