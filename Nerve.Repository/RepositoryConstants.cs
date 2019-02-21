using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Repository
{
    public class RepositoryConstants
    {
        public const string SchemaName = "dbo";
        public const string HamiDatabase = "HAMI_DATA";
        public const string ScpDatabase = "HAMI_SCP";
        public const int DefaultDocumentNumber = 100000;
    }

    public class SCP
    {
        public class MasterTables
        {
            public const string UserMaster = "UserMaster";
            public const string UserMasterDetail = "UserMasterDetail";
            public const string WarrantyType = "M_WarrantyType";
            public const string DeliveryAgent = "M_DeliveryAgent";
            public const string Brand = "M_ServiceCenter_Location";
            public const string BrandDetail= "M_BrandDetail";
            public const string Product = "M_ProductType";
            public const string ServiceCentreLocation = "M_ServiceCenter_Location";
            public const string LaptopVendorMaster = "Laptop_VendorMaster";
            public const string AccessoryMaster = "M_Accessories";
            public const string AccessoryDetailMaster = "M_Detail_Accessories";
            public const string PhysicalConditionMaster= "M_PhysicalCondition";
            public const string ReferenceMaster = "REF";
        }

        public class TransactionTables
        {
            public const string AccessoriesDetail= "T_Accessories_Detail";
            public const string DealerLogMain = "T_DealerLog_Main";
            public const string DealerLog = "DealerLog";
            public const string ReceiptDetail = "T_ReceiptTCDetail";
            public const string DealerInvoice = "DealerTCInvoice";
        }

        public class TemporaryTables
        {
            public const string TempLocationPrefix = "tmplocprefix";
        }
        public class Views
        {
            public const string Jobs = "vwnrv_jobs";
        }
    }

    public class HAMI
    {
        public class MasterTables
        {
            public const string BcgMaster = "bcgmast";
            public const string AccountMaster = "accmst";
            public const string JobRepair = "JBREPAIR";
            public const string JobRepairMain = "JBREPAIR_MAIN";
        }

        public class Views
        {
            public const string Jobs = "usermaster";
        }

        public class BcgMasterTag
        {
            public const string Model = "Y";
            public const string FaultCode = "F";
        }
    }
}
