
SELECT *
  FROM [ProviderNetworkStaging].[dbo].[PollingNetworkLocation] with (nolock)
where [PollingStatusKey] = 10

--update [ProviderNetworkStaging].[dbo].[PollingNetworkLocation]
--set [PollingStatusKey] = 20
--where [PollingStatusKey] = 10