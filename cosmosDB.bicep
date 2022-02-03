targetScope = 'resourceGroup'

param accountName string = 'cosmos-${uniqueString(resourceGroup().id)}'
param location string = resourceGroup().location
param databaseName string = 'woficecream'

resource myCosmosDBAccount 'Microsoft.DocumentDB/databaseAccounts@2021-10-15' = {
  name: toLower(accountName)
  location: location
  properties: {
    databaseAccountOfferType: 'Standard'
    locations: [
      {
      locationName: location
      }
    ]
    consistencyPolicy: {
      defaultConsistencyLevel: 'Session'
    }
    capabilities: [
      {
      name: 'EnableServerless'
      }
    ]
  }
}

resource myCosmosDB 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases@2021-10-15' = {
  name: '${myCosmosDBAccount.name}/${toLower(databaseName)}'
  properties: {
    resource: {
      id: databaseName
    }
  }
}
