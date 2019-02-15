#pragma checksum "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "f1d89bc7621e75e6a0ea5adea62bad03ed64a090"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Shared__Actions), @"mvc.1.0.view", @"/Views/Shared/_Actions.cshtml")]
[assembly:global::Microsoft.AspNetCore.Mvc.Razor.Compilation.RazorViewAttribute(@"/Views/Shared/_Actions.cshtml", typeof(AspNetCore.Views_Shared__Actions))]
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
#line 1 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
using Nerve.Repository;

#line default
#line hidden
#line 2 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
using Microsoft.AspNetCore.Http;

#line default
#line hidden
#line 3 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
using Nerve.Repository.Enums;

#line default
#line hidden
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"f1d89bc7621e75e6a0ea5adea62bad03ed64a090", @"/Views/Shared/_Actions.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"99594d08e9904441231da0f54667e41be0b4da55", @"/Views/_ViewImports.cshtml")]
    public class Views_Shared__Actions : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<PageActionBarModel>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#line 6 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
  

    var langugeId = (LanguageType)ViewContext.HttpContext.Session.GetInt32(WebConstants.SessionKeys.Language);
    var persianFont = ViewContext.HttpContext.Session.GetString(WebConstants.SessionKeys.PersianFont);
    var menus = Newtonsoft.Json.JsonConvert
            .DeserializeObject<List<UserMenuAccess>>(Context.Session.GetString(WebConstants.SessionKeys.UserMenus));

    var actionPermission = new UserMenuAccess();

    if (menus != null)
    {
        actionPermission = menus.SingleOrDefault(x => x.MenuId == Model.MenuId);
    }

    var translateItems = await _languageTranslator.TranslateManyAsync(new List<string>
{
LanguageKeys.Save,
LanguageKeys.Undo,
LanguageKeys.UndoMessage,
LanguageKeys.Delete,
LanguageKeys.Print,
LanguageKeys.Exit,
LanguageKeys.ExitConfirmation,
LanguageKeys.ExitConfirmationMessage,
LanguageKeys.Yes,
LanguageKeys.No
});

#line default
#line hidden
            BeginContext(1085, 2, true);
            WriteLiteral("\r\n");
            EndContext();
