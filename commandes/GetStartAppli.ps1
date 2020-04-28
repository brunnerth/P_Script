<#
.NOTES
    *****************************************************************************
	ETML
	Name: 	GetStartAppli.ps1
    Author:	Brunner Théo
    Date:	07.04.2020
 	*****************************************************************************
    Modifications
 	Date  : -
 	Author: -
 	Reason: -
 	*****************************************************************************
.SYNOPSIS
    
 	
.DESCRIPTION
    
  	
.EXAMPLE
    
#>
 
 <#Get-StartupApplication
# 
#
# @param -
# @retrun -
#>
function GetStartAppli(){
     $startupappli = Get-CimInstance -ClassName Win32_StartupCommand | Select-Object -Property Command, Location, Name, User, Description;
     return $startupappli;
}
function Disable(){
    param (
    $location, 
    $name
    )
    if($location -eq "HKU\S-1-5-21-2014756496-2923043445-477522502-1001\SOFTWARE\Microsoft\Windows\CurrentVersion\Run")
    {
        Set-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run -Name $name -Value ([byte[]](0x03,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00))
    }
    elseif($location -eq "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run")
    {
        Set-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run -Name $name -Value ([byte[]](0x03,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00))
    }
}
#Get-CimInstance win32_startupcommand | Select-Object Name, command, Location, User| Format-List;
#Get-CimInstance win32_startupcommand;
$startupappli = Get-CimInstance win32_startupcommand;
for($i =0; $i-lt $startupappli.Length;$i++)
{
    #Write-Host $startupappli[$i].Name $startupappli[$i].Location;
}
#Probleme passage parametre
Disable -location $startupappli[4].Location -name $startupappli[4].Name;