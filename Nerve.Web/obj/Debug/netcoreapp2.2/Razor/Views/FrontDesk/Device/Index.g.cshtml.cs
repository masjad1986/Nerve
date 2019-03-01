#pragma checksum "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\Index.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "e9a53148ce2156130c044b2a960a2c5976e75547"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_FrontDesk_Device_Index), @"mvc.1.0.view", @"/Views/FrontDesk/Device/Index.cshtml")]
[assembly:global::Microsoft.AspNetCore.Mvc.Razor.Compilation.RazorViewAttribute(@"/Views/FrontDesk/Device/Index.cshtml", typeof(AspNetCore.Views_FrontDesk_Device_Index))]
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
#line 2 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\Index.cshtml"
using Microsoft.AspNetCore.Http;

#line default
#line hidden
#line 3 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\Index.cshtml"
using Nerve.Common;

#line default
#line hidden
#line 4 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\Index.cshtml"
using Nerve.Common.Enums;

#line default
#line hidden
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"e9a53148ce2156130c044b2a960a2c5976e75547", @"/Views/FrontDesk/Device/Index.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"0b4ad927f8ad8b4c65681b12622429f55ec7cd77", @"/Views/_ViewImports.cshtml")]
    public class Views_FrontDesk_Device_Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<Nerve.Web.ViewModels.DeviceViewModel>
    {
        #line hidden
        #pragma warning disable 0169
        private string __tagHelperStringValueBuffer;
        #pragma warning restore 0169
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext __tagHelperExecutionContext;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner __tagHelperRunner = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner();
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __backed__tagHelperScopeManager = null;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __tagHelperScopeManager
        {
            get
            {
                if (__backed__tagHelperScopeManager == null)
                {
                    __backed__tagHelperScopeManager = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager(StartTagHelperWritingScope, EndTagHelperWritingScope);
                }
                return __backed__tagHelperScopeManager;
            }
        }
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.PartialTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_PartialTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            BeginContext(202, 2, true);
            WriteLiteral("\r\n");
            EndContext();
#line 7 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\Index.cshtml"
  
    ViewData["Title"] = WebConstants.PageTitle.DeviceLogin;
    var langugeId = (LanguageType)Context.Session.GetInt32(WebConstants.SessionKeys.Language);
    var persianFont = Context.Session.GetString(WebConstants.SessionKeys.PersianFont);
    var resourceKeys = new List<string>
{
LanguageKeys.Brand,
LanguageKeys.CollectionPoint,
LanguageKeys.Confirm,
LanguageKeys.ConfirmDeviceFields,
LanguageKeys.ImeiNumber,
LanguageKeys.Model,
LanguageKeys.No,
LanguageKeys.ServiceCentre,
LanguageKeys.Yes,
LanguageKeys.ValidationFailureSummary
};

    var translateItems = await _languageTranslator.TranslateManyAsync(resourceKeys); //pass languageId if persian translation required.

#line default
#line hidden
            BeginContext(905, 36, true);
            WriteLiteral("\r\n<div class=\"main-container\">\r\n    ");
            EndContext();
            BeginContext(941, 91, false);
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("partial", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.SelfClosing, "e9a53148ce2156130c044b2a960a2c5976e755474440", async() => {
            }
            );
            __Microsoft_AspNetCore_Mvc_TagHelpers_PartialTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.PartialTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_PartialTagHelper);
            BeginWriteTagHelperAttribute();
#line 29 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\Index.cshtml"
       WriteLiteral(WebConstants.ViewPage.Partial.Actions);

