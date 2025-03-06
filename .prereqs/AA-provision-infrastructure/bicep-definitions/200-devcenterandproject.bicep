targetScope = 'resourceGroup'

param dcName string
param dcLocation string
param dcpName string

resource dc 'Microsoft.DevCenter/devcenters@2024-10-01-preview' = {
  name: dcName
  location: dcLocation
}

resource dcp 'Microsoft.DevCenter/projects@2024-02-01' = {
  name: dcpName
  location: dcLocation
  properties: {
    devCenterId: dc.id
  }
}

output dcpId string = dcp.id
