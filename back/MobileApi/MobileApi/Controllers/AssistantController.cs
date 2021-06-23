using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MobileApi.Services;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MobileApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AssistantController : ControllerBase
    {
        private IAssistantService _a;
        public AssistantController(IAssistantService a)
        {
            _a = a;
        }
        [HttpGet("getat")]
        public IActionResult GetAssistant()
        {
            try
            {
                var res = _a.GetAssistant();
                return Ok(JsonConvert.SerializeObject(res));
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }
    }
}
