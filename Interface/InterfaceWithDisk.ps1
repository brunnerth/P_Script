$form = New-Object Windows.Forms.Form
$panel1 = New-Object System.Windows.Forms.Panel





$panel1.Location = New-Object System.Drawing.Point(15, 38);
$panel1.Name = "panel1";
$panel1.Size = New-Object System.Drawing.Size(245, 148);
$panel1.TabIndex = 2;
$panel1.AutoScroll = $False;
$panel1.HorizontalScroll.Enabled = $False;
$panel1.HorizontalScroll.Visible = $False;
$panel1.HorizontalScroll.Maximum = 0;
$panel1.BackColor = '#CCCC99'
$panel1.AutoScroll = $true;





$form.MaximizeBox = $False
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$form.AutoScaleDimensions = New-Object System.Drawing.SizeF(20, 60);
$form.Size = New-Object System.Drawing.Size(700, 700);
$form.Controls.Add($panel1);
$form.Name = "Form1";
$form.Text = "GestionTION";
$form.PerformLayout();




$a =  get-wmiobject -class win32_logicaldisk

$b = Format-List -Property FreeSpace;

$kek = "ProgressBar";
$x = 12;
$y = 31;
$z = 36;
for ($i = 0; $i -lt $a.Count; $i++){

        $b = (100 * ($a[$i].Size - $a[$i].FreeSpace)) / $a[$i].Size;

        $labelTaux = New-Object System.Windows.Forms.Label
        $labelTaux.AutoSize = $true;
        $labelTaux.Location = New-Object System.Drawing.Point(202, $z);
        $labelTaux.Name = "lblTaux"+$i;
        $labelTaux.Size = New-Object System.Drawing.Size(21, 13);
        $labelTaux.TabIndex = 5;
        $labelTaux.Text = [math]::Ceiling($b),"%"

        $label = New-Object System.Windows.Forms.Label
        $label.AutoSize = $true;
        $label.Location = New-Object System.Drawing.Point(4, $x);
        $label.Name = "label"+$i;
        $label.Size = New-Object System.Drawing.Size(75, 13);
        $label.TabIndex = 4;
        $label.Text =$a[$i].Name;

        $progressBar = New-Object System.Windows.Forms.ProgressBar
        $progressBar.Location = New-Object System.Drawing.Point(0, $y);
        $progressBar.Name = $kek + $i;
        $progressBar.Size = New-Object System.Drawing.Size(190, 24);
        $progressBar.Value = $b
        $panel1.Controls.Add($progressBar);
        $panel1.Controls.Add($labelTaux);
        $panel1.Controls.Add($label);
        $y += 43;
        $x += 43;
        $z += 43;
}
$form.ShowDialog();