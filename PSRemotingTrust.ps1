#To trust all machines for powershell remoting for all machines
Set-Item -Path WSMan:\localhost\Client\TrustedHosts -Value * -Force