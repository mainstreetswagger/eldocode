﻿using System;
using System.Collections.Generic;

#nullable disable

namespace MobileApi.Models
{
    public partial class HolderType
    {
        public HolderType()
        {
            Users = new HashSet<User>();
        }

        public int Id { get; set; }
        public string Name { get; set; }

        public virtual ICollection<User> Users { get; set; }
    }
}
