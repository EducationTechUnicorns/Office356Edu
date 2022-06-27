#REQUIRES -Version 5.0

<#
.SYNOPSIS
    Installs Microsoft Graph PowerShell SDK
.DESCRIPTION
    Installs Microsoft Graph PowerShell SDK
    
.NOTES
    File Name      : InstallGraph.ps1
    Author         : apocsantos (antoniopocsantos@gmail.com)
    Prerequisite   : PowerShell V5 over Windows 10 and upper.
    Copyright 2022 - AC Santos
.LINK
    Script posted over:
   https://github.com/apocsantos/O365EduScripts
#>
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Install-Module Microsoft.Graph -Scope CurrentUser
Install-Module Microsoft.Graph -Scope AllUsers


