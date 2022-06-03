#Powershell WinSCP upload script
#  Written by Matt R. using example from https://winscp.net/eng/docs/library_powershell

#Attempt to unblock the powershell script
#Unblock-File -Path U:\Scripts\PowerShell\SftpUpload.ps1

#Adds .NET assembly from C:/Users/$user/WinSCPnet.dll
#Add-Type -Path "WinSCPnet.dll"

#Adds .NET assembly from location of script
#Add-Type -Path (Join-Path $PSScriptRoot "WinSCPnet.dll")

#ssh-rsa 2048 d5:09:ad:41:c4:d2:eb:d3:2a:db:eb:35:18:cf:fc:ab

try 
{
    #First we load the .NET assembly for WinSCP
    Add-Type -Path (Join-Path $PSScriptRoot "WinSCPnet.dll")

    #Setup the session options, using DR server for testing
    $sessionOptions = New-Object WinSCP.SessionOptions -Property @{
        Protocol = [WinSCP.Protocol]::Sftp
        HostName = "10.255.255.66"
        UserName = "root"
        Password = "bsdc"
        SshHostKeyFingerprint = "ssh-rsa 2048 d5:09:ad:41:c4:d2:eb:d3:2a:db:eb:35:18:cf:fc:ab"
    }
    #Start the WinSCP session - used each time we want to take an action
    $session = New-Object WinSCP.Session

    try 
    {
        #Connecting
        $session.Open($sessionOptions)

        #Upload files
        $transferOptions = New-Object WinSCP.TransferOptions
        $transferOptions.TransferMode = [WinSCP.TransferMode]::Binary

        $transferResult = $session.PutFiles("C:\test\*", "/sftpTest/", $False, $transferOptions)

        # Throw on any error
        $transferResult.Check()

        #Writes to the console the success or failure of each file we tried to upload.
        foreach ($transfer in $transferResult.Transfers)
        {
            Write-Host "Upload of $($transfer.FileName) succeeded"
        }
    }
    finally 
    {
        $session.Dispose()
    }
    #exit 0
} catch {
    Write-Host "Error: $($_.Exception.Message)"
    exit 1
}