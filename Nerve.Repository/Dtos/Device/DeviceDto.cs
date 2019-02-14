using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Nerve.Repository.Dtos
{
    public class DeviceDto
    {
        public string AutoJobNumber { get; set; }
        public string AutoJobReferenceNumber { get; set; }

        [Required]
        public string IMEINumber { get; set; }
        public bool DoA { get; set; }

        [Required]
        public int CollectionPoint { get; set; }
        public string CollectionPointName { get; set; }

        [Required]
        public string TrackingNumber { get; set; }
        public DateTime? TrackingDate { get; set; }
        public DateTime? FarsiDate { get; set; }
        //public int CrnNumber { get; set; }
        public bool AutoCrn { get; set; }

        [Required]
        public int Product { get; set; }
        public string ProductName { get; set; }

        [Required]
        public string BrandCode { get; set; }
        public string BrandName { get; set; }

        [Required]
        public int TransferTo { get; set; }

        [Required]
        public int ServiceCentre { get; set; }

        [Required]
        public string Model { get; set; }

        [Required]
        public string CustomerName { get; set; }

        [Required]
        public string LastName { get; set; }

        [Required]
        public string CustomerAddress { get; set; }

        [Required]
        public string MobileNumber { get; set; }
        public string PopUploadPath { get; set; }

        [Required]
        public string FarsiName { get; set; }

        [Required]
        public string FaultCode { get; set; }

        [Required]
        public string FaultDetail { get; set; }

        public string Accessories { get; set; }

        [Required]
        public string PhysicalCondition { get; set; }
        public string Notes { get; set; }

        [Required]
        public DateTime PopDate { get; set; }
        public DateTime? Date { get; set; }

        [Required]
        public DateTime ExpiryDate { get; set; }

        [Required]
        public string Forwarder { get; set; }

        [Required]
        public int WarrantyType { get; set; }

        public string WarrantyTypeText { get; set; }

        [Required]
        public int Type { get; set; }


        public DateTime? UnitDroppedDate { get; set; }
        public DateTime? CollectionDate { get; set; }
        public string TelephoneNumber { get; set; }
        public string Email { get; set; }

        [Required]
        public string VendorRmaNumber { get; set; }

        [Required]
        public string NationalId { get; set; }

        [Required]
        public string EcoCode { get; set; }
        public string PostalCode { get; set; }
        public string Prefix { get; set; }
        public string PhoneType => "M";
        public int UnitReceived => 1;
        public int JobStatus => 1;
        public int DirectCustomer => 0;
        public DateTime? UnitReceivedDate { get; set; }
        public string UnitAllocated => "COURIER #1";
        public string LocationCode { get; set; }
        public string LocationName { get; set; }
        public string City { get; set; }
        public int? DetailId { get; set; }
        public string Backend { get; set; }
        public string LoginType { get; set; }

        public List<int> AccessoriesIds { get; set; }
    }
}
