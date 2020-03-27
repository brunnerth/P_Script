
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
		[System.Windows.Forms.MessageBox]::Show($tbLogin.Text + $tbPassword.Text  , "My Dialog Box")
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