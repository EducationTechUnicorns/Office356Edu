#REQUIRES -Version 5.0

<#
.SYNOPSIS
    Updates Microsoft Graph PowerShell SDK
.DESCRIPTION
    Updates Microsoft Graph PowerShell SDK
    
.NOTES
    File Name      : UpdateGraph.ps1
    Author         : apocsantos (antoniopocsantos@gmail.com)
    Prerequisite   : PowerShell V5 over Windows 10 and upper.
    Copyright 2022 - AC Santos
.LINK
    Script posted over:
   https://github.com/apocsantos/O365EduScripts
#>
Get-InstalledModule Microsoft.Graph
Update-Module Microsoft.Graph