using System;
using System.Collections.Generic;

#nullable disable

namespace MobileApi.Models
{
    public partial class Customer
    {
        public Customer()
        {
            BonusSystems = new HashSet<BonusSystem>();
            Carts = new HashSet<Cart>();
            CustomerVerifications = new HashSet<CustomerVerification>();
            EvaluationSystems = new HashSet<EvaluationSystem>();
        }

        public Guid Id { get; set; }
        public decimal Amount { get; set; }
        public Guid? AssistantCreatorId { get; set; }

        public virtual User IdNavigation { get; set; }
        public virtual ICollection<BonusSystem> BonusSystems { get; set; }
        public virtual ICollection<Cart> Carts { get; set; }
        public virtual ICollection<CustomerVerification> CustomerVerifications { get; set; }
        public virtual ICollection<EvaluationSystem> EvaluationSystems { get; set; }
    }
}
