#update AzureAD users setting proprieties from INOVAR Alunos 


#global vars
$dominio = ""
$departamento = "" #Ano de escolaridade
$processo = "" 
$anoLectivo ="" #ano lectivo em string
$thisUserDoesExists = $true
#main loop
Import-CSV  C:\EB\testes\teste.csv  -delimiter ";"  -Header Nome,Processo, ano, turma | Foreach-Object{ #replace path to your fole
   Write-Host $_.Nome
    $mail = $_.Processo + $dominio

    $azureaduser = Get-AzureADUser -All $true | Where-Object {$_.UserPrincipalName -eq "$mail"}  ## slow as f***                     
    if($azureaduser){
       Write-Host "User: $_.ObjectId was found in $displayname AzureAD." -ForegroundColor Green
       Write-Host $mail + " " + $_.Nome  + " " + $_.Processo + " " + $_.ano + " " + $turma + " " + $departamento
       
    }
    else{ 
            $PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
            $PasswordProfile.Password = "StrongPassword" #veryForkingStrongPassword
            New-AzureADUser -DisplayName $_.Nome -UserPrincipalName $mail -PasswordProfile $PasswordProfile -AccountEnabled $true
            Set-MsolUser -UserPrincipalName $mail -UsageLocation PT
            Set-MsolUserLicense -UserPrincipalName $mail -AddLicenses "ebaveromar1:STANDARDWOFFPACK_STUDENT"
            Write-Host "User $_.ObjectId was not found in $displayname Azure AD " -ForegroundColor Red
            Write-Host $mail + " " + $_.Nome  + " " + $_.Processo + " " + $_.ano + " " + $turma + " " + $departamento
    }
   $turma = $_.ano + " " + $_.turma
   $departamento = $_.ano
   $processo = $_.Processo
   Set-AzureADUser -ObjectId $mail -UserType "Member" -JobTitle $turma -Department $departamento -GivenName $processo -CompanyName $anoLectivo
   Write-Host $mail + " " + $_.Nome  + " " + $_.Processo + " " + $_.ano + " " + $turma + " " + $departamento
}