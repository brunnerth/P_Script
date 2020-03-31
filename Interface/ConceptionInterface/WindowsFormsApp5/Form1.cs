using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Timers;

namespace WindowsFormsApp5
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void lbl_Click(object sender, EventArgs e)
        {
            MessageBox.Show("kek");
            panel1.AutoScroll = false;
            panel1.HorizontalScroll.Enabled = false;
            panel1.HorizontalScroll.Visible = false;
            panel1.HorizontalScroll.Maximum = 0;
            panel1.AutoScroll = true;
            string kek = "ProgressBar";
            int x = 12;
            int y = 31;
            int z = 36;
            for (int i = 1; i < 20; i++)
            {
                Label labelTaux = new Label();
                labelTaux.AutoSize = true;
                labelTaux.Location = new System.Drawing.Point(202, z);
                labelTaux.Name = "lblTaux"+i;
                labelTaux.Size = new System.Drawing.Size(21, 13);
                labelTaux.TabIndex = 5;
                labelTaux.Text = "0%";

                Label label  = new Label();
                label.AutoSize = true;
                label.Location = new System.Drawing.Point(4, x);
                label.Name = "label"+i;
                label.Size = new System.Drawing.Size(75, 13);
                label.TabIndex = 4;
                label.Text = "Disque Dur : "+i;

                ProgressBar progressBar = new ProgressBar();
                progressBar.Location = new System.Drawing.Point(0, y);
                progressBar.Name = kek + i;
                progressBar.Size = new System.Drawing.Size(190, 24);
                panel1.Controls.Add(progressBar);
                panel1.Controls.Add(labelTaux);
                panel1.Controls.Add(label);
                y += 43;
                x += 43;
                z += 43;
            }






        }
        private void Form1_Load(object sender, EventArgs e)
        {
        }
    



    }
}
