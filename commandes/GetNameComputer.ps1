<#
.NOTES
    *****************************************************************************
	ETML
	Name: 	GetNameComputer.ps1
    Author:	Brunner Théo
    Date:	07.04.2020
 	*****************************************************************************
    Modifications
 	Date  : -
 	Author: -
 	Reason: -
 	*****************************************************************************
.SYNOPSIS
    Prends le nom du pc
 	
.DESCRIPTION
    Containt un méthode qui prends le nom du pc
  	
.EXAMPLE
    ./GetNameComputer.ps1
 	Result: DESKTOP-Q7HKTRL
#>

 <#
# Prends le nom du l'ordinateur
#
# @param -
# @retrun Retrourne le nom de l'ordinateur
#>
function GetName{
    $computerName =  [system.environment]::MachineName;
    return $computerName;
}
$computerName = GetName;
Write-Host $computerName;