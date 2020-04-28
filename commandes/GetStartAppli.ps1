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
# 
#
# @param -
# @retrun -
#>
function GetStartAppli(){
    
}
Get-CimInstance win32_startupcommand | Select-Object Name, command, Location, User| Format-List;
$startupappli = Get-CimInstance win32_startupcommand;
for($i =0; $i-lt $startupappli.Length;$i++)
{
    Write-Host $startupappli[$i].Name $startupappli[$i].Location;
}