
declare @batch_id bigint = -5


-- Staging

delete from [ProviderNetworkStaging].[dbo].[PollingNetworkLocation]
where batchID = @batch_id

delete from [ProviderNetworkStaging].[dbo].[ProviderNetworkException]
where batchID = @batch_id

delete from [ProviderNetworkStaging].[dbo].[StgContractComponent]
where batchID = @batch_id

delete from [ProviderNetworkStaging].[dbo].[StgPractice]
where batchID = @batch_id

delete from [ProviderNetworkStaging].[dbo].[StgPracticeBilling]
where batchID = @batch_id

delete from [ProviderNetworkStaging].[dbo].[StgPracticeLicenseDetails]
where batchID = @batch_id

delete from [ProviderNetworkStaging].[dbo].[StgPracticeLocation]
where batchID = @batch_id

delete from [ProviderNetworkStaging].[dbo].[StgPracticeLocationCommunication]
where batchID = @batch_id

delete from [ProviderNetworkStaging].[dbo].[StgPracticeLocationContractComponent]
where batchID = @batch_id

delete from [ProviderNetworkStaging].[dbo].[StgPracticeLocationLanguage]
where batchID = @batch_id

delete from [ProviderNetworkStaging].[dbo].[StgPracticeLocationProvider]
where batchID = @batch_id

delete from [ProviderNetworkStaging].[dbo].[StgPracticeLocationProviderCommunication]
where batchID = @batch_id

delete from [ProviderNetworkStaging].[dbo].[StgPracticeLocationProviderSpecialty]
where batchID = @batch_id

delete from [ProviderNetworkStaging].[dbo].[StgPracticeLocationSpecialty]
where batchID = @batch_id

delete from [ProviderNetworkStaging].[dbo].[StgPracticeLocationType]
where batchID = @batch_id

delete from [ProviderNetworkStaging].[dbo].[StgProvider]
where batchID = @batch_id

delete from [ProviderNetworkStaging].[dbo].[StgProviderCredential]
where batchID = @batch_id

delete from [ProviderNetworkStaging].[dbo].[StgProviderLanguage]
where batchID = @batch_id

delete from [ProviderNetworkStaging].[dbo].[StgProviderLicenseDetails]
where batchID = @batch_id

delete from [ProviderNetworkStaging].[dbo].[StgProviderLocationContractComponent]
where batchID = @batch_id

delete from [ProviderNetworkStaging].[dbo].[StgProviderLocationHospitalRelationship]
where batchID = @batch_id

delete from [ProviderNetworkStaging].[dbo].[StgProviderNetworkMaster]
where batchID = @batch_id

delete from [ProviderNetworkStaging].[dbo].[StgProviderSpecialty]
where batchID = @batch_id



-- OLTP

delete plcc
from [ProviderNetwork].[dbo].[PracticeLocationContractComponent] plcc
join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = plcc.[PracticeLocationKey]
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
where p.NPI like '99999%'

delete plcc
from [ProviderNetwork].[dbo].[ProviderLocationContractComponent] plcc
join [ProviderNetwork].[dbo].[PracticeLocationProvider] plp on plp.[PracticeLocationProviderKey] = plcc.[PracticeLocationProviderKey]
join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = plp.[PracticeLocationKey]
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
where p.NPI like '99999%'

delete plhr
from [ProviderNetwork].[dbo].[ProviderLocationHospitalRelationship] plhr
join [ProviderNetwork].[dbo].[PracticeLocationProvider] plp on plp.[PracticeLocationProviderKey] = plhr.[PracticeLocationProviderKey]
join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = plp.[PracticeLocationKey]
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
where p.NPI like '99999%'

delete plpc
from [ProviderNetwork].[dbo].[PracticeLocationProviderCommunication] plpc
join [ProviderNetwork].[dbo].[PracticeLocationProvider] plp on plp.[PracticeLocationProviderKey] = plpc.[PracticeLocationProviderKey]
join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = plp.[PracticeLocationKey]
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
where p.NPI like '99999%'

delete plps
from [ProviderNetwork].[dbo].[PracticeLocationProviderSpecialty] plps
join [ProviderNetwork].[dbo].[PracticeLocationProvider] plp on plp.[PracticeLocationProviderKey] = plps.[PracticeLocationProviderKey]
join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = plp.[PracticeLocationKey]
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
where p.NPI like '99999%'

delete from [ProviderNetwork].[dbo].[ContractComponent]
where [ContractId] like '99999%'

delete pb
from [ProviderNetwork].[dbo].[PracticeBilling] pb
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pb.[PracticeKey]
where p.NPI like '99999%'

