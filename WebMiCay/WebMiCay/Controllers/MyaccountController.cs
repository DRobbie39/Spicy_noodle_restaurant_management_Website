using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebMiCay.Controllers
{
    public class MyaccountController : Controller
    {
        // GET: Myaccount
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Donhang()
        {
            return View();
        }
       
        public ActionResult Account()
        {
            return View();
        }
    }
}