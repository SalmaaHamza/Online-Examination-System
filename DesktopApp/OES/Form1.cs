using FontAwesome.Sharp;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace OES
{
    public partial class Form1 : Form
    {
        private IconButton CurrentBtn;

        private Form currentChildForm;
        public Form1()
        {
            InitializeComponent();
        }

        private void panelMenu_Paint(object sender, PaintEventArgs e)
        {

        }

        private void pLinqInstantFeedbackSource1_GetEnumerable(object sender, DevExpress.Data.PLinq.GetEnumerableEventArgs e)
        {

        }

        private void OpenChildForm(Form childForm)
        {
            if(currentChildForm != null)
            {
                currentChildForm.Close();
            }
            currentChildForm = childForm;
            childForm.TopLevel = false;
            childForm.Dock = DockStyle.Fill;
            panelDesktopForm.Controls.Add(childForm);
            panelDesktopForm.Tag = childForm;
            childForm.BringToFront();
            childForm.Show();
        }
    
        private void btnExams_Click(object sender, EventArgs e)
        {
            OpenChildForm(new frmExam());
        }
    }
}
