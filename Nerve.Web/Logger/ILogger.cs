using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Nerve.Web
{
    public interface ILogger
    {
        void Log(string controller, string action, string message);
        void Log(string controller, string action, Exception exception);
    }
}
