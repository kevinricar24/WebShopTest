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
    public class ProductsController : Controller
    {
        private WebShopDataStorageEntities db = new WebShopDataStorageEntities();

        private List<Product> productsCache
        {
            get { return Session["productsCache"] as List<Product>; }
            set { Session["productsCache"] = value; }
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

        // GET: Products
        public ActionResult Index()
        {
            if (UsingInMemory())
            {
                if (productsCache == null)
                {
                    productsCache = new List<Product>() { new Product {
                        ProductId = 0,
                        Number = "NumberTest",
                        Title = "TitleTest",
                        Price = 0,
                        Description = "DescriptionTest"
                    } };
                }
                return View(productsCache.ToList());
            }
            else
            {
                return View(db.Products.ToList());
            }
        }

        // GET: Products/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ProductId,Number,Title,Price,Description")] Product product)
        {
            if (ModelState.IsValid)
            {
                if (UsingInMemory())
                {
                    productsCache.Add(new Product()
                    {
                        ProductId = product.ProductId,
                        Number = product.Number,
                        Title = product.Title,
                        Price = product.Price,
                        Description = product.Description
                    });
                }
                else
                {
                    db.Products.Add(product);
                    db.SaveChanges();
                }
                return RedirectToAction("Index");
            }
            return View(product);
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
