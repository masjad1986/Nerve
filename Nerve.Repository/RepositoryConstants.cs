using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Repository
{
    public class RepositoryConstants
    {
        public const string SchemaName = "dbo";
    }

    public class SCP
    {
        public class MasterTables
        {
            public const string UserMaster = "usermaster";
            public const string WarrantyType = "M_WarrantyType";
            public const string DeliveryAgent = "M_DeliveryAgent";
        }

        public class Views
        {
            public const string Jobs = "usermaster";
        }
    }
}
