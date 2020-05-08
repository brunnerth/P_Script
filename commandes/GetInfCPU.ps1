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
<#
# Retrourne la vitesse du processeur
#
# @param -
# @retrun Retourne la vitesse du processeur
#>
function GetClockSpeed(){
    $Processor = Get-WmiObject -class Win32_Processor;
    return $Processor.CurrentClockSpeed ;
}
<#
# Retrourne la moyenne utilisée du processeur
#
# @param -
# @retrun Retourne la moyenne utilisée du processeur
#>
function GetCPUsed(){
    Get-WmiObject win32_processor |Measure-Object -property LoadPercentage -Average | Select Average;
}
CLS
 
Add-Type -Path "OpenHardwareMonitorLib.dll"
$Comp = New-Object -TypeName OpenHardwareMonitor.Hardware.Computer
 
$Comp.Open()
 
$Comp.CPUEnabled = $true
 
ForEach ($HW in $Comp.Hardware) {
 
$HW.Update()
    $hw.HardwareType.ToString() + ' - ' + $hw.name.ToString()
 
    If ( $hw.HardwareType -eq "CPU"){
        ForEach ($Sensor in $HW.Sensors) {
 
        If ($Sensor.SensorType -eq "Temperature"){
             
            $Sensor.Name + ' - Temp : ' + $Sensor.Value.ToString() + ' C - Min. : ' + $Sensor.Min.ToString() + ' C - Max : ' + $Sensor.Max.ToString() + ' C'
        }
      }
    }
    
    # $hw.Sensors
    $hw.SubHardware
}
$Comp.Close()