#line 35 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
 if (actionPermission != null)
{

#line default
#line hidden
            BeginContext(1122, 74, true);
            WriteLiteral("    <div class=\"bs-glyphicons\">\r\n        <ul class=\"bs-glyphicons-list\">\r\n");
            EndContext();
#line 39 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
             if (actionPermission.SaveOption == WebConstants.HasActionOptionAccess)
            {

#line default
#line hidden
            BeginContext(1296, 53, true);
            WriteLiteral("                <li>\r\n                    <a href=\"#\"");
            EndContext();
            BeginWriteAttribute("id", " id=\"", 1349, "\"", 1384, 2);
#line 42 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
WriteAttributeValue("", 1354, Model.ActionPrefix, 1354, 19, false);

#line default
#line hidden
            WriteAttributeValue("", 1373, "-save-click", 1373, 11, true);
            EndWriteAttribute();
            BeginContext(1385, 167, true);
            WriteLiteral(" >\r\n                        <span class=\"glyphicon glyphicon-floppy-disk\" aria-hidden=\"true\"></span> <span class=\"glyphicon-class\">\r\n                            <label");
            EndContext();
            BeginWriteAttribute("class", " class=\"", 1552, "\"", 1579, 2);
#line 44 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
WriteAttributeValue("", 1560, persianFont, 1560, 12, false);

#line default
#line hidden
            WriteAttributeValue(" ", 1572, "cursor", 1573, 7, true);
            EndWriteAttribute();
            BeginContext(1580, 1, true);
            WriteLiteral(">");
            EndContext();
            BeginContext(1582, 33, false);
#line 44 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
                                                          Write(translateItems[LanguageKeys.Save]);

#line default
#line hidden
            EndContext();
            BeginContext(1615, 92, true);
            WriteLiteral("</label>\r\n                        </span>\r\n                    </a>\r\n                </li>\r\n");
            EndContext();
#line 48 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
            }

#line default
#line hidden
            BeginContext(1722, 38, true);
            WriteLiteral("\r\n            <li>\r\n                <a");
            EndContext();
            BeginWriteAttribute("href", " href=\"", 1760, "\"", 1787, 1);
#line 51 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
WriteAttributeValue("", 1767, Model.UndoActionUrl, 1767, 20, false);

#line default
#line hidden
            EndWriteAttribute();
            BeginWriteAttribute("id", " id=\"", 1788, "\"", 1823, 2);
#line 51 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
WriteAttributeValue("", 1793, Model.ActionPrefix, 1793, 19, false);

#line default
#line hidden
            WriteAttributeValue("", 1812, "-undo-click", 1812, 11, true);
            EndWriteAttribute();
            BeginContext(1824, 153, true);
            WriteLiteral(">\r\n                    <span class=\"glyphicon glyphicon-repeat\" aria-hidden=\"true\"></span> <span class=\"glyphicon-class\">\r\n                        <label");
            EndContext();
            BeginWriteAttribute("class", " class=\"", 1977, "\"", 2004, 2);
#line 53 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
WriteAttributeValue("", 1985, persianFont, 1985, 12, false);

#line default
#line hidden
            WriteAttributeValue(" ", 1997, "cursor", 1998, 7, true);
            EndWriteAttribute();
            BeginContext(2005, 1, true);
            WriteLiteral(">");
            EndContext();
            BeginContext(2007, 33, false);
#line 53 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
                                                      Write(translateItems[LanguageKeys.Undo]);

#line default
#line hidden
            EndContext();
            BeginContext(2040, 82, true);
            WriteLiteral("</label>\r\n                    </span>\r\n                </a>\r\n            </li>\r\n\r\n");
            EndContext();
            BeginContext(2606, 2, true);
            WriteLiteral("\r\n");
            EndContext();
#line 67 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
             if (actionPermission.DeleteOption == Model.HasDeleteActionAccess)
            {

#line default
#line hidden
            BeginContext(2703, 53, true);
            WriteLiteral("                <li>\r\n                    <a href=\"#\"");
            EndContext();
            BeginWriteAttribute("id", " id=\"", 2756, "\"", 2793, 2);
#line 70 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
WriteAttributeValue("", 2761, Model.ActionPrefix, 2761, 19, false);

#line default
#line hidden
            WriteAttributeValue("", 2780, "-delete-click", 2780, 13, true);
            EndWriteAttribute();
            BeginContext(2794, 161, true);
            WriteLiteral(" >\r\n                        <span class=\"glyphicon glyphicon-trash\" aria-hidden=\"true\"></span> <span class=\"glyphicon-class\">\r\n                            <label");
            EndContext();
            BeginWriteAttribute("class", " class=\"", 2955, "\"", 2982, 2);
#line 72 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
WriteAttributeValue("", 2963, persianFont, 2963, 12, false);

#line default
#line hidden
            WriteAttributeValue(" ", 2975, "cursor", 2976, 7, true);
            EndWriteAttribute();
            BeginContext(2983, 1, true);
            WriteLiteral(">");
            EndContext();
            BeginContext(2985, 35, false);
#line 72 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
                                                          Write(translateItems[LanguageKeys.Delete]);

#line default
#line hidden
            EndContext();
            BeginContext(3020, 92, true);
            WriteLiteral("</label>\r\n                        </span>\r\n                    </a>\r\n                </li>\r\n");
            EndContext();
#line 76 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
            }

#line default
#line hidden
            BeginContext(3127, 2, true);
            WriteLiteral("\r\n");
            EndContext();
#line 78 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
             if (actionPermission.PrintOption == WebConstants.HasActionOptionAccess)
            {

#line default
#line hidden
            BeginContext(3230, 53, true);
            WriteLiteral("                <li>\r\n                    <a href=\"#\"");
            EndContext();
            BeginWriteAttribute("id", " id=\"", 3283, "\"", 3319, 2);
#line 81 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
WriteAttributeValue("", 3288, Model.ActionPrefix, 3288, 19, false);

#line default
#line hidden
            WriteAttributeValue("", 3307, "-print-click", 3307, 12, true);
            EndWriteAttribute();
            BeginContext(3320, 161, true);
            WriteLiteral(" >\r\n                        <span class=\"glyphicon glyphicon-print\" aria-hidden=\"true\"></span> <span class=\"glyphicon-class\">\r\n                            <label");
            EndContext();
            BeginWriteAttribute("class", " class=\"", 3481, "\"", 3508, 2);
#line 83 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
WriteAttributeValue("", 3489, persianFont, 3489, 12, false);

#line default
#line hidden
            WriteAttributeValue(" ", 3501, "cursor", 3502, 7, true);
            EndWriteAttribute();
            BeginContext(3509, 1, true);
            WriteLiteral(">");
            EndContext();
            BeginContext(3511, 34, false);
#line 83 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
                                                          Write(translateItems[LanguageKeys.Print]);

#line default
#line hidden
            EndContext();
            BeginContext(3545, 92, true);
            WriteLiteral("</label>\r\n                        </span>\r\n                    </a>\r\n                </li>\r\n");
            EndContext();
#line 87 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
            }

#line default
#line hidden
            BeginContext(3652, 211, true);
            WriteLiteral("            <li>\r\n                <a href=\"#\" id=\"exit-click\">\r\n                    <span class=\"glyphicon glyphicon-off\" aria-hidden=\"true\"></span> <span class=\"glyphicon-class\">\r\n                        <label");
            EndContext();
            BeginWriteAttribute("class", " class=\"", 3863, "\"", 3890, 2);
#line 91 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
WriteAttributeValue("", 3871, persianFont, 3871, 12, false);

#line default
#line hidden
            WriteAttributeValue(" ", 3883, "cursor", 3884, 7, true);
            EndWriteAttribute();
            BeginContext(3891, 1, true);
            WriteLiteral(">");
            EndContext();
            BeginContext(3893, 33, false);
#line 91 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
                                                      Write(translateItems[LanguageKeys.Exit]);

#line default
#line hidden
            EndContext();
            BeginContext(3926, 107, true);
            WriteLiteral("</label>\r\n                    </span>\r\n                </a>\r\n            </li>\r\n        </ul>\r\n    </div>\r\n");
            EndContext();
#line 97 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
}

