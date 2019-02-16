using Nerve.Common.Enums;
using Nerve.Repository;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Nerve.Service
{
    public class UserService : IUserService
    {
        private readonly IUserRepository _userRepository;

        public UserService(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        public async Task<User> AuthenticateAsync(string username, string password)
        {
            var user = await _userRepository.AuthenticateAsync(username, password, (int)UserModuleType.Web);

            // return null if user not found
            if (user == null)
                return null;

            // authentication successful so generate jwt token
            //var tokenHandler = new JwtSecurityTokenHandler();
            //var key = Encoding.ASCII.GetBytes(AppSettings.Secret);
            //var tokenDescriptor = new SecurityTokenDescriptor
            //{
            //    Subject = new ClaimsIdentity(new Claim[]
            //    {
            //        new Claim(ClaimTypes.Name, user.Id.ToString()),
            //        new Claim(ClaimTypes.Role, user.Role),
            //        new Claim(ClaimTypes.Email, user.Email)
            //    }),
            //    Expires = DateTime.UtcNow.AddDays(7),
            //    SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            //};
            //var token = tokenHandler.CreateToken(tokenDescriptor);
            //user.Token = tokenHandler.WriteToken(token);

            //// remove password before returning
            //user.Password = null;

            return await Task.FromResult(user);
        }

        public async Task<List<UserMenuAccess>> GetUserAccessPermissionsAsync(int groupId, int moduleId)
        {
            return await _userRepository.GetUserAccessPermissionsAsync(groupId, moduleId);
        }

        public async Task<string> GetTrackingPrefixByUserIdAsync(string userId)
        {
            var prefix =  await _userRepository.GetTrackingPrefixByUserIdAsync(userId);
            return prefix.TrackingPrefix;
        }
    }
}