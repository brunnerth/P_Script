<#
.NOTES
    *****************************************************************************
	ETML
	Name: 	GetStartAppli.ps1
    Author:	Brunner Théo
    Date:	08.05.2020
 	*****************************************************************************
    Modifications
 	Date  : -
 	Author: -
 	Reason: -
 	*****************************************************************************
.SYNOPSIS
    Affiche les infos d'utilisateur du processeurs
 	
.DESCRIPTION
    Affiche les infos d'utilisateur du processeurs, pourcentage d'utilisation, température et pourcentage d'utilisation de la frécence
  	
.EXAMPLE
    
#>
Add-Type -Path "$PSScriptRoot\OpenHardwareMonitor\OpenHardwareMonitorLib.dll";
$Comp = New-Object -TypeName OpenHardwareMonitor.Hardware.Computer;
<#
# Retrourne les infos d'utilisatation du processeur
#
# @param -
# @retrun Retourne les infos d'utilisatation du processeur
#>
function GetInfCpu(){
    $Comp.Open();
 
    $Comp.CPUEnabled = $true;
    $tabInfosUsed= @();
    $nbCoeur = 0;
    $totalSpeed = 0;
    $totalSpeedMax = 0;
    $moyenneSpeed = 0;
    $moyenneSpeedMax = 0;
    ForEach ($HW in $Comp.Hardware) 
    {
        $HW.Update();
        If ( $hw.HardwareType -eq "CPU")
        {
            ForEach ($Sensor in $HW.Sensors) 
            {
                If ($Sensor.SensorType -eq "Temperature" -and $Sensor.Name -eq "CPU Package")
                {
                    $tabInfosUsed += ,@{Name=$Sensor.Name; Value=$Sensor.Value.ToString()}; 
                }
                elseif($Sensor.SensorType -eq "Load" -and $Sensor.Name -eq "CPU Total")
                {
                    $tabInfosUsed += ,@{Name=$Sensor.Name; Value=$Sensor.Value.ToString()};
                }
                elseif($Sensor.SensorType -eq "Clock" -and !($Sensor.Name -eq "Bus Speed"))
                {
                    $totalSpeed += $Sensor.Value.ToString();
                    $totalSpeedMax += $Sensor.Max.ToString();
                    $nbCoeur++;
                }
            }
        }
    }
    $moyenneSpeed = $totalSpeed / $nbCoeur;
    $moyenneSpeed /=1000;
    $moyenneSpeedMax = $totalSpeedMax / $nbCoeur;
    $moyenneSpeedMax /= 1000; 
    $pourcentSpeed = $moyenneSpeed* 100 / $moyenneSpeedMax;
    $tabInfosUsed += ,@{Name="CPU Speed"; Value=$pourcentSpeed};
    $Comp.Close();
    return $tabInfosUsed; 
}
$tabInf = GetInfCpu;
for($i = 0; $i -lt $tabInf.Count; $i++)
{
    if($tabInf[$i].Name -eq "CPU Package")
    {
        "Température du processeur " + $tabInf[$i].Value +  "°C";
    }
    elseif($tabInf[$i].Name -eq "CPU Total")
    {
        "Pourcentage du processeur utilisés " + $tabInf[$i].Value + "%";
    }
    elseif($tabInf[$i].Name -eq "CPU Speed")
    {
        "Pourcentage de al vitesse du processeur utilisés " + $tabInf[$i].Value + "%";
    }
}