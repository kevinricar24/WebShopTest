using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebShopTest.Controllers
{
    public class HomeController : Controller
    {

        [HttpPost]
        public ActionResult UpdateMode()
        {
            try
            {
                string strTypeMode = Request.Form["typeid"].ToString();
                Session["Storage"] = strTypeMode;
                return RedirectToAction("Index", "Products");
            }
            catch (Exception)
            {
                return View();
            }
        }

        public ActionResult Index()
        {
            return View();
        }
    }
}