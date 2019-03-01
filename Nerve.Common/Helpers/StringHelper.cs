using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Common.Helpers
{
    public static class StringHelper
    {
        public static List<string> ToSingleQuoteList(this List<string> items)
        {
            var quoteItems = new List<string>();
            items.ForEach(item => quoteItems.Add($"'{item}'"));
            return quoteItems;
        }
    }
}
