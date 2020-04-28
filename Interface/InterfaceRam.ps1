Add-Type -AssemblyName System.Windows.Forms.DataVisualization

function GetTotalRam{
    $tabBarette = Get-WmiObject win32_physicalmemory;
    $totalRam = 0;
    for($i =0; $i-lt $tabBarette.Length;$i++)
    {
        $totalRam +=  $tabBarette[$i].Capacity;
    }
    return $totalRam;
}
function GetUsedRam{
    $os = Get-Ciminstance Win32_OperatingSystem;
    $ramTotal = GetTotalRam;
    $ramTotal /= 1024;
    $ramFree = $os.FreePhysicalMemory;
    $ramUsed = ($ramTotal - $ramFree)/ 1048576;
    return $ramUsed;
}

$form = New-Object Windows.Forms.Form

$form.MaximizeBox = $False
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$form.AutoScaleDimensions = New-Object System.Drawing.SizeF(20, 60);
$form.Size = New-Object System.Drawing.Size(700, 700);
$form.Name = "Form1";
$form.Text = "GestionTION";
$form.PerformLayout();



#frame

$MemoryUsageChart1 = New-object System.Windows.Forms.DataVisualization.Charting.Chart

$MemoryUsageChart1.Width = 400

$MemoryUsageChart1.Height = 400

$MemoryUsageChart1.BackColor = [System.Drawing.Color]::White
 
#header 

[void]$MemoryUsageChart1.Titles.Add("Utilisation de la mémoire")

$MemoryUsageChart1.Titles[0].Font = "segoeuilight,20pt"

$MemoryUsageChart1.Titles[0].Alignment = "topLeft"
 
$chartarea = New-Object System.Windows.Forms.DataVisualization.Charting.ChartArea

$chartarea.Name = "ChartArea1"
$MemoryUsageChart1.ChartAreas.Add($chartarea)




 $maxValue = 16000;

[void]$MemoryUsageChart1.Series.Add("Ram");
$MemoryUsageChart1.Series["Ram"].Color = '#FF0000';
$MemoryUsageChart1.Series["Ram"].BorderColor ='#FF0000';
$MemoryUsageChart1.Series["Ram"].ChartType = [System.Windows.Forms.DataVisualization.Charting.SeriesChartType]::Line
$MemoryUsageChart1.ChartAreas[0].AxisX.MajorGrid.LineWidth = 0;
$MemoryUsageChart1.ChartAreas[0].AxisX.LabelStyle.Enabled = $False;
$MemoryUsageChart1.ChartAreas[0].AxisX.MajorGrid.LineColor = '#000000';
$MemoryUsageChart1.ChartAreas[0].AxisY.MajorGrid.LineColor = '#D3D3D3';
$MemoryUsageChart1.ChartAreas[0].AxisX.Minimum = 1;
$MemoryUsageChart1.ChartAreas[0].AxisY.Minimum = 0;
$MemoryUsageChart1.ChartAreas[0].AxisY.Maximum = $maxValue;
$MemoryUsageChart1.ChartAreas[0].AxisY.Interval = $maxValue/8;
$MemoryUsageChart1.ChartAreas[0].AxisX.LabelStyle.Format = "";
$MemoryUsageChart1.ChartAreas[0].AxisY.LabelStyle.Format = "";
$MemoryUsageChart1.ChartAreas[0].AxisY.LabelStyle.IsEndLabelVisible = $true;

#$MemoryUsageChart1.Series["Ram"].Points.AddXY(1,12000);
#$MemoryUsageChart1.Series["Ram"].Points.AddXY(2,2000);
#$MemoryUsageChart1.Series["Ram"].Points.AddXY(3,3000);
#$MemoryUsageChart1.Series["Ram"].Points.AddXY(4,6000);

function ActualiseGraphic{
    $i = 1;
    while($true)
    {
        $ramUsed = GetUsedRam;
        $MemoryUsageChart1.Series["Ram"].Points.AddXY($i,$ramUsed);
        $form.Controls.Add($MemoryUsageChart1);
        Write-Host "Point : $i -> $ramUsed"
        $i++;
        Start-Sleep -Seconds 1.0;
    }
}
$runForm = {
    $form.ShowDialog();
}
Start-Job $runForm
Get-Job

Write-Host("asd");
