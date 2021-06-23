using MobileApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MobileApi.Services
{
    public interface ICustomerService
    {
        Customer GetCustomer();
    }
    public class CustomerService : ICustomerService
    {
        private eldoradoContext _db;
        public CustomerService(eldoradoContext db)
        {
            _db = db;
        }
        public Customer GetCustomer()
        {
            return _db.Customers.FirstOrDefault();
        }
    }
}
