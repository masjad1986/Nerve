using Nerve.Common.Dtos;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;

namespace Nerve.Common.Helpers
{
    public class EnumHelper
    {
        public static List<ItemDto> ToList<TEnum>(List<object> excludeItems)
        {
            var items = new List<ItemDto>();
            var fields = typeof(TEnum).GetFields();
            if (fields == null || !fields.Any())
                return items;

            foreach (var field in fields)
            {
                DescriptionAttribute[] attributes =
                (DescriptionAttribute[])field.GetCustomAttributes(
                typeof(DescriptionAttribute),
                false);

                if (attributes != null && attributes.Length > 0)
                    items.Add(new ItemDto { Id = (int)field.GetValue(field), Name = attributes[0].Description });
            }

            if (excludeItems != null && excludeItems.Any())
            {
                return items.Where(item => !excludeItems.Contains(item.Id)).ToList();
            }

            return items;
        }
        public static List<ItemDto> Filter<TEnum>(List<object> filterItems)
        {
            var items = new List<ItemDto>();
            if (filterItems == null || !filterItems.Any())
                return items;

            items = ToList<TEnum>(null);
            if (items != null && items.Any())
            {
                return items.Where(item => filterItems.Contains(item.Id)).ToList();
            }
            return items;
        }
    }
}
