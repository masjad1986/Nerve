using Nerve.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Nerve.Web.ViewModels
{
    public class MenuViewModel
    {
        public int CurrentMenuId { get; set; }
        public List<UserMenuAccess> Menus { get; set; }
    }
}
