#pragma checksum "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_StandByUnits.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "8df1fcfb1d6b58a8b0394d104b8e169eb5298994"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_FrontDesk_Device__StandByUnits), @"mvc.1.0.view", @"/Views/FrontDesk/Device/_StandByUnits.cshtml")]
[assembly:global::Microsoft.AspNetCore.Mvc.Razor.Compilation.RazorViewAttribute(@"/Views/FrontDesk/Device/_StandByUnits.cshtml", typeof(AspNetCore.Views_FrontDesk_Device__StandByUnits))]
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
#line 2 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_StandByUnits.cshtml"
using Microsoft.AspNetCore.Http;

#line default
#line hidden
#line 3 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_StandByUnits.cshtml"
using Nerve.Repository.Enums;

#line default
#line hidden
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"8df1fcfb1d6b58a8b0394d104b8e169eb5298994", @"/Views/FrontDesk/Device/_StandByUnits.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"99594d08e9904441231da0f54667e41be0b4da55", @"/Views/_ViewImports.cshtml")]
    public class Views_FrontDesk_Device__StandByUnits : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<Nerve.Repository.Dtos.StandByUnitDto>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            BeginContext(181, 2, true);
            WriteLiteral("\r\n");
            EndContext();
#line 6 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_StandByUnits.cshtml"
  
    var langugeId = (LanguageType)ViewContext.HttpContext.Session.GetInt32(WebConstants.SessionKeys.Language);
    var persianFont = ViewContext.HttpContext.Session.GetString(WebConstants.SessionKeys.PersianFont);

#line default
#line hidden
            BeginContext(406, 183, true);
            WriteLiteral("\r\n\r\n<div class=\"panel panel-default top-margin-10\">\r\n    <div class=\"panel-body\">\r\n        <div class=\"row row-space\">\r\n            <div class=\"col-sm-1 text-right\">\r\n                ");
            EndContext();
            BeginContext(590, 71, false);
#line 16 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_StandByUnits.cshtml"
           Write(await _languageTranslator.TranslateAsync(LanguageKeys.Brand, langugeId));

#line default
#line hidden
            EndContext();
            BeginContext(661, 74, true);
            WriteLiteral("\r\n            </div>\r\n            <div class=\"col-sm-4\">\r\n                ");
            EndContext();
            BeginContext(736, 71, false);
#line 19 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_StandByUnits.cshtml"
           Write(Html.TextBoxFor(model => model.Brand, new { @class = "form-control", }));

#line default
#line hidden
            EndContext();
            BeginContext(807, 245, true);
            WriteLiteral("\r\n                <span class=\"glyphicon glyphicon-search cursor form-control-feedback btn-primary\"></span>\r\n            </div>\r\n        </div>\r\n        <div class=\"row row-space\">\r\n            <div class=\"col-sm-1 text-right\">\r\n                ");
            EndContext();
            BeginContext(1053, 71, false);
#line 25 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_StandByUnits.cshtml"
           Write(await _languageTranslator.TranslateAsync(LanguageKeys.Model, langugeId));

#line default
#line hidden
            EndContext();
            BeginContext(1124, 74, true);
            WriteLiteral("\r\n            </div>\r\n            <div class=\"col-sm-4\">\r\n                ");
            EndContext();
            BeginContext(1199, 71, false);
#line 28 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_StandByUnits.cshtml"
           Write(Html.TextBoxFor(model => model.Model, new { @class = "form-control", }));

#line default
#line hidden
            EndContext();
            BeginContext(1270, 245, true);
            WriteLiteral("\r\n                <span class=\"glyphicon glyphicon-search cursor form-control-feedback btn-primary\"></span>\r\n            </div>\r\n        </div>\r\n        <div class=\"row row-space\">\r\n            <div class=\"col-sm-1 text-right\">\r\n                ");
            EndContext();
            BeginContext(1516, 76, false);
#line 34 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_StandByUnits.cshtml"
           Write(await _languageTranslator.TranslateAsync(LanguageKeys.ImeiNumber, langugeId));

#line default
#line hidden
            EndContext();
            BeginContext(1592, 74, true);
            WriteLiteral("\r\n            </div>\r\n            <div class=\"col-sm-4\">\r\n                ");
            EndContext();
            BeginContext(1667, 76, false);
#line 37 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_StandByUnits.cshtml"
           Write(Html.TextBoxFor(model => model.IMEINumber, new { @class = "form-control", }));

