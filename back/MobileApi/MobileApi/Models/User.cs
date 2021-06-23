using System;
using System.Collections.Generic;

#nullable disable

namespace MobileApi.Models
{
    public partial class User
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public int? Age { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public int HolderTypeId { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime? VerifiedDate { get; set; }
        public string Password { get; set; }
        public string Login { get; set; }

        public virtual HolderType HolderType { get; set; }
        public virtual Assistant Assistant { get; set; }
        public virtual Customer Customer { get; set; }
    }
}
