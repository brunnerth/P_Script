using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Forms.DataVisualization.Charting;

namespace TestChart
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            int x1 = 1;
            int x2 = 56;
            int x3 = 2;
            int x4 = 1;
            int x5 = 45;
            int x6 = 63;
            int x7 = 15;
            int x8 = 25;
            var chart = chart1.ChartAreas[0];
            chart.AxisX.IntervalType = DateTimeIntervalType.Number;
            chart.AxisX.LabelStyle.Format = "";
            chart.AxisY.LabelStyle.Format = "";
            chart.AxisY.LabelStyle.IsEndLabelVisible = true;
            chart.AxisX.Maximum = 8;
            chart.AxisX.Minimum = 1;
            chart.AxisY.Minimum = 0;
            chart.AxisY.Maximum = 70;
            chart.AxisX.Interval = 1;
            chart.AxisY.Interval = 5;
            chart1.Series["Ram"].Points.AddXY(1, x1);
            chart1.Series["Ram"].Points.AddXY(2, x2);
            chart1.Series["Ram"].Points.AddXY(3, x3);
            chart1.Series["Ram"].Points.AddXY(4, x4);
            chart1.Series["Ram"].Points.AddXY(5, x5);
            chart1.Series["Ram"].Points.AddXY(6, x6);
            chart1.Series["Ram"].Points.AddXY(7, x7);
            chart1.Series["Ram"].Points.AddXY(8, x8);
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void Chart1_Click(object sender, EventArgs e)
        {

        }
    }
}
