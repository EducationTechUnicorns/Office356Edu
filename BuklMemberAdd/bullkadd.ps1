Install-Module -Name MicrosoftTeams
Connect-MicrosoftTeams
Get-Team
#csv file:
#mail
#user1@mail.com
#user2@mail.com

#Import-Csv -Path "YOUR_FILE_PATH" | foreach{Add-TeamUser -GroupId YOUR_TEAM_ID -user $_.email}