<#
.NOTES
    *****************************************************************************
	ETML
	Name: 	GetService.ps1
    Author:	Brunner Théo
    Date:	07.04.2020
 	*****************************************************************************
    Modifications
 	Date  : -
 	Author: -
 	Reason: -
 	*****************************************************************************
.SYNOPSIS
    Prends les satus 
 	
.DESCRIPTION
    Prends les status par rapport à ce que l'utilisateur veut
  	
 	
.EXAMPLE
    .\GetService.ps1
    Result: 
 	AarSvc_c378de9
    AGMService
    AGSService
    AJRouter etc
#>
 
 <#
# Prends les services par rapport au status donnée
#
# @param Status que l'utilisateur souhaite voir
# @retrun Retorune les sevices par rappprot au status du parametre
#>
function GetService($status){
    
    switch($status)
    {
        "stoping"
        {
            $services = Get-Service | Where-Object {$_.status -eq "stoping"};
            break;
        }
        "starting"
        {
            $services = Get-Service | Where-Object {$_.status -eq "starting"};
            break;
        }
        "running"
        {
            $services = Get-Service | Where-Object {$_.status -eq "running"};
            break;
        }
        "stopped"
        {
            $services = Get-Service | Where-Object {$_.status -eq "stopped"};
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
$services = GetService("");

for($i =0; $i-lt $services.Length;$i++)
{
    Write-Host $services[$i].Name;
}