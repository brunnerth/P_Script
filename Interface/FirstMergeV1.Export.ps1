﻿#------------------------------------------------------------------------
# Source File Information (DO NOT MODIFY)
# Source ID: 1bd4903e-94ad-491b-9691-b56fc3f66390
# Source File: FirstMergeV1.psproj
#------------------------------------------------------------------------
#region Project Recovery Data (DO NOT MODIFY)
<#RecoveryData:
owIAAB+LCAAAAAAABACdUtFOgzAUfV+yfyB9NGGsbpIQWR90wexhasayV1PgMqqlJaXMza+3UDZn
pjHx5banPT3n3gPhClK5A3WYU03JcOA44bOSr5BqJz6ItFBSsA/IZiiivAbUHUaMa1AzdDWqanzb
1tIumV3wvuTdJu9qbao9KYBXI73XqDMyVhtQNZOCXI9w6B1Bf2dcYDEnOMmmwXgCbjClmTsNcOIG
foDd5MbP00nu+5NgHHo9uX/aT7A+VEDM5Tk8ikueGTvHO3ere9BD565h3Ew+RiTWVOmmaoexXr8x
nRXkoECkEDUi1WacGYoL+e4uKRORVOWLSQWRI2oz+kMwLqhq81+rBn6UX4idfAP3gcuEciOPEbH7
uv0U/2z3vjCMr35P8KJhC2xyp6QtelJsywTlLeGRlkAipmq9BLWFDTZClSGH3gVrOAi9bz/lJ0Wo
cjKjAgAA#>
#endregion
<#
    .NOTES
    --------------------------------------------------------------------------------
     Code generated by:  SAPIEN Technologies, Inc., PowerShell Studio 2020 v5.7.174
     Generated on:       05.05.2020 14:18
     Generated by:       Thomas Meyer
    --------------------------------------------------------------------------------
    .DESCRIPTION
        Script generated by PowerShell Studio 2020
#>



#region Source: Startup.pss
#region File Recovery Data (DO NOT MODIFY)
<#RecoveryData:
YQAAAB+LCAAAAAAABACzCUpNzi9LLap0SSxJVAAyijPz82yVjPUMlex4uRQUbPyLMtMz8xJz3DJz
Uv0Sc1PtgksSi0pKC/QKiott9DFkebls9JGNtAMAoyFkEGEAAAA=#>
#endregion
#----------------------------------------------
#region Import Assemblies
#----------------------------------------------
#endregion Import Assemblies

#Define a Param block to use custom parameters in the project
#Param ($CustomParameter)

function Main {
<#
    .SYNOPSIS
        The Main function starts the project application.
    
    .PARAMETER Commandline
        $Commandline contains the complete argument string passed to the script packager executable.
    
    .NOTES
        Use this function to initialize your script and to call GUI forms.
		
    .NOTES
        To get the console output in the Packager (Forms Engine) use: 
		$ConsoleOutput (Type: System.Collections.ArrayList)
#>
	Param ([String]$Commandline)
		
	#--------------------------------------------------------------------------
	#TODO: Add initialization script here (Load modules and check requirements)
	
	
	#--------------------------------------------------------------------------
	
	if((Show-MainForm_psf) -eq 'OK')
	{
		
	}
	
	$script:ExitCode = 0 #Set the exit code for the Packager
}



#endregion Source: Startup.pss

