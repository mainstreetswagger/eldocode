using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MobileApi.Dtos
{
    public class Credentials
    {
        public Guid CustomerId { get; set; }
        public Guid AssistantId { get; set; }
    }
}
