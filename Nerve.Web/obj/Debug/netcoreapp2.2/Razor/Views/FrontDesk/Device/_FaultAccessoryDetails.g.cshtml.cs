#pragma checksum "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_FaultAccessoryDetails.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "171831732f3dfa57de7c04d3c6b1f4f4000c3ef1"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_FrontDesk_Device__FaultAccessoryDetails), @"mvc.1.0.razor-page", @"/Views/FrontDesk/Device/_FaultAccessoryDetails.cshtml")]
[assembly:global::Microsoft.AspNetCore.Mvc.RazorPages.Infrastructure.RazorPageAttribute(@"/Views/FrontDesk/Device/_FaultAccessoryDetails.cshtml", typeof(AspNetCore.Views_FrontDesk_Device__FaultAccessoryDetails), null)]
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
#line 3 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_FaultAccessoryDetails.cshtml"
using Microsoft.AspNetCore.Http;

#line default
#line hidden
#line 4 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_FaultAccessoryDetails.cshtml"
using Nerve.Repository.Enums;

#line default
#line hidden
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"171831732f3dfa57de7c04d3c6b1f4f4000c3ef1", @"/Views/FrontDesk/Device/_FaultAccessoryDetails.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"99594d08e9904441231da0f54667e41be0b4da55", @"/Views/_ViewImports.cshtml")]
    public class Views_FrontDesk_Device__FaultAccessoryDetails : global::Microsoft.AspNetCore.Mvc.RazorPages.Page
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            BeginContext(191, 2, true);
            WriteLiteral("\r\n");
            EndContext();
#line 7 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_FaultAccessoryDetails.cshtml"
  
    var languageId = (LanguageType)ViewContext.HttpContext.Session.GetInt32(WebConstants.SessionKeys.Language);
    var persianFont = ViewContext.HttpContext.Session.GetString(WebConstants.SessionKeys.PersianFont);

    var translateItems = await _languageTranslator.TranslateManyAsync(new List<string>
    {
        LanguageKeys.FaultCode,
        LanguageKeys.FaultDetails,
        LanguageKeys.Remarks,
        LanguageKeys.Accessories
    }, languageId);

#line default
#line hidden
            BeginContext(669, 268, true);
            WriteLiteral(@"
<div class=""panel panel-default top-margin-10"">
    <div class=""panel-body"">
        <div class=""row"">
            <div class=""col-sm-4"">
                <div class=""row row-space"">
                    <div class=""col-sm-4 text-right"">
                        ");
            EndContext();
            BeginContext(938, 38, false);
#line 26 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_FaultAccessoryDetails.cshtml"
                   Write(translateItems[LanguageKeys.FaultCode]);

#line default
#line hidden
            EndContext();
            BeginContext(976, 98, true);
            WriteLiteral("\r\n                    </div>\r\n                    <div class=\"col-sm-8\">\r\n                        ");
            EndContext();
            BeginContext(1075, 75, false);
#line 29 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_FaultAccessoryDetails.cshtml"
                   Write(Html.TextBoxFor(model => model.FaultCode, new { @class = "form-control", }));

#line default
#line hidden
            EndContext();
            BeginContext(1150, 293, true);
            WriteLiteral(@"
                        <span class=""glyphicon glyphicon-search cursor form-control-feedback btn-primary""></span>
                    </div>
                </div>
                <div class=""row row-space"">
                    <div class=""col-sm-4 text-right"">
                        ");
            EndContext();
            BeginContext(1444, 41, false);
#line 35 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_FaultAccessoryDetails.cshtml"
                   Write(translateItems[LanguageKeys.FaultDetails]);

#line default
#line hidden
            EndContext();
            BeginContext(1485, 98, true);
            WriteLiteral("\r\n                    </div>\r\n                    <div class=\"col-sm-8\">\r\n                        ");
            EndContext();
            BeginContext(1584, 88, false);
#line 38 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_FaultAccessoryDetails.cshtml"
                   Write(Html.TextAreaFor(model => model.FaultDetail, new { @class = "form-control text-area", }));

#line default
#line hidden
            EndContext();
            BeginContext(1672, 178, true);
            WriteLiteral("\r\n                    </div>\r\n                </div>\r\n                <div class=\"row row-space\">\r\n                    <div class=\"col-sm-4 text-right\">\r\n                        ");
            EndContext();
            BeginContext(1851, 36, false);
#line 43 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_FaultAccessoryDetails.cshtml"
                   Write(translateItems[LanguageKeys.Remarks]);

#line default
#line hidden
            EndContext();
            BeginContext(1887, 98, true);
            WriteLiteral("\r\n                    </div>\r\n                    <div class=\"col-sm-8\">\r\n                        ");
            EndContext();
            BeginContext(1986, 84, false);
#line 46 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_FaultAccessoryDetails.cshtml"
                   Write(Html.TextAreaFor(model => model.Remarks, new { @class = "form-control text-area", }));

#line default
#line hidden
            EndContext();
            BeginContext(2070, 126, true);
            WriteLiteral("\r\n                    </div>\r\n                </div>\r\n            </div>\r\n            <div class=\"col-sm-8\">\r\n                ");
            EndContext();
            BeginContext(2197, 40, false);
#line 51 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\_FaultAccessoryDetails.cshtml"
           Write(translateItems[LanguageKeys.Accessories]);

#line default
#line hidden
            EndContext();
            BeginContext(2237, 2013, true);
            WriteLiteral(@"
                <table class=""table"">
                    <thead class=""thead-dark"">
                        <tr>
                            <th scope=""col"">#</th>
                            <th scope=""col"">First</th>
                            <th scope=""col"">Last</th>
                            <th scope=""col"">Handle</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope=""row"">1</th>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>mdo</td>
                        </tr>
                        <tr>
                            <th scope=""row"">2</th>
                            <td>Jacob</td>
                            <td>Thornton</td>
                            <td>fat</td>
                        </tr>
                        <tr>
                            <th scope=""row"">3</th>
                          ");
            WriteLiteral(@"  <td>Larry</td>
                            <td>the Bird</td>
                            <td>twitter</td>
                        </tr>
                        <tr>
                            <th scope=""row"">1</th>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>mdo</td>
                        </tr>
                        <tr>
                            <th scope=""row"">2</th>
                            <td>Jacob</td>
                            <td>Thornton</td>
                            <td>fat</td>
                        </tr>
                        <tr>
                            <th scope=""row"">3</th>
                            <td>Larry</td>
                            <td>the Bird</td>
                            <td>twitter</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>");
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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<Nerve.Repository.Dtos.FaultAccessoryDto> Html { get; private set; }
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.ViewDataDictionary<Nerve.Repository.Dtos.FaultAccessoryDto> ViewData => (global::Microsoft.AspNetCore.Mvc.ViewFeatures.ViewDataDictionary<Nerve.Repository.Dtos.FaultAccessoryDto>)PageContext?.ViewData;
        public Nerve.Repository.Dtos.FaultAccessoryDto Model => ViewData.Model;
    }
}
#pragma warning restore 1591
