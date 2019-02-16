#pragma checksum "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "5a7db5eae534b7ddc2348f4c457dd69517459a54"
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
using Nerve.Common;

#line default
#line hidden
#line 4 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
using Nerve.Common.Enums;

#line default
#line hidden
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"5a7db5eae534b7ddc2348f4c457dd69517459a54", @"/Views/Shared/_Actions.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"99594d08e9904441231da0f54667e41be0b4da55", @"/Views/_ViewImports.cshtml")]
    public class Views_Shared__Actions : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<PageActionBarModel>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#line 7 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
  

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
            BeginContext(1106, 2, true);
            WriteLiteral("\r\n");
            EndContext();
#line 36 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
 if (actionPermission != null)
{

#line default
#line hidden
            BeginContext(1143, 74, true);
            WriteLiteral("    <div class=\"bs-glyphicons\">\r\n        <ul class=\"bs-glyphicons-list\">\r\n");
            EndContext();
#line 40 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
             if (actionPermission.SaveOption == WebConstants.HasActionOptionAccess)
            {

#line default
#line hidden
            BeginContext(1317, 53, true);
            WriteLiteral("                <li>\r\n                    <a href=\"#\"");
            EndContext();
            BeginWriteAttribute("id", " id=\"", 1370, "\"", 1405, 2);
#line 43 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
WriteAttributeValue("", 1375, Model.ActionPrefix, 1375, 19, false);

#line default
#line hidden
            WriteAttributeValue("", 1394, "-save-click", 1394, 11, true);
            EndWriteAttribute();
            BeginContext(1406, 166, true);
            WriteLiteral(">\r\n                        <span class=\"glyphicon glyphicon-floppy-disk\" aria-hidden=\"true\"></span> <span class=\"glyphicon-class\">\r\n                            <label");
            EndContext();
            BeginWriteAttribute("class", " class=\"", 1572, "\"", 1599, 2);
#line 45 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
WriteAttributeValue("", 1580, persianFont, 1580, 12, false);

#line default
#line hidden
            WriteAttributeValue(" ", 1592, "cursor", 1593, 7, true);
            EndWriteAttribute();
            BeginContext(1600, 1, true);
            WriteLiteral(">");
            EndContext();
            BeginContext(1602, 33, false);
#line 45 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
                                                          Write(translateItems[LanguageKeys.Save]);

#line default
#line hidden
            EndContext();
            BeginContext(1635, 92, true);
            WriteLiteral("</label>\r\n                        </span>\r\n                    </a>\r\n                </li>\r\n");
            EndContext();
#line 49 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
            }

#line default
#line hidden
            BeginContext(1742, 38, true);
            WriteLiteral("\r\n            <li>\r\n                <a");
            EndContext();
            BeginWriteAttribute("href", " href=\"", 1780, "\"", 1807, 1);
#line 52 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
WriteAttributeValue("", 1787, Model.UndoActionUrl, 1787, 20, false);

#line default
#line hidden
            EndWriteAttribute();
            BeginWriteAttribute("id", " id=\"", 1808, "\"", 1843, 2);
#line 52 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
WriteAttributeValue("", 1813, Model.ActionPrefix, 1813, 19, false);

#line default
#line hidden
            WriteAttributeValue("", 1832, "-undo-click", 1832, 11, true);
            EndWriteAttribute();
            BeginContext(1844, 153, true);
            WriteLiteral(">\r\n                    <span class=\"glyphicon glyphicon-repeat\" aria-hidden=\"true\"></span> <span class=\"glyphicon-class\">\r\n                        <label");
            EndContext();
            BeginWriteAttribute("class", " class=\"", 1997, "\"", 2024, 2);
#line 54 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
WriteAttributeValue("", 2005, persianFont, 2005, 12, false);

#line default
#line hidden
            WriteAttributeValue(" ", 2017, "cursor", 2018, 7, true);
            EndWriteAttribute();
            BeginContext(2025, 1, true);
            WriteLiteral(">");
            EndContext();
            BeginContext(2027, 33, false);
#line 54 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
                                                      Write(translateItems[LanguageKeys.Undo]);

#line default
#line hidden
            EndContext();
            BeginContext(2060, 82, true);
            WriteLiteral("</label>\r\n                    </span>\r\n                </a>\r\n            </li>\r\n\r\n");
            EndContext();
            BeginContext(2626, 2, true);
            WriteLiteral("\r\n");
            EndContext();
#line 68 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
             if (actionPermission.DeleteOption == Model.HasDeleteActionAccess)
            {

#line default
#line hidden
            BeginContext(2723, 53, true);
            WriteLiteral("                <li>\r\n                    <a href=\"#\"");
            EndContext();
            BeginWriteAttribute("id", " id=\"", 2776, "\"", 2813, 2);
#line 71 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
WriteAttributeValue("", 2781, Model.ActionPrefix, 2781, 19, false);

#line default
#line hidden
            WriteAttributeValue("", 2800, "-delete-click", 2800, 13, true);
            EndWriteAttribute();
            BeginContext(2814, 160, true);
            WriteLiteral(">\r\n                        <span class=\"glyphicon glyphicon-trash\" aria-hidden=\"true\"></span> <span class=\"glyphicon-class\">\r\n                            <label");
            EndContext();
            BeginWriteAttribute("class", " class=\"", 2974, "\"", 3001, 2);
#line 73 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
WriteAttributeValue("", 2982, persianFont, 2982, 12, false);

#line default
#line hidden
            WriteAttributeValue(" ", 2994, "cursor", 2995, 7, true);
            EndWriteAttribute();
            BeginContext(3002, 1, true);
            WriteLiteral(">");
            EndContext();
            BeginContext(3004, 35, false);
#line 73 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
                                                          Write(translateItems[LanguageKeys.Delete]);

#line default
#line hidden
            EndContext();
            BeginContext(3039, 92, true);
            WriteLiteral("</label>\r\n                        </span>\r\n                    </a>\r\n                </li>\r\n");
            EndContext();
#line 77 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
            }

#line default
#line hidden
            BeginContext(3146, 2, true);
            WriteLiteral("\r\n");
            EndContext();
#line 79 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
             if (actionPermission.PrintOption == WebConstants.HasActionOptionAccess)
            {

#line default
#line hidden
            BeginContext(3249, 53, true);
            WriteLiteral("                <li>\r\n                    <a href=\"#\"");
            EndContext();
            BeginWriteAttribute("id", " id=\"", 3302, "\"", 3338, 2);
#line 82 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
WriteAttributeValue("", 3307, Model.ActionPrefix, 3307, 19, false);

#line default
#line hidden
            WriteAttributeValue("", 3326, "-print-click", 3326, 12, true);
            EndWriteAttribute();
            BeginContext(3339, 160, true);
            WriteLiteral(">\r\n                        <span class=\"glyphicon glyphicon-print\" aria-hidden=\"true\"></span> <span class=\"glyphicon-class\">\r\n                            <label");
            EndContext();
            BeginWriteAttribute("class", " class=\"", 3499, "\"", 3526, 2);
#line 84 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
WriteAttributeValue("", 3507, persianFont, 3507, 12, false);

#line default
#line hidden
            WriteAttributeValue(" ", 3519, "cursor", 3520, 7, true);
            EndWriteAttribute();
            BeginContext(3527, 1, true);
            WriteLiteral(">");
            EndContext();
            BeginContext(3529, 34, false);
#line 84 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
                                                          Write(translateItems[LanguageKeys.Print]);

#line default
#line hidden
            EndContext();
            BeginContext(3563, 92, true);
            WriteLiteral("</label>\r\n                        </span>\r\n                    </a>\r\n                </li>\r\n");
            EndContext();
#line 88 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
            }

#line default
#line hidden
            BeginContext(3670, 211, true);
            WriteLiteral("            <li>\r\n                <a href=\"#\" id=\"exit-click\">\r\n                    <span class=\"glyphicon glyphicon-off\" aria-hidden=\"true\"></span> <span class=\"glyphicon-class\">\r\n                        <label");
            EndContext();
            BeginWriteAttribute("class", " class=\"", 3881, "\"", 3908, 2);
#line 92 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
WriteAttributeValue("", 3889, persianFont, 3889, 12, false);

#line default
#line hidden
            WriteAttributeValue(" ", 3901, "cursor", 3902, 7, true);
            EndWriteAttribute();
            BeginContext(3909, 1, true);
            WriteLiteral(">");
            EndContext();
            BeginContext(3911, 33, false);
#line 92 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
                                                      Write(translateItems[LanguageKeys.Exit]);

#line default
#line hidden
            EndContext();
            BeginContext(3944, 107, true);
            WriteLiteral("</label>\r\n                    </span>\r\n                </a>\r\n            </li>\r\n        </ul>\r\n    </div>\r\n");
            EndContext();
#line 98 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
}

