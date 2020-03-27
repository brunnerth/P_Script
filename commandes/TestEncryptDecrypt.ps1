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
    Encrypt and decrypt
 	
.DESCRIPTION
    Encrypt and decrypt a password the password is .Etml-44
 	
.EXAMPLE
    ./TestEncryptDecrypt.ps1
    Result:01000000d08c9ddf0115d1118c7a00c04fc297eb01000000c1e854fc55fc864f91034531e7dea61600000000020000000000106600000001000020000000cfddcb0905b89415110bc67cf1985bedfa1d84bcb7a54f
    b0781f6ce1822a481e000000000e80000000020000200000007af96dfe9a059803b001e4e15ca54d0b9f1b3f05fb9f49168bbaf5b91bc967ba20000000e941dce0c01fad2e8092070549cafd92c33aaed43026c905
    de89b5405f5b580e400000004e2f571708bfaf30825dcb6ae1046b71f6ff26fe5c77788adeaebb2b9a3a99560280f66e77118327d4d7556c4c2259ef3d66ff7e5671a7446ded6dd928d6a6b5
    .Etml-44
#>
$User = "Test";
$password = ".Etml-44" | ConvertTo-SecureString -AsPlainText -Force | ConvertFrom-SecureString;
$password.GetType().FullName;
$securestring = $password | ConvertTo-SecureString;
$UserCred = New-Object System.Management.Automation.PSCredential ($User, $securestring);
$Password2 = $UserCred.GetNetworkCredential().password;
$Password2;