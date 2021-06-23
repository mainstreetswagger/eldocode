using System;
using System.Collections.Generic;

#nullable disable

namespace MobileApi.Models
{
    public partial class EvaluationSystem
    {
        public Guid Id { get; set; }
        public Guid CustomerId { get; set; }
        public Guid AssistantId { get; set; }
        public string Description { get; set; }
        public DateTime CreatedDate { get; set; }
        public int Points { get; set; }

        public virtual Assistant Assistant { get; set; }
        public virtual Customer Customer { get; set; }
        public virtual Grade PointsNavigation { get; set; }
    }
}
