using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO.Ports;
using System.Data.SqlClient;

namespace TSU_SMS_Sender
{
    public partial class frmMain : Form
    {
        SqlConnection sqlcon = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        string constr = @"Data Source=.\SQLEXPRESS;Initial Catalog=tsuat_db;Persist Security Info=True;User ID=sa;Password=masterfile";
        int SMSnum;
        SerialPort port = new SerialPort();
        clsSMS objclsSMS = new clsSMS();

        public frmMain()
        {
            InitializeComponent();
        }

        private void frmMain_Load(object sender, EventArgs e)
        {
            SMSnum = 1000;
        }

        private void tmrMain_Tick(object sender, EventArgs e)
        {
            checksms();
        }

        private void btnConnect_Click(object sender, EventArgs e)
        {
            if(btnConnect.Text == "Connect")
            {
                try
                {
                    this.port = objclsSMS.OpenPort(cboComport.Text, Convert.ToInt32(8), Convert.ToInt32(1), Convert.ToInt32(300), Convert.ToInt32(300));

                    if (this.port != null)
                    {
                        MessageBox.Show("Connected on " + cboComport.Text);
                        btnConnect.Text = "Disconnect";
                        cboComport.Enabled = false;

                        tmrMain.Start();
                    }
                    else
                    {
                        MessageBox.Show("Invalid port settings");
                    } 
                }
                catch
                {
                    MessageBox.Show("Invalid port settings");
                }
            }
            else
            {
                objclsSMS.ClosePort(port);
                btnConnect.Text = "Connect";
                cboComport.Enabled = true;

                tmrMain.Stop();
            }
        }

        private void checksms()
        {
            using(SqlConnection sqlcon = new SqlConnection(constr))
            {
                sqlcon.Open();

                SqlCommand cmd = new SqlCommand("SELECT * FROM tblSMS", sqlcon);
                SqlDataReader dr = cmd.ExecuteReader();

                if(dr.HasRows)
                {
                    tmrMain.Stop();
                    lblStatus.ForeColor = Color.Red;
                    lblStatus.Text = "Sending announcements.";
                    pbSMS.Maximum = 2;

                    while(dr.Read())
                    {
                        lblSMSnum.Text = dr.FieldCount.ToString();
                        objclsSMS.sendMsg(this.port, dr.GetString(1), dr.GetString(2));
                        pbSMS.Value = pbSMS.Value + 1;
                    }

                    sqlcon.Close();

                    deletesms();
                } 
            }
        }

        private void deletesms()
        {

        }

    }
}
