using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MobileApi.Dtos;
using MobileApi.Models;
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
    public class EvaluationSystemController : ControllerBase
    {
        private IEvaluationService _evaluation;
        public EvaluationSystemController(IEvaluationService evaluation)
        {
            _evaluation = evaluation;
        }
        [HttpPost("add")]
        public IActionResult AddEval([FromBody] Eval eval)
        {
            try
            {
                var c = _evaluation.Add(eval.CustomerId,eval.AssistantId,eval.Description,eval.Points);
                return Ok(JsonConvert.SerializeObject(c));
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }
        [HttpPost("get")]
        public IActionResult Get([FromBody]Guid atId)
        {
            try
            {
                var c = _evaluation.Get(atId);
                return Ok(JsonConvert.SerializeObject(c));
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }
    }
}
