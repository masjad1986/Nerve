using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Repository
{
    [Table("usermaster", Schema = RepositoryConstants.SchemaName)]
    public class User
    {
        [Column("T")]
        public int Id { get; set; }

        [Column("USERID")]
        public string UserId { get; set; }

        [Column("USERNAME")]
        public string Username { get; set; }
        [Column("PASSWORD")]
        public string Password { get; set; }

        [Column("CREATIONDATE")]
        public DateTime? CreatedDate { get; set; }

        [Column("LASTLOGINDATE")]
        public DateTime? LastLoginDate { get; set; }

        [Column("CUSTOMERID")]
        [MaxLength(7)]
        public string CustomerId { get; set; }

        [Column("LOCPREFIX")]
        [MaxLength(4)]
        public string LocPrefix { get; set; }

        [Column("EMAIL")]
        [MaxLength(100)]
        public string Email { get; set; }

        [Column("EmailCC")]
        [MaxLength(250)]
        public string EmailCc { get; set; }

        [Column("ToEmail")]
        [MaxLength(100)]
        public string EmailTo { get; set; }

        [Column("TCLOC")]
        [MaxLength(100)]
        public string TCLoc { get; set; }

        [Column("BRAND")]
        [MaxLength(50)]
        public string Brand { get; set; }

        [Column("Location")]
        [MaxLength(50)]
        public string Location { get; set; }

        [Column("Emirate")]
        [MaxLength(50)]
        public string Emirate { get; set; }

        [Column("Country")]
        [MaxLength(50)]
        public string Country { get; set; }

        [Column("CollectedBy")]
        [MaxLength(20)]
        public string CollectedBy { get; set; }

        [Column("CustomerType")]
        [MaxLength(20)]
        public string CustomerType { get; set; }

        [Column("DeliveryAgent")]
        [MaxLength(50)]
        public string DeliveryAgent { get; set; }

        [Column("Backenduser")]
        public int? Backenduser { get; set; }

        [Column("UserType")]
        public int? UserType { get; set; }

        [Column("FS_UserType")]
        public int? FsUserType { get; set; }

        [Column("BBOffer")]
        public int? BBOffer { get; set; }

        [Column("HTCOffer")]
        public int? HTCOffer { get; set; }

        [Column("NOKIAOffer")]
        public int? NOKIAOffer { get; set; }

        [Column("SiemensOffer")]
        public int? SiemensOffer { get; set; }

        [Column("MotorolaOffer")]
        public int? MotorolaOffer { get; set; }

        [Column("GenericOffer")]
        public int? GenericOffer { get; set; }

        [Column("AppleOffer")]
        public int? AppleOffer { get; set; }

        [Column("LaptopOffer")]
        public int? LaptopOffer { get; set; }

        [Column("IPADOffer")]
        public int? IPadOffer { get; set; }

        [Column("ThoshibaOffer")]
        public int? ThoshibaOffer { get; set; }

        [Column("SonyOffer")]
        public int? SonyOffer { get; set; }

        [Column("Camera")]
        public int? Camera { get; set; }

        [Column("MP3Player")]
        public int? Mp3Player { get; set; }

        [Column("GameConsole")]
        public int? GameConsole { get; set; }

        [Column("MainPartnercode")]
        [MaxLength(50)]
        public string MainPartnerCode { get; set; }

        [Column("MainSPartnercode")]
        [MaxLength(50)]
        public string MainSPartnerCode { get; set; }

        [Column("SubPartner")]
        public int? SubPartner { get; set; }

        [Column("LastLabelID")]
        [MaxLength(50)]
        public string LastLabelId { get; set; }

        [Column("CurrCode")]
        [MaxLength(5)]
        public string CurrencyCode { get; set; }

        [Column("ExchRate")]
        public decimal? ExchangeRate { get; set; }

        [Column("Laptop_LocationName")]
        [MaxLength(50)]
        public string LaptopLocationName { get; set; }

        [Column("CF_LocationCode")]
        [MaxLength(5)]
        public string CFLocationCode { get; set; }

        [Column("Laptop_MasterLocation")]
        [MaxLength(50)]
        public string LaptopMasterLocation { get; set; }

        [Column("CF_Prefix")]
        [MaxLength(5)]
        public string CFPrefix { get; set; }

        [Column("Region")]
        [MaxLength(20)]
        public string Region { get; set; }

        [Column("MainPartnerCode1")]
        [MaxLength(50)]
        public string MainPartnerCode1 { get; set; }

        [Column("LoginType")]
        [MaxLength(10)]
        public string LoginType { get; set; }

        [Column("COSMOSUSERID")]
        [MaxLength(15)]
        public string CosmosUserId { get; set; }

        [Column("SendEmail")]
        public byte? SendEmail { get; set; }

        [Column("Branch")]
        [MaxLength(100)]
        public string Branch { get; set; }

        [Column("Language_ID")]
        public int? LanguageId { get; set; }

        [Column("MultipleLocation")]
        [MaxLength(1)]
        [Required]
        public string MultipleLocation { get; set; }

        [Column("Inactive")]
        public int? Inactive { get; set; }

        [Column("LOC")]
        [MaxLength(1)]
        public string Loc { get; set; }

        [Column("Laptop_VenderID")]
        public int? LaptopVenderId { get; set; }

        [Column("GroupID")]
        public int? GroupId { get; set; }

        [Column("CollectionRequired")]
        public bool? IsCollectionRequired { get; set; }

        [Column("DiscPer")]
        public decimal? DiscountPercent { get; set; }

        [Column("DefaultFormMenuID")]
        public int? DefaultPageMenuId { get; set; }

        [Column("Type")]
        [MaxLength(2)]
        public string Type { get; set; }

        [Column("MenuType")]
        public int? MenuType { get; set; }

        [Column("EnggCode")]
        [MaxLength(10)]
        public string EngineerCode { get; set; }

        [Column("DefaultCollectionPoint")]
        [MaxLength(20)]
        public string DefaultCollectionPoint { get; set; }

        [Column("DefaultLocationCode")]
        [MaxLength(20)]
        public string DefaultLocationCode { get; set; }

        [Column("CashPer")]
        public decimal? CashPercent { get; set; }

        [Column("CP_INCHARGE")]
        public decimal? CPIncharge { get; set; }

        [Column("USER_MODULE")]
        public int? UserModule { get; set; }

        public string Role { get; set; }
        public string Token { get; set; }
    }
}
