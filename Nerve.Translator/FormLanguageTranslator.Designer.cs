namespace Nerve.Translator
{
    partial class frmTranslator
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.cmbSourceLanguage = new System.Windows.Forms.ComboBox();
            this.cmbTargetLanguage = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.lstTranslateItems = new System.Windows.Forms.ListBox();
            this.label3 = new System.Windows.Forms.Label();
            this.btnTranslate = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.txtTranslateInput = new System.Windows.Forms.TextBox();
            this.txtTranslateResult = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.btnGo = new System.Windows.Forms.Button();
            this.btnReset = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // cmbSourceLanguage
            // 
            this.cmbSourceLanguage.FormattingEnabled = true;
            this.cmbSourceLanguage.Items.AddRange(new object[] {
            "English",
            "Farsi"});
            this.cmbSourceLanguage.Location = new System.Drawing.Point(140, 13);
            this.cmbSourceLanguage.Name = "cmbSourceLanguage";
            this.cmbSourceLanguage.Size = new System.Drawing.Size(144, 24);
            this.cmbSourceLanguage.TabIndex = 0;
            this.cmbSourceLanguage.Text = "Select...";
            // 
            // cmbTargetLanguage
            // 
            this.cmbTargetLanguage.FormattingEnabled = true;
            this.cmbTargetLanguage.Items.AddRange(new object[] {
            "English",
            "Farsi"});
            this.cmbTargetLanguage.Location = new System.Drawing.Point(427, 13);
            this.cmbTargetLanguage.Name = "cmbTargetLanguage";
            this.cmbTargetLanguage.Size = new System.Drawing.Size(155, 24);
            this.cmbTargetLanguage.TabIndex = 1;
            this.cmbTargetLanguage.Text = "Select...";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 13);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(121, 17);
            this.label1.TabIndex = 2;
            this.label1.Text = "Source Language";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(303, 13);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(118, 17);
            this.label2.TabIndex = 3;
            this.label2.Text = "Target Language";
            // 
            // lstTranslateItems
            // 
            this.lstTranslateItems.Location = new System.Drawing.Point(16, 242);
            this.lstTranslateItems.Name = "lstTranslateItems";
            this.lstTranslateItems.Size = new System.Drawing.Size(268, 181);
            this.lstTranslateItems.TabIndex = 4;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(13, 222);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(124, 17);
            this.label3.TabIndex = 5;
            this.label3.Text = "Translate Item List";
            // 
            // btnTranslate
            // 
            this.btnTranslate.Location = new System.Drawing.Point(414, 429);
            this.btnTranslate.Name = "btnTranslate";
            this.btnTranslate.Size = new System.Drawing.Size(168, 31);
            this.btnTranslate.TabIndex = 6;
            this.btnTranslate.Text = "Translate";
            this.btnTranslate.UseVisualStyleBackColor = true;
            this.btnTranslate.Visible = false;
            this.btnTranslate.Click += new System.EventHandler(this.btnTranslate_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(12, 56);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(252, 17);
            this.label4.TabIndex = 7;
            this.label4.Text = "Paste Items (Seperated by semi-colon)";
            // 
            // txtTranslateInput
            // 
            this.txtTranslateInput.Location = new System.Drawing.Point(15, 76);
            this.txtTranslateInput.Multiline = true;
            this.txtTranslateInput.Name = "txtTranslateInput";
            this.txtTranslateInput.Size = new System.Drawing.Size(567, 111);
            this.txtTranslateInput.TabIndex = 8;
            // 
            // txtTranslateResult
            // 
            this.txtTranslateResult.Location = new System.Drawing.Point(307, 242);
            this.txtTranslateResult.Multiline = true;
            this.txtTranslateResult.Name = "txtTranslateResult";
            this.txtTranslateResult.Size = new System.Drawing.Size(275, 181);
            this.txtTranslateResult.TabIndex = 9;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(304, 222);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(48, 17);
            this.label5.TabIndex = 10;
            this.label5.Text = "Result";
            // 
            // btnGo
            // 
            this.btnGo.Location = new System.Drawing.Point(427, 193);
            this.btnGo.Name = "btnGo";
            this.btnGo.Size = new System.Drawing.Size(64, 31);
            this.btnGo.TabIndex = 11;
            this.btnGo.Text = "Go";
            this.btnGo.UseVisualStyleBackColor = true;
            this.btnGo.Click += new System.EventHandler(this.btnGo_Click);
            // 
            // btnReset
            // 
            this.btnReset.Location = new System.Drawing.Point(497, 193);
            this.btnReset.Name = "btnReset";
            this.btnReset.Size = new System.Drawing.Size(85, 31);
            this.btnReset.TabIndex = 12;
            this.btnReset.Text = "Reset";
            this.btnReset.UseVisualStyleBackColor = true;
            this.btnReset.Click += new System.EventHandler(this.btnReset_Click);
            // 
            // frmTranslator
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(594, 468);
            this.Controls.Add(this.btnReset);
            this.Controls.Add(this.btnGo);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.txtTranslateResult);
            this.Controls.Add(this.txtTranslateInput);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.btnTranslate);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.lstTranslateItems);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.cmbTargetLanguage);
            this.Controls.Add(this.cmbSourceLanguage);
            this.Name = "frmTranslator";
            this.Text = "Language Translator";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox cmbSourceLanguage;
        private System.Windows.Forms.ComboBox cmbTargetLanguage;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ListBox lstTranslateItems;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button btnTranslate;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtTranslateInput;
        private System.Windows.Forms.TextBox txtTranslateResult;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button btnGo;
        private System.Windows.Forms.Button btnReset;
    }
}

