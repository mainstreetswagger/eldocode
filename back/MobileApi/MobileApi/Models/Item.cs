using System;
using System.Collections.Generic;

#nullable disable

namespace MobileApi.Models
{
    public partial class Item
    {
        public Item()
        {
            CartToItems = new HashSet<CartToItem>();
        }

        public Guid Id { get; set; }
        public Guid CategoryId { get; set; }
        public string Name { get; set; }
        public string Desciption { get; set; }
        public decimal Price { get; set; }
        public bool IsSold { get; set; }
        public byte[] Image { get; set; }

        public virtual Category Category { get; set; }
        public virtual ICollection<CartToItem> CartToItems { get; set; }
    }
}
