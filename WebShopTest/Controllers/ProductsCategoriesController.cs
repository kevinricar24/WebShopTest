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
    public class ProductsCategoriesController : Controller
    {
        private WebShopDataStorageEntities db = new WebShopDataStorageEntities();

        // GET: ProductsCategories
        public ActionResult Index()
        {
            var productsCategories = db.ProductsCategories.Include(p => p.Category).Include(p => p.Product);
            return View(productsCategories.ToList());
        }

        // GET: ProductsCategories/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductsCategory productsCategory = db.ProductsCategories.Find(id);
            if (productsCategory == null)
            {
                return HttpNotFound();
            }
            return View(productsCategory);
        }

        // GET: ProductsCategories/Create
        public ActionResult Create()
        {
            ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "Name");
            ViewBag.ProductId = new SelectList(db.Products, "ProductId", "Title");
            return View();
        }

        // POST: ProductsCategories/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ProductCategoryId,ProductId,CategoryId")] ProductsCategory productsCategory)
        {
            if (ModelState.IsValid)
            {
                db.ProductsCategories.Add(productsCategory);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "Name", productsCategory.CategoryId);
            ViewBag.ProductId = new SelectList(db.Products, "ProductId", "Title", productsCategory.ProductId);
            return View(productsCategory);
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
