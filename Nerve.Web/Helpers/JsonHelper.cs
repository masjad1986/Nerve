using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Nerve.Web.Helpers
{
    public class JsonHelper<T>
    {
        public static string ToJsonString(T type)
        {
            return JsonConvert.SerializeObject(type);
        }
    }
}
