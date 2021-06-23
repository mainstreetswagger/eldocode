using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MobileApi.Errors
{
    public class Error
    {
        public int Code { get; set; }
        public string Message { get; set; }
    }
    public static class ErrorList
    {
        private static List<Error> _errors = new List<Error>
        {
            new Error{Code=1,Message="Пользователь не найден"},
        };

        public static List<Error> Fetch()
        {
            return _errors;
        }
    }
}
