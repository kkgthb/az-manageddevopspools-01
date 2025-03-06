# ################################
# PROVISION "DEMO" AZURE RESOURCES
# ################################
az deployment sub create `
    --name 'whatever' `
    --subscription ([System.Environment]::GetEnvironmentVariable('DEMOS_my_azure_subscription_id')) `
    --location 'centralus' `
    --template-file ([IO.Path]::Combine((Split-Path -Path $PSCommandPath -Parent), 'bicep-definitions', '000-main.bicep')) `
    --parameters ([IO.Path]::Combine((Split-Path -Path $PSCommandPath -Parent), 'bicep-definitions', '000-demo.bicepparam'))
