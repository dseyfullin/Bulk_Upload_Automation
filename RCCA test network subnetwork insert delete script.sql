
-- Connect to ine1qa-iddb-001.ehnp.corp.evolenthealth.com

declare @client_id int = 113

if (select count(*) from [ProviderNetwork].[dbo].[Network] where [NetworkName] = 'MEDICAID 1' and [ClientID] = @client_id) = 1
begin
	delete s 
	from [ProviderNetwork].[dbo].[Subnetwork] s
	join [ProviderNetwork].[dbo].[Network] n on n.[NetworkKey] = s.[NetworkKey]
	where n.[NetworkName] = 'MEDICAID 1'
		and n.[ClientID] = @client_id

	delete from [ProviderNetwork].[dbo].[Network] where [NetworkName] = 'MEDICAID 1' and [ClientID] = @client_id

	print 'Network "Medicaid 1" and related subnetworks have been deleted from tables'
end
else print 'Network "Medicaid 1" doesn''t exist in the table'


if (select count(*) 
	from [ProviderNetwork].[dbo].[Subnetwork] s
	join [ProviderNetwork].[dbo].[Network] n on n.[NetworkKey] = s.[NetworkKey]
	where s.[SubnetworkName] = 'MEDICAID 1'
		and n.[NetworkName] = 'MEDICAID'
		and n.[ClientID] = @client_id) = 1
begin
	delete s 
	from [ProviderNetwork].[dbo].[Subnetwork] s
	join [ProviderNetwork].[dbo].[Network] n on n.[NetworkKey] = s.[NetworkKey]
	where s.[SubnetworkName] = 'MEDICAID 1'
		and n.[NetworkName] = 'MEDICAID'
		and n.[ClientID] = @client_id

	print 'Subnetwork "Medicaid 1" under Network "MEDICAID" has been deleted from table'
end
else print 'Subnetwork "Medicaid 1" under Network "MEDICAID" doesn''t exist in the table'


if (select count(*) from [ProviderNetwork].[dbo].[Network] where [NetworkName] = 'Medicare DST' and [ClientID] = @client_id) = 0
begin
	insert into [ProviderNetwork].[dbo].[Network]
		([ClientID]
		,[NetworkCode]
		,[NetworkName]
		,[Description]
		,[IsActive]
		,[CloseDate]
		,[CreateUserKey]
		,[CreateDate]
		,[UpdateUserKey]
		,[UpdateDate])
	values
		(@client_id					-- [ClientID]
		,'DST'					-- [NetworkCode]
		,'Medicare DST'			-- [NetworkName]
		,'Medicare DST'			-- [Description]
		,1						-- [IsActive]
		,NULL					-- [CloseDate]
		,112954					-- [CreateUserKey]
		,getdate()				-- [CreateDate]
		,112954					-- [UpdateUserKey]
		,getdate())				-- [UpdateDate]

print 'Network "Medicare DST" has been inserted into the table'
end
else print 'Network "Medicare DST" already exists in the table'





if (select count(*) from [ProviderNetwork].[dbo].[Network] where [NetworkName] = 'MEDICAID' and [ClientID] = @client_id) = 0
begin
	insert into [ProviderNetwork].[dbo].[Network]
		([ClientID]
		,[NetworkCode]
		,[NetworkName]
		,[Description]
		,[IsActive]
		,[CloseDate]
		,[CreateUserKey]
		,[CreateDate]
		,[UpdateUserKey]
		,[UpdateDate])
	values
		(@client_id					-- [ClientID]
		,'MED'					-- [NetworkCode]
		,'MEDICAID'				-- [NetworkName]
		,'med'					-- [Description]
		,1						-- [IsActive]
		,NULL					-- [CloseDate]
		,112954					-- [CreateUserKey]
		,getdate()				-- [CreateDate]
		,112954					-- [UpdateUserKey]
		,getdate())				-- [UpdateDate]

print 'Network "Medicaid" has been inserted into the table'
end
else print 'Network "Medicaid" already exists in the table'


if (select count(*) from [ProviderNetwork].[dbo].[Network] where [NetworkName] = 'MEDICAID 2' and [ClientID] = @client_id) = 0
begin
	insert into [ProviderNetwork].[dbo].[Network]
		([ClientID]
		,[NetworkCode]
		,[NetworkName]
		,[Description]
		,[IsActive]
		,[CloseDate]
		,[CreateUserKey]
		,[CreateDate]
		,[UpdateUserKey]
		,[UpdateDate])
	values
		(@client_id					-- [ClientID]
		,'MED 2'				-- [NetworkCode]
		,'MEDICAID 2'			-- [NetworkName]
		,'med'					-- [Description]
		,1						-- [IsActive]
		,NULL					-- [CloseDate]
		,112954					-- [CreateUserKey]
		,getdate()				-- [CreateDate]
		,112954					-- [UpdateUserKey]
		,getdate())				-- [UpdateDate]

