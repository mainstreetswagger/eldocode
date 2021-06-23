using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MobileApi.Dtos
{
    public class CartDto
    {
        public List<Guid> Items { get; set; }
        public Guid CustomerId { get; set; }
        public Guid AssistantId { get; set; }
    }
}
