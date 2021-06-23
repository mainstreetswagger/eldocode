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
    public class CustomerController : ControllerBase
    {
        private ICustomerService _customer;
        public CustomerController(ICustomerService customer)
        {
            _customer = customer;
        }
        [HttpGet("get")]
        public IActionResult GetCustomer()
        {
            try
            {
                var res = _customer.GetCustomer();
                return Ok(JsonConvert.SerializeObject(res));
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }
    }
}
