using System;
using System.Collections.Generic;

#nullable disable

namespace MobileApi.Models
{
    public partial class Grade
    {
        public Grade()
        {
            EvaluationSystems = new HashSet<EvaluationSystem>();
        }

        public string Name { get; set; }
        public int Points { get; set; }
        public string Description { get; set; }

        public virtual ICollection<EvaluationSystem> EvaluationSystems { get; set; }
    }
}
