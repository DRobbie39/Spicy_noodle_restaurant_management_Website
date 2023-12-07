using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebMiCay.Areas.Admin.Controllers
{
    public class NhanvienController : Controller
    {
        public ActionResult Index()
        {
            if (Session["user"] == null)
            {
                return RedirectToAction("Login");
            }
            else
            {
                return View();
            }
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string user, string password)
        {
            if (user.ToLower() == "nv" && password == "1")
            { 
                Session["user"] = "user";
                return RedirectToAction("Index");
            }
            else
            {
                TempData["error"] = "Tài khoản đăng nhập không đúng";
                return View();
            }
        }

        public ActionResult List()
        {
            return View();
        }
        public ActionResult Billbook()
        {
            return View();
        }
        public ActionResult Booktable()
        {
            return View();
        }
        public ActionResult ChitietHD()
        {
            return View();
        }
        public ActionResult Phanhoi()
        {
            return View();
        }
    }
}