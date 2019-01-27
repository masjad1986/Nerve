using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Repository.Dtos
{
    public class FaultAccessoryDto
    {
        // select ITCODE AS ,ITDESC from bcgmast where ittag='F' AND ITBRAND=@brand 
        public string FaultCode { get; set; }
        public string FaultDetail { get; set; }
        public string Remarks { get; set; }
        public List<string> Accessories { get; set; }
    }
}
