﻿$dominio = "ebaveromar.com"

#Create users from INOVAR Alunos

Import-CSV  C:\eb\DadosFiltrados.csv  -delimiter ";"  -Header Nome,Processo | Foreach-Object{
   Write-Host $_.Nome
   $mail = $_.Processo + $dominio
   Write-Host $mail
   New-MsolUser -UserPrincipalName $mail -DisplayName $_.Nome -Password "MySuperPassword"
   Set-MsolUser -UserPrincipalName $mail -UsageLocation PT
   Set-MsolUserLicense -UserPrincipalName $mail -AddLicenses "myOrg:STANDARDWOFFPACK_STUDENT"
   #Example Licence: myOrg:STANDARDWOFFPACK_STUDENT
}
