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
    Programme permetant la gestion des applis au démmarrage
 	
.DESCRIPTION
    Programme permetant d'activer/désactiver et récuper la liste des applications qui se lance au démarrage et si elles sont activés ou non
  	
.EXAMPLE
    .\GetStartAppli.ps1
    OneDriveSetup Enable
    OneDrive Disable
    utweb Disable
    Discord Disable
    Steam Disable
    uTorrent Disable
    NoxDaemon Disable
    CAM Enable
    LGHUB Enable
    SecurityHealth Disable
    AdobeGCInvoker-1.0 Disable
    RtkAudUService Enable
#>
 
<#
# Méthode permetant de récupérer les applications au démarrage
#
# @param -
# @retrun Toutes les application qui peuvent se lancer au démarrage
#>
function GetStartAppli(){
     $startupappli = Get-CimInstance -ClassName Win32_StartupCommand | Select-Object -Property Command, Location, Name, User, Description;
     return $startupappli;
}
<#
# Méthode permetant de récupérer les applications qui se lance vraiment au démarrage
#
# @param Toutes les aplications qui peuvent se lancer au démarrage
# @retrun Le nom et si les application sont activé au démarrage
#>
function GetEnableOrDisable($startupapplis){
    $tableEnable= @();
    for($i = 0; $i -lt $startupappli.Count;$i++)
    {
        if($startupappli[$i].Location -eq "HKU\S-1-5-21-2014756496-2923043445-477522502-1001\SOFTWARE\Microsoft\Windows\CurrentVersion\Run")
        {
            $itemProperty = Get-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run -Name $startupappli[$i].Name;
            $name = $startupappli[$i].Name;
            if($itemProperty.$name[0] -eq 2 -or $itemProperty.$name[0] -eq 6)
            {
                $tableEnable += ,@{Name=$startupapplis[$i].Name; Enable=$true}
            }
            else
            {
                $tableEnable += ,@{Name=$startupapplis[$i].Name; Enable=$false}
            }
        }
        elseif($startupappli[$i].Location -eq "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run")
        {
            $itemProperty = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run -Name $startupappli[$i].Name;
            $name = $startupapplis[$i].Name;
            if($itemProperty.$name[0] -eq -or $itemProperty.$name[0] -eq 6)
            {
                $tableEnable += ,@{Name=$startupapplis[$i].Name; Enable=$true}
            }
            else
            {
                $tableEnable += ,@{Name=$startupapplis[$i].Name; Enable=$false}
            }
        }
        else
        {
            $tableEnable += ,@{Name=$startupapplis[$i].Name; Enable=$true}
        }
    }
    return  $tableEnable;
}
<#
# Méthode permetant d'activer une application au démarrage
#
# @param $location La localisation de l'application dans le registre
# @param $name Nom de l'application dans le registre
# @retrun -
#>
function Enable(){
    param (
    $location, 
    $name
    )
    if($location -eq "HKU\S-1-5-21-2014756496-2923043445-477522502-1001\SOFTWARE\Microsoft\Windows\CurrentVersion\Run")
    {
        Set-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run -Name $name -Value ([byte[]](0x02,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00))
    }
    elseif($location -eq "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run")
    {
        if($name = "SecurityHealth")
        {
            Set-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run -Name $name -Value ([byte[]](0x06,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00))
        }
        else
        {
            Set-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run -Name $name -Value ([byte[]](0x02,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00))
        }
    }
}
<#
# Méthode permetant de desactiver une application au démarrage
#
# @param $location La localisation de l'application dans le registre
# @param $name Nom de l'application dans le registre
# @retrun -
#>
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
$startupappli = GetStartAppli;
$enableOrDisable = GetEnableOrDisable ($startupappli);
for($i = 0; $i -lt $startupappli.Count;$i++)
{
    if($enableOrDisable[$i].Enable)
    {
        Write-Host $enableOrDisable[$i].Name Enable;
    }
    else{
        Write-Host $enableOrDisable[$i].Name Disable;
    }
}