#pragma checksum "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_menus.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "b49dfe261fe4c98e98d1a4e43738103516b2d3d4"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Shared__menus), @"mvc.1.0.view", @"/Views/Shared/_menus.cshtml")]
[assembly:global::Microsoft.AspNetCore.Mvc.Razor.Compilation.RazorViewAttribute(@"/Views/Shared/_menus.cshtml", typeof(AspNetCore.Views_Shared__menus))]
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
#line 2 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_menus.cshtml"
using Microsoft.AspNetCore.Http;

#line default
#line hidden
#line 3 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_menus.cshtml"
using Nerve.Common;

#line default
#line hidden
#line 4 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_menus.cshtml"
using Nerve.Common.Enums;

#line default
#line hidden
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"b49dfe261fe4c98e98d1a4e43738103516b2d3d4", @"/Views/Shared/_menus.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"99594d08e9904441231da0f54667e41be0b4da55", @"/Views/_ViewImports.cshtml")]
    public class Views_Shared__menus : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<Nerve.Web.ViewModels.MenuViewModel>
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("asp-action", "Index", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_1 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("asp-controller", "Home", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_2 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("asp-action", "Logout", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_3 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("asp-controller", "Users", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
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
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            BeginContext(200, 2, true);
            WriteLiteral("\r\n");
            EndContext();
#line 7 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_menus.cshtml"
   
    var persianFont = Context.Session.GetString(WebConstants.SessionKeys.PersianFont);

#line default
#line hidden
            BeginContext(298, 145, true);
            WriteLiteral("\r\n<nav class=\"navbar navbar-inverse\">\r\n    <div class=\"container-fluid\">\r\n        <ul class=\"nav navbar-nav\">\r\n            <li>\r\n                ");
            EndContext();
            BeginContext(443, 244, false);
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("a", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "b49dfe261fe4c98e98d1a4e43738103516b2d3d45184", async() => {
                BeginContext(508, 22, true);
                WriteLiteral("\r\n                    ");
                EndContext();
                BeginContext(531, 134, false);
#line 16 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_menus.cshtml"
               Write(await _languageTranslator.TranslateAsync(LanguageKeys.Home, (LanguageType)Context.Session.GetInt32(WebConstants.SessionKeys.Language)));

#line default
#line hidden
                EndContext();
                BeginContext(665, 18, true);
                WriteLiteral("\r\n                ");
                EndContext();
            }
            );
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper);
            BeginAddHtmlAttributeValues(__tagHelperExecutionContext, "class", 1, global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
#line 15 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_menus.cshtml"
AddHtmlAttributeValue("", 453, persianFont, 453, 12, false);

#line default
#line hidden
            EndAddHtmlAttributeValues(__tagHelperExecutionContext);
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.Action = (string)__tagHelperAttribute_0.Value;
            __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_0);
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.Controller = (string)__tagHelperAttribute_1.Value;
            __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_1);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            EndContext();
            BeginContext(687, 21, true);
            WriteLiteral("\r\n            </li>\r\n");
            EndContext();
#line 19 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_menus.cshtml"
             if (Model != null)
            {
                var parents = Model.Menus.Where(x => x.ParentMenuId == 0).OrderBy(x => x.OrderBy).ToList();
                

#line default
#line hidden
#line 22 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_menus.cshtml"
                 foreach (var parent in parents)
                {

#line default
#line hidden
            BeginContext(934, 69, true);
            WriteLiteral("                    <li class=\"dropdown\">\r\n                        <a");
            EndContext();
            BeginWriteAttribute("class", " class=\"", 1003, "\"", 1039, 2);
            WriteAttributeValue("", 1011, "dropdown-toggle", 1011, 15, true);
#line 25 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_menus.cshtml"
WriteAttributeValue(" ", 1026, persianFont, 1027, 12, false);

#line default
#line hidden
            EndWriteAttribute();
            BeginContext(1040, 63, true);
            WriteLiteral(" data-toggle=\"dropdown\" href=\"#\">\r\n                            ");
            EndContext();
            BeginContext(1104, 136, false);
#line 26 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_menus.cshtml"
                       Write(await _languageTranslator.TranslateAsync(@parent.LanguageKey, (LanguageType)Context.Session.GetInt32(WebConstants.SessionKeys.Language)));

#line default
#line hidden
            EndContext();
            BeginContext(1240, 61, true);
            WriteLiteral("  <span class=\"caret\"></span>\r\n                        </a>\r\n");
            EndContext();
#line 28 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_menus.cshtml"
                          var childs = @Model.Menus.Where(x => x.ParentMenuId == parent.MenuId).OrderBy(x => x.MenuName).ToList();
                            if (childs.Any())
                            {

#line default
#line hidden
            BeginContext(1511, 60, true);
            WriteLiteral("                                <ul class=\"dropdown-menu\">\r\n");
            EndContext();
#line 32 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_menus.cshtml"
                                     foreach (var child in childs)
                                    {

#line default
#line hidden
            BeginContext(1678, 82, true);
            WriteLiteral("                                        <li class=\"menu-link-click\" data-content=\"");
            EndContext();
            BeginContext(1761, 51, false);
#line 34 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_menus.cshtml"
                                                                             Write(Newtonsoft.Json.JsonConvert.SerializeObject(parent));

#line default
#line hidden
            EndContext();
            BeginContext(1812, 50, true);
            WriteLiteral("\">\r\n                                            <a");
            EndContext();
            BeginWriteAttribute("class", " class=\"", 1862, "\"", 1882, 1);
#line 35 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_menus.cshtml"
WriteAttributeValue("", 1870, persianFont, 1870, 12, false);

#line default
#line hidden
            EndWriteAttribute();
            BeginWriteAttribute("href", " href=\"", 1883, "\"", 1922, 3);
#line 35 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_menus.cshtml"
WriteAttributeValue("", 1890, child.MenuLink, 1890, 15, false);

#line default
#line hidden
            WriteAttributeValue("", 1905, "?id=", 1905, 4, true);
#line 35 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_menus.cshtml"
WriteAttributeValue("", 1909, child.MenuId, 1909, 13, false);

#line default
#line hidden
            EndWriteAttribute();
            BeginContext(1923, 51, true);
            WriteLiteral(">\r\n                                                ");
            EndContext();
            BeginContext(1975, 135, false);
#line 36 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_menus.cshtml"
                                           Write(await _languageTranslator.TranslateAsync(@child.LanguageKey, (LanguageType)Context.Session.GetInt32(WebConstants.SessionKeys.Language)));

#line default
#line hidden
            EndContext();
            BeginContext(2110, 99, true);
            WriteLiteral("\r\n                                            </a>\r\n                                        </li>\r\n");
            EndContext();
#line 39 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_menus.cshtml"
                                    }

#line default
#line hidden
            BeginContext(2248, 39, true);
            WriteLiteral("                                </ul>\r\n");
            EndContext();
#line 41 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_menus.cshtml"
                            }
                        

#line default
#line hidden
            BeginContext(2345, 27, true);
            WriteLiteral("                    </li>\r\n");
            EndContext();
#line 44 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_menus.cshtml"
                }

#line default
#line hidden
#line 44 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_menus.cshtml"
                 
            }

#line default
#line hidden
            BeginContext(2406, 140, true);
            WriteLiteral("        </ul>\r\n        <ul class=\"nav navbar-nav navbar-right\">\r\n            <li><a href=\"#\"><span class=\"glyphicon glyphicon-user\"></span> ");
            EndContext();
            BeginContext(2547, 60, false);
#line 48 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_menus.cshtml"
                                                                      Write(Context.Session.GetString(WebConstants.SessionKeys.UserName));

#line default
#line hidden
            EndContext();
            BeginContext(2607, 27, true);
            WriteLiteral("</a></li>\r\n            <li>");
            EndContext();
            BeginContext(2634, 250, false);
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("a", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "b49dfe261fe4c98e98d1a4e43738103516b2d3d413661", async() => {
                BeginContext(2680, 5, true);
                WriteLiteral("<span");
                EndContext();
                BeginWriteAttribute("class", " class=\"", 2685, "\"", 2733, 3);
                WriteAttributeValue("", 2693, "glyphicon", 2693, 9, true);
                WriteAttributeValue(" ", 2702, "glyphicon-log-out", 2703, 18, true);
#line 49 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_menus.cshtml"
WriteAttributeValue(" ", 2720, persianFont, 2721, 12, false);

#line default
#line hidden
                EndWriteAttribute();
                BeginContext(2734, 9, true);
                WriteLiteral("></span> ");
                EndContext();
                BeginContext(2744, 136, false);
#line 49 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_menus.cshtml"
                                                                                                                        Write(await _languageTranslator.TranslateAsync(LanguageKeys.Logout, (LanguageType)Context.Session.GetInt32(WebConstants.SessionKeys.Language)));

#line default
#line hidden
                EndContext();
            }
            );
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper);
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.Action = (string)__tagHelperAttribute_2.Value;
            __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_2);
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.Controller = (string)__tagHelperAttribute_3.Value;
            __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_3);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            EndContext();
            BeginContext(2884, 682, true);
            WriteLiteral(@"</li>
        </ul>
    </div>
</nav>
<script>
    $(document).ready(function () {
        let item = $(this).attr('data-content');
        if (item) {
            let menu = JSON.parse(item);
            let parentMenu = menu.MenuName;
            let parentMenuUrl = menu.MenuLink;
            let currentMenu = $(this).children(""a"").first().text();
            $(""#bread-crumb-list"").empty();
            $(""#bread-crumb-list"").append(`<li class=""breadcrumb-item""><a href=""${parentMenuUrl}"">${parentMenu}</a></li>
                                       <li class=""breadcrumb-item active"" aria-current=""page"">${currentMenu}</li>`);
        }
    });
</script>

");
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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<Nerve.Web.ViewModels.MenuViewModel> Html { get; private set; }
    }
}
#pragma warning restore 1591
