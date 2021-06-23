using MobileApi.Errors;
using MobileApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MobileApi.Services
{
    public interface IAssistantService
    {
        Assistant GetAssistant();
    }
    public class AssistantService:IAssistantService
    {
        private eldoradoContext _db;
        public AssistantService(eldoradoContext db)
        {
            _db = db;
        }
        public Assistant GetAssistant()
        {
            return _db.Assistants.FirstOrDefault();
        }
    }
}
