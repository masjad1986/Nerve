using Nerve.Common.Enums;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Nerve.Common.Translations
{
    public interface ILanguageTranslator
    {
        Task<string> TranslateAsync(string resourceKey);
        Task<string> TranslateAsync(string resourceKey, LanguageType languageType);
        Task<Dictionary<string, string>> TranslateManyAsync(List<string> resourceKeys);
        Task<Dictionary<string, string>> TranslateManyAsync(List<string> resourceKeys, LanguageType languageType);
    }
}