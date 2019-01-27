using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using Nerve.Repository;
using Nerve.Service;
using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using Nerve.Repository.Enums;
using Nerve.Web.Translation;
using Nerve.Web.Filters;

namespace Nerve.Web.Controllers
{
    [Route("[controller]")]
    public class UsersController : Controller
    {
        private string _controllerName;
        private readonly IUserService _userService;
        private readonly ILogger _logger;
        private readonly ILanguageTranslator _languageTranslator;
        public UsersController(IUserService userService, ILogger logger, ILanguageTranslator languageTranslator)
        {
            _userService = userService;
            _logger = logger;
            _languageTranslator = languageTranslator;
            _controllerName = "UsersController";
        }

        [AllowAnonymous]
        [Route("Login")]
        public async Task<IActionResult> Login()
        {
            var user = await Task.FromResult(new User());
            return View(user);
        }

        [HttpPost]
        [AllowAnonymous]
        [Route("Login")]
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

                // language
                HttpContext.Session.SetInt32(WebConstants.SessionKeys.Language, user.LanguageId ?? 0);

                // default laptop vendor location
                HttpContext.Session.SetInt32(WebConstants.SessionKeys.DefaultStockLocation, authenticatedUser.LaptopVenderId.Value);

                HttpContext.Session.SetString(WebConstants.SessionKeys.PersianFont, (user.LanguageId == (int)LanguageType.Farsi ? "persian-font-size" : ""));

                // HttpContext.Session.SetInt32(WebConstants.SessionKeys.DefaultDealer, authenticatedUser.D);
                return RedirectToAction("Index", "Home");
            }
            catch (Exception ex)
            {
                _logger.Log(controller: _controllerName, action: "Login", exception: ex);
                return Unauthorized(user.UserId);
            }
        }

        //[NerveAuthorize]
        public IActionResult Logout()
        {
            HttpContext.Session.Remove(WebConstants.SessionKeys.User);
            HttpContext.Session.Remove(WebConstants.SessionKeys.UserMenus);
            HttpContext.Session.Remove(WebConstants.SessionKeys.UserName);
            HttpContext.Session.Remove(WebConstants.SessionKeys.GroupId);
            HttpContext.Session.Remove(WebConstants.SessionKeys.ModuleId);
            HttpContext.Session.Remove(WebConstants.SessionKeys.Language);
            HttpContext.Session.Remove(WebConstants.SessionKeys.DefaultStockLocation);
            HttpContext.Session.Remove(WebConstants.SessionKeys.DefaultDealer);
            return RedirectToAction("Login");
        }
    }
}