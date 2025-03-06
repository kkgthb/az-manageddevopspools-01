targetScope = 'subscription'

@description('Primary location for all resources')
param location string
@description('The Azure resource group where new resources will be deployed')
param resourceGroupName string
@description('The name of the Dev Center resource')
param devCenterName string
@description('The name of the Dev Center Project resource')
param devCenterProjectName string
@description('The name of the Managed DevOps Pool resource')
param managedDevOpsPoolName string
@description('The name of an Azure DevOps organization that will be able to use this managed Pipelines agent pool')
param adoOrganizationName string
@description('The name of an Azure DevOps project (within the aforementioned organization) that will be able to use this managed Pipelines agent pool')
param adoProjectName string

module rsrcGrp './100-resourcegroup.bicep' = {
  name: resourceGroupName
  scope: subscription()
  params: {
    resourceGroupName: resourceGroupName
    resourceGroupLocation: location
  }
}

module dc './200-devcenterandproject.bicep' = {
  name: devCenterName
  scope: resourceGroup(rsrcGrp.name)
  params: {
    dcName: devCenterName
    dcpName: devCenterProjectName
    dcLocation: location
  }
}

module mdp './250-manageddevopspool.bicep' = {
  name: managedDevOpsPoolName
  scope: resourceGroup(rsrcGrp.name)
  params: {
    mdpName: managedDevOpsPoolName
    mdpLocation: location
    dcpId: dc.outputs.dcpId
    adoOrgName: adoOrganizationName
    adoProjName: adoProjectName
  }
}
