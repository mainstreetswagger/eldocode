using System;
using System.Collections.Generic;

#nullable disable

namespace MobileApi.Models
{
    public partial class Assistant
    {
        public Assistant()
        {
            EvaluationSystems = new HashSet<EvaluationSystem>();
        }

        public Guid Id { get; set; }
        public string Shop { get; set; }
        public string Position { get; set; }
        public string Contacts { get; set; }

        public virtual User IdNavigation { get; set; }
        public virtual ICollection<EvaluationSystem> EvaluationSystems { get; set; }
    }
}