delete pld
from [ProviderNetwork].[dbo].[PracticeLicenseDetails] pld
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pld.[PracticeKey]
where p.NPI like '99999%'

delete plb
from [ProviderNetwork].[dbo].[PracticeLocationBilling] plb
join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = plb.[PracticeLocationKey]
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
where p.NPI like '99999%'

delete plc
from [ProviderNetwork].[dbo].[PracticeLocationCommunication] plc
join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = plc.[PracticeLocationKey]
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
where p.NPI like '99999%'


delete pll
from [ProviderNetwork].[dbo].[PracticeLocationLanguage] pll
join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = pll.[PracticeLocationKey]
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
where p.NPI like '99999%'

delete plp
from [ProviderNetwork].[dbo].[PracticeLocationProvider] plp
join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = plp.[PracticeLocationKey]
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
where p.NPI like '99999%'



delete pls
from [ProviderNetwork].[dbo].[PracticeLocationSpecialty] pls
join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = pls.[PracticeLocationKey]
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
where p.NPI like '99999%'

delete plspt
from [ProviderNetwork].[dbo].[PracticeLocationStateProviderType] plspt
join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = plspt.[PracticeLocationKey]
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
where p.NPI like '99999%'

delete plss
from [ProviderNetwork].[dbo].[PracticeLocationStateSpecialty] plss
join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = plss.[PracticeLocationKey]
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
where p.NPI like '99999%'

delete pls
from [ProviderNetwork].[dbo].[PracticeLocationSubPart] pls
join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = pls.[PracticeLocationKey]
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
where p.NPI like '99999%'

delete plt
from [ProviderNetwork].[dbo].[PracticeLocationType] plt
join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = plt.[PracticeLocationKey]
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
where p.NPI like '99999%'



delete pl
from [ProviderNetwork].[dbo].[PracticeLocation] pl
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
where p.NPI like '99999%'

delete from [ProviderNetwork].[dbo].[Practice]
where NPI like '99999%'

delete pc
from [ProviderNetwork].[dbo].[ProviderCredential] pc
join [ProviderNetwork].[dbo].[Provider] p on p.[ProviderKey] = pc.[ProviderKey]
where p.NPI like '99999%'

delete pcs
from [ProviderNetwork].[dbo].[ProviderCredentialingStatus] pcs
join [ProviderNetwork].[dbo].[Provider] p on p.[ProviderKey] = pcs.[ProviderKey]
where p.NPI like '99999%'

delete pl
from [ProviderNetwork].[dbo].[ProviderLanguage] pl
join [ProviderNetwork].[dbo].[Provider] p on p.[ProviderKey] = pl.[ProviderKey]
where p.NPI like '99999%'

delete pld
from [ProviderNetwork].[dbo].[ProviderLicenseDetails] pld
join [ProviderNetwork].[dbo].[Provider] p on p.[ProviderKey] = pld.[ProviderKey]
where p.NPI like '99999%'

delete pss
from [ProviderNetwork].[dbo].[ProviderStateSpecialty] pss
join [ProviderNetwork].[dbo].[Provider] p on p.[ProviderKey] = pss.[ProviderKey]
where p.NPI like '99999%'

delete pst
from [ProviderNetwork].[dbo].[ProviderStateType] pst
join [ProviderNetwork].[dbo].[Provider] p on p.[ProviderKey] = pst.[ProviderKey]
where p.NPI like '99999%'

delete ps
from [ProviderNetwork].[dbo].[ProviderSpecialty] ps
join [ProviderNetwork].[dbo].[Provider] p on p.[ProviderKey] = ps.[ProviderKey]
where p.NPI like '99999%'


delete from [ProviderNetwork].[dbo].[Provider]
where NPI like '99999%'







delete plcc
from [ProviderNetwork].[dbo].[PracticeLocationContractComponent] plcc
join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = plcc.[PracticeLocationKey]
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
where p.NPI like '99998%'

delete plcc
from [ProviderNetwork].[dbo].[ProviderLocationContractComponent] plcc
join [ProviderNetwork].[dbo].[PracticeLocationProvider] plp on plp.[PracticeLocationProviderKey] = plcc.[PracticeLocationProviderKey]
join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = plp.[PracticeLocationKey]
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
where p.NPI like '99998%'

delete plhr
from [ProviderNetwork].[dbo].[ProviderLocationHospitalRelationship] plhr
join [ProviderNetwork].[dbo].[PracticeLocationProvider] plp on plp.[PracticeLocationProviderKey] = plhr.[PracticeLocationProviderKey]
join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = plp.[PracticeLocationKey]
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
where p.NPI like '99998%'

