targetScope = 'resourceGroup'

@description('Primary location for all resources')
param location string
@description('The name of the Azure App Service Plan resource')
param publicWebappPlanName string
@description('The name of the Azure App Service resource')
param publicWebappName string
@description('The display name of the Entra service principal representing the CI/CD pipeline that needs to deploy a webapp')
param cicdServicePrincipalDisplayName string
@description('The object ID name of the Entra service principal representing the CI/CD pipeline that needs to deploy a webapp')
param cicdServicePrincipalObjectId string

module publicWebapp './610-webapp.bicep' = {
  name: 'publicWebapp'
  scope: resourceGroup()
  params: {
    aspName: publicWebappPlanName
    asName: publicWebappName
    location: location
    ciSPObjectId: cicdServicePrincipalObjectId
    ciSPName: cicdServicePrincipalDisplayName
  }
}
