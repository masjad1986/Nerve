#pragma checksum "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Users\Login.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "ca3ca0156b7759794bd9e3016f22e23ecf0f87bc"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Users_Login), @"mvc.1.0.view", @"/Views/Users/Login.cshtml")]
[assembly:global::Microsoft.AspNetCore.Mvc.Razor.Compilation.RazorViewAttribute(@"/Views/Users/Login.cshtml", typeof(AspNetCore.Views_Users_Login))]
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
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"ca3ca0156b7759794bd9e3016f22e23ecf0f87bc", @"/Views/Users/Login.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"99594d08e9904441231da0f54667e41be0b4da55", @"/Views/_ViewImports.cshtml")]
    public class Views_Users_Login : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<Nerve.Repository.User>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            BeginContext(30, 97, true);
            WriteLiteral("<h2>Login</h2>\r\n<div class=\"row\">\r\n    <div class=\"col-md-8\">\r\n        <section id=\"loginForm\">\r\n");
            EndContext();
#line 6 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Users\Login.cshtml"
             using (Html.BeginForm("Login", "Users", FormMethod.Post, new { @class = "form-horizontal", role = "form" }))
            {
                

#line default
#line hidden
            BeginContext(282, 23, false);
#line 8 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Users\Login.cshtml"
           Write(Html.AntiForgeryToken());

#line default
#line hidden
            EndContext();
            BeginContext(307, 81, true);
            WriteLiteral("                <h4>Use a local account to log in.</h4>\r\n                <hr />\r\n");
            EndContext();
            BeginContext(405, 64, false);
#line 11 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Users\Login.cshtml"
           Write(Html.ValidationSummary(true, "", new { @class = "text-danger" }));

#line default
#line hidden
            EndContext();
            BeginContext(471, 62, true);
            WriteLiteral("                <div class=\"form-group\">\r\n                    ");
            EndContext();
            BeginContext(534, 73, false);
#line 13 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Users\Login.cshtml"
               Write(Html.LabelFor(m => m.Username, new { @class = "col-md-2 control-label" }));

#line default
#line hidden
            EndContext();
            BeginContext(607, 71, true);
            WriteLiteral("\r\n                    <div class=\"col-md-10\">\r\n                        ");
            EndContext();
            BeginContext(679, 65, false);
#line 15 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Users\Login.cshtml"
                   Write(Html.TextBoxFor(m => m.Username, new { @class = "form-control" }));

#line default
#line hidden
            EndContext();
            BeginContext(744, 26, true);
            WriteLiteral("\r\n                        ");
            EndContext();
            BeginContext(771, 78, false);
#line 16 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Users\Login.cshtml"
                   Write(Html.ValidationMessageFor(m => m.Username, "", new { @class = "text-danger" }));

#line default
#line hidden
            EndContext();
            BeginContext(849, 116, true);
            WriteLiteral("\r\n                    </div>\r\n                </div>\r\n                <div class=\"form-group\">\r\n                    ");
            EndContext();
            BeginContext(966, 73, false);
#line 20 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Users\Login.cshtml"
               Write(Html.LabelFor(m => m.Password, new { @class = "col-md-2 control-label" }));

#line default
#line hidden
            EndContext();
            BeginContext(1039, 71, true);
            WriteLiteral("\r\n                    <div class=\"col-md-10\">\r\n                        ");
            EndContext();
            BeginContext(1111, 66, false);
#line 22 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Users\Login.cshtml"
                   Write(Html.PasswordFor(m => m.Password, new { @class = "form-control" }));

#line default
#line hidden
            EndContext();
            BeginContext(1177, 26, true);
            WriteLiteral("\r\n                        ");
            EndContext();
            BeginContext(1204, 78, false);
#line 23 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Users\Login.cshtml"
                   Write(Html.ValidationMessageFor(m => m.Password, "", new { @class = "text-danger" }));

#line default
#line hidden
            EndContext();
            BeginContext(1282, 338, true);
            WriteLiteral(@"
                    </div>
                </div>
                <div class=""form-group"">
                    <div class=""col-md-offset-2 col-md-10"">
                        <input type=""submit"" value=""Log in"" class=""btn btn-default"" />
                    </div>
                </div>
                <p>
                    ");
            EndContext();
            BeginContext(1621, 53, false);
#line 32 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Users\Login.cshtml"
               Write(Html.ActionLink("Register as a new user", "Register"));

#line default
#line hidden
            EndContext();
            BeginContext(1674, 24, true);
            WriteLiteral("\r\n                </p>\r\n");
            EndContext();
            BeginContext(1809, 41, true);
            WriteLiteral("                <p>\r\n                    ");
            EndContext();
            BeginContext(1851, 58, false);
#line 36 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Users\Login.cshtml"
               Write(Html.ActionLink("Forgot your password?", "ForgotPassword"));

#line default
#line hidden
            EndContext();
            BeginContext(1909, 24, true);
            WriteLiteral("\r\n                </p>\r\n");
            EndContext();
#line 38 "D:\Asjad\Apps\Nerve\Nerve.Web\Views\Users\Login.cshtml"
            }

#line default
#line hidden
            BeginContext(1948, 42, true);
            WriteLiteral("        </section>\r\n    </div>\r\n</div>\r\n\r\n");
            EndContext();
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<Nerve.Repository.User> Html { get; private set; }
    }
}
#pragma warning restore 1591
