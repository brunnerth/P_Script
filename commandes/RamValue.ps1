<#
.NOTES
    *****************************************************************************
	ETML
	Name: 	TestEncryptDecrypt.ps1
    Author:	Brunner Théo
    Date:	27.03.2020
 	*****************************************************************************
    Modifications
 	Date  : -
 	Author: -
 	Reason: -
 	*****************************************************************************
.SYNOPSIS
    Get value of ram
 	
.DESCRIPTION
    CGet the speed, the total capacity and the cosommate
    
     	
.EXAMPLE
    .\RamValue.ps1
    Nothing view
#>
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
$total = GetTotalRam;
$ramUsed = GetUsedRam;