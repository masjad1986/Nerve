using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using Nerve.Repository;
using Nerve.Service;
using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using Nerve.Repository.Enums;

namespace Nerve.Web.Controllers
{
    [Authorize]
    public class UsersController : Controller
    {
        private string _controllerName;
        private readonly IUserService _userService;
        private readonly ILogger _logger;
        public UsersController(IUserService userService, ILogger logger)
        {
            _userService = userService;
            _logger = logger;
            _controllerName = "UsersController";
        }

        [AllowAnonymous]
        public async Task<IActionResult> Login()
        {
            var user = await Task.FromResult(new User());
            return View(user);
        }

        [AllowAnonymous]
        public async Task<IActionResult> DeviceLogin()
        {
            var user = await Task.FromResult(new User());
            return View(user);
        }

        [HttpPost]
        [AllowAnonymous]
        public async Task<IActionResult> Login(User user)
        {
            try
            {
                var authenticatedUser = await _userService.AuthenticateAsync(user.Username, user.Password);
                if (authenticatedUser == null)
                {
                    ViewBag.Error = "Invalid user credentials. Please try again.";
                    return View();
                }

                var userAccessMenus = await _userService.GetUserAccessPermissionsAsync(authenticatedUser.GroupId ?? 0, authenticatedUser.UserModule ?? 6);
                HttpContext.Session.SetString(WebConstants.SessionKeys.UserMenus,
                       Newtonsoft.Json.JsonConvert.SerializeObject(userAccessMenus ?? new List<UserMenuAccess>()));
                // session user information
                HttpContext.Session.SetString(WebConstants.SessionKeys.User,
                    Newtonsoft.Json.JsonConvert.SerializeObject(authenticatedUser));

                // session username
                HttpContext.Session.SetString(WebConstants.SessionKeys.UserName,
                       authenticatedUser.Username);

                // session group id
                HttpContext.Session.SetString(WebConstants.SessionKeys.GroupId,
                      Convert.ToString(authenticatedUser.GroupId.Value));

                // session module id
                HttpContext.Session.SetString(WebConstants.SessionKeys.ModuleId,
                      Convert.ToString(authenticatedUser.UserModule.Value));

                return RedirectToAction("Index", "Home");
            }
            catch (Exception ex)
            {
                _logger.Log(controller: _controllerName, action: "Login", exception: ex);
                return Unauthorized(user.UserId);
            }
        }

        public IActionResult Logout()
        {
            HttpContext.Session.Remove(WebConstants.SessionKeys.User);
            HttpContext.Session.Remove(WebConstants.SessionKeys.UserMenus);
            HttpContext.Session.Remove(WebConstants.SessionKeys.UserName);
            HttpContext.Session.Remove(WebConstants.SessionKeys.GroupId);
            HttpContext.Session.Remove(WebConstants.SessionKeys.ModuleId);
            if (HttpContext.Session.GetInt32(WebConstants.SessionKeys.LoginType) == (int)LoginType.Device)
            {
                HttpContext.Session.Remove(WebConstants.SessionKeys.LoginType);
                return RedirectToAction("DeviceLogin");
            }
            else
            {
                return RedirectToAction("Login");
            }
        }
    }
}