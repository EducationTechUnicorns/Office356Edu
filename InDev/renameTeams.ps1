#REQUIRES -Version 5.0

<#
.SYNOPSIS
    Reads Team names from text file, and Rename them acordingly
.DESCRIPTION
    Reads Team names from text file, and Rename them acordingly
    
.NOTES
    File Name      : renameTeams.ps1
    Author         : apocsantos (antoniopocsantos@gmail.com)
    Prerequisite   : PowerShell V5 over Windows 10 and upper.
    Copyright 2022 - AC Santos
.LINK
    Script posted over:
   https://github.com/apocsantos/O365EduScripts
#>

Connect-MicrosoftTeams
Connect-ExchangeOnline -UserPrincipalName "Username" -ShowProgress $true

[string[]]$users =Get-Content -Path .\teams.txt

foreach ($t in $users) 
{ 
Write-host $t
Get-team -displayname $t
#still some stuff to do
#Set-team -GroupId <Group ID of Team to rename>  -DisplayName "New Name" -Description "New Name or details on the team's purpose"
#Get-team -displayname "New Name" | Fl

#Set-UnifiedGroup -Identity "Team Name" -alias "New alias name"  -EmailAddresses: @{Add ="new email address"}

#Set-UnifiedGroup -identity "Team Name" -PrimarySMTPAddress "new email address "

#Set-UnifiedGroup -Identity "Team Name" -EmailAddresses @{Remove="old email address"}

#Set-UnifiedGroup -Identity "Team Name" -EmailAddresses: @{Add ="new email address @company.onmicrosoft.com"}

#
}








Set-team -GroupId <Group ID of Team to rename>  -DisplayName "New Name" -Description "New Name or details on the team's purpose"
Get-team -displayname "New Name" | Fl

Set-UnifiedGroup -Identity "Team Name" -alias "New alias name"  -EmailAddresses: @{Add ="new email address"}

Set-UnifiedGroup -identity "Team Name" -PrimarySMTPAddress "new email address "

Set-UnifiedGroup -Identity "Team Name" -EmailAddresses @{Remove="old email address"}

Set-UnifiedGroup -Identity "Team Name" -EmailAddresses: @{Add ="new email address @company.onmicrosoft.com"}