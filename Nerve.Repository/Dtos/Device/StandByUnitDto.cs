using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Repository.Dtos
{
    public class StandByUnitDto
    {
        public int IMEINumber { get; set; }
        public int Brand { get; set; }
        public int Model { get; set; }
        public bool IsReturned { get; set; }
        public int IssueReturned { get; set; }
        public string Remarks { get; set; }

    }
}
