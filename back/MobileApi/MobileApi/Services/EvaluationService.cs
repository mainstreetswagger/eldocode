using MobileApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MobileApi.Services
{
    public interface IEvaluationService
    {
        EvaluationSystem Add(Guid customer, Guid at, string desc, int points = 5);
        List<EvaluationSystem> Get(Guid atId);
    }
    public class EvaluationService : IEvaluationService
    {
        private eldoradoContext _db;
        public EvaluationService(eldoradoContext db)
        {
            _db = db;
        }
        public EvaluationSystem Add(Guid customer, Guid at, string desc, int points = 5)
        {
            var e = new EvaluationSystem { CustomerId = customer, AssistantId = at, Description = desc, Points = points };
            var ev = _db.EvaluationSystems.Add(e);
            _db.SaveChanges();
            return ev.Entity;
        }
        public List<EvaluationSystem> Get(Guid atId)
        {
            return _db.EvaluationSystems.Where(x => x.AssistantId == atId).ToList();
        }
    }
}
