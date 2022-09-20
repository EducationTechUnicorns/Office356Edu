#REQUIRES -Version 5.0

<#
.SYNOPSIS
   Uninstalls Microsoft Graph PowerShell SDK
.DESCRIPTION
    Uninstalls Microsoft Graph PowerShell SDK
    
.NOTES
    File Name      : UninstalGraph.ps1
    Author         : apocsantos (antoniopocsantos@gmail.com)
    Prerequisite   : PowerShell V5 over Windows 10 and upper.
    Copyright 2022 - AC Santos
.LINK
    Script posted over:
   https://github.com/apocsantos/O365EduScripts
#>
Uninstall-Module Microsoft.Graph
Get-InstalledModule Microsoft.Graph.* | %{ if($_.Name -ne "Microsoft.Graph.Authentication"){ Uninstall-Module $_.Name } }
Uninstall-Module Microsoft.Graph.Authentication