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
    Connect to databse and verfication
 	
.DESCRIPTION
    
.PARAMETER 
 	
.EXAMPLE
    
#>
param($userName, [string]$password)
[void][System.Reflection.Assembly]::LoadFrom("C:\Program Files (x86)\MySQL\MySQL Connector Net 8.0.19\Assemblies\v4.5.2\MySql.Data.dll")

# Information for the connection.
$sqlServer = "localhost"
$sqlDBName = "db_script_thomeyer"
$user = "db_Script_User"
$password = ".Etml-"
$sqlConnectionString = "Server = $sqlServer; Database = $sqlDBName; Integrated Security = True; User ID = $user; Password = $password";

# Connection
$sqlConnection = New-Object Mysql.Data.MySqlClient.MySqlConnection($sqlConnectionString);
$sqlConnection.Open();

#Query
$sqlQuery = "SELECT T1.useLogin, T1.usePassword FROM t_user AS T1";

#Adapter
$command = New-Object MySql.Data.MySqlClient.MySqlCommand($sqlQuery, $sqlConnection)

$dataAdapter = New-Object MySql.Data.MySqlClient.MySqlDataAdapter($command);
$dataSet = New-Object System.Data.DataSet;
$recordCount = $dataAdapter.Fill($dataSet, "data");
$sqlConnection.Close();

#Show result
$res = $dataSet.Tables[0];
$verification = $false;
for($i = 0; $i -lt $res.useLogin.Length; $i++)
{
    $User = $userName;
    $passwordEncrypted = $password | ConvertTo-SecureString | ConvertFrom-SecureString;
    if(($res.useLogin[$i] -eq $userName) -and ($res.usePassword[$i] -eq $passwordEncrypted))
    {
        $verification = $true;
    }
}
if($verification)
{
    Write-Host("Yes");
}
else
{
    Write-Host("No");
}