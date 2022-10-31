using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using WingtipToys.Models;
using System.Web.ModelBinding;
using System.Web.Routing;

namespace WingtipToys
{
  public partial class ProductList : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
            SearchForm.Attributes.Add("placeholder", "search product...");
        }
        public IQueryable<Category> GetCategories()
        {
            var _db = new WingtipToys.Models.ProductContext();
            IQueryable<Category> query = _db.Categories;
            return query;
        }
        public IQueryable<Product> GetProducts(
                        [QueryString("id")] int? categoryId,
                        [RouteData] string categoryName)
    {
      var _db = new WingtipToys.Models.ProductContext();
      IQueryable<Product> query = _db.Products;

      if (categoryId.HasValue && categoryId > 0)
      {
        query = query.Where(p => p.CategoryID == categoryId);
      }

      if (!String.IsNullOrEmpty(categoryName))
      {
        query = query.Where(p =>
                            String.Compare(p.Category.CategoryName,
                            categoryName) == 0);
      }
            var count = query.Count();
            
      return query;
    }
        [WebMethod] 
        public static string GetCurrentTime(string name)
        {
            return "Hello " + name + Environment.NewLine + "The Current Time is: "
                + DateTime.Now.ToString();
        }
        [WebMethod]
        public static string SearchProduct(string name)
        {
            return "Hello " + name + Environment.NewLine + "The Current Time is: "
                + DateTime.Now.ToString();
        }
    }
    
}