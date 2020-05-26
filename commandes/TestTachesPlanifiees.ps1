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
    .\TestTachesPlanifiees.ps1
    TaskPath                                       TaskName                          State     
    --------                                       --------                          -----     
    \                                              Chrome 637260995116706949         Ready
#>
<#
# Méthode permetant de palanifier l'ouverture de chrome sur un site web a une heure précise
#
# @param $site Lien vers le site souhaiter
# @param $heure Heure souhiaiter pour l'ouverture de chrome
# @param $daily Si la taches s'efefctue chaque jour
# @retrun -
#>
function SchedulTaskChrome(){
    param(
    $site
    ,$heure
    ,$daily
    )
    $description = "";
    $action= New-ScheduledTaskAction -Execute "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" -Argument $site;
    if($daily)
    {
        $trigger= New-ScheduledTaskTrigger -Daily -At $heure;
        $description = "Ouverture de chrome sur un site tous les jours";
    }
    else
    {
        $trigger= New-ScheduledTaskTrigger -Once -At $heure;
        $description = "Ouverture de chrome sur un site une seule foi";
    }
    $taskName = "Chrome " + (get-date).ticks;
    Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $taskName -Description $description;
}
$siteChrome = "https://www.adkami.com/";
try
{
    $date = [datetime]::parseexact("00:00", 'HH:mm', $nulls);
}catch [System.FormatExceptions]
{
    $date = [datetime]::parseexact("00:00", 'HH:mm', $nulls);
}
if(!($siteChrome -eq $null))
{
    SchedulTaskChrome -site $siteChrome -heure $date -daily $true;
}