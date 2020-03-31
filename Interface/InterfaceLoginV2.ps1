
$form = New-Object Windows.Forms.Form
$lblLogin = New-Object Windows.Forms.Label 
$lblPassword = New-Object Windows.Forms.Label 
$tbLogin = New-Object Windows.Forms.TextBox
$tbPassword = New-Object Windows.Forms.TextBox
$label1 = New-Object System.Windows.Forms.Label
$bLogin = New-Object System.Windows.Forms.Button


$lblLogin.AutoSize = $true;
$lblLogin.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 20)
$lblLogin.Location = New-Object System.Drawing.Point(51, 158);
$lblLogin.Name = "lblLogin";
$lblLogin.Size = New-Object System.Drawing.Size(77, 25);
$lblLogin.TabIndex = 0;
$lblLogin.Text = "Login :";

$lblPassword.AutoSize = $true;
$lblPassword.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 20)
$lblPassword.Location = New-Object System.Drawing.Point(51, 267);
$lblPassword.Name = "lblPassword";
$lblPassword.Size = New-Object System.Drawing.Size(106, 25);
$lblPassword.TabIndex = 1;
$lblPassword.Text = "Password";
 
$tbLogin.Location = New-Object System.Drawing.Point(56, 201);
$tbLogin.Name = "tbLogin";
$tbLogin.Size = New-Object System.Drawing.Size(240, 20);
$tbLogin.TabIndex = 2;

$tbPassword.Location = New-Object System.Drawing.Point(56, 313);
$tbPassword.Name = "tbPassword";
$tbPassword.Size = New-Object System.Drawing.Size(240, 20);
$tbPassword.TabIndex = 3;
$tbPassword.PasswordChar = '*';

$label1.AutoSize = $true;
$label1.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",22)
$label1.Location = New-Object System.Drawing.Point(16, 58);
$label1.Name = "label1";
$label1.Size = New-Object System.Drawing.Size(370, 33);
$label1.TabIndex = 4;
$label1.Text = "Welcome to GestionTION";

$bLogin.Location = New-Object System.Drawing.Point(221, 367)
$bLogin.Name = "bLogin";
$bLogin.Size = New-Object System.Drawing.Size(75, 23);
$bLogin.TabIndex = 5;
$bLogin.Text = "Login";
$bLogin.UseVisualStyleBackColor = $true;


$bLogin.Add_Click(
        {    
            $verif = VerifUser -userName $tbLogin.Text -password $tbPassword.Text 
            if($verif)
            {
            [System.Windows.MessageBox]::Show('kek')
            }
            else
            {
            [System.Windows.MessageBox]::Show('notkek')
            }

        }
)




$form.MaximizeBox = $False
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$form.AutoScaleDimensions = New-Object System.Drawing.SizeF(20, 60);
$form.Size = New-Object System.Drawing.Size(398, 540);
$form.Controls.Add($label1);
$form.Controls.Add($lblPassword);
$form.Controls.Add($lblLogin);
$form.Controls.Add($tbLogin);
$form.Controls.Add($tbPassword);
$form.Controls.Add($bLogin);
$form.Name = "Form1";
$form.Text = "GestionTION";
$form.PerformLayout();

$form.ShowDialog();

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
[void][System.Reflection.Assembly]::LoadFrom("F:\Script\MySql.Data.dll")
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