#line default
#line hidden
            BeginContext(4036, 350, true);
            WriteLiteral(@"
<div class=""modal fade"" id=""exit-modal"" role=""dialog"">
    <div class=""modal-dialog modal-sm"">
        <div class=""modal-content"">
            <div class=""modal-header"">
                <button type=""button"" class=""close"" data-dismiss=""modal"">&times;</button>
                <span id=""exit-modal-title"" class=""modal-title model-title-header"">");
            EndContext();
            BeginContext(4387, 43, false);
#line 104 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
                                                                              Write(Html.Raw(translateItems[LanguageKeys.Exit]));

#line default
#line hidden
            EndContext();
            BeginContext(4430, 104, true);
            WriteLiteral("</span>\r\n            </div>\r\n            <div class=\"modal-body\" id=\"exit-modal-body\">\r\n                ");
            EndContext();
            BeginContext(4535, 62, false);
#line 107 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
           Write(Html.Raw(translateItems[LanguageKeys.ExitConfirmationMessage]));

#line default
#line hidden
            EndContext();
            BeginContext(4597, 145, true);
            WriteLiteral("\r\n            </div>\r\n            <div class=\"modal-footer\">\r\n                <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">");
            EndContext();
            BeginContext(4743, 41, false);
#line 110 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
                                                                              Write(Html.Raw(translateItems[LanguageKeys.No]));

#line default
#line hidden
            EndContext();
            BeginContext(4784, 95, true);
            WriteLiteral("</button>\r\n                <button type=\"button\" class=\"btn btn-primary\" id=\"exit-click-modal\">");
            EndContext();
            BeginContext(4880, 42, false);
#line 111 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
                                                                               Write(Html.Raw(translateItems[LanguageKeys.Yes]));

#line default
#line hidden
            EndContext();
            BeginContext(4922, 193, true);
            WriteLiteral("</button>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>\r\n\r\n<script>\r\n    $(document).ready(function () {\r\n        $(\"#exit-click\").on(\"click\", function () {\r\n            let title = \'");
            EndContext();
            BeginContext(5116, 43, false);
#line 120 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
                    Write(Html.Raw(translateItems[LanguageKeys.Exit]));

#line default
#line hidden
            EndContext();
            BeginContext(5159, 31, true);
            WriteLiteral("\';\r\n            let message = \'");
            EndContext();
            BeginContext(5191, 62, false);
#line 121 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
                      Write(Html.Raw(translateItems[LanguageKeys.ExitConfirmationMessage]));

#line default
#line hidden
            EndContext();
            BeginContext(5253, 69, true);
            WriteLiteral("\';\r\n            confirm(title, message);\r\n        });\r\n\r\n        $(\"#");
            EndContext();
            BeginContext(5323, 18, false);
#line 125 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
       Write(Model.ActionPrefix);

#line default
#line hidden
            EndContext();
            BeginContext(5341, 100, true);
            WriteLiteral("-undo-click\").on(\"click\", function (e) {\r\n            e.preventDefault();\r\n            let title = \'");
            EndContext();
            BeginContext(5442, 43, false);
#line 127 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
                    Write(Html.Raw(translateItems[LanguageKeys.Undo]));

#line default
#line hidden
            EndContext();
            BeginContext(5485, 31, true);
            WriteLiteral("\';\r\n            let message = \'");
            EndContext();
            BeginContext(5517, 50, false);
#line 128 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
                      Write(Html.Raw(translateItems[LanguageKeys.UndoMessage]));

#line default
#line hidden
            EndContext();
            BeginContext(5567, 188, true);
            WriteLiteral("\';\r\n            confirm(title, message);\r\n        });\r\n\r\n        $(\"#exit-click-modal\").click(function () {\r\n            let title = $(\"#exit-modal-title\").text();\r\n            let url = \'");
            EndContext();
            BeginContext(5756, 27, false);
#line 134 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
                  Write(Url.Action("Index", "Home"));

#line default
#line hidden
            EndContext();
            BeginContext(5783, 31, true);
            WriteLiteral("\';\r\n            if (title === \'");
            EndContext();
            BeginContext(5815, 43, false);
#line 135 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
                      Write(Html.Raw(translateItems[LanguageKeys.Undo]));

#line default
#line hidden
            EndContext();
            BeginContext(5858, 29, true);
            WriteLiteral("\') {\r\n                url = \'");
            EndContext();
            BeginContext(5888, 19, false);
#line 136 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
                  Write(Model.UndoActionUrl);

#line default
#line hidden
            EndContext();
            BeginContext(5907, 292, true);
            WriteLiteral(@"';
            }
            window.location.href = url;
        });

        function confirm(title, message) {
            $(""#exit-modal-title"").text(title);
            $(""#exit-modal-body"").text(message);
            $(""#exit-modal"").modal('show');
        }
    });
</script>");
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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<PageActionBarModel> Html { get; private set; }
    }
}
#pragma warning restore 1591
