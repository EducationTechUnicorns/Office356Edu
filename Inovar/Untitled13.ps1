#update AzureAD users setting proprieties from INOVAR Alunos 


#global vars
$dominio = "@ebaveromar.com"
$turma = ""
$departamento = ""
$processo = ""
$anoLectivo =""
$thisUserDoesExists = $true
$anoLectivostring =""
$anoProximo


Import-CSV  C:\EB\dadosteste.csv  -delimiter ";" -Header Ano, Turma, Nome,Processo,lectivo  | ForEach {
    # Get each user from file
    Write-Host $_.ano
    Write-Host $_.turma
    Write-Host $_.nome
    Write-Host $_.processo
    Write-Host $_.lectivo

    #creates the users in AzureAD if they do not exist and set their respective proprieties
    $mail = $_.processo + $dominio

    $azureaduser = Get-AzureADUser -All $true | Where-Object {$_.UserPrincipalName -eq "$mail"}  ## slow as f***                     
    if($azureaduser){
       Write-Host "User: $_.ObjectId was found in $displayname AzureAD." -ForegroundColor Green
       
    }
    else{
            New-MsolUser -UserPrincipalName $mail -DisplayName $_.Nome -Password "EBAverOMar2022/2023" #default password hardcoded here
            Set-MsolUser -UserPrincipalName $mail -UsageLocation PT
            Set-MsolUserLicense -UserPrincipalName $mail -AddLicenses "ebaveromar1:STANDARDWOFFPACK_STUDENT"
            Write-Host "User $_.ObjectId was not found in $displayname Azure AD " -ForegroundColor Red
    }
   #stringOps 
   $anoatual = [int]$_.lectivo
   $anoProximo = $anoatual +1
   $anoLectivostring = $anoatual.ToString() + "/" + $anoProximo.ToString()

   #Sets user proprieties
   $processo = $_.processo
   Set-AzureADUser -ObjectId $mail -UserType "Member" -JobTitle $turma -Department $departamento -GivenName $processo -CompanyName $anoLectivostring
   Write-Host $mail
}