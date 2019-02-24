using System;
using System.Collections.Generic;

namespace Nerve.Repository.Dtos
{
    public class DeviceDto: BaseDeviceDto
    {
        public string JobReferenceNumber { get; set; }
        public bool DoA { get; set; }
        public int CollectionPoint { get; set; }
        public DateTime? TrackingDate { get; set; }
        public DateTime? FarsiDate { get; set; }
        public bool AutoCrn { get; set; }
        public int Product { get; set; }
        public string BrandCode { get; set; }
        public int TransferTo { get; set; }
        public int ServiceCentre { get; set; }
        public string CustomerName { get; set; }
        public string LastName { get; set; }
        public string CustomerAddress { get; set; }
        public string MobileNumber { get; set; }
        public string PopUploadPath { get; set; }
        public string FarsiName { get; set; }
        public string FaultCode { get; set; }
        public string FaultDetail { get; set; }
        public string Accessories { get; set; }
        public string PhysicalCondition { get; set; }
        public string Notes { get; set; }
        public DateTime? PopDate { get; set; }
        public DateTime? Date { get; set; }
        public DateTime? ExpiryDate { get; set; }
        public string Forwarder { get; set; }
        public int Type { get; set; }
        public DateTime? UnitDroppedDate { get; set; }
        public DateTime? CollectionDate { get; set; }
        public string TelephoneNumber { get; set; }
        public string Email { get; set; }
        public string VendorRmaNumber { get; set; }
        public string NationalId { get; set; }
        public string EcoCode { get; set; }
        public string PostalCode { get; set; }
        public string Prefix { get; set; }
        public string PhoneType => "M";
        public int UnitReceived => 1;
        public int JobStatus => 1;
        public int DirectCustomer => 0;
        public DateTime? UnitReceivedDate { get; set; }
        public string UnitAllocated => "COURIER #1";
        public string City { get; set; }
        public int? DetailId { get; set; }
        public string Backend { get; set; }
        public List<int> AccessoriesIds { get; set; }
    }
}
