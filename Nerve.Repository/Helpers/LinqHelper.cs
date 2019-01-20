using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;

namespace Nerve.Repository.Helpers
{
    public class LinqHelper
    {
        public IEnumerable<T> ToEnumerable<T>(SqlDataReader reader)
        {
            throw new NotImplementedException();
        }
    }
}
