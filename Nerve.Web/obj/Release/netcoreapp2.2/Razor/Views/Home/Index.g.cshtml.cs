#pragma checksum "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Home\Index.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "a53e8033a2a66c3825101696f3b6c0508d2a4291"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Home_Index), @"mvc.1.0.view", @"/Views/Home/Index.cshtml")]
[assembly:global::Microsoft.AspNetCore.Mvc.Razor.Compilation.RazorViewAttribute(@"/Views/Home/Index.cshtml", typeof(AspNetCore.Views_Home_Index))]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#line 1 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\_ViewImports.cshtml"
using Nerve.Web;

#line default
#line hidden
#line 1 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Home\Index.cshtml"
using Microsoft.AspNetCore.Http;

#line default
#line hidden
#line 2 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Home\Index.cshtml"
using Nerve.Common;

#line default
#line hidden
#line 3 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Home\Index.cshtml"
using Nerve.Common.Enums;

#line default
#line hidden
#line 4 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Home\Index.cshtml"
using Nerve.Web.Extensions;

#line default
#line hidden
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"a53e8033a2a66c3825101696f3b6c0508d2a4291", @"/Views/Home/Index.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"6f4246cd722c431f8282f683ae25bbc3db727493", @"/Views/_ViewImports.cshtml")]
    public class Views_Home_Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<dynamic>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#line 6 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Home\Index.cshtml"
  
    ViewData["Title"] = "Home Page";
    var welcome = await _languageTranslator
                .TranslateAsync(LanguageKeys.WelcomeToNerveLogistics,
                (LanguageType)Context.Session.GetInt32(WebConstants.SessionKeys.Language));

    var items = new List<SelectListItem>
{
new SelectListItem { Text = "Male", Value = "1", Selected = false },
new SelectListItem { Text = "Female", Value = "2", Selected = false },
new SelectListItem { Text = "Others", Value = "3", Selected = false }
};

#line default
#line hidden
            BeginContext(704, 2, true);
            WriteLiteral("\r\n");
            EndContext();
#line 20 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Home\Index.cshtml"
   var persianFont = Context.Session.GetInt32(WebConstants.SessionKeys.Language).Value == (int)LanguageType.Farsi ? "persion-font-size" : "";

#line default
#line hidden
            BeginContext(850, 4, true);
            WriteLiteral("<div");
            EndContext();
            BeginWriteAttribute("class", " class=\"", 854, "\"", 892, 2);
            WriteAttributeValue("", 862, "home-welcome-text", 862, 17, true);
#line 21 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Home\Index.cshtml"
WriteAttributeValue(" ", 879, persianFont, 880, 12, false);

#line default
#line hidden
            EndWriteAttribute();
            BeginContext(893, 5, true);
            WriteLiteral("><h2>");
            EndContext();
            BeginContext(899, 7, false);
#line 21 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Home\Index.cshtml"
                                           Write(welcome);

#line default
#line hidden
            EndContext();
            BeginContext(906, 11, true);
            WriteLiteral("</h2></div>");
            EndContext();
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public Nerve.Common.Translations.ILanguageTranslator _languageTranslator { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<dynamic> Html { get; private set; }
    }
}
#pragma warning restore 1591