#line default
#line hidden
            EndContext();
            BeginContext(1743, 343, true);
            WriteLiteral(@"
                <span class=""glyphicon glyphicon-search cursor form-control-feedback btn-primary""></span>
            </div>
            <div class=""col-sm-6""></div>
        </div>
        <div class=""row row-space"">
            <div class=""col-sm-1 text-right"">
            </div>
            <div class=""col-sm-4"">
                ");
            EndContext();
            BeginContext(2087, 43, false);
#line 46 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_StandByUnits.cshtml"
           Write(Html.CheckBoxFor(model => model.IsReturned));

#line default
#line hidden
            EndContext();
            BeginContext(2130, 18, true);
            WriteLiteral("\r\n                ");
            EndContext();
            BeginContext(2149, 74, false);
#line 47 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_StandByUnits.cshtml"
           Write(await _languageTranslator.TranslateAsync(LanguageKeys.Returned, langugeId));

#line default
#line hidden
            EndContext();
            BeginContext(2223, 138, true);
            WriteLiteral("\r\n            </div>\r\n        </div>\r\n        <div class=\"row row-space\">\r\n            <div class=\"col-sm-1 text-right\">\r\n                ");
            EndContext();
            BeginContext(2362, 74, false);
#line 52 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_StandByUnits.cshtml"
           Write(await _languageTranslator.TranslateAsync(LanguageKeys.Returned, langugeId));

#line default
#line hidden
            EndContext();
            BeginContext(2436, 127, true);
            WriteLiteral("\r\n            </div>\r\n            <div class=\"col-sm-4\">\r\n                <label class=\"checkbox-inline\">\r\n                    ");
            EndContext();
            BeginContext(2564, 71, false);
#line 56 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_StandByUnits.cshtml"
               Write(Html.RadioButtonFor(model => model.IssueReturned, ReturnedType.Battery));

#line default
#line hidden
            EndContext();
            BeginContext(2635, 22, true);
            WriteLiteral("\r\n                    ");
            EndContext();
            BeginContext(2658, 73, false);
#line 57 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_StandByUnits.cshtml"
               Write(await _languageTranslator.TranslateAsync(LanguageKeys.Battery, langugeId));

#line default
#line hidden
            EndContext();
            BeginContext(2731, 97, true);
            WriteLiteral("\r\n                </label>\r\n                <label class=\"checkbox-inline\">\r\n                    ");
            EndContext();
            BeginContext(2829, 71, false);
#line 60 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_StandByUnits.cshtml"
               Write(Html.RadioButtonFor(model => model.IssueReturned, ReturnedType.Charger));

#line default
#line hidden
            EndContext();
            BeginContext(2900, 22, true);
            WriteLiteral("\r\n                    ");
            EndContext();
            BeginContext(2923, 73, false);
#line 61 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_StandByUnits.cshtml"
               Write(await _languageTranslator.TranslateAsync(LanguageKeys.Charger, langugeId));

#line default
#line hidden
            EndContext();
            BeginContext(2996, 97, true);
            WriteLiteral("\r\n                </label>\r\n                <label class=\"checkbox-inline\">\r\n                    ");
            EndContext();
            BeginContext(3094, 69, false);
#line 64 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_StandByUnits.cshtml"
               Write(Html.RadioButtonFor(model => model.IssueReturned, ReturnedType.Other));

#line default
#line hidden
            EndContext();
            BeginContext(3163, 22, true);
            WriteLiteral("\r\n                    ");
            EndContext();
            BeginContext(3186, 71, false);
#line 65 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_StandByUnits.cshtml"
               Write(await _languageTranslator.TranslateAsync(LanguageKeys.Other, langugeId));

#line default
#line hidden
            EndContext();
            BeginContext(3257, 209, true);
            WriteLiteral("\r\n                </label>\r\n            </div>\r\n        </div>\r\n        <div class=\"row row-space\">\r\n            <div class=\"col-sm-1\">\r\n            </div>\r\n            <div class=\"col-sm-4\">\r\n                ");
            EndContext();
            BeginContext(3467, 84, false);
#line 73 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_StandByUnits.cshtml"
           Write(Html.TextAreaFor(model => model.Remarks, new { @class = "form-control text-area", }));

#line default
#line hidden
            EndContext();
            BeginContext(3551, 56, true);
            WriteLiteral("\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>");
            EndContext();
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public Nerve.Web.Translation.ILanguageTranslator _languageTranslator { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<Nerve.Repository.Dtos.StandByUnitDto> Html { get; private set; }
    }
}
#pragma warning restore 1591