#line default
#line hidden
            __tagHelperStringValueBuffer = EndWriteTagHelperAttribute();
            __Microsoft_AspNetCore_Mvc_TagHelpers_PartialTagHelper.Name = __tagHelperStringValueBuffer;
            __tagHelperExecutionContext.AddTagHelperAttribute("name", __Microsoft_AspNetCore_Mvc_TagHelpers_PartialTagHelper.Name, global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
#line 29 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\Index.cshtml"
__Microsoft_AspNetCore_Mvc_TagHelpers_PartialTagHelper.Model = Model.PageActionBarModel;

#line default
#line hidden
            __tagHelperExecutionContext.AddTagHelperAttribute("model", __Microsoft_AspNetCore_Mvc_TagHelpers_PartialTagHelper.Model, global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            EndContext();
            BeginContext(1032, 58, true);
            WriteLiteral("\r\n</div>\r\n<div id=\"device-login\" class=\"main-container\">\r\n");
            EndContext();
            BeginContext(2181, 98, true);
            WriteLiteral("    <div class=\"tab-content clearfix\">\r\n        <div class=\"tab-pane active\" id=\"login-details\">\r\n");
            EndContext();
#line 51 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\Index.cshtml"
              
                Html.RenderPartial(WebConstants.ViewPage.Partial.DeviceLoginDetails, Model);
            

#line default
#line hidden
            BeginContext(2404, 16, true);
            WriteLiteral("        </div>\r\n");
            EndContext();
            BeginContext(3322, 347, true);
            WriteLiteral(@"    </div>
</div>
<div class=""modal fade"" id=""device-confirm-modal"" role=""dialog"">
    <div class=""modal-dialog"">
        <div class=""modal-content"">
            <div class=""modal-header"">
                <button type=""button"" class=""close"" data-dismiss=""modal"">&times;</button>
                <span class=""modal-title model-title-header"">");
            EndContext();
            BeginContext(3670, 46, false);
#line 82 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\Index.cshtml"
                                                        Write(Html.Raw(translateItems[LanguageKeys.Confirm]));

#line default
#line hidden
            EndContext();
            BeginContext(3716, 88, true);
            WriteLiteral("</span>\r\n            </div>\r\n            <div class=\"modal-body\">\r\n                <div>");
            EndContext();
            BeginContext(3805, 58, false);
#line 85 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\Index.cshtml"
                Write(Html.Raw(translateItems[LanguageKeys.ConfirmDeviceFields]));

#line default
#line hidden
            EndContext();
            BeginContext(3863, 232, true);
            WriteLiteral("</div>\r\n                <br />\r\n                <div id=\"device-confirm-summary\"></div>\r\n            </div>\r\n            <div class=\"modal-footer\">\r\n                <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">");
            EndContext();
            BeginContext(4096, 41, false);
#line 90 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\Index.cshtml"
                                                                              Write(Html.Raw(translateItems[LanguageKeys.No]));

#line default
#line hidden
            EndContext();
            BeginContext(4137, 103, true);
            WriteLiteral("</button>\r\n                <button type=\"button\" class=\"btn btn-primary\" id=\"device-confirm-modal-yes\">");
            EndContext();
            BeginContext(4241, 42, false);
#line 91 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\Index.cshtml"
                                                                                       Write(Html.Raw(translateItems[LanguageKeys.Yes]));

#line default
#line hidden
            EndContext();
            BeginContext(4283, 67, true);
            WriteLiteral("</button>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>\r\n");
            EndContext();
            BeginContext(4350, 130, false);
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("partial", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.SelfClosing, "e9a53148ce2156130c044b2a960a2c5976e755479747", async() => {
            }
            );
            __Microsoft_AspNetCore_Mvc_TagHelpers_PartialTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.PartialTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_PartialTagHelper);
            BeginWriteTagHelperAttribute();
#line 96 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\Index.cshtml"
   WriteLiteral(WebConstants.ViewPage.Partial.ValidationSummary);

#line default
#line hidden
            __tagHelperStringValueBuffer = EndWriteTagHelperAttribute();
            __Microsoft_AspNetCore_Mvc_TagHelpers_PartialTagHelper.Name = __tagHelperStringValueBuffer;
            __tagHelperExecutionContext.AddTagHelperAttribute("name", __Microsoft_AspNetCore_Mvc_TagHelpers_PartialTagHelper.Name, global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
#line 96 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\FrontDesk\Device\Index.cshtml"
__Microsoft_AspNetCore_Mvc_TagHelpers_PartialTagHelper.Model = translateItems[LanguageKeys.ValidationFailureSummary];

#line default
#line hidden
            __tagHelperExecutionContext.AddTagHelperAttribute("model", __Microsoft_AspNetCore_Mvc_TagHelpers_PartialTagHelper.Model, global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<Nerve.Web.ViewModels.DeviceViewModel> Html { get; private set; }
    }
}
#pragma warning restore 1591
