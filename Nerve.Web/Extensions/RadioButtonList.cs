using Microsoft.AspNetCore.Html;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
using Nerve.Common.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Nerve.Web.Extensions
{
    public static class HtmlHelpers
    {
        public static IHtmlContent RadioButtonList(this IHtmlHelper html, string name,
            IEnumerable<SelectListItem> items, int columns = 1, string cssClass = "")
        {
            var columnCounter = 0;
            var counter = 1;
            if (items == null || !items.Any())
                return new HtmlString(string.Empty);

            var builder = new StringBuilder("<table class='radio-button-list'>");
            foreach (var item in items)
            {
                if (columnCounter == 0)
                {
                    builder.AppendLine("<tr>");
                }

                if (columnCounter < columns)
                {
                    builder.AppendLine("<td>");
                    var id = $"{name.ToLower()}-radio-{counter}";
                    builder.Append($"<input type='radio' id ='{id}' name ='{name}' class='{ (string.IsNullOrEmpty(cssClass) ? string.Empty : cssClass) }' value ='{item.Value}' />");
                    builder.Append($"<label for='{id}'>{item.Text}</label>");
                    builder.AppendLine("</td>");
                    columnCounter++;
                    counter++;
                }

                if (columnCounter == columns || counter == items.Count() + 1)
                {
                    builder.AppendLine("</tr>");
                    columnCounter = 0;
                }
            }
            builder.AppendLine("</table>");
            return new HtmlString(builder.ToString());
        }
    }
}