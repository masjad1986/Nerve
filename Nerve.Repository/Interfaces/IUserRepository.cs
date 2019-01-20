using Nerve.Repository.Dtos;
using Nerve.Repository.Enums;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Repository
{
    public interface IUserRepository
    {
        Task<User> AuthenticateAsync(string username, string password, int moduleId);
        Task<IEnumerable<UserMenuAccess>> GetUserAccessPermissionsAsync(int groupId, int moduleId);
    }
}
