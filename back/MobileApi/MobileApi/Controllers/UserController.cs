using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MobileApi.Dtos;
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
    public class UserController : ControllerBase
    {
        private IUserService _user;
        public UserController(IUserService user)
        {
            _user = user;
        }
        [HttpPost("logassistant")]
        public IActionResult LoginAssistant([FromBody]Auth a)
        {
            try
            {
                var res = _user.Authenticate(a);
                return Ok(JsonConvert.SerializeObject(res));
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }

        [HttpPost("logcustomer")]
        public IActionResult LoginCustomer([FromBody] Auth a)
        {
            try
            {
                var res = _user.AuthenticateCustomer(a);
                return Ok(JsonConvert.SerializeObject(res));
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }
    }
}
