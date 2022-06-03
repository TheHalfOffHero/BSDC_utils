#
#  Written by: Matt R.
#  Purpose: To mass import a list of Users into bsdcsb AD at the given OU
#
#  Note: Password can be hard coded in if needed, The OU Path will need to be updated depending on the CU.
#        csv format is below, it needs to be in the hardware documents folder to work.

#Format of CSV file is 
#"Givenname","Surname","SamAccountName","DisplayName"
$Users = Import-Csv -Delimiter "," -Path "C:\Users\hardware\Documents\ADusers.csv"

#Write-Host ($Users | Format-Table | Out-String)

$Password = (Read-Host -AsSecureString "Input Password")

#Will need to be updated depending on the CU.
$OU = "OU=Altamaha Federal Credit Union,OU=Credit Union's,DC=bsdcsb,DC=local'"

foreach ($User in $Users)
{
    $Displayname = $User.DisplayName
    $UserFirstname = $User.Givenname
    $UserLastname = $User.Surname
    $SAM = $User.SamAccountName
    $UPN = $User.SamAccountName + "@bsdcsb.local"
    New-ADUser -Name "$Displayname" -GivenName "$UserFirstname" -Surname "$UserLastname" -SamAccountName "$SAM" -UserPrincipalName "$UPN" -Path "OU=Altamaha Federal Credit Union Users,OU=Altamaha Federal Credit Union,OU=Credit Union's,DC=bsdcsb,DC=local" -AccountPassword $Password -Enabled $true

}

#Working Line
#New-ADUser -Name "Jack Robinson" -GivenName "Jack" -Surname "Robinson" -SamAccountName "J.Robinson" -UserPrincipalName "J.Robinson@bsdcsb.local" -Path "OU=Altamaha Federal Credit Union Users,OU=Altamaha Federal Credit Union,OU=Credit Union's,DC=bsdcsb,DC=local" -AccountPassword(Read-Host -AsSecureString "Input Password") -Enabled $true
