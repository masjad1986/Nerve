#pragma checksum "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Home\Index.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "8f715934c737bcfe73291b11494960e8ff04e98b"
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
#line 2 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\_ViewImports.cshtml"
using Nerve.Web.Models;

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
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"8f715934c737bcfe73291b11494960e8ff04e98b", @"/Views/Home/Index.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"99594d08e9904441231da0f54667e41be0b4da55", @"/Views/_ViewImports.cshtml")]
    public class Views_Home_Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<dynamic>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#line 5 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Home\Index.cshtml"
  
    ViewData["Title"] = "Home Page";
    var welcome = await _languageTranslator
                .TranslateAsync(LanguageKeys.WelcomeToNerveLogistics,
                (LanguageType)Context.Session.GetInt32(WebConstants.SessionKeys.Language));

#line default
#line hidden
            BeginContext(411, 2, true);
            WriteLiteral("\r\n");
            EndContext();
#line 12 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Home\Index.cshtml"
   var persianFont = Context.Session.GetInt32(WebConstants.SessionKeys.Language).Value == (int)LanguageType.Farsi ? "persion-font-size" : "";

#line default
#line hidden
            BeginContext(557, 4, true);
            WriteLiteral("<div");
            EndContext();
            BeginWriteAttribute("class", " class=\"", 561, "\"", 599, 2);
            WriteAttributeValue("", 569, "home-welcome-text", 569, 17, true);
#line 13 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Home\Index.cshtml"
WriteAttributeValue(" ", 586, persianFont, 587, 12, false);

#line default
#line hidden
            EndWriteAttribute();
            BeginContext(600, 5, true);
            WriteLiteral("><h2>");
            EndContext();
            BeginContext(606, 7, false);
#line 13 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Home\Index.cshtml"
                                           Write(welcome);

#line default
#line hidden
            EndContext();
            BeginContext(613, 13, true);
            WriteLiteral("</h2></div>\r\n");
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
