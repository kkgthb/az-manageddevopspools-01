using '500-main.bicep'

var envNickname = 'demo'
var solutionName = readEnvironmentVariable('DEMOS_my_workload_nickname')
param location = 'centralus'
param publicWebappPlanName = '${solutionName}-asp-${envNickname}'
param publicWebappName = '${solutionName}-as-${envNickname}'
param cicdServicePrincipalDisplayName = readEnvironmentVariable('DEMOS_my_favorite_workload_identity_display_name')
param cicdServicePrincipalObjectId = readEnvironmentVariable('DEMOS_my_favorite_workload_identity_object_id')
