#REQUIRES -Version 5.0

<#
.SYNOPSIS
    Reads users from text file, and adds them to teams as guests
.DESCRIPTION
    Reads users from text file, and adds them to teams as guests
    
.NOTES
    File Name      : AddADUsersToTeamsAsGuests.ps1
    Author         : apocsantos (antoniopocsantos@gmail.com)
    Prerequisite   : PowerShell V5 over Windows 10 and upper.
    Copyright 2021 - AC Santos
.LINK
    Script posted over:
   https://github.com/apocsantos/O365EduScripts
#>

Connect-MicrosoftTeams -Credential 

[string[]]$users =Get-Content -Path .\alunos.txt
foreach ($u in $users) 
{ 
Write-host $u
Add-TeamUser -User $u -Role
}
