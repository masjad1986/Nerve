using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Nerve.Repository;
using Nerve.Service;
using System;
using System.Threading.Tasks;

namespace Nerve.Web.Controllers
{
    // [Authorize]
    //[Route("[controller]")]
    public class UsersController : Controller
    {
        private readonly IUserService _userService;
        public UsersController(IUserService userService)
        {
            _userService = userService;
        }

        [AllowAnonymous]
        //[Route("/login")]
        public async Task<IActionResult> Login()
        {
            return View();
        }

        [HttpPost]
        //[Route("/login")]
        [AllowAnonymous]
        public async Task<IActionResult> Login(User user)
        {
            try
            {
                var authenticatedUser = await _userService.AuthenticateAsync(user.Username, user.Password);
                if (authenticatedUser == null)
                {
                    return Unauthorized();
                }

                TempData["user"] = authenticatedUser;
            }
            catch (Exception ex)
            {
                // log exception here 
            }

            return RedirectToAction("Index", "Home");
        }
    }
}