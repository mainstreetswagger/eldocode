using System;
using System.Collections.Generic;

#nullable disable

namespace MobileApi.Models
{
    public partial class CartToItem
    {
        public Guid Id { get; set; }
        public Guid ItemId { get; set; }
        public Guid CartId { get; set; }
        public DateTime CreatedDate { get; set; }

        public virtual Cart Cart { get; set; }
        public virtual Item Item { get; set; }
    }
}
