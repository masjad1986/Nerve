using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Repository.Dtos
{
    public class DeviceDto
    {
        public string IMEINumber { get; set; }
        public int CollectionPoint { get; set; }
        public int TrackingNumber { get; set; }
        public int CrnNumber { get; set; }
        public int Product { get; set; }
        public int Brand { get; set; }
        public int TransferTo { get; set; }
        public int ServiceCentre { get; set; }
        public int Model { get; set; }
        public string CustomerFirstName { get; set; }
        public string CustomerLastName { get; set; }
        public string CustomerAddress { get; set; }
        public string MobileNumber { get; set; }
        public string SmsLanguage { get; set; }
        public string JobNumber { get; set; }
        public string FarsiCustomerName { get; set; }

        public string AdditionalSerialNumber { get; set; }
        public string PhysicalCondition { get; set; }
        public string Password { get; set; }
        public string PasswordType { get; set; }
        public DateTime? PopFromDate { get; set; }
        public DateTime? PopToDate { get; set; }
        public DateTime? ExpiryFromDate { get; set; }
        public DateTime? ExpiryToDate { get; set; }
        public string Forwarder { get; set; }
        public string AirwayBillNumber { get; set; }
        public int? WarrantyType { get; set; }
        public int? Type { get; set; }
        public DateTime? UnitDroppedDate { get; set; }
        public DateTime? CollectionDate { get; set; }
        public string TelephoneNumber { get; set; }
        public string Email { get; set; }
        public string RmaVendorNumber { get; set; }
        public string NationalId { get; set; }
        public string EcoCode { get; set; }
        public string PostalCode { get; set; }
    }
}
