#pragma checksum "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_CollectionPoint.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "62d1c922d4a6aedec3119f4e8e3e5d6f5f406ba9"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_FrontDesk_Device__CollectionPoint), @"mvc.1.0.view", @"/Views/FrontDesk/Device/_CollectionPoint.cshtml")]
[assembly:global::Microsoft.AspNetCore.Mvc.Razor.Compilation.RazorViewAttribute(@"/Views/FrontDesk/Device/_CollectionPoint.cshtml", typeof(AspNetCore.Views_FrontDesk_Device__CollectionPoint))]
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
#line 2 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_CollectionPoint.cshtml"
using Microsoft.AspNetCore.Http;

#line default
#line hidden
#line 3 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_CollectionPoint.cshtml"
using Nerve.Common;

#line default
#line hidden
#line 4 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_CollectionPoint.cshtml"
using Nerve.Common.Enums;

#line default
#line hidden
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"62d1c922d4a6aedec3119f4e8e3e5d6f5f406ba9", @"/Views/FrontDesk/Device/_CollectionPoint.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"99594d08e9904441231da0f54667e41be0b4da55", @"/Views/_ViewImports.cshtml")]
    public class Views_FrontDesk_Device__CollectionPoint : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<List<Nerve.Repository.Dtos.ItemDto>>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#line 6 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_CollectionPoint.cshtml"
  
    var languageId = (LanguageType)ViewContext.HttpContext.Session.GetInt32(WebConstants.SessionKeys.Language);
    var persianFont = ViewContext.HttpContext.Session.GetString(WebConstants.SessionKeys.PersianFont);
    var resourceKeys = new List<string>()
{
LanguageKeys.Code,
LanguageKeys.Name,
LanguageKeys.NoRecodsAvaiable
};

    var translateItems = await _languageTranslator.TranslateManyAsync(resourceKeys, languageId);

#line default
#line hidden
            BeginContext(646, 2, true);
            WriteLiteral("\r\n");
            EndContext();
#line 19 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_CollectionPoint.cshtml"
 if (Model != null && Model.Any())
{

#line default
#line hidden
            BeginContext(687, 76, true);
            WriteLiteral("    <script>\r\n        $(\"#select-collection-point\").show();\r\n    </script>\r\n");
            EndContext();
            BeginContext(765, 121, true);
            WriteLiteral("    <table class=\"table\">\r\n        <thead class=\"thead-dark\">\r\n            <tr>\r\n                <th scope=\"col\">#</th>\r\n");
            EndContext();
            BeginContext(974, 32, true);
            WriteLiteral("                <th scope=\"col\">");
            EndContext();
            BeginContext(1007, 44, false);
#line 30 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_CollectionPoint.cshtml"
                           Write(Html.Raw(@translateItems[LanguageKeys.Name]));

#line default
#line hidden
            EndContext();
            BeginContext(1051, 61, true);
            WriteLiteral("</th>\r\n            </tr>\r\n        </thead>\r\n        <tbody>\r\n");
            EndContext();
#line 34 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_CollectionPoint.cshtml"
             foreach (var item in Model)
            {

#line default
#line hidden
            BeginContext(1169, 65, true);
            WriteLiteral("                <tr>\r\n                    <td><input type=\"radio\"");
            EndContext();
            BeginWriteAttribute("id", " id=\"", 1234, "\"", 1264, 2);
            WriteAttributeValue("", 1239, "collection-check-", 1239, 17, true);
#line 37 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_CollectionPoint.cshtml"
WriteAttributeValue("", 1256, item.Id, 1256, 8, false);

#line default
#line hidden
            EndWriteAttribute();
            BeginWriteAttribute("checked", " checked=\"", 1265, "\"", 1289, 1);
#line 37 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_CollectionPoint.cshtml"
WriteAttributeValue("", 1275, item.Selected, 1275, 14, false);

#line default
#line hidden
            EndWriteAttribute();
            BeginWriteAttribute("title", " title=\"", 1290, "\"", 1308, 1);
#line 37 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_CollectionPoint.cshtml"
WriteAttributeValue("", 1298, item.Name, 1298, 10, false);

#line default
#line hidden
            EndWriteAttribute();
            BeginContext(1309, 61, true);
            WriteLiteral(" name=\"collection-point-radio\" class=\"collection-point-click\"");
            EndContext();
            BeginWriteAttribute("value", " value=\"", 1370, "\"", 1386, 1);
#line 37 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_CollectionPoint.cshtml"
WriteAttributeValue("", 1378, item.Id, 1378, 8, false);

#line default
#line hidden
            EndWriteAttribute();
            BeginContext(1387, 10, true);
            WriteLiteral(" /></td>\r\n");
            EndContext();
            BeginContext(1440, 24, true);
            WriteLiteral("                    <td>");
            EndContext();
            BeginContext(1465, 9, false);
#line 39 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_CollectionPoint.cshtml"
                   Write(item.Name);

#line default
#line hidden
            EndContext();
            BeginContext(1474, 30, true);
            WriteLiteral("</td>\r\n                </tr>\r\n");
            EndContext();
#line 41 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_CollectionPoint.cshtml"
            }

#line default
#line hidden
            BeginContext(1519, 32, true);
            WriteLiteral("        </tbody>\r\n    </table>\r\n");
            EndContext();
#line 44 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_CollectionPoint.cshtml"
}
else
{


#line default
#line hidden
            BeginContext(1565, 76, true);
            WriteLiteral("    <script>\r\n        $(\"#select-collection-point\").hide();\r\n    </script>\r\n");
            EndContext();
            BeginContext(1643, 51, true);
            WriteLiteral("    <div class=\"no-records-message\">\r\n        <span");
            EndContext();
            BeginWriteAttribute("class", " class=\"", 1694, "\"", 1714, 1);
#line 53 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_CollectionPoint.cshtml"
WriteAttributeValue("", 1702, persianFont, 1702, 12, false);

#line default
#line hidden
            EndWriteAttribute();
            BeginContext(1715, 15, true);
            WriteLiteral(">\r\n            ");
            EndContext();
            BeginContext(1731, 55, false);
#line 54 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_CollectionPoint.cshtml"
       Write(Html.Raw(translateItems[LanguageKeys.NoRecodsAvaiable]));

#line default
#line hidden
            EndContext();
            BeginContext(1786, 31, true);
            WriteLiteral("\r\n        </span>\r\n    </div>\r\n");
            EndContext();
#line 57 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_CollectionPoint.cshtml"
}

#line default
#line hidden
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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<List<Nerve.Repository.Dtos.ItemDto>> Html { get; private set; }
    }
}
#pragma warning restore 1591
