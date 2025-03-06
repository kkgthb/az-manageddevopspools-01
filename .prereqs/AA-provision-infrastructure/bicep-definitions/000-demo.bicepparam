using '000-main.bicep'

var envNickname = 'demo'
var solutionName = readEnvironmentVariable('DEMOS_my_workload_nickname')
param location = 'centralus'
param resourceGroupName = '${solutionName}-rg-${envNickname}'
param devCenterName = '${solutionName}-dc-${envNickname}'
param devCenterProjectName = '${solutionName}-dcp-${envNickname}'
param managedDevOpsPoolName = '${solutionName}-mdp-${envNickname}'
param adoOrganizationName = readEnvironmentVariable('DEMOS_my_ado_org_name')
param adoProjectName = readEnvironmentVariable('DEMOS_my_ado_project_name')
//var cicdServicePrincipalDisplayName = readEnvironmentVariable('DEMOS_my_favorite_workload_identity_display_name')
