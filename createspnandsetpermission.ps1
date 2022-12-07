

# Create Service Principal
$servicePrincipalDisplayName = "<name of service principal>"
$servicePrincipal = New-AzADServicePrincipal -DisplayName $servicePrincipalDisplayName

Write-Host "ARM_TENANT_ID: $((Get-AzContext).Tenant.Id)"
Write-Host "ARM_SUBSCRIPTION_ID: $((Get-AzContext).Subscription.Id)"
Write-Host "ARM_CLIENT_ID: $($servicePrincipal.AppId)"
Write-Host "ARM_CLIENT_SECRET: $($servicePrincipal.PasswordCredentials.SecretText)"


$servicePrincipalDisplayName = '<name of service principal or resource with MI enabled>'
$roleToAssign = 'Owner'
$ErrorActionPreference = 'Stop'
$servicePrincipal = Get-AzADServicePrincipal -DisplayName $servicePrincipalDisplayName
New-AzRoleAssignment -ObjectId $servicePrincipal.Id -RoleDefinitionName $roleToAssign -Scope '/'