#region Source: MainForm.psf
function Show-MainForm_psf
{
#region File Recovery Data (DO NOT MODIFY)
<#RecoveryData:
LwIAAB+LCAAAAAAABABlUsmOqkAAvJPwD2auJgPIJonPpIGBERdkaRFuqM0OjTTCMF8/ju/yklen
SlXqUKlaueiKB9RNetzHsychOW7+vPHv3Nuapmazld3lad7ElZFX6BDXaL2P88bAXf3ekmTF/Ge/
Qr/+OnalgDvV+QVsANBsXQN/oQLNgMS4ZzpwBjeR9OmzwbsBS7mEofnNsz3e7h6LL1fl4143orIz
eybpzFscnGlKhWW4JJm8/JJ164Ph1G8XkznpnHZjfaiTXR6sOwH5TZkseJfnfa+gup5wUclCiJyo
yE5RK215c2QLRFPefDy0oJUOxjjBIeaMPavoIFE0794LYjbU5YLlU5h1u1D2Mn9oPo9q5rYy7LdL
TSl/K4rPimx/9CBNcSbsC1/SRmSSB6rc07g4XzUiQXNvuwIbBg6yjpx9bjenRxpEsih7eIohyKKz
cAs3aZGVVq+Y+d3Wa5ryvTzOQmHOw7OFJcLWI5q87dwxp4kzUGo6u+M1clz/4ERgF+DjcmP7xqUh
tySpFi1v6eKdZ+QKuWIh0JS13LJeIrFeKu99cVDAzeGDriIgBWDFvAZ7TQcIQfWlyhGZMU9lxfx7
kPUPx6llOi8CAAA=#>
#endregion
	#----------------------------------------------
	#region Import the Assemblies
	#----------------------------------------------
	[void][reflection.assembly]::Load('System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	[void][reflection.assembly]::Load('System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	#endregion Import Assemblies

	#----------------------------------------------
	#region Generated Form Objects
	#----------------------------------------------
	[System.Windows.Forms.Application]::EnableVisualStyles()
	$MainForm = New-Object 'System.Windows.Forms.Form'
	$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
	#endregion Generated Form Objects

	#----------------------------------------------
	# User Generated Script
	#----------------------------------------------
	#Code provient de http://get-powershell.com/post/2008/12/13/Encrypting-and-Decrypting-Strings-with-a-Key-in-PowerShell.aspx
	function Get-EncryptedData
	{
		param ($key,
			$data)
		$data | ConvertTo-SecureString -key $key |
		ForEach-Object { [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($_)) }
	}
	#Code provient de https://stackoverflow.com/questions/42801713/store-a-text-in-encrypted-form-and-use-in-powershell-script-without-compromising
	function Set-Key
	{
		param ([string]$string)
		$length = $string.length
		$pad = 32 - $length
		if (($length -lt 16) -or ($length -gt 32))
		{
			Throw "String must be between 16 and 32 characters"
		}
		$encoding = New-Object System.Text.ASCIIEncoding
		$bytes = $encoding.GetBytes($string + "0" * $pad)
		return $bytes
	}
	[void][System.Reflection.Assembly]::LoadFrom("F:\Script\MySql.Data.dll")
	function VerifUser
	{
		param ([string]$userName,
			[string]$password)
		# Information for the connection.
		$sqlServer = "localhost"
		$sqlDBName = "db_script_thomeyer"
		$user = "db_Script_User"
		$passwordDb = ".Etml-"
		$sqlConnectionString = "Server = $sqlServer; Database = $sqlDBName; Integrated Security = True; User ID = $user; Password = $passwordDb";
		try
		{
			# Connection
			$sqlConnection = New-Object Mysql.Data.MySqlClient.MySqlConnection($sqlConnectionString);
			$sqlConnection.Open();
			
			#Query
			$sqlQuery = "SELECT T1.useLogin, T1.usePassword FROM t_user AS T1";
			
			#Adapter
			$command = New-Object MySql.Data.MySqlClient.MySqlCommand($sqlQuery, $sqlConnection)
			
			$dataAdapter = New-Object MySql.Data.MySqlClient.MySqlDataAdapter($command);
			$dataSet = New-Object System.Data.DataSet;
			$recordCount = $dataAdapter.Fill($dataSet, "data");
			$sqlConnection.Close();
			
			#Show result
			$res = $dataSet.Tables[0];
			$verification = $false;
			for ($i = 0; $i -lt $res.useLogin.Length; $i++)
			{
				$User = $userName;
				#$passwordEncrypted = ConvertTo-SecureString $password -AsPlainText -Force | ConvertFrom-SecureString -Key ([System.Text.Encoding]::ASCII.GetBytes("Kaguya-samawaKokurasetaiTensaiS2"));
				$key = Set-Key -string "Kaguya-samawaKokurasetaiTensaiS2";
				$passwordDecrypt = Get-EncryptedData -Data $res.usePassword[$i] -key $key;
				if (($res.useLogin[$i] -eq $userName) -and ($password -eq $passwordDecrypt))
				{
					$verification = $true;
				}
			}
			if ($verification)
			{
				return $true;
			}
			else
			{
				return $false;
			}
		}
		catch [Exception]
		{
			Write-Warning "Il y a une erreur inconnu, verifier que le serveur mysql est lancé.";
		}
	}
	
	$lblLogin = New-Object Windows.Forms.Label
	$lblPassword = New-Object Windows.Forms.Label
	$tbLogin = New-Object Windows.Forms.TextBox
	$tbPassword = New-Object Windows.Forms.TextBox
	$label1 = New-Object System.Windows.Forms.Label
	$bLogin = New-Object System.Windows.Forms.Button
	
	
	$lblLogin.AutoSize = $true;
	$lblLogin.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 20)
	$lblLogin.Location = New-Object System.Drawing.Point(51, 158);
	$lblLogin.Name = "lblLogin";
	$lblLogin.Size = New-Object System.Drawing.Size(77, 25);
	$lblLogin.TabIndex = 0;
	$lblLogin.Text = "Login :";
	
	$lblPassword.AutoSize = $true;
	$lblPassword.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 20)
	$lblPassword.Location = New-Object System.Drawing.Point(51, 267);
	$lblPassword.Name = "lblPassword";
	$lblPassword.Size = New-Object System.Drawing.Size(106, 25);
	$lblPassword.TabIndex = 1;
	$lblPassword.Text = "Password";
	
	$tbLogin.Location = New-Object System.Drawing.Point(56, 201);
	$tbLogin.Name = "tbLogin";
	$tbLogin.Size = New-Object System.Drawing.Size(240, 20);
	$tbLogin.TabIndex = 2;
	
	$tbPassword.Location = New-Object System.Drawing.Point(56, 313);
	$tbPassword.Name = "tbPassword";
	$tbPassword.Size = New-Object System.Drawing.Size(240, 20);
	$tbPassword.TabIndex = 3;
	$tbPassword.PasswordChar = '*';
	
	$label1.AutoSize = $true;
	$label1.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 22)
	$label1.Location = New-Object System.Drawing.Point(16, 58);
	$label1.Name = "label1";
	$label1.Size = New-Object System.Drawing.Size(370, 33);
	$label1.TabIndex = 4;
	$label1.Text = "Welcome to GestionTION";
	
	$bLogin.Location = New-Object System.Drawing.Point(221, 367)
	$bLogin.Name = "bLogin";
	$bLogin.Size = New-Object System.Drawing.Size(75, 23);
	$bLogin.TabIndex = 5;
	$bLogin.Text = "Login";
	$bLogin.UseVisualStyleBackColor = $true;
	
	
	$bLogin.Add_Click(
		{
			$verif = VerifUser -userName $tbLogin.Text -password $tbPassword.Text
			if ($verif)
			{
				
				Write-Host 'Login succed';
				$MainForm.Visible = $false;
				Show-ChildForm_psf;
			}
			else
			{
				Write-Host 'Login fail'
			}
			
		}
	)
	
	
	
	$MainForm
	$MainForm.MaximizeBox = $False
	$MainForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
	$MainForm.AutoScaleDimensions = New-Object System.Drawing.SizeF(20, 60);
	$MainForm.Size = New-Object System.Drawing.Size(398, 540);
	$MainForm.Controls.Add($label1);
	$MainForm.Controls.Add($lblPassword);
	$MainForm.Controls.Add($lblLogin);
	$MainForm.Controls.Add($tbLogin);
	$MainForm.Controls.Add($tbPassword);
	$MainForm.Controls.Add($bLogin);
	$MainForm.Name = "MainForm";
	$MainForm.Text = "GestionTION";
	$MainForm.PerformLayout();
	
	
	
	
	$MainForm_Load={
		#TODO: Place custom script here
		
	}
	
	# --End User Generated Script--
	#----------------------------------------------
	#region Generated Events
	#----------------------------------------------
	
	$Form_StateCorrection_Load=
	{
		#Correct the initial state of the form to prevent the .Net maximized form issue
		$MainForm.WindowState = $InitialFormWindowState
	}
	
	$Form_StoreValues_Closing=
	{
		#Store the control values
	}

	
	$Form_Cleanup_FormClosed=
	{
		#Remove all event handlers from the controls
		try
		{
			$MainForm.remove_Load($MainForm_Load)
			$MainForm.remove_Load($Form_StateCorrection_Load)
			$MainForm.remove_Closing($Form_StoreValues_Closing)
			$MainForm.remove_FormClosed($Form_Cleanup_FormClosed)
		}
		catch { Out-Null <# Prevent PSScriptAnalyzer warning #> }
	}
	#endregion Generated Events

	#----------------------------------------------
	#region Generated Form Code
	#----------------------------------------------
	#
	# MainForm
	#
	$MainForm.AutoScaleDimensions = '6, 13'
	$MainForm.AutoScaleMode = 'Font'
	$MainForm.ClientSize = '377, 486'
	$MainForm.Margin = '4, 4, 4, 4'
	$MainForm.Name = 'MainForm'
	$MainForm.StartPosition = 'CenterScreen'
	$MainForm.Text = 'Main Form'
	$MainForm.add_Load($MainForm_Load)
	#endregion Generated Form Code

	#----------------------------------------------

	#Save the initial state of the form
	$InitialFormWindowState = $MainForm.WindowState
	#Init the OnLoad event to correct the initial state of the form
	$MainForm.add_Load($Form_StateCorrection_Load)
	#Clean up the control events
	$MainForm.add_FormClosed($Form_Cleanup_FormClosed)
	#Store the control values when form is closing
	$MainForm.add_Closing($Form_StoreValues_Closing)
	#Show the Form
	return $MainForm.ShowDialog()

}
#endregion Source: MainForm.psf

