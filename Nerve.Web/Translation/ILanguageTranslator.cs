using Nerve.Repository.Enums;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Nerve.Web.Translation
{
    public interface ILanguageTranslator
    {
        Task<string> TranslateAsync(string resourceKey);
        Task<string> TranslateAsync(string resourceKey, LanguageType languageType);
        Task<Dictionary<string, string>> TranslateManyAsync(List<string> resourceKeys);
        Task<Dictionary<string, string>> TranslateManyAsync(List<string> resourceKeys, LanguageType languageType);
    }
}