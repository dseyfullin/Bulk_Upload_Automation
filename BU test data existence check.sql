select *
  from [ProviderNetworkStaging].[dbo].[StgProviderNetworkMaster]
where BatchID = -5

select * 
from [ProviderNetwork].[dbo].[Practice]
where NPI like '99999%'

select * 
from [ProviderNetwork].[dbo].[Practice]
where NPI like '99998%'

