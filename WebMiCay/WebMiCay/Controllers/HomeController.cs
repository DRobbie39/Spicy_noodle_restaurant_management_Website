using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace WebMiCay.Controllers
{
    public class HomeController : Controller
    {
        QuanLyQuanMiCayEntities db = new QuanLyQuanMiCayEntities();
        public ActionResult Index()
        {
             return View(); 
        }

        public ActionResult Login()
        {
            if (TempData["ErrorMessage"] != null)
            {
                ViewBag.ErrorMessage = TempData["ErrorMessage"];
            }

            return View();
        }

        [HttpPost]
        public ActionResult Login(string Username, string MatKhau)
        {
            var taiKhoanKhach = db.TaiKhoanKhach.SingleOrDefault(x => x.TenTaiKhoanKhach == Username && x.MatKhauKhach == MatKhau);
            if (taiKhoanKhach != null)
            {
                var khachHang = db.KhachHang.Find(taiKhoanKhach.MaKH);
                if (khachHang != null)
                {
                    var user = new KhachHang { TenKH = khachHang.TenKH, SDT = khachHang.SDT };
                    Session["user"] = user;
                }
                return RedirectToAction("Index", "HomeClient");
            }
            else
            {
                return View("Login");
            }
        }

        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(string TenKH, string SDT, DateTime NgaySinh, string DiaChi, string GioiTinh, string Username, string MatKhau)
        {
            db.Database.ExecuteSqlCommand("EXEC sp_InsertKhachHang @p0, @p1, @p2, @p3, @p4, @p5, @p6",
            parameters: new[]
            {
                new SqlParameter("@p0", TenKH),
                new SqlParameter("@p1", SDT),
                new SqlParameter("@p2", NgaySinh),
                new SqlParameter("@p3", DiaChi),
                new SqlParameter("@p4", GioiTinh),
                new SqlParameter("@p5", Username),
                new SqlParameter("@p6", MatKhau)
            });

            return RedirectToAction("Index");
        }

        public ActionResult HomeClient()
        {
            return View();
        }
    }
}