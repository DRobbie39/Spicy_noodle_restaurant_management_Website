using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebMiCay.Controllers
{
    public class BookController : Controller
    {
        QuanLyQuanMiCayEntities db = new QuanLyQuanMiCayEntities();
        public ActionResult Index()
        {
            if (Session["user"] != null)
            {
                var user = Session["user"] as KhachHang;
                if (user != null)
                {
                    ViewBag.TenKH = user.TenKH;
                    ViewBag.SDT = user.SDT;
                }

            }

            return View();
        }
    }
}