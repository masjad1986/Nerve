using Nerve.Repository;
using Nerve.Repository.Dtos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Service
{
    public interface IUserService
    {
        Task<User> AuthenticateAsync(string username, string password);
        Task<List<UserMenuAccess>> GetUserAccessPermissionsAsync(int groupId, int moduleId);
        Task<string> GetTrackingPrefixByUserIdAsync(string userId);
    }
}
