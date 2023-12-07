using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebMiCay.Areas.Admin.Controllers
{
    public class IngredientController : Controller
    {
        // GET: Admin/Ingredient
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Addingredient()
        {
            return View();
        }
        public ActionResult Updateingredient()
        {
            return View();
        }
    }
}