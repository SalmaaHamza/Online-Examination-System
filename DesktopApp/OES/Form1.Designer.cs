
namespace OES
{
    partial class Form1
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
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
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.pLinqInstantFeedbackSource1 = new DevExpress.Data.PLinq.PLinqInstantFeedbackSource();
            this.panelMenu = new System.Windows.Forms.Panel();
            this.btnGrades = new FontAwesome.Sharp.IconButton();
            this.btnExams = new FontAwesome.Sharp.IconButton();
            this.PanelLogo = new System.Windows.Forms.Panel();
            this.iconPictureBox1 = new FontAwesome.Sharp.IconPictureBox();
            this.panelDesktopForm = new System.Windows.Forms.Panel();
            this.panelMenu.SuspendLayout();
            this.PanelLogo.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.iconPictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // pLinqInstantFeedbackSource1
            // 
            this.pLinqInstantFeedbackSource1.GetEnumerable += new System.EventHandler<DevExpress.Data.PLinq.GetEnumerableEventArgs>(this.pLinqInstantFeedbackSource1_GetEnumerable);
            // 
            // panelMenu
            // 
            this.panelMenu.BackColor = System.Drawing.Color.SteelBlue;
            this.panelMenu.Controls.Add(this.btnGrades);
            this.panelMenu.Controls.Add(this.btnExams);
            this.panelMenu.Controls.Add(this.PanelLogo);
            this.panelMenu.Dock = System.Windows.Forms.DockStyle.Left;
            this.panelMenu.Location = new System.Drawing.Point(0, 0);
            this.panelMenu.Name = "panelMenu";
            this.panelMenu.Size = new System.Drawing.Size(165, 375);
            this.panelMenu.TabIndex = 0;
            this.panelMenu.Paint += new System.Windows.Forms.PaintEventHandler(this.panelMenu_Paint);
            // 
            // btnGrades
            // 
            this.btnGrades.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnGrades.FlatAppearance.BorderSize = 0;
            this.btnGrades.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnGrades.Font = new System.Drawing.Font("Sitka Display", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.btnGrades.ForeColor = System.Drawing.SystemColors.ButtonFace;
            this.btnGrades.IconChar = FontAwesome.Sharp.IconChar.Sistrix;
            this.btnGrades.IconColor = System.Drawing.Color.Gainsboro;
            this.btnGrades.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.btnGrades.IconSize = 40;
            this.btnGrades.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnGrades.Location = new System.Drawing.Point(0, 220);
            this.btnGrades.Name = "btnGrades";
            this.btnGrades.Padding = new System.Windows.Forms.Padding(0, 0, 0, 10);
            this.btnGrades.Size = new System.Drawing.Size(165, 86);
            this.btnGrades.TabIndex = 2;
            this.btnGrades.Text = "Grades";
            this.btnGrades.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnGrades.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnGrades.UseVisualStyleBackColor = true;
            // 
            // btnExams
            // 
            this.btnExams.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnExams.FlatAppearance.BorderSize = 0;
            this.btnExams.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnExams.Font = new System.Drawing.Font("Sitka Display", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.btnExams.ForeColor = System.Drawing.SystemColors.ButtonFace;
            this.btnExams.IconChar = FontAwesome.Sharp.IconChar.User;
            this.btnExams.IconColor = System.Drawing.Color.Gainsboro;
            this.btnExams.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.btnExams.IconSize = 40;
            this.btnExams.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnExams.Location = new System.Drawing.Point(0, 142);
            this.btnExams.Name = "btnExams";
            this.btnExams.Padding = new System.Windows.Forms.Padding(0, 0, 0, 10);
            this.btnExams.Size = new System.Drawing.Size(165, 78);
            this.btnExams.TabIndex = 1;
            this.btnExams.Text = "Exams";
            this.btnExams.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnExams.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnExams.UseVisualStyleBackColor = true;
            this.btnExams.Click += new System.EventHandler(this.btnExams_Click);
            // 
            // PanelLogo
            // 
            this.PanelLogo.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.PanelLogo.Controls.Add(this.iconPictureBox1);
            this.PanelLogo.Dock = System.Windows.Forms.DockStyle.Top;
            this.PanelLogo.Location = new System.Drawing.Point(0, 0);
            this.PanelLogo.Name = "PanelLogo";
            this.PanelLogo.Size = new System.Drawing.Size(165, 142);
            this.PanelLogo.TabIndex = 0;
            // 
            // iconPictureBox1
            // 
            this.iconPictureBox1.BackColor = System.Drawing.Color.SteelBlue;
            this.iconPictureBox1.Dock = System.Windows.Forms.DockStyle.Top;
            this.iconPictureBox1.ForeColor = System.Drawing.Color.SeaShell;
            this.iconPictureBox1.IconChar = FontAwesome.Sharp.IconChar.YinYang;
            this.iconPictureBox1.IconColor = System.Drawing.Color.SeaShell;
            this.iconPictureBox1.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.iconPictureBox1.IconSize = 110;
            this.iconPictureBox1.Location = new System.Drawing.Point(0, 0);
            this.iconPictureBox1.Name = "iconPictureBox1";
            this.iconPictureBox1.Padding = new System.Windows.Forms.Padding(10);
            this.iconPictureBox1.Size = new System.Drawing.Size(161, 110);
            this.iconPictureBox1.TabIndex = 0;
            this.iconPictureBox1.TabStop = false;
            // 
            // panelDesktopForm
            // 
            this.panelDesktopForm.AccessibleRole = System.Windows.Forms.AccessibleRole.None;
            this.panelDesktopForm.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panelDesktopForm.Location = new System.Drawing.Point(165, 0);
            this.panelDesktopForm.Name = "panelDesktopForm";
            this.panelDesktopForm.Size = new System.Drawing.Size(422, 375);
            this.panelDesktopForm.TabIndex = 1;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(587, 375);
            this.Controls.Add(this.panelDesktopForm);
            this.Controls.Add(this.panelMenu);
            this.Name = "Form1";
            this.Text = "Form1";
            this.panelMenu.ResumeLayout(false);
            this.PanelLogo.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.iconPictureBox1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private DevExpress.Data.PLinq.PLinqInstantFeedbackSource pLinqInstantFeedbackSource1;
        private System.Windows.Forms.Panel panelMenu;
        private FontAwesome.Sharp.IconButton btnGrades;
        private FontAwesome.Sharp.IconButton btnExams;
        private System.Windows.Forms.Panel PanelLogo;
        private FontAwesome.Sharp.IconPictureBox iconPictureBox1;
        private System.Windows.Forms.Panel panelDesktopForm;
    }
}

