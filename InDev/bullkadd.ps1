#REQUIRES -Version 5.0

<#
.SYNOPSIS
    Reads e-mails from textfile and add them to teams team as guests
.DESCRIPTION
    Reads e-mails from textfile and add them to teams team as guests
    
.NOTES
    File Name      : bulkadd.ps1
    Author         : apocsantos (antoniopocsantos@gmail.com)
    Prerequisite   : PowerShell V5 over Windows 10 and upper.
    Copyright 2021 - AC Santos
.LINK
    Script posted over:
   https://github.com/apocsantos/O365EduScripts
#>

Install-Module -Name MicrosoftTeams
Connect-MicrosoftTeams
Get-Team

#csv file model:
#mail
#user1@mail.com
#user2@mail.com

$file = Read-Host -Prompt "Insira o nome e caminho do ficheiro"
$gid = Read-Host -Prompt "Insira o ID da equipe"
#Import-Csv -Path "D:\Documentos\GitHub\Office356Edu\last\BuklMemberAdd\mail.csv" 
Import-Csv -Path $file 
$users = Import-Csv -Path "Path"
foreach ($user in $users) 
{ 
    Add-TeamUser -GroupId $gid -user $user
    #Add-TeamUser -GroupId 8ccb0bfc-ca85-4309-838d-bf439c250d9f -user $user
}
