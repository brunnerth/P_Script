<#
.NOTES
    *****************************************************************************
	ETML
	Name: 	RamValue.ps1
    Author:	Brunner Théo
    Date:	03.04.2020
 	*****************************************************************************
    Modifications
 	Date  : -
 	Author: -
 	Reason: -
 	*****************************************************************************
.SYNOPSIS
    Get value of ram
 	
.DESCRIPTION
    Get the speed, the total capacity and the cosommate
    
     	
.EXAMPLE
    .\RamValue.ps1
    Nothing view
#>
# Retroune la vitesse moyenne de la ram
#
# @param -
# @retrun Retroune la vitesse moyenne de la ram
#>
function GetSpeed{
    $tabBarette = Get-WmiObject win32_physicalmemory;
    $totalRamFrequency = 0;
    for($i =0; $i-lt $tabBarette.Length;$i++)
    {
        $totalRamFrequency +=  $tabBarette[$i].Speed;
    }
    $moyenne = $totalRamFrequency / $tabBarette.Length;
    return $moyenne;
}
 <#
# Retroune le nombre total de byte des barettes de ram
#
# @param -
# @retrun Retourne le nombre total de byte des barettes de ram
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
<#
# Retroune le nombre de gigabytes de ram utilisé
#
# @param -
# @retrun Retourne le nombre de gigabytes de ram utilisé
#>
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
$moyenneSpeed = GetSpeed;
$total;
$ramUsed;
$moyenneSpeed;