using MobileApi.Dtos;
using MobileApi.Errors;
using MobileApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MobileApi.Services
{
    public interface IUserService
    {
        User Authenticate(Auth auth);
        User AuthenticateCustomer(Auth auth);
    }
    public class UserService : IUserService
    {
        private eldoradoContext _db;
        public UserService(eldoradoContext db)
        {
            _db = db;
        }
        public User Authenticate(Auth auth)
        {
            if (_db.Users.Any(x => x.Login == auth.Login && x.Password == auth.Password))
            {
                return _db.Users.FirstOrDefault(x => x.Login == auth.Login && x.Password == auth.Password && x.HolderType.Id == 2);
            }
            throw new Exception(ErrorList.Fetch().FirstOrDefault(x => x.Code == 1).Message);
        }
        public User AuthenticateCustomer(Auth auth)
        {
            if (_db.Users.Any(x => x.Login == auth.Login && x.Password == auth.Password))
            {
                return _db.Users.FirstOrDefault(x => x.Login == auth.Login && x.Password == auth.Password && x.HolderType.Id == 1);
            }
            throw new Exception(ErrorList.Fetch().FirstOrDefault(x => x.Code == 1).Message);
        }

    }
}
