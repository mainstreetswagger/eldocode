using System;
using System.Collections.Generic;

#nullable disable

namespace MobileApi.Models
{
    public partial class Cart
    {
        public Cart()
        {
            CartToItems = new HashSet<CartToItem>();
        }

        public Guid Id { get; set; }
        public Guid CustomerId { get; set; }
        public DateTime CreatedDate { get; set; }
        public Guid? AssistantId { get; set; }

        public virtual Customer Customer { get; set; }
        public virtual ICollection<CartToItem> CartToItems { get; set; }
    }
}
