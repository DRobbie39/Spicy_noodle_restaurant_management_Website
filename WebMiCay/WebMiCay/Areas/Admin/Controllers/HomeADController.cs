using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace WebMiCay.Areas.Admin.Controllers
{
    public class HomeADController : Controller
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            if (Session["user"] == null)
            {
                return RedirectToAction("Login");
            }
            else {
                return View();
            }
        }


        public ActionResult Login() {
        return View();
        }

        [HttpPost]
        public ActionResult Login(string user , string password)
        {
           if(user.ToLower() == "admin" && password == "1") {
                Session["user"] = "admin";
                return RedirectToAction("Index");
            }
           else
            {
                TempData["error"] = "Tài khoản đăng nhập không đúng";
                return View();
            }
        }

        public ActionResult Logout()
        {
           Session.Remove("user");
            FormsAuthentication.SignOut();
            return RedirectToAction("Login");
        }
    }
}