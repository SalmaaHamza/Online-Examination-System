using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BLL;
namespace OES
{
    public partial class StdLogin : Form
    {
        public StdLogin()
        {
            InitializeComponent();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            if (int.TryParse(this.txtUserName.Text, out int UserName))
            {
                var flag = StudentManager.spGetByIdStudent(UserName);
            }
        }
    }
}