#line default
#line hidden
            BeginContext(4054, 350, true);
            WriteLiteral(@"
<div class=""modal fade"" id=""exit-modal"" role=""dialog"">
    <div class=""modal-dialog modal-sm"">
        <div class=""modal-content"">
            <div class=""modal-header"">
                <button type=""button"" class=""close"" data-dismiss=""modal"">&times;</button>
                <span id=""exit-modal-title"" class=""modal-title model-title-header"">");
            EndContext();
            BeginContext(4405, 43, false);
#line 105 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
                                                                              Write(Html.Raw(translateItems[LanguageKeys.Exit]));

#line default
#line hidden
            EndContext();
            BeginContext(4448, 104, true);
            WriteLiteral("</span>\r\n            </div>\r\n            <div class=\"modal-body\" id=\"exit-modal-body\">\r\n                ");
            EndContext();
            BeginContext(4553, 62, false);
#line 108 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
           Write(Html.Raw(translateItems[LanguageKeys.ExitConfirmationMessage]));

#line default
#line hidden
            EndContext();
            BeginContext(4615, 145, true);
            WriteLiteral("\r\n            </div>\r\n            <div class=\"modal-footer\">\r\n                <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">");
            EndContext();
            BeginContext(4761, 41, false);
#line 111 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
                                                                              Write(Html.Raw(translateItems[LanguageKeys.No]));

#line default
#line hidden
            EndContext();
            BeginContext(4802, 95, true);
            WriteLiteral("</button>\r\n                <button type=\"button\" class=\"btn btn-primary\" id=\"exit-click-modal\">");
            EndContext();
            BeginContext(4898, 42, false);
#line 112 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
                                                                               Write(Html.Raw(translateItems[LanguageKeys.Yes]));

#line default
#line hidden
            EndContext();
            BeginContext(4940, 193, true);
            WriteLiteral("</button>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>\r\n\r\n<script>\r\n    $(document).ready(function () {\r\n        $(\"#exit-click\").on(\"click\", function () {\r\n            let title = \'");
            EndContext();
            BeginContext(5134, 43, false);
#line 121 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
                    Write(Html.Raw(translateItems[LanguageKeys.Exit]));

#line default
#line hidden
            EndContext();
            BeginContext(5177, 31, true);
            WriteLiteral("\';\r\n            let message = \'");
            EndContext();
            BeginContext(5209, 62, false);
#line 122 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
                      Write(Html.Raw(translateItems[LanguageKeys.ExitConfirmationMessage]));

#line default
#line hidden
            EndContext();
            BeginContext(5271, 69, true);
            WriteLiteral("\';\r\n            confirm(title, message);\r\n        });\r\n\r\n        $(\"#");
            EndContext();
            BeginContext(5341, 18, false);
#line 126 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
       Write(Model.ActionPrefix);

#line default
#line hidden
            EndContext();
            BeginContext(5359, 100, true);
            WriteLiteral("-undo-click\").on(\"click\", function (e) {\r\n            e.preventDefault();\r\n            let title = \'");
            EndContext();
            BeginContext(5460, 43, false);
#line 128 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
                    Write(Html.Raw(translateItems[LanguageKeys.Undo]));

#line default
#line hidden
            EndContext();
            BeginContext(5503, 31, true);
            WriteLiteral("\';\r\n            let message = \'");
            EndContext();
            BeginContext(5535, 50, false);
#line 129 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
                      Write(Html.Raw(translateItems[LanguageKeys.UndoMessage]));

#line default
#line hidden
            EndContext();
            BeginContext(5585, 188, true);
            WriteLiteral("\';\r\n            confirm(title, message);\r\n        });\r\n\r\n        $(\"#exit-click-modal\").click(function () {\r\n            let title = $(\"#exit-modal-title\").text();\r\n            let url = \'");
            EndContext();
            BeginContext(5774, 27, false);
#line 135 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
                  Write(Url.Action("Index", "Home"));

#line default
#line hidden
            EndContext();
            BeginContext(5801, 31, true);
            WriteLiteral("\';\r\n            if (title === \'");
            EndContext();
            BeginContext(5833, 43, false);
#line 136 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
                      Write(Html.Raw(translateItems[LanguageKeys.Undo]));

#line default
#line hidden
            EndContext();
            BeginContext(5876, 29, true);
            WriteLiteral("\') {\r\n                url = \'");
            EndContext();
            BeginContext(5906, 19, false);
#line 137 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Shared\_Actions.cshtml"
                  Write(Model.UndoActionUrl);

#line default
#line hidden
            EndContext();
            BeginContext(5925, 292, true);
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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<PageActionBarModel> Html { get; private set; }
    }
}
#pragma warning restore 1591