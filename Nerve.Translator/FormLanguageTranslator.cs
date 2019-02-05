using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Google.Apis.Services;
using Google.Apis.Translate.v2;
using Google.Apis.Translate.v2.Data;
using TranslationsResource = Google.Apis.Translate.v2.Data.TranslationsResource;

namespace Nerve.Translator
{
    public partial class frmTranslator : Form
    {
        public frmTranslator()
        {
            InitializeComponent();
        }

        private void btnTranslate_Click(object sender, EventArgs e)
        {
            if (ValidateFields())
            {
                var sourceLanguage = cmbSourceLanguage.SelectedItem.ToString();
                var targetLanguage = cmbTargetLanguage.SelectedItem.ToString();

                var sourceLanguageCode = sourceLanguage == "English" ? "en" : "fa";
                var targetLanguageCode = targetLanguage == "English" ? "en" : "fa";
                var builder = new StringBuilder();

                var service = new TranslateService(new BaseClientService.Initializer()
                {
                    ApiKey = "api key",
                    ApplicationName = "Translate API Sample"
                });

                var values = new Google.Apis.Util.Repeatable<string>(lstTranslateItems.Items.Cast<string>());
                var response = service.Translations.List(values, targetLanguageCode).Execute();

                foreach (TranslationsResource translation in response.Translations)
                {
                    builder.AppendLine(translation.TranslatedText);
                }

                txtTranslateResult.Text = builder.ToString();
            }
        }

        private void btnGo_Click(object sender, EventArgs e)
        {
            if (ValidateFields())
            {
                lstTranslateItems.Items.Clear();
                var value = txtTranslateInput.Text;
                var items = value.Split(',');
                if (items.Length > 0)
                {
                    foreach (var item in items)
                    {
                        lstTranslateItems.Items.Add(item);
                    }
                }
                else
                {
                    lstTranslateItems.Items.Add(value);
                }
                btnGo.Enabled = false;
                btnTranslate.Visible = true;
            }
            else
            {
                btnTranslate.Visible = false;
            }
        }

        private bool ValidateFields()
        {
            if (cmbSourceLanguage.SelectedItem == null || cmbTargetLanguage.SelectedItem == null)
            {
                MessageBox.Show("Mandatory fields are missing.");
                return false;
            }
            var sourceLanguage = cmbSourceLanguage.SelectedItem.ToString();
            var targetLanguage = cmbTargetLanguage.SelectedItem.ToString();
            var isValid = true;
            if (string.IsNullOrEmpty(sourceLanguage) || string.IsNullOrEmpty(targetLanguage) || lstTranslateItems.Items.Count < 0)
            {
                MessageBox.Show("Mandatory fields are missing.");
                isValid = false;
            }
            else if (sourceLanguage.Equals(targetLanguage))
            {
                MessageBox.Show("Source and target language can't be same.");
                isValid = false;
            }

            return isValid;
        }

        private void btnReset_Click(object sender, EventArgs e)
        {
            btnTranslate.Visible = false;
        }
    }
}
