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
            int maxValue = 16000;
            InitializeComponent();
            this.chart1.Series["Ram"].Color = System.Drawing.Color.Red;
            this.chart1.Series["Ram"].BorderColor = System.Drawing.Color.Red;
            this.chart1.Series["Ram"].ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Line;
            this.chart1.ChartAreas[0].AxisX.MajorGrid.LineWidth = 0;
            this.chart1.ChartAreas[0].AxisX.LabelStyle.Enabled = false;
            this.chart1.ChartAreas[0].AxisX.MajorGrid.LineColor = System.Drawing.Color.White;
            this.chart1.ChartAreas[0].AxisY.MajorGrid.LineColor = System.Drawing.Color.LightGray;
            this.chart1.ChartAreas[0].AxisX.Minimum = 1;
            this.chart1.ChartAreas[0].AxisY.Minimum = 0;
            this.chart1.ChartAreas[0].AxisY.Maximum = maxValue;
            this.chart1.ChartAreas[0].AxisY.Interval = maxValue/8;
            var chart = chart1.ChartAreas[0];
            chart.AxisX.LabelStyle.Format = "";
            chart.AxisY.LabelStyle.Format = "";
            chart.AxisY.LabelStyle.IsEndLabelVisible = true;
            List<int> values = new List<int>();
            Random int2 = new Random();
            for (int x = 0; x<8;x++)
            {

                UpdateChart(int2.Next(1, 16000), x);
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
        private void UpdateChart(int value, int compteur)
        {
            chart1.Series["Ram"].Points.AddXY(compteur, value);
        }
        private void Chart1_Click(object sender, EventArgs e)
        {

        }
    }
}
