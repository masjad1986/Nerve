using System;
using System.Net;

namespace Nerve.Web.ViewModels
{
    public class ErrorViewModel
    {
        public string RequestId { get; set; }

        public bool ShowRequestId => !string.IsNullOrEmpty(RequestId);
        public bool ShowPageError { get; set; }
        public string Error { get; set; }
    }
}