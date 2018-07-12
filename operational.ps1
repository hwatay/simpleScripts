#Version 1.0
#Error Checking for Transcript, Transcript is required to save the output of the script to a textfile.
$ErrorActionPreference="SilentlyContinue"
Stop-Transcript | out-null
$ErrorActionPreference = "Continue"

Start-Transcript -path "C:\Users\Jimmy Tay\Documents\output.txt" -append
echo "Windows Powershell Script-Made for Operational alerts"

$Server = Read-Host -Prompt 'Input the address'

Ping $Server

tracert $Server


#Only works if openssh is properly installed to work with powershell
C:\'Program Files'\OpenSSH\ssh.exe $Server
Stop-Transcript
