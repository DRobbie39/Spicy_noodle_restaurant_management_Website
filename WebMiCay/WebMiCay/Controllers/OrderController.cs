using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebMiCay.Controllers
{
    public class OrderController : Controller
    {
        public ActionResult Index()
        {
            if (Session["username"] != null)
            {
                // Khách hàng đã đăng nhập, cho phép đặt món
                return View();
            }
            else
            {
                // Khách hàng chưa đăng nhập, báo lỗi rồi chuyển hướng
                TempData["ErrorMessage"] = "Vui lòng đăng nhập để sử dụng tính năng đặt món.";
                return RedirectToAction("Login", "Home");
            }
        }    
    }
}