delete plpc
from [ProviderNetwork].[dbo].[PracticeLocationProviderCommunication] plpc
join [ProviderNetwork].[dbo].[PracticeLocationProvider] plp on plp.[PracticeLocationProviderKey] = plpc.[PracticeLocationProviderKey]
join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = plp.[PracticeLocationKey]
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
where p.NPI like '99998%'

delete plps
from [ProviderNetwork].[dbo].[PracticeLocationProviderSpecialty] plps
join [ProviderNetwork].[dbo].[PracticeLocationProvider] plp on plp.[PracticeLocationProviderKey] = plps.[PracticeLocationProviderKey]
join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = plp.[PracticeLocationKey]
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
where p.NPI like '99998%'

delete from [ProviderNetwork].[dbo].[ContractComponent]
where [ContractId] like '99998%'

delete pb
from [ProviderNetwork].[dbo].[PracticeBilling] pb
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pb.[PracticeKey]
where p.NPI like '99998%'

delete pld
from [ProviderNetwork].[dbo].[PracticeLicenseDetails] pld
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pld.[PracticeKey]
where p.NPI like '99998%'

delete plb
from [ProviderNetwork].[dbo].[PracticeLocationBilling] plb
join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = plb.[PracticeLocationKey]
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
where p.NPI like '99998%'

delete plc
from [ProviderNetwork].[dbo].[PracticeLocationCommunication] plc
join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = plc.[PracticeLocationKey]
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
where p.NPI like '99998%'


delete pll
from [ProviderNetwork].[dbo].[PracticeLocationLanguage] pll
join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = pll.[PracticeLocationKey]
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
where p.NPI like '99998%'

delete plp
from [ProviderNetwork].[dbo].[PracticeLocationProvider] plp
join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = plp.[PracticeLocationKey]
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
where p.NPI like '99998%'



delete pls
from [ProviderNetwork].[dbo].[PracticeLocationSpecialty] pls
join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = pls.[PracticeLocationKey]
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
where p.NPI like '99998%'

delete plspt
from [ProviderNetwork].[dbo].[PracticeLocationStateProviderType] plspt
join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = plspt.[PracticeLocationKey]
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
where p.NPI like '99998%'

delete plss
from [ProviderNetwork].[dbo].[PracticeLocationStateSpecialty] plss
join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = plss.[PracticeLocationKey]
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
where p.NPI like '99998%'

delete pls
from [ProviderNetwork].[dbo].[PracticeLocationSubPart] pls
join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = pls.[PracticeLocationKey]
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
where p.NPI like '99998%'

delete plt
from [ProviderNetwork].[dbo].[PracticeLocationType] plt
join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = plt.[PracticeLocationKey]
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
where p.NPI like '99998%'



delete pl
from [ProviderNetwork].[dbo].[PracticeLocation] pl
join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
where p.NPI like '99998%'

delete from [ProviderNetwork].[dbo].[Practice]
where NPI like '99998%'

delete pc
from [ProviderNetwork].[dbo].[ProviderCredential] pc
join [ProviderNetwork].[dbo].[Provider] p on p.[ProviderKey] = pc.[ProviderKey]
where p.NPI like '99998%'

delete pcs
from [ProviderNetwork].[dbo].[ProviderCredentialingStatus] pcs
join [ProviderNetwork].[dbo].[Provider] p on p.[ProviderKey] = pcs.[ProviderKey]
where p.NPI like '99998%'

delete pl
from [ProviderNetwork].[dbo].[ProviderLanguage] pl
join [ProviderNetwork].[dbo].[Provider] p on p.[ProviderKey] = pl.[ProviderKey]
where p.NPI like '99998%'

delete pld
from [ProviderNetwork].[dbo].[ProviderLicenseDetails] pld
join [ProviderNetwork].[dbo].[Provider] p on p.[ProviderKey] = pld.[ProviderKey]
where p.NPI like '99998%'

delete pss
from [ProviderNetwork].[dbo].[ProviderStateSpecialty] pss
join [ProviderNetwork].[dbo].[Provider] p on p.[ProviderKey] = pss.[ProviderKey]
where p.NPI like '99998%'

delete pst
from [ProviderNetwork].[dbo].[ProviderStateType] pst
join [ProviderNetwork].[dbo].[Provider] p on p.[ProviderKey] = pst.[ProviderKey]
where p.NPI like '99998%'

delete ps
from [ProviderNetwork].[dbo].[ProviderSpecialty] ps
join [ProviderNetwork].[dbo].[Provider] p on p.[ProviderKey] = ps.[ProviderKey]
where p.NPI like '99998%'


delete from [ProviderNetwork].[dbo].[Provider]
where NPI like '99998%'