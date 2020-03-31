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
    Conenct to database and verfication of the username and passeord is valide into database
    
.PARAMETER _userName
    Nom de l'utilisateur

.PARAMETER _password
    Mot de passe de l'utilisateur
     	
.EXAMPLE
    .\VerificationLogin.ps1 -_userName "User1" -_password ".Etml-"
    Result: True
#>
param($_userName, [string]$_password)
#Code provient de http://get-powershell.com/post/2008/12/13/Encrypting-and-Decrypting-Strings-with-a-Key-in-PowerShell.aspx
function Get-EncryptedData {
    param($key,$data)
    $data | ConvertTo-SecureString -key $key |
    ForEach-Object {[Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($_))}
}
#Code provient de https://stackoverflow.com/questions/42801713/store-a-text-in-encrypted-form-and-use-in-powershell-script-without-compromising
function Set-Key {
    param([string]$string)
    $length = $string.length
    $pad = 32-$length
    if (($length -lt 16) -or ($length -gt 32)) 
    {
        Throw "String must be between 16 and 32 characters"
    }
    $encoding = New-Object System.Text.ASCIIEncoding
    $bytes = $encoding.GetBytes($string + "0" * $pad)
    return $bytes
}
[void][System.Reflection.Assembly]::LoadFrom("C:\Program Files (x86)\MySQL\MySQL Connector Net 8.0.19\Assemblies\v4.5.2\MySql.Data.dll")
function VerifUser
{
    param([string]$userName, [string] $password)
    # Information for the connection.
    $sqlServer = "localhost"
    $sqlDBName = "db_script_thomeyer"
    $user = "db_Script_User"
    $passwordDb = ".Etml-"
    $sqlConnectionString = "Server = $sqlServer; Database = $sqlDBName; Integrated Security = True; User ID = $user; Password = $passwordDb";
    try
    {
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
            #$passwordEncrypted = ConvertTo-SecureString $password -AsPlainText -Force | ConvertFrom-SecureString -Key ([System.Text.Encoding]::ASCII.GetBytes("Kaguya-samawaKokurasetaiTensaiS2"));
            $key = Set-Key -string "Kaguya-samawaKokurasetaiTensaiS2";
            $passwordDecrypt = Get-EncryptedData -Data $res.usePassword[$i] -key $key;
            if(($res.useLogin[$i] -eq $userName) -and ($password -eq $passwordDecrypt))
            {
                $verification = $true;
            }
        }
        if($verification)
        {
            return $true;
        }
        else
        {
            return $false;
        }
    }
    catch [Exception]
    {
        Write-Warning "Il y a une erreur inconnu, verifier que le serveur mysql est lancé.";
    }
}
VerifUser -userName $_userName -password $_password;