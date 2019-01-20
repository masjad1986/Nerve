using Nerve.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Nerve.Web.ViewModels
{
    public class UserViewModel
    {
        public User User { get; set; }
        public List<UserMenuAccess> UserMenus { get; set; }
    }
}