print 'Network "Medicaid 2" has been inserted into the table'
end
else print 'Network "Medicaid 2" already exists in the table'
	   

if (select count(*) from [ProviderNetwork].[dbo].[Network] where [NetworkName] = 'MEDICAID 3' and [ClientID] = @client_id) = 0
begin
	insert into [ProviderNetwork].[dbo].[Network]
		([ClientID]
		,[NetworkCode]
		,[NetworkName]
		,[Description]
		,[IsActive]
		,[CloseDate]
		,[CreateUserKey]
		,[CreateDate]
		,[UpdateUserKey]
		,[UpdateDate])
	values
	    (@client_id					-- [ClientID]
		,'MED 3'				-- [NetworkCode]
		,'MEDICAID 3'			-- [NetworkName]
		,'med'					-- [Description]
		,1						-- [IsActive]
		,NULL					-- [CloseDate]
		,112954					-- [CreateUserKey]
		,getdate()				-- [CreateDate]
		,112954					-- [UpdateUserKey]
		,getdate())				-- [UpdateDate]

print 'Network "Medicaid 3" has been inserted into the table'
end
else print 'Network "Medicaid 3" already exists in the table'


if (select count(*) 
	from [ProviderNetwork].[dbo].[Subnetwork] s
	join [ProviderNetwork].[dbo].[Network] n on n.[NetworkKey] = s.[NetworkKey]
	where n.[NetworkName] = 'Medicare DST'
		and n.[ClientID] = @client_id
		and s.[SubnetworkName] = 'Medicare DST') = 0
begin
	insert into [ProviderNetwork].[dbo].[Subnetwork]
		([NetworkKey]
		,[SubnetworkCode]
		,[SubnetworkName]
		,[Description]
		,[LineOfBusinessKey]
		,[IsActive]
		,[CloseDate]
		,[CreateUserKey]
		,[CreateDate]
		,[UpdateUserKey]
		,[UpdateDate])
	values
		((select [NetworkKey] from [ProviderNetwork].[dbo].[Network] where ClientID = @client_id and [NetworkName] = 'Medicare DST')	-- [NetworkKey]
		,NULL					-- [SubnetworkCode]
		,'Medicare DST'			-- [SubnetworkName]
		,NULL					-- [Description]
		,2						-- [LineOfBusinessKey]
		,1						-- [IsActive]
		,NULL					-- [CloseDate]
		,112954					-- [CreateUserKey]
		,getdate()				-- [CreateDate]
		,112954					-- [UpdateUserKey]
		,getdate())				-- [UpdateDate])

print 'Subnetwork "Medicare DST" under Network "Medicare DST" has been inserted into the table'
end
else print 'Subnetwork "Medicare DST" under Network "Medicare DST" already exists in the table'


if (select count(*) 
	from [ProviderNetwork].[dbo].[Subnetwork] s
	join [ProviderNetwork].[dbo].[Network] n on n.[NetworkKey] = s.[NetworkKey]
	where n.[NetworkName] = 'MEDICAID'
		and n.[ClientID] = @client_id
		and s.[SubnetworkName] = 'Medicare DST') = 0
begin
	insert into [ProviderNetwork].[dbo].[Subnetwork]
		([NetworkKey]
		,[SubnetworkCode]
		,[SubnetworkName]
		,[Description]
		,[LineOfBusinessKey]
		,[IsActive]
		,[CloseDate]
		,[CreateUserKey]
		,[CreateDate]
		,[UpdateUserKey]
		,[UpdateDate])
	values
		((select [NetworkKey] from [ProviderNetwork].[dbo].[Network] where ClientID = @client_id and [NetworkName] = 'MEDICAID')	-- [NetworkKey]
		,NULL					-- [SubnetworkCode]
		,'Medicare DST'			-- [SubnetworkName]
		,NULL					-- [Description]
		,2						-- [LineOfBusinessKey]
		,1						-- [IsActive]
		,NULL					-- [CloseDate]
		,112954					-- [CreateUserKey]
		,getdate()				-- [CreateDate]
		,112954					-- [UpdateUserKey]
		,getdate())				-- [UpdateDate])

print 'Subnetwork "Medicare DST" under Network "MEDICAID" has been inserted into the table'
end
else print 'Subnetwork "Medicare DST" under Network "MEDICAID" already exists in the table'


