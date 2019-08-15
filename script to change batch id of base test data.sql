
declare @batch_id bigint = 201908151535011


-- Staging

update [ProviderNetworkStaging].[dbo].[ProviderNetworkException]
set BatchID = -5
where batchID = @batch_id

update [ProviderNetworkStaging].[dbo].[StgContractComponent]
set BatchID = -5
	,ClientID = -5
where batchID = @batch_id

update [ProviderNetworkStaging].[dbo].[StgPractice]
set BatchID = -5
	,ClientID = -5
where batchID = @batch_id

update [ProviderNetworkStaging].[dbo].[StgPracticeBilling]
set BatchID = -5
	,ClientID = -5
where batchID = @batch_id

update [ProviderNetworkStaging].[dbo].[StgPracticeLicenseDetails]
set BatchID = -5
	,ClientID = -5
where batchID = @batch_id

update [ProviderNetworkStaging].[dbo].[StgPracticeLocation]
set BatchID = -5
	,ClientID = -5
where batchID = @batch_id

update [ProviderNetworkStaging].[dbo].[StgPracticeLocationCommunication]
set BatchID = -5
where batchID = @batch_id

update [ProviderNetworkStaging].[dbo].[StgPracticeLocationContractComponent]
set BatchID = -5
	,ClientID = -5
where batchID = @batch_id

update [ProviderNetworkStaging].[dbo].[StgPracticeLocationLanguage]
set BatchID = -5
where batchID = @batch_id

update [ProviderNetworkStaging].[dbo].[StgPracticeLocationProvider]
set BatchID = -5
	,ClientID = -5
where batchID = @batch_id

update [ProviderNetworkStaging].[dbo].[StgPracticeLocationProviderCommunication]
set BatchID = -5
where batchID = @batch_id

update [ProviderNetworkStaging].[dbo].[StgPracticeLocationProviderSpecialty]
set BatchID = -5
where batchID = @batch_id

update [ProviderNetworkStaging].[dbo].[StgPracticeLocationSpecialty]
set BatchID = -5
where batchID = @batch_id

update [ProviderNetworkStaging].[dbo].[StgPracticeLocationType]
set BatchID = -5
where batchID = @batch_id

update [ProviderNetworkStaging].[dbo].[StgProvider]
set BatchID = -5
	,ClientID = -5
where batchID = @batch_id

update [ProviderNetworkStaging].[dbo].[StgProviderCredential]
set BatchID = -5
	,ClientID = -5
where batchID = @batch_id

update [ProviderNetworkStaging].[dbo].[StgProviderLanguage]
set BatchID = -5
	,ClientID = -5
where batchID = @batch_id

update [ProviderNetworkStaging].[dbo].[StgProviderLicenseDetails]
set BatchID = -5
	,ClientID = -5
where batchID = @batch_id

update [ProviderNetworkStaging].[dbo].[StgProviderLocationContractComponent]
set BatchID = -5
	,ClientID = -5
where batchID = @batch_id

update [ProviderNetworkStaging].[dbo].[StgProviderLocationHospitalRelationship]
set BatchID = -5
	,ClientID = -5
where batchID = @batch_id

update [ProviderNetworkStaging].[dbo].[StgProviderNetworkMaster]
set BatchID = -5
	,ClientID = -5
where batchID = @batch_id

update [ProviderNetworkStaging].[dbo].[StgProviderSpecialty]
set BatchID = -5
where batchID = @batch_id


-- OLTP

update [ProviderNetwork].[dbo].[ContractComponent]
set [ContractId] = replace([ContractId],'99999','99998')
where [ContractId] like '99999%'

update [ProviderNetwork].[dbo].[Practice]
set [NPI] = replace([NPI],'99999','99998')
where [NPI] like '99999%'

update [ProviderNetwork].[dbo].[Provider]
set [NPI] = replace([NPI],'99999','99998')
where [NPI] like '99999%'