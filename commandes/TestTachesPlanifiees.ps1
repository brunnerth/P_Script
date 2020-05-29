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
     Script permetant de palnifiée l'ouverture 
 	
.DESCRIPTION
    Script permetant de planifiée l'ouveture d'un site web a une heure voulu
  	
.EXAMPLE
    .\TestTachesPlanifiees.ps1
    TaskPath                                       TaskName                          State     
    --------                                       --------                          -----     
    \                                              Chrome 637260995116706949         Ready
#>
<#
# Méthode permetant de palanifier l'ouverture de navigateur par défaut sur un site web a une heure précise
#
# @param $site Lien vers le site souhaiter
# @param $heure Heure souhiaiter pour l'ouverture de chrome
# @param $daily Si la taches s'effectue chaque jour
# @param $link Lien vers le navigateur apr défaut
# @retrun -
#>
function ScheduledTask(){
    param(
    $site
    ,$heure
    ,$daily
    ,$link
    )
    $description = "";
    $action= New-ScheduledTaskAction -Execute $link -Argument $site;
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
    $taskName = "Ouverture navigateur " + (get-date).ticks;
    Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $taskName -Description $description;
} 
<#
# Méthode permetant de palanifier l'ouverture de navigateur par défaut sur un site web a une heure précise
#
# @param $site Lien vers le site souhaiter
# @param $heure Heure souhiaiter pour l'ouverture de chrome
# @param $daily Si la taches s'efefctue chaque jour
# @retrun -
#>
function SchedulTask(){
    param(
    $site
    ,$heure
    ,$daily
    )
    $navDefault = Get-ItemProperty HKCU:\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice
    switch($navDefault.ProgId)
    {
        "ChromeHTML"
        {
            ScheduledTask -site $siteChrome -heure $date -daily $daily -link "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe";
        } 
        "FirefoxURL"
        {
            ScheduledTask -site $siteChrome -heure $date -daily $daily -link "C:\Program Files\Mozilla Firefox\firefox.exe";
        }
        default
        {
            ScheduledTask -site $siteChrome -heure $date -daily $daily -link "C:\Program Files\Internet Explorer\iexplore.exe";
        }    
    }
}
$siteChrome = "https://www.adkami.com/";
try
{
    $date = [datetime]::parseexact("1dede0", 'HH:mm', $nulls);
}
catch [System.FormatException]
{
    $date = [datetime]::parseexact("00:00", 'HH:mm', $nulls);
}
if(!($siteChrome -eq $null))
{
    SchedulTask -site $siteChrome -heure $date -daily $true;
}