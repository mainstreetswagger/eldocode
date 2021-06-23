using System;
using System.Collections.Generic;

#nullable disable

namespace MobileApi.Models
{
    public partial class BonusSystem
    {
        public Guid Id { get; set; }
        public Guid BonusId { get; set; }
        public Guid CustomerId { get; set; }
        public DateTime CreatedDate { get; set; }

        public virtual Bonu Bonus { get; set; }
        public virtual Customer Customer { get; set; }
    }
}
