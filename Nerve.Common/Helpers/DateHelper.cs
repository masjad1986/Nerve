using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Common.Helpers
{
    public enum CompareType
    {
        Equal,
        GreaterThan,
        GreaterThanEqual,
        LessThan,
        LessThanEqual,
        NotEqual
    }
    public class DateHelper
    {
        public static bool CompareDate(DateTime first, DateTime second, CompareType compareType = CompareType.Equal)
        {
            var isValid = false;
            switch (compareType)
            {
                case CompareType.Equal:
                    isValid = first.Equals(second);
                    break;
                case CompareType.GreaterThan:
                    isValid = first > second;
                    break;
                case CompareType.GreaterThanEqual:
                    isValid = first >= second;
                    break;
                case CompareType.LessThan:
                    isValid = first < second;
                    break;
                case CompareType.LessThanEqual:
                    isValid = first <= second;
                    break;
                case CompareType.NotEqual:
                    isValid = !first.Equals(second);
                    break;
                default:
                    isValid = first.Equals(second);
                    break;
            }
            return isValid;
        }
    }
}
