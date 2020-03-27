CLS
 
Add-Type -Path "C:\Users\Noah-PC\Desktop\OpenHardwareMonitorLib.dll"
 
$Comp = New-Object -TypeName OpenHardwareMonitor.Hardware.Computer
 
$Comp.Open()
 
$Comp.CPUEnabled = $true
 
$Comp.RAMEnabled = $true
 
$Comp.MainboardEnabled = $true
 
$Comp.FanControllerEnabled = $true
 
$Comp.GPUEnabled = $true
 
$Comp.HDDEnabled = $true
 
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