if (select count(*) 
	from [ProviderNetwork].[dbo].[Subnetwork] s
	join [ProviderNetwork].[dbo].[Network] n on n.[NetworkKey] = s.[NetworkKey]
	where n.[NetworkName] = 'MEDICAID'
		and n.[ClientID] = @client_id
		and s.[SubnetworkName] = 'MEDICAID') = 0
begin
	insert into [ProviderNetwork].[dbo].[Subnetwork]
		([NetworkKey]
		,[SubnetworkCode]
		,[SubnetworkName]
		,[Description]
		,[LineOfBusinessKey]
		,[IsActive]
		,[CloseDate]
		,[CreateUserKey]
		,[CreateDate]
		,[UpdateUserKey]
		,[UpdateDate])
	values
		((select [NetworkKey] from [ProviderNetwork].[dbo].[Network] where ClientID = @client_id and [NetworkName] = 'MEDICAID')	-- [NetworkKey]
		,NULL					-- [SubnetworkCode]
		,'MEDICAID'				-- [SubnetworkName]
		,NULL					-- [Description]
		,2						-- [LineOfBusinessKey]
		,1						-- [IsActive]
		,NULL					-- [CloseDate]
		,112954					-- [CreateUserKey]
		,getdate()				-- [CreateDate]
		,112954					-- [UpdateUserKey]
		,getdate())				-- [UpdateDate])

print 'Subnetwork "Medicaid" under Network "Medicaid" has been inserted into the table'
end
else print 'Subnetwork "Medicaid" under Network "Medicaid" already exists in the table'


if (select count(*) 
	from [ProviderNetwork].[dbo].[Subnetwork] s
	join [ProviderNetwork].[dbo].[Network] n on n.[NetworkKey] = s.[NetworkKey]
	where n.[NetworkName] = 'MEDICAID 2'
		and n.[ClientID] = @client_id
		and s.[SubnetworkName] = 'MEDICAID') = 0
begin
	insert into [ProviderNetwork].[dbo].[Subnetwork]
		([NetworkKey]
		,[SubnetworkCode]
		,[SubnetworkName]
		,[Description]
		,[LineOfBusinessKey]
		,[IsActive]
		,[CloseDate]
		,[CreateUserKey]
		,[CreateDate]
		,[UpdateUserKey]
		,[UpdateDate])
	values
		((select [NetworkKey] from [ProviderNetwork].[dbo].[Network] where ClientID = @client_id and [NetworkName] = 'MEDICAID 2')	-- [NetworkKey]
		,NULL					-- [SubnetworkCode]
		,'MEDICAID'				-- [SubnetworkName]
		,NULL					-- [Description]
		,2						-- [LineOfBusinessKey]
		,1						-- [IsActive]
		,NULL					-- [CloseDate]
		,112954					-- [CreateUserKey]
		,getdate()				-- [CreateDate]
		,112954					-- [UpdateUserKey]
		,getdate())				-- [UpdateDate])

print 'Subnetwork "Medicaid" under Network "Medicaid 2" has been inserted into the table'
end
else print 'Subnetwork "Medicaid" under Network "Medicaid 2" already exists in the table'
	

if (select count(*) 
	from [ProviderNetwork].[dbo].[Subnetwork] s
	join [ProviderNetwork].[dbo].[Network] n on n.[NetworkKey] = s.[NetworkKey]
	where n.[NetworkName] = 'MEDICAID 3'
		and n.[ClientID] = @client_id
		and s.[SubnetworkName] = 'MEDICAID') = 0
begin
	insert into [ProviderNetwork].[dbo].[Subnetwork]
		([NetworkKey]
		,[SubnetworkCode]
		,[SubnetworkName]
		,[Description]
		,[LineOfBusinessKey]
		,[IsActive]
		,[CloseDate]
		,[CreateUserKey]
		,[CreateDate]
		,[UpdateUserKey]
		,[UpdateDate])
	values
	    ((select [NetworkKey] from [ProviderNetwork].[dbo].[Network] where ClientID = @client_id and [NetworkName] = 'MEDICAID 3')	-- [NetworkKey]
		,NULL					-- [SubnetworkCode]
		,'MEDICAID'				-- [SubnetworkName]
		,NULL					-- [Description]
		,2						-- [LineOfBusinessKey]
		,1						-- [IsActive]
		,NULL					-- [CloseDate]
		,112954					-- [CreateUserKey]
		,getdate()				-- [CreateDate]
		,112954					-- [UpdateUserKey]
		,getdate())				-- [UpdateDate])

print 'Subnetwork "Medicaid" under Network "Medicaid 3" has been inserted into the table'
end
else print 'Subnetwork "Medicaid" under Network "Medicaid 3" already exists in the table'