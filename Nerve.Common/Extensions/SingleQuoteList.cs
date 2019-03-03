using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Common.Extensions
{
    public static class SingleQuoteList
    {
        /// <summary>
        /// Prepare single quote list.
        /// </summary>
        /// <param name="items"></param>
        /// <returns></returns>
        public static List<string> ToSingleQuoteList(this List<string> items)
        {
            var quoteItems = new List<string>();
            items.ForEach(item => quoteItems.Add($"'{item}'"));
            return quoteItems;
        }

        /// <summary>
        /// Prepare list to comman serparate
        /// </summary>
        /// <param name="items"></param>
        /// <returns></returns>
        public static string ToSingleQuote(this List<string> items, char separator)
        {
            var quoteItems = ToSingleQuoteList(items);
            return string.Join(separator, quoteItems);
        }
    }
}
