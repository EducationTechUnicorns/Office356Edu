#REQUIRES -Version 5.0

<#
.SYNOPSIS
    Install powershell modules necessary.
.DESCRIPTION
    Install modules: MicrosoftTeams;ExchangeOnlineManagement;ActiveDirectory;
                     All required for the other scripts
.NOTES
    File Name      : installModules.ps1
    Author         : apocsantos (antoniopocsantos@gmail.com)
    Prerequisite   : PowerShell V5 over Windows 10 and upper.
    Copyright 2021 - AC Santos
.LINK
    Script posted over:
   https://github.com/apocsantos/O365EduScripts
#>

Install-Module MicrosoftTeams
Install-Module -Name ExchangeOnlineManagement
Install-Module -Name ActiveDirectory
