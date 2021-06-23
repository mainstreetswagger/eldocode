using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MobileApi.Dtos
{
    public class Eval
    {
        public Guid CustomerId { get; set; }
        public Guid AssistantId { get; set; }
        public string Description { get; set; }
        public int Points { get; set; }
    }
}
