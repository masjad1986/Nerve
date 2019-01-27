using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Repository.Dtos
{
    public class DeliveryAgentDto
    {
        public int Code { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Country { get; set; }
        public string MobileNumber { get; set; }
        public int? Biker { get; set; }
        public string Status { get; set; }
        public int? Target { get; set; }
        public string Email { get; set; }
        public string CC { get; set; }
        public string Type { get; set; }
    }
}
