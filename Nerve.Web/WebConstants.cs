using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Nerve.Web
{
    public class WebConstants
    {
        public const decimal TaxPercent = 9;
        public const string HasDeleteActionOptionAccess = "0";
        public const string HasActionOptionAccess = "1";
        public const string LoginType = "RETAIL";
        public const string ProductMobilePhone = "MOBILE PHONES";
        public const string BrandHuawei = "HUAWEI";
        public const string StdCodePrefix = "+98";
        public const int ImeiLength = 16;
        public const int WarrantyBounceDays = 15;

        public class SessionKeys
        {
            public const string User = "user";
            public const string UserId = "userid";
            public const string UserMenus = "menus";
            public const string UserName = "username";
            public const string GroupId = "group";
            public const string ModuleId = "module";
            public const string Language = "language";
            public const string DefaultStockLocation = "location";
            public const string DefaultDealer = "dealer";
            public const string PersianFont = "css";
            public const string CurrentMenuId = "menuid";

            //View Data
            public const string BreadCrumb = "bread-crumb";
        }

        public class TempDataKeys
        {
            public const string Notification = "notification";
        }

        public class ViewPage
        {
            public const string DeviceLogin = "Views/FrontDesk/Device/Index.cshtml";
            public const string VendorUpdation = "Views/FrontDesk/VendorUpdation/Index.cshtml";
            public const string DispatchNote = "Views/Transactions/Invoice/DispatchNote.cshtml";
            public const string Estimation = "Views/Transactions/Estimation/Index.cshtml";
            public const string JobAllocation = "Views/Transactions/Jobs/JobAllocation.cshtml";
            public const string Error = "Error";
            public const string Unauthorized = "Unauthorized";
            public class Partial
            {
                public const string Actions = "_Actions";
                public const string Grid = "_Grid";
                public const string DeviceCollectionPointView = "~/Views/FrontDesk/Device/_CollectionPoint.cshtml";
                public const string DeviceLoginDetails = "~/Views/FrontDesk/Device/_LoginDetail.cshtml";
                public const string DeviceFaultAccessoryDetails = "~/Views/FrontDesk/Device/_FaultAccessoryDetails.cshtml";
                public const string DeviceStandByUnits = "~/Views/FrontDesk/Device/_StandByUnits.cshtml";
                public const string DevicePopUpload = "~/Views/FrontDesk/Device/_PopUpload.cshtml";
                public const string DeviceImeiHistory = "~/Views/FrontDesk/Device/_ImeiHistory.cshtml";
                public const string Invoice = "Views/Transactions/Invoice/_Invoices.cshtml";
                public const string Jobs = "Views/Transactions/Jobs/_Job.cshtml";
                public const string ValidationSummary = "_ValidationSummary";
            }
        }

        public class PageTitle
        {
            public const string DeviceLogin = "Device Login";
        }

        public class PageRoute
        {
            public const string DeviceAuthenticate = "authenticate";
            public const string DeviceCollectionPoint = "collectionpoint";
            public const string Devices = "devices";
            public const string Estimation = "index";
            public const string Find = "find";
            public const string Login = "login";
            public const string Jobs = "jobs";
            public const string JobAllocation = "allocation";
            public const string Save = "save";
            public const string Update = "update";
            public const string DispatchNote = "dispatchnote";
            public const string GetDealerInvoices = "dealerinvoices";
            public const string GetBrandByProductName = "product";
            public const string GetEngineer = "engineers";
            public const string GetJobByLocation = "jobbylocation";
            public const string GetOptionByBrandAndProductAndCollectionPoint = "option";
            public const string GetServiceCentreByCollectionPointAndBrandAndProduct = "servicecentre";
            public const string GetTrackingPrefix = "trackingprefix";
            public const string UpdateEstimationDate = "estimationdate";
        }

        public class Controllers
        {
            public const string Brand = "Brand";
            public const string Device = "Device";
            public const string Engineer = "Engineer";
            public const string Estimation = "Estimation";
            public const string Invoice = "Invoice";
            public const string Job = "Job";
            public const string ProductModel = "ProductModel";
            public const string Users = "Users";
            public const string VendorUpdation = "VendorUpdation";
        }
    }
}
