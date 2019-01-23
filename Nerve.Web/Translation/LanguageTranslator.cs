using Microsoft.AspNetCore.Hosting;
using Nerve.Repository.Enums;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace Nerve.Web.Translation
{
    /// <summary>
    /// 
    /// </summary>
    public class LanguageTranslator: ILanguageTranslator
    {
        private readonly IHostingEnvironment _hostingEnvironment;
        private const string ENGLISH_RESOURCE_PATH = "en-US.json";
        private const string PERSIAN_RESOURCE_PATH = "fa.json";
        public LanguageTranslator(IHostingEnvironment hostingEnvironment)
        {
            _hostingEnvironment = hostingEnvironment;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="resourceKey"></param>
        /// <returns></returns>
        public async Task<string> TranslateAsync(string resourceKey)
        {
            return await TranslateAsync(resourceKey, LanguageType.English);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="resourceKey"></param>
        /// <param name="languageType"></param>
        /// <returns></returns>
        public async Task<string> TranslateAsync(string resourceKey, LanguageType languageType)
        {
            var value = string.Empty;
            var resourceDictionary = await ReadJsonLanguageResource(languageType);
            if (resourceDictionary.Any())
            {
                value = resourceDictionary.FirstOrDefault(x => x.Key == resourceKey).Value;
                if (string.IsNullOrEmpty(value))
                {
                    return await Task.FromResult(string.Empty);
                }
            }
            return await Task.FromResult(value);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="resourceKeys"></param>
        /// <returns></returns>
        public async Task<Dictionary<string, string>> TranslateManyAsync(List<string> resourceKeys)
        {
            return await TranslateManyAsync(resourceKeys, LanguageType.English);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="resourceKeys"></param>
        /// <param name="languageType"></param>
        /// <returns></returns>
        public async Task<Dictionary<string, string>> TranslateManyAsync(List<string> resourceKeys, LanguageType languageType)
        {
            var resourceDictionary = await ReadJsonLanguageResource(languageType);
            if (resourceDictionary.Any())
            {
                return resourceDictionary.Where(x => resourceKeys.Contains(x.Key)).ToDictionary(x => x.Key, y => y.Value);
            }

            return await Task.FromResult(new Dictionary<string, string>());
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="languageType"></param>
        /// <returns></returns>
        private async Task<Dictionary<string, string>> ReadJsonLanguageResource(LanguageType languageType)
        {
            var json = new JObject();
            var file = string.Empty;
            switch (languageType)
            {
                case LanguageType.English:
                    file = ENGLISH_RESOURCE_PATH;
                    break;
                case LanguageType.Farsi:
                    file = PERSIAN_RESOURCE_PATH;
                    break;
                default:
                    file = ENGLISH_RESOURCE_PATH;
                    break;
            }
            var filePath = $"{_hostingEnvironment.ContentRootPath}\\Resources\\{file}";
            var fileText = File.ReadAllText(filePath);
            if (string.IsNullOrEmpty(fileText))
                throw new Exception(WebConstants.NotifyMessage.NoLanguageResourceFound);

            json = JObject.Parse(fileText);

            if (json == null)
                throw new Exception(WebConstants.NotifyMessage.InvalidLanguageResourceFile);

            var resourceItems = JsonConvert.DeserializeObject<Dictionary<string, string>>(fileText, new JsonSerializerSettings { Formatting = Formatting.Indented });
            return await Task.FromResult(resourceItems);
        }
    }
}
