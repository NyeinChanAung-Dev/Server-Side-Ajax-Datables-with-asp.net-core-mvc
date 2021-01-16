using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ajax_serverside_processing.Models;
using Microsoft.EntityFrameworkCore;

namespace ajax_serverside_processing.Controllers
{
    public class HomeController : Controller
    {
        private readonly AjaxServerSideDbContext _dbContext;

        public HomeController(AjaxServerSideDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public IActionResult Index()
        {
            return View();
        }

        public async Task<IActionResult> LoadShippingDataAsync()
        {
            try
            {
                var draw = HttpContext.Request.Form["draw"].FirstOrDefault();
                // Skiping number of Rows count
                var start = Request.Form["start"].FirstOrDefault();
                // Paging Length 10,20
                var length = Request.Form["length"].FirstOrDefault();
                // Sort Column Names
                var sortColumn = Request.Form["columns[" + Request.Form["order[0][column]"].FirstOrDefault() + "][data]"].FirstOrDefault();
                // Sort Column Direction ( asc ,desc)
                var sortColumnDirection = Request.Form["order[0][dir]"].FirstOrDefault();
                // Search Value from (Search box)
                var searchValue = Request.Form["search[value]"].FirstOrDefault();

                //Paging Size (10,20,50,100)
                int pageSize = length != null ? Convert.ToInt32(length) : 0;
                int skip = start != null ? Convert.ToInt32(start) : 0;
                int recordsTotal = 0;

                // Getting all Customer data
                IEnumerable<ShippingTb> _dataList = await _dbContext.ShippingTb.ToListAsync();

                //Sorting
                if (!(string.IsNullOrEmpty(sortColumn)) && !(string.IsNullOrEmpty(sortColumnDirection)))
                {
                    var propertyInfo = typeof(ShippingTb).GetProperty(sortColumn);
                    if (sortColumnDirection == "desc")
                    {
                        _dataList =  _dataList.OrderByDescending(x => propertyInfo.GetValue(x, null));
                    }
                    else
                    {
                        _dataList = _dataList.OrderBy(x => propertyInfo.GetValue(x, null));
                    }
                }
                //Search
                if (!string.IsNullOrEmpty(searchValue))
                {
                    _dataList = _dataList.Where(r => r.OrderId != null && r.OrderId.ToUpper().Contains(searchValue.ToUpper()) ||
                                           r.Country != null && r.Country.ToUpper().Contains(searchValue.ToUpper()) ||
                                           r.ShipCity != null && r.ShipCity.ToUpper().Contains(searchValue.ToUpper()) ||
                                           r.ShipAddress != null && r.ShipAddress.ToUpper().Contains(searchValue.ToUpper()) ||
                                           r.CompanyAgent != null && r.CompanyAgent.ToUpper().Contains(searchValue.ToUpper()) ||
                                           r.CompanyName != null && r.CompanyName.ToUpper().Contains(searchValue.ToUpper()) ||
                                           r.Country != null && r.Country.ToUpper().Contains(searchValue.ToUpper()))
                        .ToList();
                }

                //total number of rows count 
                recordsTotal = _dataList.Count();
                //Paging 
                var data = _dataList.Skip(skip).Take(pageSize).ToList();
                //Returning Json Data
                return Json(new { draw = draw, recordsFiltered = recordsTotal, recordsTotal = recordsTotal, data = data });

            }
            catch (Exception)
            {
                throw;
            }
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
