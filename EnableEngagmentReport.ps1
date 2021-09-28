#REQUIRES -Version 5.0

<#
.SYNOPSIS
    Reads users from text file, and set them the policy to allow changing picture
.DESCRIPTION
    Creates a policy to allow users to change their profile picture and
    Reads users from text file, and set them the policy to allow changing picture
    
.NOTES
    File Name      : EnableEngagmentReport.ps1
    Author         : apocsantos (antoniopocsantos@gmail.com)
    Prerequisite   : PowerShell V5 over Windows 10 and upper.
    Copyright 2021 - AC Santos
.LINK
    Script posted over:
   https://github.com/apocsantos/O365EduScripts
#>

[string[]]$users =Get-Content -Path .\alunos.txt
foreach ($u in $users) 
{ 
	Set-CSTeamsMeetingPolicy - Identity Global - AllowEngagementReport "Enabled" 
	Write-host $u
}
