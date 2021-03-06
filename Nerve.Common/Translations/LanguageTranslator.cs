﻿using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Options;
using Nerve.Common.Constants;
using Nerve.Common.Enums;
using Nerve.Common.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace Nerve.Common.Translations
{
    /// <summary>
    /// Purpose of this class is to provide the translate the text to English and Persian Language.
    /// It can be used to translate into many other language based on same json key with language specific value.
    /// </summary>
    public class LanguageTranslator : ILanguageTranslator
    {
        private readonly IOptions<AppSettings> _appSettings;
        private readonly IHostingEnvironment _hostingEnvironment;
        private const string ENGLISH_RESOURCE_PATH = "en-us.json";
        private const string PERSIAN_RESOURCE_PATH = "fa.json";
        public LanguageTranslator(IHostingEnvironment hostingEnvironment, IOptions<AppSettings> appSettings)
        {
            _hostingEnvironment = hostingEnvironment;
            _appSettings = appSettings;
        }

        /// <summary>
        /// Translate the word into default locale.
        /// </summary>
        /// <param name="resourceKey">Resource key to get the related value.</param>
        /// <returns>It's return the translated value as a string type.</returns>
        public async Task<string> TranslateAsync(string resourceKey)
        {
            return await TranslateAsync(resourceKey, LanguageType.English);
        }

        /// <summary>
        /// Translate the word for given locale.
        /// </summary>
        /// <param name="resourceKey">Resource key to get the related value.</param>
        /// <param name="languageType">Pass the locale value like English, Persian etc.</param>
        /// <returns>It's return the translated value as a string type.</returns>
        public async Task<string> TranslateAsync(string resourceKey, LanguageType languageType)
        {
            var value = string.Empty;
            var resourceDictionary = await ReadJsonLanguageResource(languageType);
            if (resourceDictionary.Any())
            {
                value = resourceDictionary.FirstOrDefault(x => x.Key == resourceKey).Value;
                if (string.IsNullOrEmpty(value))
                {
                    return await Task.FromResult(resourceKey);
                }
            }
            return await Task.FromResult(value);
        }

        /// <summary>
        /// Translate the list of word into default locale.
        /// </summary>
        /// <param name="resourceKey">Pass list of resource key to get the related value.</param>
        /// <returns>It's return the list of translated values with key and value pair.</returns>
        public async Task<Dictionary<string, string>> TranslateManyAsync(List<string> resourceKeys)
        {
            return await TranslateManyAsync(resourceKeys, LanguageType.English);
        }

        /// <summary>
        /// Translate the list of word into given locale.
        /// </summary>
        /// <param name="resourceKey">Pass list of resource key to get the related value.</param>
        /// <param name="languageType">Pass the locale value like English, Persian etc.</param>
        /// <returns></returns>
        public async Task<Dictionary<string, string>> TranslateManyAsync(List<string> resourceKeys, LanguageType languageType)
        {
            var resourceDictionary = await ReadJsonLanguageResource(languageType);
            if (resourceDictionary.Any())
            {
                var translatedItems = resourceDictionary.Where(x => resourceKeys.Contains(x.Key)).ToDictionary(x => x.Key, y => y.Value);
                if (translatedItems != null && translatedItems.Count != resourceKeys.Count)
                {
                    var missingItems = resourceKeys.Except(translatedItems.Select(x => x.Key).ToList()).ToDictionary(x => x, y => y);
                    translatedItems = translatedItems.Concat(missingItems).ToDictionary(x => x.Key, y => y.Value);
                }
                return translatedItems;
            }


            return await Task.FromResult(resourceKeys.ToDictionary(x => x, y => y));
        }

        /// <summary>
        /// Read language resource file based on language provided.
        /// </summary>
        /// <param name="languageType">Pass the locale value like English, Persian etc.</param>
        /// <returns>It's return the list of key value pair.</returns>
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
            var filePath = $"{_appSettings.Value.LANGUAGE_RESOURCE_FILEPATH}\\{file}";
            var fileText = File.ReadAllText(filePath);
            if (string.IsNullOrEmpty(fileText))
                throw new Exception(CommonConstants.NoLanguageResourceFound);

            json = JObject.Parse(fileText);

            if (json == null)
                throw new Exception(CommonConstants.InvalidLanguageResourceFile);

            var resourceItems = JsonConvert.DeserializeObject<Dictionary<string, string>>(fileText, new JsonSerializerSettings { Formatting = Formatting.Indented });
            return await Task.FromResult(resourceItems);
        }
    }
}
