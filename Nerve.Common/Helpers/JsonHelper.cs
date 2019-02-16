using Newtonsoft.Json;

namespace Nerve.Common.Helpers
{
    public class JsonHelper<T>
    {
        public static string ToJsonString(T type)
        {
            return JsonConvert.SerializeObject(type);
        }
    }
}
