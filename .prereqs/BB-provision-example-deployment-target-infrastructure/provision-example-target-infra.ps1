# ################################
# PROVISION "DEMO" AZURE RESOURCES
# ################################
az deployment group create `
    --name 'whatever' `
    --subscription ([System.Environment]::GetEnvironmentVariable('DEMOS_my_azure_subscription_id')) `
    --resource-group ("$([System.Environment]::GetEnvironmentVariable('DEMOS_my_workload_nickname'))-rg-$('demo')") `
    --template-file ([IO.Path]::Combine((Split-Path -Path $PSCommandPath -Parent), 'bicep-definitions', '500-main.bicep')) `
    --parameters ([IO.Path]::Combine((Split-Path -Path $PSCommandPath -Parent), 'bicep-definitions', '500-demo.bicepparam'))

