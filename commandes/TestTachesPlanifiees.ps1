<#
.NOTES
    *****************************************************************************
	ETML
	Name: 	TestTachesPlanifiees.ps1
    Author:	Brunner Théo
    Date:	08.05.2020
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
# Méthode permetant de récupérer les applications au démarrage
#
# @param $site Lien vers le site souhaiter
# @retrun -
#>
function SchedulTaskChrome($site){
    $action= New-ScheduledTaskAction -Execute "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" -Argument $site;
    $trigger= New-ScheduledTaskTrigger -Once -At 14:12;
    $taskName = "Chrome " + (get-date).ticks;
    Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $taskName -Description Test;
}
SchedulTaskChrome("https://www.adkami.com/");