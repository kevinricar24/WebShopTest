using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebShopTest.Models;

namespace WebShopTest.Controllers
{
    public class CategoriesController : Controller
    {
        private WebShopDataStorageEntities db = new WebShopDataStorageEntities();
        private List<Category> categoriesCache
        {
            get { return Session["categoriesCache"] as List<Category>; }
            set { Session["categoriesCache"] = value; }
        }

        public bool UsingInMemory()
        {
            if (Session["Storage"] == null || Session["Storage"].ToString().Equals("InDatabase"))
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        // GET: Categories
        public ActionResult Index()
        {
            if (UsingInMemory())
            {
                if (categoriesCache == null)
                {
                    categoriesCache = new List<Category>() { new Category
                    {
                        CategoryId = 0,
                        Name = "NameTest",
                        Description = "DescriptionTest"
                    } };
                }
                return View(categoriesCache.ToList());
            }
            else
            {
                return View(db.Categories.ToList());
            }
        }

        // GET: Categories/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Categories/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CategoryId,Name,Description")] Category category)
        {
            if (ModelState.IsValid)
            {
                if (UsingInMemory())
                {
                    categoriesCache.Add(new Category()
                    {
                        CategoryId = category.CategoryId,
                        Name = category.Name,
                        Description = category.Description
                    });
                }
                else
                {
                    db.Categories.Add(category);
                    db.SaveChanges();
                }
                return RedirectToAction("Index");
            }
            return View(category);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
