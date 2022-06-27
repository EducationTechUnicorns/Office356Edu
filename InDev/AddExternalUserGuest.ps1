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

Connect-MgGraph -Scopes user.readwrite.all
New-MgInvitation -InvitedUserDisplayName "acs" -InvitedUserEmailAddress antoniopocsantos@gmail.com -InviteRedirectUrl "https://myapplications.microsoft.com" -SendInvitationMessage:$true
Get-MgUser -Filter "Mail eq 'John@contoso.com'"