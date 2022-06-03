Add-PSSnapin -Name ktools.powershell.sftp

$sftpHost = "12.11.112.5"

$port = "1255"

$userName = "yourUserName"

$userPassword = "yourPassword"

$files = "C:\file1.txt", "C:\file2.txt", "C:\file3.txt" #specify full path to  your files here

$sftp = Open-SFTPServer -serverAddress $sftpHost -userName $userName -userPassword $userPassword
foreach($file in $files){

$sftp.Put($file, "/usr/home/transfer")
}

#Close the SFTP connection

$sftp.Close()