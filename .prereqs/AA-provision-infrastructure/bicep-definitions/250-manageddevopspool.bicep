targetScope = 'resourceGroup'

param mdpName string
param mdpLocation string
param dcpId string
param adoOrgName string
param adoProjName string

resource symbolicname 'Microsoft.DevOpsInfrastructure/pools@2025-01-21' = {
  name: mdpName
  location: mdpLocation
  properties: {
    devCenterProjectResourceId: dcpId
    agentProfile: {
      kind: 'Stateless'
    }
    fabricProfile: {
      kind: 'Vmss'
      images: [
        {
          wellKnownImageName: 'ubuntu-22.04/latest'
        }
      ]
      sku: {
        name: 'Standard_D2ads_v5'
      }
      storageProfile: {
        osDiskStorageAccountType: 'Standard'
      }
    }
    maximumConcurrency: 1
    organizationProfile: {
      kind: 'AzureDevOps'
      organizations: [
        {
          url: 'https://dev.azure.com/${adoOrgName}'
          projects: [
            adoProjName
          ]
        }
      ]
    }
  }
}