#region Source: Globals.ps1
	#--------------------------------------------
	# Declare Global Variables and Functions here
	#--------------------------------------------
	
	
	#Sample function that provides the location of the script
	function Get-ScriptDirectory
	{
	<#
		.SYNOPSIS
			Get-ScriptDirectory returns the proper location of the script.
	
		.OUTPUTS
			System.String
		
		.NOTES
			Returns the correct path within a packaged executable.
	#>
		[OutputType([string])]
		param ()
		if ($null -ne $hostinvocation)
		{
			Split-Path $hostinvocation.MyCommand.path
		}
		else
		{
			Split-Path $script:MyInvocation.MyCommand.Path
		}
	}
	
	#Sample variable that provides the location of the script
	[string]$ScriptDirectory = Get-ScriptDirectory
	
	
	
	
#endregion Source: Globals.ps1

#region Source: ChildForm.psf
function Show-ChildForm_psf
{
#region File Recovery Data (DO NOT MODIFY)
<#RecoveryData:
2AUAAB+LCAAAAAAABABlVMeq4wgQvBv8D8NcBaNsWfDmgXLOkiXrpmzlHKyvX8/sZWH71HTR1VB0
1ZedJf2WTW82WqIfn2Yu++73T/QX/PP7evnx48uYyqLsooYvm0yP2uybeZVNyvdT+2uY8y/wf/jf
rT/4d3xyEYxRiU0nFMUYLEP9WzTFPnx+2fqz8PKGHMDdLA1/YBm1nbnRkrW3/kDuuCC72+nTNRbH
B5wItrbgTX69mPfsKcuOU4bN0o/4mwtfJwnk5gGdQLndaF+IAYIgQ7h2c19UztdYp3ElySO2bDqH
YhvZ8eEb94GJrK4X3UVHnyfpUHY6CMT5BwrdHgN1ttb6HAZatR6V2K6J3YNCPvPdbkNlBwW0tOlF
bAgGypKojaihM9eqeb2QSLH5vOIrmoHw0aIWuYzsvDYY2jZLza5lDIEJvZs0Up8nc8e2LIs5fGaN
LW2lOnOIYvpebY8cuom9XjiCJU+gGkaOoBTFeg86aT/dc02jE7ipZSW8pSwSJiK33QC9aWMAsjnZ
kB4evQxFaq0Ex+3y4e+gRX3YaJfrfC2uMgct/EhR7q0HG+AGvcRQufmLUTcDlCLDnDSNFD984wms
ka3RBlve2o0tQIv06IR23Y2m8OtlYyYx2j1eJFewj8XiI3rwqCvnpAYaEmfuidwXA362+v5utTvm
UKgZmEx4E/uEdHV0qay3pwsDtBZxeb0YFQCh3apjViTVRjG6GRuS3cxSoABqe4VFPSzb1O5tAkYv
1kMX95uXispw9xWj60muHu/Qe28rFFs+bIFlqwGl9lZzhyhghZGSpM7ALzM0r1mvKtltKrJm7Y9k
2Jxbpa8ay2jyxOj4JA0Z8udt7c/b0oMgPa+XIcJ2NCcdrQ2OSfAJVEj7makKyhOh8NVMCXDHUBsS
WbEnD0cVeIV+RZxEr4z6Oq1xnGI0L9qJSYhVuV48dUvT4ezaZxGsQPXCxu02ms7LX4EyayKdViLE
xxHPe2VvHjEIL1vU0FXs3HX2BZh5eu9z5kS6CPDr60XkVXVLpMad/Gwdn3pc5o02nmLf56ovRutt
j+KGSQl9nGPUhQYix2a4fk54QPHy9ggjFTxobpVEJL9fL0DmpM5xpnjbjuR8unoJPOLZpNOZitvT
1PVarXA332tt0NahU7DKHF1s4sMD1z+XGuhptwvPwGmlOR+f7lGS5HzLJliY2KGyNTibVFFiBAiq
pqzCcXdFl7XlUZi6KU8gldLtGtqjdWLHqcjx05h6hBrq7P7Grhd0pNKwHsCjL8JsRU2rDNOmjrRC
LGSqAzfONWAOvVEQ2GIKQKfJYybQOBGQ8F2HZzVPKE/kN+nQp2C5XthWJIDe8cwn3x/Is6I1QtpY
MKf97qP3NNI6vdlIohN6CiAzAVVlWIYeDDQ2lEwHhBMsgiCwIBBRTF0vDn9uCuO1E0saYDc1eAIf
LHP2zOzKmsM8eCC3WhI3lYT3asgc4MjZYG0z5bti9fGs2wQUhGrSrxxOfJwFb16r4M64wg2+3Sn7
DUEJZwWf4Pz9Bf4N1r8RS81z1sZNmc0/wM/kC/xvkn//AxJkmB/YBQAA#>
#endregion
	#----------------------------------------------
	#region Import the Assemblies
	#----------------------------------------------
	[void][reflection.assembly]::Load('System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Windows.Forms.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35')
	[void][reflection.assembly]::Load('System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	#endregion Import Assemblies

	#----------------------------------------------
	#region Generated Form Objects
	#----------------------------------------------
	[System.Windows.Forms.Application]::EnableVisualStyles()
	$formChildForm = New-Object 'System.Windows.Forms.Form'
	$label1 = New-Object 'System.Windows.Forms.Label'
	$chart1 = New-Object 'System.Windows.Forms.DataVisualization.Charting.Chart'
	$cbRunning = New-Object 'System.Windows.Forms.CheckBox'
	$cbStopped = New-Object 'System.Windows.Forms.CheckBox'
	$bReload = New-Object 'System.Windows.Forms.Button'
	$pServices = New-Object 'System.Windows.Forms.Panel'
	$lblService = New-Object 'System.Windows.Forms.Label'
	$timer1 = New-Object 'System.Windows.Forms.Timer'
	$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
	#endregion Generated Form Objects

	#----------------------------------------------
	# User Generated Script
	#----------------------------------------------
	function GetService($status)
	{
		
		switch ($status)
		{
			"stoping"
			{
				$services = Get-Service | Where-Object { $_.status -eq "stoping" };
				break;
			}
			"starting"
			{
				$services = Get-Service | Where-Object { $_.status -eq "starting" };
				break;
			}
			"running"
			{
				$services = Get-Service | Where-Object { $_.status -eq "running" };
				break;
			}
			"stopped"
			{
				$services = Get-Service | Where-Object { $_.status -eq "stopped" };
				break;
			}
			default
			{
				$services = Get-Service;
				break;
			}
		}
		return $services;
		
	}
	$u = 0;
	$formChildForm_Load={
			$u = 0;	
			$totalRam = GetTotalRam;
			$totalRam /= 1024 * 1024 * 1024
			
			$ramUsed = GetUsedRam;
			$ramPourcentage = $ramUsed / $totalRam * 100
			$chart1.ChartAreas[0].AxisY.Maximum = 100;
			$chart1.ChartAreas[0].AxisX.LabelStyle.Enabled = $false;
			$chart1.ChartAreas[0].AxisX.MajorGrid.LineWidth = 0;
			$chart1.Series["Series1"].BorderWidth = 3;
			$chart1.Series["Series1"].Points.AddXY(0, $ramPourcentage);
			$ramUsed = [math]::Round($ramUsed, 1)
			$label1.Text = " $ramUsed / $totalRam ";
		
		
	}
	#endregion
	$timer1_Tick = {
		$totalRam = GetTotalRam;
		$totalRam /= 1024 * 1024 * 1024
		
		$ramUsed = GetUsedRam;
		$ramPourcentage = $ramUsed / $totalRam * 100
		$chart1.Series["Series1"].Points.AddXY($u, $ramPourcentage);
		$u = $u + 1;
		
		$ramUsed = [math]::Round($ramUsed, 1)
		$label1.Text = " $ramUsed / $totalRam ";
	}
	
	function GetTotalRam
	{
		$tabBarette = Get-WmiObject win32_physicalmemory;
		$totalRam = 0;
		for ($i = 0; $i -lt $tabBarette.Length; $i++)
		{
			$totalRam += $tabBarette[$i].Capacity;
		}
		return $totalRam;
	}
	function GetUsedRam
	{
		$os = Get-Ciminstance Win32_OperatingSystem;
		$ramTotal = GetTotalRam;
		$ramTotal /= 1024;
		$ramFree = $os.FreePhysicalMemory;
		$ramUsed = ($ramTotal - $ramFree)/ 1048576;
		return $ramUsed;
	}
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
	
	$formChildForm.Controls.Add($panel1);
	$formChildForm.Text= "GestionTION";
	
	$a = get-wmiobject -class win32_logicaldisk
	
	$b = Format-List -Property FreeSpace;
	
	$kek = "ProgressBar";
	$x = 12;
	$y = 31;
	$z = 36;
	for ($i = 0; $i -lt $a.Count; $i++)
	{
		
		$b = (100 * ($a[$i].Size - $a[$i].FreeSpace)) / $a[$i].Size;
		
		$labelTaux = New-Object System.Windows.Forms.Label
		$labelTaux.AutoSize = $true;
		$labelTaux.Location = New-Object System.Drawing.Point(202, $z);
		$labelTaux.Name = "lblTaux" + $i;
		$labelTaux.Size = New-Object System.Drawing.Size(21, 13);
		$labelTaux.TabIndex = 5;
		$labelTaux.Text = [math]::Ceiling($b), "%"
		
		$label = New-Object System.Windows.Forms.Label
		$label.AutoSize = $true;
		$label.Location = New-Object System.Drawing.Point(4, $x);
		$label.Name = "label" + $i;
		$label.Size = New-Object System.Drawing.Size(75, 13);
		$label.TabIndex = 4;
		$label.Text = $a[$i].Name;
		
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
	
	
	$services = "";
	
	$bReload_Click = {
		#TODO: Place custom script here	
		if ($cbRunning.Checked)
		{
			$services += GetService("running");
			Write-Host $services;
		}
		if ($cbStarting.Checked)
		{
			$services += GetService("starting");
			Write-Host $services;
		}
		if ($cbStopped.Checked)
		{
			$services += GetService("stopped");
			Write-Host $services;
		}
		if ($cbStopping.Checked)
		{
			$services += GetService("stoping");
			Write-Host $services;
		}
		$pServices.Controls.Clear();
		$pServices.AutoScroll = $false;
		$pServices.HorizontalScroll.Enabled = $false;
		$pServices.HorizontalScroll.Visible = $false;
		$pServices.HorizontalScroll.Maximum = 0;
		$pServices.AutoScroll = $true;
		$x = 12;
		$z = 12;
		for ($i = 0; $i -lt $services.Length; $i++)
		{
			$labelTauxService = New-Object System.Windows.Forms.Label;
			$labelTauxService.AutoSize = $true;
			$labelTauxService.Location = New-Object System.Drawing.Point(250, $z);
			$labelTauxService.Name = "lblStatus";
			$labelTauxService.Size = New-Object System.Drawing.Size(21, 13);
			$labelTauxService.TabIndex = 5;
			$labelTauxService.Text = $services[$i].status
			$LabelService = New-Object System.Windows.Forms.Label;
			$LabelService.AutoSize = $true;
			$LabelService.Location = New-Object System.Drawing.Point(4, $x);
			$LabelService.Name = "lblNameService";
			$LabelService.Size = New-Object System.Drawing.Size(75, 13);
			$LabelService.TabIndex = 4;
			$LabelService.Text = $services[$i].Name;
			
			
			$pServices.Controls.Add($labelTauxService);
			$pServices.Controls.Add($LabelService);
			$x += 43;
			$z += 43;
			$label1.Text = 1;
			
		}
		
	}
	
	
	#region Control Helper Functions
	function Update-Chart
	{
	<#
	    .SYNOPSIS
	        This functions helps you plot points on a chart
	    
	    .DESCRIPTION
	        Use the function to plot points on a chart or add more charts to a chart control
	    
	    .PARAMETER ChartControl
	        The Chart Control you when to add points to
	    
	    .PARAMETER XPoints
	        Set the X Axis Points. These can be strings or numerical values.
	    
	    .PARAMETER YPoints
	        Set the Y Axis Points. These can be strings or numerical values.
	    
	    .PARAMETER XTitle
	        Set the Title for the X Axis.
	    
	    .PARAMETER YTitle
	        Set the Title for the Y Axis.
	    
	    .PARAMETER Title
	        Set the Title for the chart.
	    
	    .PARAMETER ChartType
	        Set the Style of the chart. See System.Windows.Forms.DataVisualization.Charting.SeriesChartType Enum
	    
	    .PARAMETER SeriesIndex
	        Set the settings of a particular Series and corresponding ChartArea
	    
	    .PARAMETER TitleIndex
	        Set the settings of a particular Title
	    
	    .PARAMETER SeriesName
	        Set the settings of a particular Series using its name and corresponding ChartArea.
	        The Series will be created if not found.
	        If SeriesIndex is set, it will replace the Series' name if the Series does not exist
	    
	    .PARAMETER Enable3D
	        The chart will be rendered in 3D.
	    
	    .PARAMETER Disable3D
	        The chart will be rendered in 2D.
	    
	    .PARAMETER AppendNew
	        When this switch is used, a new ChartArea is added to Chart Control.
	    
	    .NOTES
	        Additional information about the function.
	    
	    .LINK
	        http://www.sapien.com/blog/2011/05/05/primalforms-2011-designing-charts-for-powershell/
	#>
		
		param
		(
			[Parameter(Mandatory = $true, Position = 1)]
			[ValidateNotNull()]
			[System.Windows.Forms.DataVisualization.Charting.Chart]$ChartControl,
			[Parameter(Mandatory = $true, Position = 2)]
			[ValidateNotNull()]
			$XPoints,
			[Parameter(Mandatory = $true, Position = 3)]
			$YPoints,
			[Parameter(Mandatory = $false, Position = 4)]
			[string]$XTitle,
			[Parameter(Mandatory = $false, Position = 5)]
			[string]$YTitle,
			[Parameter(Mandatory = $false, Position = 6)]
			[string]$Title,
			[Parameter(Mandatory = $false, Position = 7)]
			[System.Windows.Forms.DataVisualization.Charting.SeriesChartType]$ChartType,
			[Parameter(Mandatory = $false, Position = 8)]
			[int]$SeriesIndex = -1,
			[Parameter(Mandatory = $false, Position = 9)]
			[int]$TitleIndex = 0,
			[Parameter(Mandatory = $false)]
			[string]$SeriesName = $null,
			[switch]$Enable3D,
			[switch]$Disable3D,
			[switch]$AppendNew
		)
		
		$ChartAreaIndex = 0
		if ($AppendNew)
		{
			$name = "ChartArea " + ($ChartControl.ChartAreas.Count + 1).ToString();
			$ChartArea = $ChartControl.ChartAreas.Add($name)
			$ChartAreaIndex = $ChartControl.ChartAreas.Count - 1
			
			$name = "Series " + ($ChartControl.Series.Count + 1).ToString();
			$Series = $ChartControl.Series.Add($name)
			$SeriesIndex = $ChartControl.Series.Count - 1
			
			$Series.ChartArea = $ChartArea.Name
			
			if ($Title)
			{
				$name = "Title " + ($ChartControl.Titles.Count + 1).ToString();
				$TitleObj = $ChartControl.Titles.Add($Title)
				$TitleIndex = $ChartControl.Titles.Count - 1
				$TitleObj.DockedToChartArea = $ChartArea.Name
				$TitleObj.IsDockedInsideChartArea = $false
			}
		}
		else
		{
			if ($ChartControl.ChartAreas.Count -eq 0)
			{
				$name = "ChartArea " + ($ChartControl.ChartAreas.Count + 1).ToString();
				[void]$ChartControl.ChartAreas.Add($name)
				$ChartAreaIndex = $ChartControl.ChartAreas.Count - 1
			}
			
			if ($ChartControl.Series.Count -eq 0)
			{
				if (-not $SeriesName)
				{
					$SeriesName = "Series " + ($ChartControl.Series.Count + 1).ToString();
				}
				
				$Series = $ChartControl.Series.Add($SeriesName)
				$SeriesIndex = $ChartControl.Series.Count - 1
				$Series.ChartArea = $ChartControl.ChartAreas[$ChartAreaIndex].Name
			}
			elseif ($SeriesName)
			{
				$Series = $ChartControl.Series.FindByName($SeriesName)
				
				if ($null -eq $Series)
				{
					if (($SeriesIndex -gt -1) -and ($SeriesIndex -lt $ChartControl.Series.Count))
					{
						$Series = $ChartControl.Series[$SeriesIndex]
						$Series.Name = $SeriesName
					}
					else
					{
						$Series = $ChartControl.Series.Add($SeriesName)
						$SeriesIndex = $ChartControl.Series.Count - 1
					}
					
					$Series.ChartArea = $ChartControl.ChartAreas[$ChartAreaIndex].Name
				}
				else
				{
					$SeriesIndex = $ChartControl.Series.IndexOf($Series)
					$ChartAreaIndex = $ChartControl.ChartAreas.IndexOf($Series.ChartArea)
				}
			}
		}
		
		if (($SeriesIndex -lt 0) -or ($SeriesIndex -ge $ChartControl.Series.Count))
		{
			$SeriesIndex = 0
		}
		
		$Series = $ChartControl.Series[$SeriesIndex]
		$Series.Points.Clear()
		$ChartArea = $ChartControl.ChartAreas[$Series.ChartArea]
		
		if ($Enable3D)
		{
			$ChartArea.Area3DStyle.Enable3D = $true
		}
		elseif ($Disable3D)
		{
			$ChartArea.Area3DStyle.Enable3D = $false
		}
		
		if ($Title)
		{
			if ($ChartControl.Titles.Count -eq 0)
			{
				#$name = "Title " + ($ChartControl.Titles.Count + 1).ToString();
				$TitleObj = $ChartControl.Titles.Add($Title)
				$TitleIndex = $ChartControl.Titles.Count - 1
				$TitleObj.DockedToChartArea = $ChartArea.Name
				$TitleObj.IsDockedInsideChartArea = $false
			}
			
			$ChartControl.Titles[$TitleIndex].Text = $Title
		}
		
		if ($ChartType)
		{
			$Series.ChartType = $ChartType
		}
		
		if ($XTitle)
		{
			$ChartArea.AxisX.Title = $XTitle
		}
		
		if ($YTitle)
		{
			$ChartArea.AxisY.Title = $YTitle
		}
		
		if ($XPoints -isnot [Array] -or $XPoints -isnot [System.Collections.IEnumerable])
		{
			$array = New-Object System.Collections.ArrayList
			$array.Add($XPoints)
			$XPoints = $array
		}
		
		if ($YPoints -isnot [Array] -or $YPoints -isnot [System.Collections.IEnumerable])
		{
			$array = New-Object System.Collections.ArrayList
			$array.Add($YPoints)
			$YPoints = $array
		}
		
		$Series.Points.DataBindXY($XPoints, $YPoints)
	}
	
	
	
	function Clear-Chart
	{
	<#
		.SYNOPSIS
			This function clears the contents of the chart
	
		.DESCRIPTION
			Use the function to remove contents from the chart control
	
		.PARAMETER  ChartControl
			The Chart Control to clear
	
		.PARAMETER  LeaveSingleChart
			Leaves the first chart and removes all others from the control
		
		.LINK
			http://www.sapien.com/blog/2011/05/05/primalforms-2011-designing-charts-for-powershell/
	#>
		Param (	
		[ValidateNotNull()]
		[Parameter(Position=1,Mandatory=$true)]
	  	[System.Windows.Forms.DataVisualization.Charting.Chart]$ChartControl
		,
		[Parameter(Position=2, Mandatory=$false)]
		[Switch]$LeaveSingleChart
		)
		
		$count = 0	
		if($LeaveSingleChart)
		{
			$count = 1
		}
		
		while($ChartControl.Series.Count -gt $count)
		{
			$ChartControl.Series.RemoveAt($ChartControl.Series.Count - 1)
		}
		
		while($ChartControl.ChartAreas.Count -gt $count)
		{
			$ChartControl.ChartAreas.RemoveAt($ChartControl.ChartAreas.Count - 1)
		}
		
		while($ChartControl.Titles.Count -gt $count)
		{
			$ChartControl.Titles.RemoveAt($ChartControl.Titles.Count - 1)
		}
		
		if($ChartControl.Series.Count -gt 0)
		{
			$ChartControl.Series[0].Points.Clear()
		}
	}
	
	
	#endregion
	
	# --End User Generated Script--
	#----------------------------------------------
	#region Generated Events
	#----------------------------------------------
	
	$Form_StateCorrection_Load=
	{
		#Correct the initial state of the form to prevent the .Net maximized form issue
		$formChildForm.WindowState = $InitialFormWindowState
	}
	
	$Form_StoreValues_Closing=
	{
		#Store the control values
		$script:ChildForm_cbRunning = $cbRunning.Checked
		$script:ChildForm_cbStopped = $cbStopped.Checked
	}

	
	$Form_Cleanup_FormClosed=
	{
		#Remove all event handlers from the controls
		try
		{
			$bReload.remove_Click($bReload_Click)
			$formChildForm.remove_Load($formChildForm_Load)
			$timer1.remove_Tick($timer1_Tick)
			$formChildForm.remove_Load($Form_StateCorrection_Load)
			$formChildForm.remove_Closing($Form_StoreValues_Closing)
			$formChildForm.remove_FormClosed($Form_Cleanup_FormClosed)
		}
		catch { Out-Null <# Prevent PSScriptAnalyzer warning #> }
	}
	#endregion Generated Events

	#----------------------------------------------
	#region Generated Form Code
	#----------------------------------------------
	$formChildForm.SuspendLayout()
	$chart1.BeginInit()
	#
	# formChildForm
	#
	$formChildForm.Controls.Add($label1)
	$formChildForm.Controls.Add($chart1)
	$formChildForm.Controls.Add($cbRunning)
	$formChildForm.Controls.Add($cbStopped)
	$formChildForm.Controls.Add($bReload)
	$formChildForm.Controls.Add($pServices)
	$formChildForm.Controls.Add($lblService)
	$formChildForm.AutoScaleDimensions = '6, 13'
	$formChildForm.AutoScaleMode = 'Font'
	$formChildForm.ClientSize = '992, 483'
	$formChildForm.Margin = '4, 4, 4, 4'
	$formChildForm.Name = 'formChildForm'
	$formChildForm.StartPosition = 'CenterParent'
	$formChildForm.Text = 'Child Form'
	$formChildForm.add_Load($formChildForm_Load)
	#
	# label1
	#
	$label1.AutoSize = $True
	$label1.Font = 'Microsoft Sans Serif, 12pt, style=Bold'
	$label1.Location = '720, 328'
	$label1.Name = 'label1'
	$label1.Size = '0, 23'
	$label1.TabIndex = 26
	$label1.UseCompatibleTextRendering = $True
	#
	# chart1
	#
	$chart1.BorderlineWidth = 3
	$System_Windows_Forms_DataVisualization_Charting_ChartArea_1 = New-Object 'System.Windows.Forms.DataVisualization.Charting.ChartArea'
	$System_Windows_Forms_DataVisualization_Charting_ChartArea_1.Name = 'ChartArea1'
	[void]$chart1.ChartAreas.Add($System_Windows_Forms_DataVisualization_Charting_ChartArea_1)
	$System_Windows_Forms_DataVisualization_Charting_Legend_2 = New-Object 'System.Windows.Forms.DataVisualization.Charting.Legend'
	$System_Windows_Forms_DataVisualization_Charting_Legend_2.Name = 'Legend1'
	[void]$chart1.Legends.Add($System_Windows_Forms_DataVisualization_Charting_Legend_2)
	$chart1.Location = '622, 12'
	$chart1.Name = 'chart1'
	$System_Windows_Forms_DataVisualization_Charting_Series_3 = New-Object 'System.Windows.Forms.DataVisualization.Charting.Series'
	$System_Windows_Forms_DataVisualization_Charting_Series_3.ChartArea = 'ChartArea1'
	$System_Windows_Forms_DataVisualization_Charting_Series_3.ChartType = 'Spline'
	$System_Windows_Forms_DataVisualization_Charting_Series_3.Legend = 'Legend1'
	$System_Windows_Forms_DataVisualization_Charting_Series_3.Name = 'Series1'
	[void]$chart1.Series.Add($System_Windows_Forms_DataVisualization_Charting_Series_3)
	$chart1.Size = '300, 300'
	$chart1.TabIndex = 25
	$chart1.Text = 'chart1'
	#
	# cbRunning
	#
	$cbRunning.AutoSize = $True
	$cbRunning.Location = '71, 259'
	$cbRunning.Name = 'cbRunning'
	$cbRunning.Size = '65, 18'
	$cbRunning.TabIndex = 23
	$cbRunning.Text = 'Running'
	$cbRunning.UseCompatibleTextRendering = $True
	$cbRunning.UseVisualStyleBackColor = $True
	#
	# cbStopped
	#
	$cbStopped.AutoSize = $True
	$cbStopped.Location = '143, 259'
	$cbStopped.Name = 'cbStopped'
	$cbStopped.Size = '65, 18'
	$cbStopped.TabIndex = 22
	$cbStopped.Text = 'Stopped'
	$cbStopped.UseCompatibleTextRendering = $True
	$cbStopped.UseVisualStyleBackColor = $True
	#
	# bReload
	#
	$bReload.Location = '356, 259'
	$bReload.Name = 'bReload'
	$bReload.Size = '75, 23'
	$bReload.TabIndex = 21
	$bReload.Text = 'recherche'
	$bReload.UseCompatibleTextRendering = $True
	$bReload.UseVisualStyleBackColor = $True
	$bReload.add_Click($bReload_Click)
	#
	# pServices
	#
	$pServices.BackColor = 'Silver'
	$pServices.Location = '18, 282'
	$pServices.Name = 'pServices'
	$pServices.Size = '332, 148'
	$pServices.TabIndex = 18
	#
	# lblService
	#
	$lblService.Location = '15, 259'
	$lblService.Name = 'lblService'
	$lblService.Size = '65, 17'
	$lblService.TabIndex = 17
	$lblService.Text = 'Services :'
	$lblService.UseCompatibleTextRendering = $True
	#
	# timer1
	#
	$timer1.Enabled = $True
	$timer1.Interval = 2000
	$timer1.add_Tick($timer1_Tick)
	$chart1.EndInit()
	$formChildForm.ResumeLayout()
	#endregion Generated Form Code

	#----------------------------------------------

	#Save the initial state of the form
	$InitialFormWindowState = $formChildForm.WindowState
	#Init the OnLoad event to correct the initial state of the form
	$formChildForm.add_Load($Form_StateCorrection_Load)
	#Clean up the control events
	$formChildForm.add_FormClosed($Form_Cleanup_FormClosed)
	#Store the control values when form is closing
	$formChildForm.add_Closing($Form_StoreValues_Closing)
	#Show the Form
	return $formChildForm.ShowDialog()

}
#endregion Source: ChildForm.psf

#Start the application
Main ($CommandLine)
