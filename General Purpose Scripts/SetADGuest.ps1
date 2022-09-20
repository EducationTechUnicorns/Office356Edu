#REQUIRES -Version 5.0

<#
.SYNOPSIS
    Reads users from text file, and set them as Azure AD Guests
.DESCRIPTION
    Reads users from text file, and set them as Azure AD Guests
    
.NOTES
    File Name      : SetADGuest.ps1
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
Write-host $u
Set-AzureADUser -ObjectID $u -UserType "Guest"
}
