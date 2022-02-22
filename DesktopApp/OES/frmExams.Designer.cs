
namespace OES
{
    partial class frmExams
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
            this.components = new System.ComponentModel.Container();
            this.grdStdExams = new System.Windows.Forms.DataGridView();
            this.bindingSourceStdExams = new System.Windows.Forms.BindingSource(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.grdStdExams)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSourceStdExams)).BeginInit();
            this.SuspendLayout();
            // 
            // grdStdExams
            // 
            this.grdStdExams.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.grdStdExams.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdStdExams.Location = new System.Drawing.Point(12, 101);
            this.grdStdExams.Name = "grdStdExams";
            this.grdStdExams.RowTemplate.Height = 25;
            this.grdStdExams.Size = new System.Drawing.Size(520, 305);
            this.grdStdExams.TabIndex = 0;
            this.grdStdExams.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.grdStdExams_CellContentClick);
            // 
            // frmExams
            // 
            this.AccessibleRole = System.Windows.Forms.AccessibleRole.TitleBar;
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(544, 418);
            this.ControlBox = false;
            this.Controls.Add(this.grdStdExams);
            this.Name = "frmExams";
            this.Text = "frmExams";
            this.Load += new System.EventHandler(this.frmExams_Load);
            ((System.ComponentModel.ISupportInitialize)(this.grdStdExams)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSourceStdExams)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView grdStdExams;
        private System.Windows.Forms.BindingSource bindingSourceStdExams;
    }
}