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
    public class ItemsController : ControllerBase
    {
        private IItemsService _items;
        public ItemsController(IItemsService items)
        {
            _items = items;
        }
        [HttpGet("get")]
        public IActionResult Get()
        {
            try
            {
                var res = _items.GetItems();
                return Ok(JsonConvert.SerializeObject(res));
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }
        [HttpPost("addcart")]
        public IActionResult AddCart([FromBody] CartDto cart)
        {
            try
            {
                var c = _items.AddCart(cart.Items, cart.CustomerId, cart.AssistantId);
                return Ok(JsonConvert.SerializeObject(c));
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }
        [HttpPost("getcartitems")]
        public IActionResult GetCart([FromBody] Guid cartId)
        {
            try
            {
                var items = _items.GetItemsByCart(cartId);
                return Ok(JsonConvert.SerializeObject(items));
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }
        [HttpPost("getallcartitems")]
        public IActionResult GetAllCarts([FromBody]Credentials cr)
        {
            try
            {
                var items = _items.GetAllItemsByCart(atId:cr.AssistantId, customerId:cr.CustomerId);
                return Ok(JsonConvert.SerializeObject(items));
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }
    }
}
