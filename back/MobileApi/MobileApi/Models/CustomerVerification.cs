using System;
using System.Collections.Generic;

#nullable disable

namespace MobileApi.Models
{
    public partial class CustomerVerification
    {
        public Guid Id { get; set; }
        public int PinCode { get; set; }
        public DateTime CreatedDate { get; set; }
        public Guid CustomerId { get; set; }
        public bool IsVerified { get; set; }

        public virtual Customer Customer { get; set; }
    }
}
