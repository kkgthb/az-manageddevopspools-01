targetScope = 'resourceGroup'

param aspName string
param asName string
param location string
param ciSPObjectId string
param ciSPName string

resource appserviceplan 'Microsoft.Web/serverfarms@2024-04-01' = {
  name: aspName
  location: location
  sku: {
    name: 'F1'
  }
}

resource app 'Microsoft.Web/sites@2024-04-01' = {
  name: asName
  location: location
  kind: 'app'
  properties: {
    serverFarmId: appserviceplan.id
    httpsOnly: true
    siteConfig: {
      appSettings: [
        {
          name: 'WEBSITE_NODE_DEFAULT_VERSION'
          value: '~20'
        }
      ]
    }
  }
}

resource websiteContributorRole 'Microsoft.Authorization/roleDefinitions@2022-05-01-preview' existing = {
  scope: app
  name: 'de139f84-1756-47ae-9be6-808fbbe84772' // GUID for 'Website Contributor'
}

resource raWebsiteContributor 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: app
  name: guid(app.id, ciSPObjectId, websiteContributorRole.id)
  properties: {
    description: 'Allows ${ciSPName} to deploy builds onto ${app.name}.'
    principalId: ciSPObjectId
    principalType: 'ServicePrincipal'
    roleDefinitionId: websiteContributorRole.id
  }
}
