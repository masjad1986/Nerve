namespace Nerve.Repository
{
    public class UserMenuAccess
    {
        public int Id { get; set; }
        public int GroupId { get; set; }
        public int ModuleId { get; set; }
        public string ViewOption { get; set; }
        public string SaveOption { get; set; }
        public string UpdateOption { get; set; }
        public string DeleteOption { get; set; }
        public string PrintOption { get; set; }
        public string Deleted { get; set; }
        public int MenuId { get; set; }
        public string MenuName { get; set; }
        public string MenuLink { get; set; }
        public int ParentMenuId { get; set; }
        public string ModuleName { get; set; }
        public bool Active { get; set; }
        public int OrderBy { get; set; }
        public int LanguageId { get; set; }
        public string LanguageKey { get; set; }
    }
}
