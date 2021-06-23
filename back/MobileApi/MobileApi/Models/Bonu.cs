using System;
using System.Collections.Generic;

#nullable disable

namespace MobileApi.Models
{
    public partial class Bonu
    {
        public Bonu()
        {
            BonusSystems = new HashSet<BonusSystem>();
        }

        public Guid Id { get; set; }
        public decimal BonusAmount { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }

        public virtual ICollection<BonusSystem> BonusSystems { get; set; }
    }
}
