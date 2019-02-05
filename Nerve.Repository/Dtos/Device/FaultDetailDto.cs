using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Repository.Dtos
{
    public class FaultDetailDto
    {
        // select ITCODE AS ,ITDESC from bcgmast where ittag='F' AND ITBRAND=@brand 
        public string Code { get; set; }
        public string Name { get; set; }
        public string BrandName { get; set; }
    }
}
