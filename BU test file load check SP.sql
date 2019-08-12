USE [ProviderNetworkStaging]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

alter proc [dbo].[test_BU_file_load_check]
	@BatchID bigint
as
declare
	@loop_counter int
	,@exist_col_name varchar(100)
	,@test_col_name varchar(100)
	,@sqlText1 varchar(1000)
	,@sqlText2 varchar(1000)
	,@sqlText3 varchar(1000)
	,@sqlText4 varchar(1000)


set nocount on

begin

--############################## PNE ##############################

	select [EntityName]
		,[StgTableName]
		,[StgTablePrimaryKey]
		,[ExceptionStatus]
		,[ErrorDescription]
		,cast(NULL as varchar(20)) as Facility_NPI
		,cast(NULL as varchar(20)) as Provider_NPI
		,cast(NULL as varchar(255)) as Contract_ID
		,cast(NULL as int) as [Rank]
	into #pne
	from [ProviderNetworkStaging].[dbo].[ProviderNetworkException]
	where [BatchID] = -5

	update t
	set t.[Contract_ID] = cc.[ContractId]
	from #pne t
	join [ProviderNetworkStaging].[dbo].[StgContractComponent] cc on t.[StgTableName] = 'StgContractComponent' 
														   and t.[StgTablePrimaryKey] = cc.[StgContractComponentKey]

	update t
	set t.[Facility_NPI] = case when [StgTableName] = 'StgPractice' then p.[PracticeNPI]
								when [StgTableName] = 'StgPracticeBilling' then pb.[PracticeNPI]
								when [StgTableName] = 'StgPracticeLocation' then spl.[PracticeNPI]
								when [StgTableName] = 'StgPracticeLocationLanguage' then pll.[PracticeNPI]
								when [StgTableName] = 'StgPracticeLocationCommunication' then plc.[PracticeNPI]
								when [StgTableName] = 'StgPracticeLocationSpecialty' then pls.[PracticeNPI]
								when [StgTableName] = 'StgPracticeLocationContractComponent' then flcc.[PracticeNPI]
								when [StgTableName] = 'StgPracticeLocationProvider' then plp.[PracticeNPI]
								when [StgTableName] = 'StgPracticeLocationProviderSpecialty' then plps.[PracticeNPI]
								when [StgTableName] = 'StgProviderNetworkMaster' then pnm.[PracticeNPI]
								else NULL
						   end
		,t.[Provider_NPI] = case when [StgTableName] = 'StgProvider' then pp.[ProviderNPI]
								 when [StgTableName] = 'StgProviderCredential' then pc.[ProviderNPI]
								 when [StgTableName] = 'StgProviderLanguage' then pl.[ProviderNPI]
								 when [StgTableName] = 'StgProviderLocationContractComponent' then plcc.[ProviderNPI]
								 when [StgTableName] = 'StgProviderLocationHospitalRelationship' then plhr.[ProviderNPI]
								 when [StgTableName] = 'StgProviderSpecialty' then ps.[ProviderNPI]
								 else NULL
							end
	from #pne t
	left join [ProviderNetworkStaging].[dbo].[StgPractice] p on t.[StgTableName] = 'StgPractice' 
													  and t.[StgTablePrimaryKey] = p.[StgPracticeKey]
	left join [ProviderNetworkStaging].[dbo].[StgPracticeBilling] pb on t.[StgTableName] = 'StgPracticeBilling' 
															  and t.[StgTablePrimaryKey] = pb.[StgPracticeBillingKey]
	left join [ProviderNetworkStaging].[dbo].[StgPracticeLocation] spl on t.[StgTableName] = 'StgPracticeLocation' 
																and t.[StgTablePrimaryKey] = spl.[StgPracticeLocationKey]
	left join [ProviderNetworkStaging].[dbo].[StgPracticeLocationLanguage] pll on t.[StgTableName] = 'StgPracticeLocationLanguage' 
																		and t.[StgTablePrimaryKey] = pll.[StgPracticeLocationLanguageKey]
	left join [ProviderNetworkStaging].[dbo].[StgPracticeLocationCommunication] plc on t.[StgTableName] = 'StgPracticeLocationCommunication' 
																			 and t.[StgTablePrimaryKey] = plc.[StgPracticeLocationCommunicationKey]
	left join [ProviderNetworkStaging].[dbo].[StgPracticeLocationSpecialty] pls on t.[StgTableName] = 'StgPracticeLocationSpecialty' 
																		 and t.[StgTablePrimaryKey] = pls.[StgPracticeLocationSpecialtyKey]
	left join [ProviderNetworkStaging].[dbo].[StgPracticeLocationContractComponent] flcc on t.[StgTableName] = 'StgPracticeLocationContractComponent' 
																				  and t.[StgTablePrimaryKey] = flcc.[StgPracticeLocationContractComponentKey]
	left join [ProviderNetworkStaging].[dbo].[StgPracticeLocationProvider] plp on t.[StgTableName] = 'StgPracticeLocationProvider' 
																		and t.[StgTablePrimaryKey] = plp.[StgPracticeLocationProviderKey]
	left join [ProviderNetworkStaging].[dbo].[StgPracticeLocationProviderSpecialty] plps on t.[StgTableName] = 'StgPracticeLocationProviderSpecialty' 
																				  and t.[StgTablePrimaryKey] = plps.[StgPracticeLocationProviderSpecialtyKey]
	left join [ProviderNetworkStaging].[dbo].[StgProviderNetworkMaster] pnm on t.[StgTableName] = 'StgProviderNetworkMaster' 
																	 and t.[StgTablePrimaryKey] = pnm.[StgProviderNetworkMasterKey]
	left join [ProviderNetworkStaging].[dbo].[StgProvider] pp on t.[StgTableName] = 'StgProvider' 
													   and t.[StgTablePrimaryKey] = pp.[StgProviderKey]
	left join [ProviderNetworkStaging].[dbo].[StgProviderCredential] pc on t.[StgTableName] = 'StgProviderCredential' 
																 and t.[StgTablePrimaryKey] = pc.[StgProviderCredentialKey]
	left join [ProviderNetworkStaging].[dbo].[StgProviderLanguage] pl on t.[StgTableName] = 'StgProviderLanguage' 
															   and t.[StgTablePrimaryKey] = pl.[StgProviderLanguageKey]
	left join [ProviderNetworkStaging].[dbo].[StgProviderLocationContractComponent] plcc on t.[StgTableName] = 'StgProviderLocationContractComponent' 
																				  and t.[StgTablePrimaryKey] = plcc.[StgProviderLocationContractComponentKey]
	left join [ProviderNetworkStaging].[dbo].[StgProviderLocationHospitalRelationship] plhr on t.[StgTableName] = 'StgProviderLocationHospitalRelationship' 
																					 and t.[StgTablePrimaryKey] = plhr.[StgProviderLocationHospitalRelationshipKey]
	left join [ProviderNetworkStaging].[dbo].[StgProviderSpecialty] ps on t.[StgTableName] = 'StgProviderSpecialty' 
																and t.[StgTablePrimaryKey] = ps.[StgProviderSpecialtyKey]

	;with [orderRecord] as (select [Rank]
								,rank() over (partition by [Facility_NPI]
														   ,[Provider_NPI]
														   ,[Contract_ID] 
											  order by [EntityName]
													   ,[StgTablePrimaryKey]
													   ,[ErrorDescription]
											 ) as Rank_number 
							from #pne)
	update [orderRecord] set [Rank] = Rank_number

	select [EntityName]
		,[StgTableName]
		,[StgTablePrimaryKey]
		,[ExceptionStatus]
		,[ErrorDescription]
		,cast(NULL as varchar(20)) as Facility_NPI
		,cast(NULL as varchar(20)) as Provider_NPI
		,cast(NULL as varchar(255)) as Contract_ID
		,cast(NULL as int) as [Rank]
	into #test_pne
	from [ProviderNetworkStaging].[dbo].[ProviderNetworkException]
	where [BatchID] = @BatchID

	update t
	set t.[Contract_ID] = cc.[ContractId]
	from #test_pne t
	join [ProviderNetworkStaging].[dbo].[StgContractComponent] cc on t.[StgTableName] = 'StgContractComponent' 
														   and t.[StgTablePrimaryKey] = cc.[StgContractComponentKey]

	update t
	set t.[Facility_NPI] = case when [StgTableName] = 'StgPractice' then p.[PracticeNPI]
								when [StgTableName] = 'StgPracticeBilling' then pb.[PracticeNPI]
								when [StgTableName] = 'StgPracticeLocation' then spl.[PracticeNPI]
								when [StgTableName] = 'StgPracticeLocationLanguage' then pll.[PracticeNPI]
								when [StgTableName] = 'StgPracticeLocationCommunication' then plc.[PracticeNPI]
								when [StgTableName] = 'StgPracticeLocationSpecialty' then pls.[PracticeNPI]
								when [StgTableName] = 'StgPracticeLocationContractComponent' then flcc.[PracticeNPI]
								when [StgTableName] = 'StgPracticeLocationProvider' then plp.[PracticeNPI]
								when [StgTableName] = 'StgPracticeLocationProviderSpecialty' then plps.[PracticeNPI]
								when [StgTableName] = 'StgProviderNetworkMaster' then pnm.[PracticeNPI]
								else NULL
						   end
		,t.[Provider_NPI] = case when [StgTableName] = 'StgProvider' then pp.[ProviderNPI]
								 when [StgTableName] = 'StgProviderCredential' then pc.[ProviderNPI]
								 when [StgTableName] = 'StgProviderLanguage' then pl.[ProviderNPI]
								 when [StgTableName] = 'StgProviderLocationContractComponent' then plcc.[ProviderNPI]
								 when [StgTableName] = 'StgProviderLocationHospitalRelationship' then plhr.[ProviderNPI]
								 when [StgTableName] = 'StgProviderSpecialty' then ps.[ProviderNPI]
								 else NULL
							end
	from #test_pne t
	left join [ProviderNetworkStaging].[dbo].[StgPractice] p on t.[StgTableName] = 'StgPractice' 
													  and t.[StgTablePrimaryKey] = p.[StgPracticeKey]
	left join [ProviderNetworkStaging].[dbo].[StgPracticeBilling] pb on t.[StgTableName] = 'StgPracticeBilling' 
															  and t.[StgTablePrimaryKey] = pb.[StgPracticeBillingKey]
	left join [ProviderNetworkStaging].[dbo].[StgPracticeLocation] spl on t.[StgTableName] = 'StgPracticeLocation' 
																and t.[StgTablePrimaryKey] = spl.[StgPracticeLocationKey]
	left join [ProviderNetworkStaging].[dbo].[StgPracticeLocationLanguage] pll on t.[StgTableName] = 'StgPracticeLocationLanguage' 
																		and t.[StgTablePrimaryKey] = pll.[StgPracticeLocationLanguageKey]
	left join [ProviderNetworkStaging].[dbo].[StgPracticeLocationCommunication] plc on t.[StgTableName] = 'StgPracticeLocationCommunication' 
																			 and t.[StgTablePrimaryKey] = plc.[StgPracticeLocationCommunicationKey]
	left join [ProviderNetworkStaging].[dbo].[StgPracticeLocationSpecialty] pls on t.[StgTableName] = 'StgPracticeLocationSpecialty' 
																		 and t.[StgTablePrimaryKey] = pls.[StgPracticeLocationSpecialtyKey]
	left join [ProviderNetworkStaging].[dbo].[StgPracticeLocationContractComponent] flcc on t.[StgTableName] = 'StgPracticeLocationContractComponent' 
																				  and t.[StgTablePrimaryKey] = flcc.[StgPracticeLocationContractComponentKey]
	left join [ProviderNetworkStaging].[dbo].[StgPracticeLocationProvider] plp on t.[StgTableName] = 'StgPracticeLocationProvider' 
																		and t.[StgTablePrimaryKey] = plp.[StgPracticeLocationProviderKey]
	left join [ProviderNetworkStaging].[dbo].[StgPracticeLocationProviderSpecialty] plps on t.[StgTableName] = 'StgPracticeLocationProviderSpecialty' 
																				  and t.[StgTablePrimaryKey] = plps.[StgPracticeLocationProviderSpecialtyKey]
	left join [ProviderNetworkStaging].[dbo].[StgProviderNetworkMaster] pnm on t.[StgTableName] = 'StgProviderNetworkMaster' 
																	 and t.[StgTablePrimaryKey] = pnm.[StgProviderNetworkMasterKey]
	left join [ProviderNetworkStaging].[dbo].[StgProvider] pp on t.[StgTableName] = 'StgProvider' 
													   and t.[StgTablePrimaryKey] = pp.[StgProviderKey]
	left join [ProviderNetworkStaging].[dbo].[StgProviderCredential] pc on t.[StgTableName] = 'StgProviderCredential' 
																 and t.[StgTablePrimaryKey] = pc.[StgProviderCredentialKey]
	left join [ProviderNetworkStaging].[dbo].[StgProviderLanguage] pl on t.[StgTableName] = 'StgProviderLanguage' 
															   and t.[StgTablePrimaryKey] = pl.[StgProviderLanguageKey]
	left join [ProviderNetworkStaging].[dbo].[StgProviderLocationContractComponent] plcc on t.[StgTableName] = 'StgProviderLocationContractComponent' 
																				  and t.[StgTablePrimaryKey] = plcc.[StgProviderLocationContractComponentKey]
	left join [ProviderNetworkStaging].[dbo].[StgProviderLocationHospitalRelationship] plhr on t.[StgTableName] = 'StgProviderLocationHospitalRelationship' 
																					 and t.[StgTablePrimaryKey] = plhr.[StgProviderLocationHospitalRelationshipKey]
	left join [ProviderNetworkStaging].[dbo].[StgProviderSpecialty] ps on t.[StgTableName] = 'StgProviderSpecialty' 
																and t.[StgTablePrimaryKey] = ps.[StgProviderSpecialtyKey]

	;with [orderRecord] as (select [Rank]
								,rank() over (partition by [Facility_NPI]
														   ,[Provider_NPI]
														   ,[Contract_ID] 
											  order by [EntityName]
													   ,[StgTablePrimaryKey]
													   ,[ErrorDescription]
											 ) as Rank_number 
							from #test_pne)
	update [orderRecord] set [Rank] = Rank_number

	create table #ProviderNetworkException
		(Facility_NPI varchar(20)
		,Provider_NPI varchar(20)
		,Contract_ID varchar(255)
		,Rank int
		,Diff_flag bit
		,EntityName varchar(100)
		,test_EntityName varchar(100)
		,StgTableName varchar(100)
		,test_StgTableName varchar(100)
		,ExceptionStatus varchar(1)
		,test_ExceptionStatus varchar(1)
		,ErrorDescription varchar(500)
		,test_ErrorDescription varchar(500)
		)

	insert into #ProviderNetworkException
		(Facility_NPI, Provider_NPI, Contract_ID, Rank
		,EntityName, test_EntityName
		,StgTableName, test_StgTableName
		,ExceptionStatus, test_ExceptionStatus
		,ErrorDescription, test_ErrorDescription
		)
		select t.[Facility_NPI], t.[Provider_NPI], t.[Contract_ID], t.[Rank]
			,e.[EntityName], t.[EntityName]
			,e.[StgTableName], t.[StgTableName]
			,e.[ExceptionStatus], t.[ExceptionStatus]
			,e.[ErrorDescription], t.[ErrorDescription]
		from #pne e
		full join #test_pne t on isnull(e.[Facility_NPI],1) = isnull(t.[Facility_NPI],1)
							 and isnull(e.[Provider_NPI],1) = isnull(t.[Provider_NPI],1)
							  and isnull(e.[Contract_ID],1) = isnull(t.[Contract_ID],1)
											   and e.[Rank] = t.[Rank]

	create table #pne_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #pne_names values
		(1,'EntityName','test_EntityName')
		,(2,'StgTableName','test_StgTableName')
		,(3,'ExceptionStatus','test_ExceptionStatus')
		,(4,'ErrorDescription','test_ErrorDescription')
	
	set @loop_counter = 1
	while (@loop_counter <= 4)
		begin
			select @exist_col_name = exist_col_name from #pne_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #pne_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #ProviderNetworkException set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #ProviderNetworkException set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select count(distinct '+@test_col_name+') from #ProviderNetworkException) = 0 alter table #ProviderNetworkException drop column '+@test_col_name
			set @sqlText4 = N'if (select count(distinct '+@exist_col_name+') from #ProviderNetworkException) = 0 alter table #ProviderNetworkException drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'Provider Network Exception'
	select * from #ProviderNetworkException where Diff_flag = 1


--############################## CONTRACT COMPONENT ##############################

	select [ContractId]
		,[StgContractComponentKey]
		,[AffiliationId]
		,[NetworkName]
		,[SubnetworkName]
		,[ReimbursementRate]
		,[SubnetworkKey]
		,[RecordStatus]
		,[RecordStatusDescription]
		,cast(NULL as int) as [Rank]
	into #cc
	from [ProviderNetworkStaging].[dbo].[StgContractComponent]
	where [BatchID] = -5

	;with [orderRecord] as (select [ContractId]
								,[StgContractComponentKey]
								,[Rank]
								,rank() over (partition by [ContractId] 
											  order by [StgContractComponentKey]
											 ) as Rank_number 
							from #cc)
	update [orderRecord] set [Rank] = Rank_number

	select [ContractId]
		,[StgContractComponentKey]
		,[AffiliationId]
		,[NetworkName]
		,[SubnetworkName]
		,[ReimbursementRate]
		,[SubnetworkKey]
		,[RecordStatus]
		,[RecordStatusDescription]
		,cast(NULL as int) as [Rank]
	into #test_cc
	from [ProviderNetworkStaging].[dbo].[StgContractComponent]
	where [BatchID] = @BatchID

	;with [orderRecord] as (select [ContractId]
								,[StgContractComponentKey]
								,[Rank]
								,rank() over (partition by [ContractId] 
											  order by [StgContractComponentKey]
											 ) as Rank_number 
							from #test_cc)
	update [orderRecord] set [Rank] = Rank_number

	create table #StgContractComponent
		([ContractId] varchar(255)
		,[Diff_flag] bit
		,[AffiliationId] varchar(255)
		,[test_AffiliationId] varchar(255)
		,[NetworkName] varchar(255)
		,[test_NetworkName] varchar(255)
		,[SubnetworkName] varchar(255)
		,[test_SubnetworkName] varchar(255)
		,[ReimbursementRate] varchar(255)
		,[test_ReimbursementRate] varchar(255)
		,[SubnetworkKey] int
		,[test_SubnetworkKey] int
		,[RecordStatus] varchar(2)
		,[test_RecordStatus] varchar(2)
		,[RecordStatusDescription] varchar(100)
		,[test_RecordStatusDescription] varchar(100)
		)

	insert into #StgContractComponent
		([ContractId]
		,[AffiliationId], [test_AffiliationId]
		,[NetworkName], [test_NetworkName]
		,[SubnetworkName], [test_SubnetworkName]
		,[ReimbursementRate], [test_ReimbursementRate]
		,[SubnetworkKey], [test_SubnetworkKey]
		,[RecordStatus], [test_RecordStatus]
		,[RecordStatusDescription], [test_RecordStatusDescription]
		)
		select t.[ContractId]
			,e.[AffiliationId], t.[AffiliationId]
			,e.[NetworkName], t.[NetworkName]
			,e.[SubnetworkName], t.[SubnetworkName]
			,e.[ReimbursementRate], t.[ReimbursementRate]
			,e.[SubnetworkKey], t.[SubnetworkKey]
			,e.[RecordStatus], t.[RecordStatus]
			,e.[RecordStatusDescription], t.[RecordStatusDescription]
		from #cc e
		full join #test_cc t on e.[ContractId] = t.[ContractId]
								  and e.[Rank] = t.[Rank]

	create table #stgcc_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #stgcc_names values
		 (1,'AffiliationId','test_AffiliationId')
		,(2,'NetworkName','test_NetworkName')
		,(3,'SubnetworkName','test_SubnetworkName')
		,(4,'ReimbursementRate','test_ReimbursementRate')
		,(5,'SubnetworkKey','test_SubnetworkKey')
		,(6,'RecordStatus','test_RecordStatus')
		,(7,'RecordStatusDescription','test_RecordStatusDescription')
	
	set @loop_counter = 1
	while (@loop_counter <= 7)
		begin
			select @exist_col_name = exist_col_name from #stgcc_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #stgcc_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #StgContractComponent set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #StgContractComponent set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select count(distinct '+@test_col_name+') from #StgContractComponent) = 0 alter table #StgContractComponent drop column '+@test_col_name
			set @sqlText4 = N'if (select count(distinct '+@exist_col_name+') from #StgContractComponent) = 0 alter table #StgContractComponent drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'StgContractComponent'
	select * from #StgContractComponent where Diff_flag = 1

	create table #ContractComponent
		([ContractId] varchar(255)
		,[Diff_flag] bit
		,[AffiliationId] varchar(255)
		,[test_AffiliationId] varchar(255)
		,[ReimbursementRate] varchar(255)
		,[test_ReimbursementRate] varchar(255)
		,[SubnetworkKey] int
		,[test_SubnetworkKey] int
		)

	insert into #ContractComponent
		([ContractId]
		,[AffiliationId], [test_AffiliationId]
		,[ReimbursementRate], [test_ReimbursementRate]
		,[SubnetworkKey], [test_SubnetworkKey]
		)
		select t.[ContractId]
			,e.[AffiliationId], t.[AffiliationId]
			,e.[ReimbursementRate], t.[ReimbursementRate]
			,e.[SubnetworkKey], t.[SubnetworkKey]
		from [ProviderNetwork].[dbo].[ContractComponent] e
		full join [ProviderNetwork].[dbo].[ContractComponent] t on e.[ContractId] = replace(t.[ContractId],'99999','99998')
															and e.[AffiliationId] = t.[AffiliationId]
		where e.[ContractId] like '99998%'
			and t.[ContractId] like '99999%'

	create table #cc_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #cc_names values
		 (1,'AffiliationId','test_AffiliationId')
		,(2,'ReimbursementRate','test_ReimbursementRate')
		,(3,'SubnetworkKey','test_SubnetworkKey')
	
	set @loop_counter = 1
	while (@loop_counter <= 3)
		begin
			select @exist_col_name = exist_col_name from #cc_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #cc_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #ContractComponent set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #ContractComponent set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select count(distinct '+@test_col_name+') from #ContractComponent) = 0 alter table #ContractComponent drop column '+@test_col_name
			set @sqlText4 = N'if (select count(distinct '+@exist_col_name+') from #ContractComponent) = 0 alter table #ContractComponent drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'OLTP Contract Component'
	select * from #ContractComponent where Diff_flag = 1



--############################## FACILITY ##############################
	
	create table #StgFacility
		(PracticeNPI varchar(10)
		,Diff_flag bit
		,PracticeName varchar(255)
		,test_PracticeName varchar(255)
		,PracticeType varchar(255)
		,test_PracticeType varchar(255)
		,PracticeTypeKey int
		,test_PracticeTypeKey int
		,MemberAssignmentTypeCode varchar(10)
		,test_MemberAssignmentTypeCode varchar(10)
		,MemberAssignmentTypeKey int
		,test_MemberAssignmentTypeKey int
		,RecordStatus varchar(2)
		,test_RecordStatus varchar(2)
		,RecordStatusDescription varchar(100)
		,test_RecordStatusDescription varchar(100)
		)

	insert into #StgFacility
		(PracticeNPI
		,PracticeName, test_PracticeName
		,PracticeType, test_PracticeType
		,PracticeTypeKey, test_PracticeTypeKey
		,MemberAssignmentTypeCode, test_MemberAssignmentTypeCode
		,MemberAssignmentTypeKey, test_MemberAssignmentTypeKey
		,RecordStatus, test_RecordStatus
		,RecordStatusDescription, test_RecordStatusDescription
		)
		select t.[PracticeNPI]
			,e.[PracticeName], t.[PracticeName]
			,e.[PracticeType], t.[PracticeType]
			,e.[PracticeTypeKey], t.[PracticeTypeKey]
			,e.[MemberAssignmentTypeCode], t.[MemberAssignmentTypeCode]
			,e.[MemberAssignmentTypeKey], t.[MemberAssignmentTypeKey]
			,e.[RecordStatus], t.[RecordStatus]
			,e.[RecordStatusDescription], t.[RecordStatusDescription]
		from [ProviderNetworkStaging].[dbo].[StgPractice] e
		full join [ProviderNetworkStaging].[dbo].[StgPractice] t on e.[PracticeNPI] = t.[PracticeNPI]
															   and e.[PracticeType] = t.[PracticeType]
															   and e.[PracticeName] = t.[PracticeName]
		where e.[BatchID] = -5
			and t.[BatchID] = @BatchID

	create table #stgfacility_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #stgfacility_names values
		(1,'PracticeName','test_PracticeName')
		,(2,'PracticeType','test_PracticeType')
		,(3,'PracticeTypeKey','test_PracticeTypeKey')
		,(4,'MemberAssignmentTypeCode','test_MemberAssignmentTypeCode')
		,(5,'MemberAssignmentTypeKey','test_MemberAssignmentTypeKey')
		,(6,'RecordStatus','test_RecordStatus')
		,(7,'RecordStatusDescription','test_RecordStatusDescription')

	set @loop_counter = 1
	while (@loop_counter <= 7)
		begin
			select @exist_col_name = exist_col_name from #stgfacility_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #stgfacility_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #StgFacility set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #StgFacility set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select count(distinct '+@test_col_name+') from #StgFacility) = 0 alter table #StgFacility drop column '+@test_col_name
			set @sqlText4 = N'if (select count(distinct '+@exist_col_name+') from #StgFacility) = 0 alter table #StgFacility drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end
	
	select 'StgFacility'
	select * from #StgFacility where Diff_flag = 1
	
	create table #Facility
		(NPI varchar(10)
		,PracticeName varchar(255)
		,test_PracticeName varchar(255)
		,PracticeTypeKey int
		,test_PracticeTypeKey int
		,MemberAssignmentTypeKey int
		,test_MemberAssignmentTypeKey int
		,Diff_flag bit
		)

	insert into #Facility
		(NPI
		,PracticeName, test_PracticeName
		,PracticeTypeKey, test_PracticeTypeKey
		,MemberAssignmentTypeKey, test_MemberAssignmentTypeKey
		)
		select t.[NPI]
			,e.[PracticeName], t.[PracticeName]
			,e.[PracticeTypeKey], t.[PracticeTypeKey]
			,e.[MemberAssignmentTypeKey], t.[MemberAssignmentTypeKey]
		from [ProviderNetwork].[dbo].[Practice] e
		full join [ProviderNetwork].[dbo].[Practice] t on e.[NPI] = replace(t.[NPI],'99999','99998')
		where e.[NPI] like '99998%'
			and t.[NPI] like '99999%'

	create table #facility_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #facility_names values
		(1,'PracticeName','test_PracticeName')
		,(2,'PracticeTypeKey','test_PracticeTypeKey')
		,(3,'MemberAssignmentTypeKey','test_MemberAssignmentTypeKey')

	set @loop_counter = 1
	while (@loop_counter <= 3)
		begin
			select @exist_col_name = exist_col_name from #facility_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #facility_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #Facility set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #Facility set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select count(distinct '+@test_col_name+') from #Facility) = 0 alter table #Facility drop column '+@test_col_name
			set @sqlText4 = N'if (select count(distinct '+@exist_col_name+') from #Facility) = 0 alter table #Facility drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'OLTP Facility'
	select * from #Facility where Diff_flag = 1


--############################## FACILITY BILLING ##############################

	select [PracticeNPI]
		,[StgPracticeBillingKey]
		,[BusinessName]
		,[TIN]
		,[Address1]
		,[Address2]
		,[City]
		,[StateCode]
		,[ZipCode]
		,[PhoneNumber]
		,[FaxNumber]
		,[BillingMailingAddress1]
		,[BillingMailingAddress2]
		,[BillingMailingCity]
		,[BillingMailingState]
		,[BillingMailingZip]
		,[RecordStatus]
		,[RecordStatusDescription]
		,cast(NULL as int) as [Rank]
	into #stgfb
	from [ProviderNetworkStaging].[dbo].[StgPracticeBilling]
	where [BatchID] = -5

	;with [orderRecord] as (select [PracticeNPI]
								,[StgPracticeBillingKey]
								,[Rank]
								,rank() over (partition by [PracticeNPI] 
											  order by [StgPracticeBillingKey]
											 ) as Rank_number 
							from #stgfb)
	update [orderRecord] set [Rank] = Rank_number

	select [PracticeNPI]
		,[StgPracticeBillingKey]
		,[BusinessName]
		,[TIN]
		,[Address1]
		,[Address2]
		,[City]
		,[StateCode]
		,[ZipCode]
		,[PhoneNumber]
		,[FaxNumber]
		,[BillingMailingAddress1]
		,[BillingMailingAddress2]
		,[BillingMailingCity]
		,[BillingMailingState]
		,[BillingMailingZip]
		,[RecordStatus]
		,[RecordStatusDescription]
		,cast(NULL as int) as [Rank]
	into #test_stgfb
	from [ProviderNetworkStaging].[dbo].[StgPracticeBilling]
	where [BatchID] = @BatchID

	;with [orderRecord] as (select [PracticeNPI]
								,[StgPracticeBillingKey]
								,[Rank]
								,rank() over (partition by [PracticeNPI] 
											  order by [StgPracticeBillingKey]
											 ) as Rank_number 
							from #test_stgfb)
	update [orderRecord] set [Rank] = Rank_number

	create table #StgFacilityBilling
		([PracticeNPI] varchar (10)
		,[Diff_flag] bit
		,[BusinessName] varchar(255)			,[test_BusinessName] varchar(255)
		,[TIN] varchar(9)						,[test_TIN] varchar(9)
		,[Address1] varchar(100)				,[test_Address1] varchar(100)
		,[Address2] varchar(100)				,[test_Address2] varchar(100)
		,[City] varchar(50)						,[test_City] varchar(50)
		,[StateCode] char(2)					,[test_StateCode] char(2)
		,[ZipCode] varchar(10)					,[test_ZipCode] varchar(10)
		,[PhoneNumber] varchar(10)				,[test_PhoneNumber] varchar(10)
		,[FaxNumber] varchar(10)				,[test_FaxNumber] varchar(10)
		,[BillingMailingAddress1] varchar(100)	,[test_BillingMailingAddress1] varchar(100)
		,[BillingMailingAddress2] varchar(100)	,[test_BillingMailingAddress2] varchar(100)
		,[BillingMailingCity] varchar(50)		,[test_BillingMailingCity] varchar(50)
		,[BillingMailingState] varchar(2)		,[test_BillingMailingState] varchar(2)
		,[BillingMailingZip] varchar(10)		,[test_BillingMailingZip] varchar(10)
		,[RecordStatus] varchar(2)				,[test_RecordStatus] varchar(2)
		,[RecordStatusDescription] varchar(100)	,[test_RecordStatusDescription] varchar(100)
		)

	insert into #StgFacilityBilling
		([PracticeNPI]
		,[BusinessName]								,[test_BusinessName]
		,[TIN]										,[test_TIN]
		,[Address1]									,[test_Address1]
		,[Address2]									,[test_Address2]
		,[City]										,[test_City]
		,[StateCode]								,[test_StateCode]
		,[ZipCode]									,[test_ZipCode]
		,[PhoneNumber]								,[test_PhoneNumber]
		,[FaxNumber]								,[test_FaxNumber]
		,[BillingMailingAddress1]					,[test_BillingMailingAddress1]
		,[BillingMailingAddress2]					,[test_BillingMailingAddress2]
		,[BillingMailingCity]						,[test_BillingMailingCity]
		,[BillingMailingState]						,[test_BillingMailingState]
		,[BillingMailingZip]						,[test_BillingMailingZip]
		,[RecordStatus]								,[test_RecordStatus]
		,[RecordStatusDescription]					,[test_RecordStatusDescription]
		)
		select t.[PracticeNPI]
			   ,e.[BusinessName]							,t.[BusinessName]
			   ,e.[TIN]										,t.[TIN]
			   ,e.[Address1]								,t.[Address1]
			   ,e.[Address2]								,t.[Address2]
			   ,e.[City]									,t.[City]
			   ,e.[StateCode]								,t.[StateCode]
			   ,e.[ZipCode]									,t.[ZipCode]
			   ,e.[PhoneNumber]								,t.[PhoneNumber]
			   ,e.[FaxNumber]								,t.[FaxNumber]
			   ,e.[BillingMailingAddress1]					,t.[BillingMailingAddress1]
			   ,e.[BillingMailingAddress2]					,t.[BillingMailingAddress2]
			   ,e.[BillingMailingCity]						,t.[BillingMailingCity]
			   ,e.[BillingMailingState]						,t.[BillingMailingState]
			   ,e.[BillingMailingZip]						,t.[BillingMailingZip]
			   ,e.[RecordStatus]							,t.[RecordStatus]
			   ,e.[RecordStatusDescription]					,t.[RecordStatusDescription]
		from #stgfb e
		full join #test_stgfb t on e.[PracticeNPI] = t.[PracticeNPI]
									  and e.[Rank] = t.[Rank]

	create table #stgfb_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #stgfb_names values
		 (1, 'BusinessName'								,'test_BusinessName')
		,(2, 'TIN'										,'test_TIN')
		,(3, 'Address1'									,'test_Address1')
		,(4, 'Address2'									,'test_Address2')
		,(5, 'City'										,'test_City')
		,(6, 'StateCode'								,'test_StateCode')
		,(7, 'ZipCode'									,'test_ZipCode')
		,(8, 'PhoneNumber'								,'test_PhoneNumber')
		,(9, 'FaxNumber'								,'test_FaxNumber')
		,(10,'BillingMailingAddress1'					,'test_BillingMailingAddress1')
		,(11,'BillingMailingAddress2'					,'test_BillingMailingAddress2')
		,(12,'BillingMailingCity'						,'test_BillingMailingCity')
		,(13,'BillingMailingState'						,'test_BillingMailingState')
		,(14,'BillingMailingZip'						,'test_BillingMailingZip')
		,(15,'RecordStatus'								,'test_RecordStatus')
		,(16,'RecordStatusDescription'					,'test_RecordStatusDescription')
		
	set @loop_counter = 1
	while (@loop_counter <= 16)
		begin
			select @exist_col_name = exist_col_name from #stgfb_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #stgfb_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #StgFacilityBilling set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #StgFacilityBilling set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select count(distinct '+@test_col_name+') from #StgFacilityBilling) = 0 alter table #StgFacilityBilling drop column '+@test_col_name
			set @sqlText4 = N'if (select count(distinct '+@exist_col_name+') from #StgFacilityBilling) = 0 alter table #StgFacilityBilling drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'StgFacilityBilling'
	select * from #StgFacilityBilling where Diff_flag = 1

	select p.[NPI]
		,pb.[PracticeBillingKey]
		,cast(NULL as int) as [Rank]
		,pb.[BusinessName]	
		,pb.[TIN]				
		,pb.[Address1]		
		,pb.[Address2]		
		,pb.[City]			
		,pb.[State]			
		,pb.[ZipCode]			
		,pb.[PhoneNumber]		
		,pb.[FaxNumber]		
		,pb.[MailingAddress1]	
		,pb.[MailingAddress2]	
		,pb.[MailingCity]		
		,pb.[MailingState]	
		,pb.[MailingZipCode]
	into #fb
	from [ProviderNetwork].[dbo].[PracticeBilling] pb
	join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pb.[PracticeKey]
	where p.[NPI] like '99998%'

	;with [orderRecord] as (select [NPI]
								,[PracticeBillingKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [PracticeBillingKey]
											 ) as Rank_number 
							from #fb)
	update [orderRecord] set [Rank] = Rank_number

	select p.[NPI]
		,pb.[PracticeBillingKey]
		,cast(NULL as int) as [Rank]
		,pb.[BusinessName]	
		,pb.[TIN]				
		,pb.[Address1]		
		,pb.[Address2]		
		,pb.[City]			
		,pb.[State]			
		,pb.[ZipCode]			
		,pb.[PhoneNumber]		
		,pb.[FaxNumber]		
		,pb.[MailingAddress1]	
		,pb.[MailingAddress2]	
		,pb.[MailingCity]		
		,pb.[MailingState]	
		,pb.[MailingZipCode]
	into #test_fb
	from [ProviderNetwork].[dbo].[PracticeBilling] pb
	join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pb.[PracticeKey]
	where p.[NPI] like '99999%'

	;with [orderRecord] as (select [NPI]
								,[PracticeBillingKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [PracticeBillingKey]
											 ) as Rank_number 
							from #test_fb)
	update [orderRecord] set [Rank] = Rank_number

	create table #FacilityBilling
		([PracticeNPI] varchar (10)
		,[Diff_flag] bit
		,[BusinessName] varchar(255)			,[test_BusinessName] varchar(255)
		,[TIN] varchar(9)						,[test_TIN] varchar(9)
		,[Address1] varchar(100)				,[test_Address1] varchar(100)
		,[Address2] varchar(100)				,[test_Address2] varchar(100)
		,[City] varchar(50)						,[test_City] varchar(50)
		,[StateCode] char(2)					,[test_StateCode] char(2)
		,[ZipCode] varchar(10)					,[test_ZipCode] varchar(10)
		,[PhoneNumber] varchar(10)				,[test_PhoneNumber] varchar(10)
		,[FaxNumber] varchar(10)				,[test_FaxNumber] varchar(10)
		,[BillingMailingAddress1] varchar(100)	,[test_BillingMailingAddress1] varchar(100)
		,[BillingMailingAddress2] varchar(100)	,[test_BillingMailingAddress2] varchar(100)
		,[BillingMailingCity] varchar(50)		,[test_BillingMailingCity] varchar(50)
		,[BillingMailingState] varchar(2)		,[test_BillingMailingState] varchar(2)
		,[BillingMailingZip] varchar(10)		,[test_BillingMailingZip] varchar(10)
		)

	insert into #FacilityBilling
		([PracticeNPI]
		,[BusinessName]				,[test_BusinessName]
		,[TIN]						,[test_TIN]
		,[Address1]					,[test_Address1]
		,[Address2]					,[test_Address2]
		,[City]						,[test_City]
		,[StateCode]				,[test_StateCode]
		,[ZipCode]					,[test_ZipCode]
		,[PhoneNumber]				,[test_PhoneNumber]
		,[FaxNumber]				,[test_FaxNumber]
		,[BillingMailingAddress1]	,[test_BillingMailingAddress1]
		,[BillingMailingAddress2]	,[test_BillingMailingAddress2]
		,[BillingMailingCity]		,[test_BillingMailingCity]
		,[BillingMailingState]		,[test_BillingMailingState]
		,[BillingMailingZip]		,[test_BillingMailingZip]
		)
		select t.[NPI]
			   ,e.[BusinessName]	,t.[BusinessName]
			   ,e.[TIN]				,t.[TIN]
			   ,e.[Address1]		,t.[Address1]
			   ,e.[Address2]		,t.[Address2]
			   ,e.[City]			,t.[City]
			   ,e.[State]			,t.[State]
			   ,e.[ZipCode]			,t.[ZipCode]
			   ,e.[PhoneNumber]		,t.[PhoneNumber]
			   ,e.[FaxNumber]		,t.[FaxNumber]
			   ,e.[MailingAddress1]	,t.[MailingAddress1]
			   ,e.[MailingAddress2]	,t.[MailingAddress2]
			   ,e.[MailingCity]		,t.[MailingCity]
			   ,e.[MailingState]	,t.[MailingState]
			   ,e.[MailingZipCode]	,t.[MailingZipCode]
		from #fb e
		full join #test_fb t on e.[NPI] = replace(t.[NPI],'99999','99998')
						   and e.[Rank] = t.[Rank]

	create table #fb_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #fb_names values
		 (1, 'BusinessName'								,'test_BusinessName')
		,(2, 'TIN'										,'test_TIN')
		,(3, 'Address1'									,'test_Address1')
		,(4, 'Address2'									,'test_Address2')
		,(5, 'City'										,'test_City')
		,(6, 'StateCode'								,'test_StateCode')
		,(7, 'ZipCode'									,'test_ZipCode')
		,(8, 'PhoneNumber'								,'test_PhoneNumber')
		,(9, 'FaxNumber'								,'test_FaxNumber')
		,(10,'BillingMailingAddress1'					,'test_BillingMailingAddress1')
		,(11,'BillingMailingAddress2'					,'test_BillingMailingAddress2')
		,(12,'BillingMailingCity'						,'test_BillingMailingCity')
		,(13,'BillingMailingState'						,'test_BillingMailingState')
		,(14,'BillingMailingZip'						,'test_BillingMailingZip')
		
	set @loop_counter = 1
	while (@loop_counter <= 14)
		begin
			select @exist_col_name = exist_col_name from #fb_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #fb_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #FacilityBilling set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #FacilityBilling set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select count(distinct '+@test_col_name+') from #FacilityBilling) = 0 alter table #FacilityBilling drop column '+@test_col_name
			set @sqlText4 = N'if (select count(distinct '+@exist_col_name+') from #FacilityBilling) = 0 alter table #FacilityBilling drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'OLTP Facility Billing'
	select * from #FacilityBilling where Diff_flag = 1


--############################## FACILITY LOCATION ##############################

	select [PracticeNPI]
		,[StgPracticeLocationKey]
		,[PracticeSubpartNPI]
		,[AddressType]
		,[Address1]
		,[Address2]
		,[City]
		,[StateCode]
		,[ZipCode]
		,[LocationName]
		,[AcceptsNewPatients]
		,[PhoneNumber]
		,[FaxNumber]
		,[PrimaryLocation]
		,[IsEHRServiceOffered]
		,[WebsiteUrl]
		,[Flesiid1]
		,[FlesiidType1]
		,[FlesiidDesc1]
		,[FlesiidEffectiveDate1]
		,[FlesiidTerminationDate1]
		,[Flesiid2]
		,[FlesiidType2]
		,[FlesiidDesc2]
		,[FlesiidEffectiveDate2]
		,[FlesiidTerminationDate2]
		,[Flesiid3]
		,[FlesiidType3]
		,[FlesiidDesc3]
		,[FlesiidEffectiveDate3]
		,[FlesiidTerminationDate3]
		,[Flesiid4]
		,[FlesiidType4]
		,[FlesiidDesc4]
		,[FlesiidEffectiveDate4]
		,[FlesiidTerminationDate4]
		,[Flesiid5]
		,[FlesiidType5]
		,[FlesiidDesc5]
		,[FlesiidEffectiveDate5]
		,[FlesiidTerminationDate5]
		,[Flesiid6]
		,[FlesiidType6]
		,[FlesiidDesc6]
		,[FlesiidEffectiveDate6]
		,[FlesiidTerminationDate6]
		,[Flesiid7]
		,[FlesiidType7]
		,[FlesiidDesc7]
		,[FlesiidEffectiveDate7]
		,[FlesiidTerminationDate7]
		,[Flesiid8]
		,[FlesiidType8]
		,[FlesiidDesc8]
		,[FlesiidEffectiveDate8]
		,[FlesiidTerminationDate8]
		,[Flesiid9]
		,[FlesiidType9]
		,[FlesiidDesc9]
		,[FlesiidEffectiveDate9]
		,[FlesiidTerminationDate9]
		,[CustomFields]
		,[PatientMinimumAge]
		,[PatientMaximumAge]
		,[IsWheelchairAccessibleExamRoom]
		,[FLHoursOpenMon]
		,[FLHoursCloseMon]
		,[FLHoursOpenTues]
		,[FLHoursCloseTues]
		,[FLHoursOpenWed]
		,[FLHoursCloseWed]
		,[FLHoursOpenThurs]
		,[FLHoursCloseThurs]
		,[FLHoursOpenFri]
		,[FLHoursCloseFri]
		,[FLHoursOpenSat]
		,[FLHoursCloseSat]
		,[FLHoursOpenSun]
		,[FLHoursCloseSun]
		,[OfficeHours]
		,[FLEffectiveDate]
		,[FLTerminationDate]
		,[FLTerminationReason]
		,[FLTerminationReasonKey]
		,[FLHandicapAccessible]
		,[FLCategory]
		,[FLCategoryKey]
		,[FLShowInDirectory]
		,[AcceptsNewPatientKey]
		,[LocationSpecialtyCode]
		,[FLAdditionalSpecialty1]
		,[FLAdditionalSpecialty2]
		,[FLAdditionalSpecialty3]
		,[FLLanguage1]
		,[FLLanguage2]
		,[FLLanguage3]
		,[FLLanguage4]
		,[SpecialtyKey]
		,[FLAdditionalSpecialtyKey1]
		,[FLAdditionalSpecialtyKey2]
		,[FLAdditionalSpecialtyKey3]
		,[FLMailingAddress1]
		,[FLMailingAddress2]
		,[FLMailingCity]
		,[FLMailingState]
		,[FLMailingZip]
		,[RecordStatus]
		,[RecordStatusDescription]
		,cast(NULL as int) as [Rank]
	into #stgfl
	from [ProviderNetworkStaging].[dbo].[StgPracticeLocation]
	where [BatchID] = -5

	;with [orderRecord] as (select [PracticeNPI]
								,[StgPracticeLocationKey]
								,[Rank]
								,rank() over (partition by [PracticeNPI] 
											  order by [StgPracticeLocationKey]
											 ) as Rank_number 
							from #stgfl)
	update [orderRecord] set [Rank] = Rank_number

	select [PracticeNPI]
		,[StgPracticeLocationKey]
		,[PracticeSubpartNPI]
		,[AddressType]
		,[Address1]
		,[Address2]
		,[City]
		,[StateCode]
		,[ZipCode]
		,[LocationName]
		,[AcceptsNewPatients]
		,[PhoneNumber]
		,[FaxNumber]
		,[PrimaryLocation]
		,[IsEHRServiceOffered]
		,[WebsiteUrl]
		,[Flesiid1]
		,[FlesiidType1]
		,[FlesiidDesc1]
		,[FlesiidEffectiveDate1]
		,[FlesiidTerminationDate1]
		,[Flesiid2]
		,[FlesiidType2]
		,[FlesiidDesc2]
		,[FlesiidEffectiveDate2]
		,[FlesiidTerminationDate2]
		,[Flesiid3]
		,[FlesiidType3]
		,[FlesiidDesc3]
		,[FlesiidEffectiveDate3]
		,[FlesiidTerminationDate3]
		,[Flesiid4]
		,[FlesiidType4]
		,[FlesiidDesc4]
		,[FlesiidEffectiveDate4]
		,[FlesiidTerminationDate4]
		,[Flesiid5]
		,[FlesiidType5]
		,[FlesiidDesc5]
		,[FlesiidEffectiveDate5]
		,[FlesiidTerminationDate5]
		,[Flesiid6]
		,[FlesiidType6]
		,[FlesiidDesc6]
		,[FlesiidEffectiveDate6]
		,[FlesiidTerminationDate6]
		,[Flesiid7]
		,[FlesiidType7]
		,[FlesiidDesc7]
		,[FlesiidEffectiveDate7]
		,[FlesiidTerminationDate7]
		,[Flesiid8]
		,[FlesiidType8]
		,[FlesiidDesc8]
		,[FlesiidEffectiveDate8]
		,[FlesiidTerminationDate8]
		,[Flesiid9]
		,[FlesiidType9]
		,[FlesiidDesc9]
		,[FlesiidEffectiveDate9]
		,[FlesiidTerminationDate9]
		,[CustomFields]
		,[PatientMinimumAge]
		,[PatientMaximumAge]
		,[IsWheelchairAccessibleExamRoom]
		,[FLHoursOpenMon]
		,[FLHoursCloseMon]
		,[FLHoursOpenTues]
		,[FLHoursCloseTues]
		,[FLHoursOpenWed]
		,[FLHoursCloseWed]
		,[FLHoursOpenThurs]
		,[FLHoursCloseThurs]
		,[FLHoursOpenFri]
		,[FLHoursCloseFri]
		,[FLHoursOpenSat]
		,[FLHoursCloseSat]
		,[FLHoursOpenSun]
		,[FLHoursCloseSun]
		,[OfficeHours]
		,[FLEffectiveDate]
		,[FLTerminationDate]
		,[FLTerminationReason]
		,[FLTerminationReasonKey]
		,[FLHandicapAccessible]
		,[FLCategory]
		,[FLCategoryKey]
		,[FLShowInDirectory]
		,[AcceptsNewPatientKey]
		,[LocationSpecialtyCode]
		,[FLAdditionalSpecialty1]
		,[FLAdditionalSpecialty2]
		,[FLAdditionalSpecialty3]
		,[FLLanguage1]
		,[FLLanguage2]
		,[FLLanguage3]
		,[FLLanguage4]
		,[SpecialtyKey]
		,[FLAdditionalSpecialtyKey1]
		,[FLAdditionalSpecialtyKey2]
		,[FLAdditionalSpecialtyKey3]
		,[FLMailingAddress1]
		,[FLMailingAddress2]
		,[FLMailingCity]
		,[FLMailingState]
		,[FLMailingZip]
		,[RecordStatus]
		,[RecordStatusDescription]
		,cast(NULL as int) as [Rank]
	into #test_stgfl
	from [ProviderNetworkStaging].[dbo].[StgPracticeLocation]
	where [BatchID] = @BatchID

	;with [orderRecord] as (select [PracticeNPI]
								,[StgPracticeLocationKey]
								,[Rank]
								,rank() over (partition by [PracticeNPI] 
											  order by [StgPracticeLocationKey]
											 ) as Rank_number 
							from #test_stgfl)
	update [orderRecord] set [Rank] = Rank_number

	create table #StgFacilityLocation
		([PracticeNPI] varchar (10)
		,[Diff_flag] bit
		,[PracticeSubpartNPI] varchar(10)			,[test_PracticeSubpartNPI] varchar(10)
		,[AddressType] varchar(10)					,[test_AddressType] varchar(10)
		,[Address1] varchar(100)					,[test_Address1] varchar(100)
		,[Address2] varchar(100)					,[test_Address2] varchar(100)
		,[City] varchar(50)							,[test_City] varchar(50)
		,[StateCode] char(2)						,[test_StateCode] char(2)
		,[ZipCode]  varchar(10)						,[test_ZipCode]  varchar(10)
		,[LocationName]  varchar(255)				,[test_LocationName]  varchar(255)
		,[AcceptsNewPatients]  varchar(50)			,[test_AcceptsNewPatients]  varchar(50)
		,[PhoneNumber]  varchar(20)					,[test_PhoneNumber]  varchar(20)
		,[FaxNumber]  varchar(20)					,[test_FaxNumber]  varchar(20)
		,[PrimaryLocation]  varchar(1)				,[test_PrimaryLocation]  varchar(1)
		,[IsEHRServiceOffered]  varchar(2)			,[test_IsEHRServiceOffered]  varchar(2)
		,[WebsiteUrl]  varchar(500)					,[test_WebsiteUrl]  varchar(500)
		,[Flesiid1] varchar(50)						,[test_Flesiid1] varchar(50)
		,[FlesiidType1] varchar(6)					,[test_FlesiidType1] varchar(6)
		,[FlesiidDesc1] varchar(255)				,[test_FlesiidDesc1] varchar(255)
		,[FlesiidEffectiveDate1] date				,[test_FlesiidEffectiveDate1] date
		,[FlesiidTerminationDate1] date				,[test_FlesiidTerminationDate1] date
		,[Flesiid2] varchar(50)						,[test_Flesiid2] varchar(50)
		,[FlesiidType2] varchar(6)					,[test_FlesiidType2] varchar(6)
		,[FlesiidDesc2] varchar(255)				,[test_FlesiidDesc2] varchar(255)
		,[FlesiidEffectiveDate2] date				,[test_FlesiidEffectiveDate2] date
		,[FlesiidTerminationDate2] date				,[test_FlesiidTerminationDate2] date
		,[Flesiid3] varchar(50)						,[test_Flesiid3] varchar(50)
		,[FlesiidType3] varchar(6)					,[test_FlesiidType3] varchar(6)
		,[FlesiidDesc3] varchar(255)				,[test_FlesiidDesc3] varchar(255)
		,[FlesiidEffectiveDate3] date				,[test_FlesiidEffectiveDate3] date
		,[FlesiidTerminationDate3] date				,[test_FlesiidTerminationDate3] date
		,[Flesiid4] varchar(50)						,[test_Flesiid4] varchar(50)
		,[FlesiidType4] varchar(6)					,[test_FlesiidType4] varchar(6)
		,[FlesiidDesc4] varchar(255)				,[test_FlesiidDesc4] varchar(255)
		,[FlesiidEffectiveDate4] date				,[test_FlesiidEffectiveDate4] date
		,[FlesiidTerminationDate4] date				,[test_FlesiidTerminationDate4] date
		,[Flesiid5] varchar(50)						,[test_Flesiid5] varchar(50)
		,[FlesiidType5] varchar(6)					,[test_FlesiidType5] varchar(6)
		,[FlesiidDesc5] varchar(255)				,[test_FlesiidDesc5] varchar(255)
		,[FlesiidEffectiveDate5] date				,[test_FlesiidEffectiveDate5] date
		,[FlesiidTerminationDate5] date				,[test_FlesiidTerminationDate5] date
		,[Flesiid6] varchar(50)						,[test_Flesiid6] varchar(50)
		,[FlesiidType6] varchar(6)					,[test_FlesiidType6] varchar(6)
		,[FlesiidDesc6] varchar(255)				,[test_FlesiidDesc6] varchar(255)
		,[FlesiidEffectiveDate6] date				,[test_FlesiidEffectiveDate6] date
		,[FlesiidTerminationDate6] date				,[test_FlesiidTerminationDate6] date
		,[Flesiid7] varchar(50)						,[test_Flesiid7] varchar(50)
		,[FlesiidType7] varchar(6)					,[test_FlesiidType7] varchar(6)
		,[FlesiidDesc7] varchar(255)				,[test_FlesiidDesc7] varchar(255)
		,[FlesiidEffectiveDate7] date				,[test_FlesiidEffectiveDate7] date
		,[FlesiidTerminationDate7] date				,[test_FlesiidTerminationDate7] date
		,[Flesiid8] varchar(50)						,[test_Flesiid8] varchar(50)
		,[FlesiidType8] varchar(6)					,[test_FlesiidType8] varchar(6)
		,[FlesiidDesc8] varchar(255)				,[test_FlesiidDesc8] varchar(255)
		,[FlesiidEffectiveDate8] date				,[test_FlesiidEffectiveDate8] date
		,[FlesiidTerminationDate8] date				,[test_FlesiidTerminationDate8] date
		,[Flesiid9] varchar(50)						,[test_Flesiid9] varchar(50)
		,[FlesiidType9] varchar(6)					,[test_FlesiidType9] varchar(6)
		,[FlesiidDesc9] varchar(255)				,[test_FlesiidDesc9] varchar(255)
		,[FlesiidEffectiveDate9] date				,[test_FlesiidEffectiveDate9] date
		,[FlesiidTerminationDate9] date				,[test_FlesiidTerminationDate9] date
		,[CustomFields] varchar(max)				,[test_CustomFields] varchar(max)
		,[PatientMinimumAge] int					,[test_PatientMinimumAge] int
		,[PatientMaximumAge] int					,[test_PatientMaximumAge] int
		,[IsWheelchairAccessibleExamRoom] varchar(2),[test_IsWheelchairAccessibleExamRoom] varchar(2)
		,[FLHoursOpenMon] varchar(200)				,[test_FLHoursOpenMon] varchar(200)
		,[FLHoursCloseMon] varchar(200)				,[test_FLHoursCloseMon] varchar(200)
		,[FLHoursOpenTues] varchar(200)				,[test_FLHoursOpenTues] varchar(200)
		,[FLHoursCloseTues] varchar(200)			,[test_FLHoursCloseTues] varchar(200)
		,[FLHoursOpenWed] varchar(200)				,[test_FLHoursOpenWed] varchar(200)
		,[FLHoursCloseWed] varchar(200)				,[test_FLHoursCloseWed] varchar(200)
		,[FLHoursOpenThurs] varchar(200)			,[test_FLHoursOpenThurs] varchar(200)
		,[FLHoursCloseThurs] varchar(200)			,[test_FLHoursCloseThurs] varchar(200)
		,[FLHoursOpenFri] varchar(200)				,[test_FLHoursOpenFri] varchar(200)
		,[FLHoursCloseFri] varchar(200)				,[test_FLHoursCloseFri] varchar(200)
		,[FLHoursOpenSat] varchar(200)				,[test_FLHoursOpenSat] varchar(200)
		,[FLHoursCloseSat] varchar(200)				,[test_FLHoursCloseSat] varchar(200)
		,[FLHoursOpenSun] varchar(200)				,[test_FLHoursOpenSun] varchar(200)
		,[FLHoursCloseSun] varchar(200)				,[test_FLHoursCloseSun] varchar(200)
		,[OfficeHours] varchar(4000)				,[test_OfficeHours] varchar(4000)
		,[FLEffectiveDate] date						,[test_FLEffectiveDate] date
		,[FLTerminationDate] date					,[test_FLTerminationDate] date
		,[FLTerminationReason] varchar(10)			,[test_FLTerminationReason] varchar(10)
		,[FLTerminationReasonKey] int				,[test_FLTerminationReasonKey] int
		,[FLHandicapAccessible] varchar(1)			,[test_FLHandicapAccessible] varchar(1)
		,[FLCategory] varchar(10)					,[test_FLCategory] varchar(10)
		,[FLCategoryKey] int						,[test_FLCategoryKey] int
		,[FLShowInDirectory] varchar(1)				,[test_FLShowInDirectory] varchar(1)
		,[AcceptsNewPatientKey] int					,[test_AcceptsNewPatientKey] int
		,[LocationSpecialtyCode] varchar(110)		,[test_LocationSpecialtyCode] varchar(110)
		,[FLAdditionalSpecialty1] varchar(110)		,[test_FLAdditionalSpecialty1] varchar(110)
		,[FLAdditionalSpecialty2] varchar(110)		,[test_FLAdditionalSpecialty2] varchar(110)
		,[FLAdditionalSpecialty3] varchar(110)		,[test_FLAdditionalSpecialty3] varchar(110)
		,[FLLanguage1] varchar(110)					,[test_FLLanguage1] varchar(110)
		,[FLLanguage2] varchar(110)					,[test_FLLanguage2] varchar(110)
		,[FLLanguage3] varchar(110)					,[test_FLLanguage3] varchar(110)
		,[FLLanguage4] varchar(110)					,[test_FLLanguage4] varchar(110)
		,[SpecialtyKey] int							,[test_SpecialtyKey] int
		,[FLAdditionalSpecialtyKey1] varchar(110)	,[test_FLAdditionalSpecialtyKey1] varchar(110)
		,[FLAdditionalSpecialtyKey2] varchar(110)	,[test_FLAdditionalSpecialtyKey2] varchar(110)
		,[FLAdditionalSpecialtyKey3] varchar(110)	,[test_FLAdditionalSpecialtyKey3] varchar(110)
		,[FLMailingAddress1] varchar(100)			,[test_FLMailingAddress1] varchar(100)
		,[FLMailingAddress2] varchar(100)			,[test_FLMailingAddress2] varchar(100)
		,[FLMailingCity] varchar(50)				,[test_FLMailingCity] varchar(50)
		,[FLMailingState] varchar(2)				,[test_FLMailingState] varchar(2)
		,[FLMailingZip] varchar(10)					,[test_FLMailingZip] varchar(10)
		,[RecordStatus] varchar(2)					,[test_RecordStatus] varchar(2)
		,[RecordStatusDescription] varchar(100)		,[test_RecordStatusDescription] varchar(100)
		)

	insert into #StgFacilityLocation
		([PracticeNPI]
		,[PracticeSubpartNPI]				,[test_PracticeSubpartNPI]
		,[AddressType]						,[test_AddressType]
		,[Address1]							,[test_Address1]
		,[Address2]							,[test_Address2]
		,[City]								,[test_City]
		,[StateCode]						,[test_StateCode]
		,[ZipCode]							,[test_ZipCode]
		,[LocationName]						,[test_LocationName]
		,[AcceptsNewPatients]				,[test_AcceptsNewPatients]
		,[PhoneNumber]						,[test_PhoneNumber]
		,[FaxNumber]						,[test_FaxNumber]
		,[PrimaryLocation]					,[test_PrimaryLocation]
		,[IsEHRServiceOffered]				,[test_IsEHRServiceOffered]
		,[WebsiteUrl]						,[test_WebsiteUrl]
		,[Flesiid1]							,[test_Flesiid1]
		,[FlesiidType1]						,[test_FlesiidType1]
		,[FlesiidDesc1]						,[test_FlesiidDesc1]
		,[FlesiidEffectiveDate1]			,[test_FlesiidEffectiveDate1]
		,[FlesiidTerminationDate1]			,[test_FlesiidTerminationDate1]
		,[Flesiid2]							,[test_Flesiid2]
		,[FlesiidType2]						,[test_FlesiidType2]
		,[FlesiidDesc2]						,[test_FlesiidDesc2]
		,[FlesiidEffectiveDate2]			,[test_FlesiidEffectiveDate2]
		,[FlesiidTerminationDate2]			,[test_FlesiidTerminationDate2]
		,[Flesiid3]							,[test_Flesiid3]
		,[FlesiidType3]						,[test_FlesiidType3]
		,[FlesiidDesc3]						,[test_FlesiidDesc3]
		,[FlesiidEffectiveDate3]			,[test_FlesiidEffectiveDate3]
		,[FlesiidTerminationDate3]			,[test_FlesiidTerminationDate3]
		,[Flesiid4]							,[test_Flesiid4]
		,[FlesiidType4]						,[test_FlesiidType4]
		,[FlesiidDesc4]						,[test_FlesiidDesc4]
		,[FlesiidEffectiveDate4]			,[test_FlesiidEffectiveDate4]
		,[FlesiidTerminationDate4]			,[test_FlesiidTerminationDate4]
		,[Flesiid5]							,[test_Flesiid5]
		,[FlesiidType5]						,[test_FlesiidType5]
		,[FlesiidDesc5]						,[test_FlesiidDesc5]
		,[FlesiidEffectiveDate5]			,[test_FlesiidEffectiveDate5]
		,[FlesiidTerminationDate5]			,[test_FlesiidTerminationDate5]
		,[Flesiid6]							,[test_Flesiid6]
		,[FlesiidType6]						,[test_FlesiidType6]
		,[FlesiidDesc6]						,[test_FlesiidDesc6]
		,[FlesiidEffectiveDate6]			,[test_FlesiidEffectiveDate6]
		,[FlesiidTerminationDate6]			,[test_FlesiidTerminationDate6]
		,[Flesiid7]							,[test_Flesiid7]
		,[FlesiidType7]						,[test_FlesiidType7]
		,[FlesiidDesc7]						,[test_FlesiidDesc7]
		,[FlesiidEffectiveDate7]			,[test_FlesiidEffectiveDate7]
		,[FlesiidTerminationDate7]			,[test_FlesiidTerminationDate7]
		,[Flesiid8]							,[test_Flesiid8]
		,[FlesiidType8]						,[test_FlesiidType8]
		,[FlesiidDesc8]						,[test_FlesiidDesc8]
		,[FlesiidEffectiveDate8]			,[test_FlesiidEffectiveDate8]
		,[FlesiidTerminationDate8]			,[test_FlesiidTerminationDate8]
		,[Flesiid9]							,[test_Flesiid9]
		,[FlesiidType9]						,[test_FlesiidType9]
		,[FlesiidDesc9]						,[test_FlesiidDesc9]
		,[FlesiidEffectiveDate9]			,[test_FlesiidEffectiveDate9]
		,[FlesiidTerminationDate9]			,[test_FlesiidTerminationDate9]
		,[CustomFields]						,[test_CustomFields]
		,[PatientMinimumAge]				,[test_PatientMinimumAge]
		,[PatientMaximumAge]				,[test_PatientMaximumAge]
		,[IsWheelchairAccessibleExamRoom]	,[test_IsWheelchairAccessibleExamRoom]
		,[FLHoursOpenMon]					,[test_FLHoursOpenMon]
		,[FLHoursCloseMon]					,[test_FLHoursCloseMon]
		,[FLHoursOpenTues]					,[test_FLHoursOpenTues]
		,[FLHoursCloseTues]					,[test_FLHoursCloseTues]
		,[FLHoursOpenWed]					,[test_FLHoursOpenWed]
		,[FLHoursCloseWed]					,[test_FLHoursCloseWed]
		,[FLHoursOpenThurs]					,[test_FLHoursOpenThurs]
		,[FLHoursCloseThurs]				,[test_FLHoursCloseThurs]
		,[FLHoursOpenFri]					,[test_FLHoursOpenFri]
		,[FLHoursCloseFri]					,[test_FLHoursCloseFri]
		,[FLHoursOpenSat]					,[test_FLHoursOpenSat]
		,[FLHoursCloseSat]					,[test_FLHoursCloseSat]
		,[FLHoursOpenSun]					,[test_FLHoursOpenSun]
		,[FLHoursCloseSun]					,[test_FLHoursCloseSun]
		,[OfficeHours]						,[test_OfficeHours]
		,[FLEffectiveDate]					,[test_FLEffectiveDate]
		,[FLTerminationDate]				,[test_FLTerminationDate]
		,[FLTerminationReason]				,[test_FLTerminationReason]
		,[FLTerminationReasonKey]			,[test_FLTerminationReasonKey]
		,[FLHandicapAccessible]				,[test_FLHandicapAccessible]
		,[FLCategory]						,[test_FLCategory]
		,[FLCategoryKey]					,[test_FLCategoryKey]
		,[FLShowInDirectory]				,[test_FLShowInDirectory]
		,[AcceptsNewPatientKey]				,[test_AcceptsNewPatientKey]
		,[LocationSpecialtyCode]			,[test_LocationSpecialtyCode]
		,[FLAdditionalSpecialty1]			,[test_FLAdditionalSpecialty1]
		,[FLAdditionalSpecialty2]			,[test_FLAdditionalSpecialty2]
		,[FLAdditionalSpecialty3]			,[test_FLAdditionalSpecialty3]
		,[FLLanguage1]						,[test_FLLanguage1]
		,[FLLanguage2]						,[test_FLLanguage2]
		,[FLLanguage3]						,[test_FLLanguage3]
		,[FLLanguage4]						,[test_FLLanguage4]
		,[SpecialtyKey]						,[test_SpecialtyKey]
		,[FLAdditionalSpecialtyKey1]		,[test_FLAdditionalSpecialtyKey1]
		,[FLAdditionalSpecialtyKey2]		,[test_FLAdditionalSpecialtyKey2]
		,[FLAdditionalSpecialtyKey3]		,[test_FLAdditionalSpecialtyKey3]
		,[FLMailingAddress1]				,[test_FLMailingAddress1]
		,[FLMailingAddress2]				,[test_FLMailingAddress2]
		,[FLMailingCity]					,[test_FLMailingCity]
		,[FLMailingState]					,[test_FLMailingState]
		,[FLMailingZip]						,[test_FLMailingZip]
		,[RecordStatus]						,[test_RecordStatus]
		,[RecordStatusDescription]			,[test_RecordStatusDescription]
		)
		select t.[PracticeNPI]
			   ,e.[PracticeSubpartNPI]				,t.[PracticeSubpartNPI]
			   ,e.[AddressType]						,t.[AddressType]
			   ,e.[Address1]						,t.[Address1]
			   ,e.[Address2]						,t.[Address2]
			   ,e.[City]							,t.[City]
			   ,e.[StateCode]						,t.[StateCode]
			   ,e.[ZipCode]							,t.[ZipCode]
			   ,e.[LocationName]					,t.[LocationName]
			   ,e.[AcceptsNewPatients]				,t.[AcceptsNewPatients]
			   ,e.[PhoneNumber]						,t.[PhoneNumber]
			   ,e.[FaxNumber]						,t.[FaxNumber]
			   ,e.[PrimaryLocation]					,t.[PrimaryLocation]
			   ,e.[IsEHRServiceOffered]				,t.[IsEHRServiceOffered]
			   ,e.[WebsiteUrl]						,t.[WebsiteUrl]
			   ,e.[Flesiid1]						,t.[Flesiid1]
			   ,e.[FlesiidType1]					,t.[FlesiidType1]
			   ,e.[FlesiidDesc1]					,t.[FlesiidDesc1]
			   ,e.[FlesiidEffectiveDate1]			,t.[FlesiidEffectiveDate1]
			   ,e.[FlesiidTerminationDate1]			,t.[FlesiidTerminationDate1]
			   ,e.[Flesiid2]						,t.[Flesiid2]
			   ,e.[FlesiidType2]					,t.[FlesiidType2]
			   ,e.[FlesiidDesc2]					,t.[FlesiidDesc2]
			   ,e.[FlesiidEffectiveDate2]			,t.[FlesiidEffectiveDate2]
			   ,e.[FlesiidTerminationDate2]			,t.[FlesiidTerminationDate2]
			   ,e.[Flesiid3]						,t.[Flesiid3]
			   ,e.[FlesiidType3]					,t.[FlesiidType3]
			   ,e.[FlesiidDesc3]					,t.[FlesiidDesc3]
			   ,e.[FlesiidEffectiveDate3]			,t.[FlesiidEffectiveDate3]
			   ,e.[FlesiidTerminationDate3]			,t.[FlesiidTerminationDate3]
			   ,e.[Flesiid4]						,t.[Flesiid4]
			   ,e.[FlesiidType4]					,t.[FlesiidType4]
			   ,e.[FlesiidDesc4]					,t.[FlesiidDesc4]
			   ,e.[FlesiidEffectiveDate4]			,t.[FlesiidEffectiveDate4]
			   ,e.[FlesiidTerminationDate4]			,t.[FlesiidTerminationDate4]
			   ,e.[Flesiid5]						,t.[Flesiid5]
			   ,e.[FlesiidType5]					,t.[FlesiidType5]
			   ,e.[FlesiidDesc5]					,t.[FlesiidDesc5]
			   ,e.[FlesiidEffectiveDate5]			,t.[FlesiidEffectiveDate5]
			   ,e.[FlesiidTerminationDate5]			,t.[FlesiidTerminationDate5]
			   ,e.[Flesiid6]						,t.[Flesiid6]
			   ,e.[FlesiidType6]					,t.[FlesiidType6]
			   ,e.[FlesiidDesc6]					,t.[FlesiidDesc6]
			   ,e.[FlesiidEffectiveDate6]			,t.[FlesiidEffectiveDate6]
			   ,e.[FlesiidTerminationDate6]			,t.[FlesiidTerminationDate6]
			   ,e.[Flesiid7]						,t.[Flesiid7]
			   ,e.[FlesiidType7]					,t.[FlesiidType7]
			   ,e.[FlesiidDesc7]					,t.[FlesiidDesc7]
			   ,e.[FlesiidEffectiveDate7]			,t.[FlesiidEffectiveDate7]
			   ,e.[FlesiidTerminationDate7]			,t.[FlesiidTerminationDate7]
			   ,e.[Flesiid8]						,t.[Flesiid8]
			   ,e.[FlesiidType8]					,t.[FlesiidType8]
			   ,e.[FlesiidDesc8]					,t.[FlesiidDesc8]
			   ,e.[FlesiidEffectiveDate8]			,t.[FlesiidEffectiveDate8]
			   ,e.[FlesiidTerminationDate8]			,t.[FlesiidTerminationDate8]
			   ,e.[Flesiid9]						,t.[Flesiid9]
			   ,e.[FlesiidType9]					,t.[FlesiidType9]
			   ,e.[FlesiidDesc9]					,t.[FlesiidDesc9]
			   ,e.[FlesiidEffectiveDate9]			,t.[FlesiidEffectiveDate9]
			   ,e.[FlesiidTerminationDate9]			,t.[FlesiidTerminationDate9]
			   ,e.[CustomFields]					,t.[CustomFields]
			   ,e.[PatientMinimumAge]				,t.[PatientMinimumAge]
			   ,e.[PatientMaximumAge]				,t.[PatientMaximumAge]
			   ,e.[IsWheelchairAccessibleExamRoom]	,t.[IsWheelchairAccessibleExamRoom]
			   ,e.[FLHoursOpenMon]					,t.[FLHoursOpenMon]
			   ,e.[FLHoursCloseMon]					,t.[FLHoursCloseMon]
			   ,e.[FLHoursOpenTues]					,t.[FLHoursOpenTues]
			   ,e.[FLHoursCloseTues]				,t.[FLHoursCloseTues]
			   ,e.[FLHoursOpenWed]					,t.[FLHoursOpenWed]
			   ,e.[FLHoursCloseWed]					,t.[FLHoursCloseWed]
			   ,e.[FLHoursOpenThurs]				,t.[FLHoursOpenThurs]
			   ,e.[FLHoursCloseThurs]				,t.[FLHoursCloseThurs]
			   ,e.[FLHoursOpenFri]					,t.[FLHoursOpenFri]
			   ,e.[FLHoursCloseFri]					,t.[FLHoursCloseFri]
			   ,e.[FLHoursOpenSat]					,t.[FLHoursOpenSat]
			   ,e.[FLHoursCloseSat]					,t.[FLHoursCloseSat]
			   ,e.[FLHoursOpenSun]					,t.[FLHoursOpenSun]
			   ,e.[FLHoursCloseSun]					,t.[FLHoursCloseSun]
			   ,e.[OfficeHours]						,t.[OfficeHours]
			   ,e.[FLEffectiveDate]					,t.[FLEffectiveDate]
			   ,e.[FLTerminationDate]				,t.[FLTerminationDate]
			   ,e.[FLTerminationReason]				,t.[FLTerminationReason]
			   ,e.[FLTerminationReasonKey]			,t.[FLTerminationReasonKey]
			   ,e.[FLHandicapAccessible]			,t.[FLHandicapAccessible]
			   ,e.[FLCategory]						,t.[FLCategory]
			   ,e.[FLCategoryKey]					,t.[FLCategoryKey]
			   ,e.[FLShowInDirectory]				,t.[FLShowInDirectory]
			   ,e.[AcceptsNewPatientKey]			,t.[AcceptsNewPatientKey]
			   ,e.[LocationSpecialtyCode]			,t.[LocationSpecialtyCode]
			   ,e.[FLAdditionalSpecialty1]			,t.[FLAdditionalSpecialty1]
			   ,e.[FLAdditionalSpecialty2]			,t.[FLAdditionalSpecialty2]
			   ,e.[FLAdditionalSpecialty3]			,t.[FLAdditionalSpecialty3]
			   ,e.[FLLanguage1]						,t.[FLLanguage1]
			   ,e.[FLLanguage2]						,t.[FLLanguage2]
			   ,e.[FLLanguage3]						,t.[FLLanguage3]
			   ,e.[FLLanguage4]						,t.[FLLanguage4]
			   ,e.[SpecialtyKey]					,t.[SpecialtyKey]
			   ,e.[FLAdditionalSpecialtyKey1]		,t.[FLAdditionalSpecialtyKey1]
			   ,e.[FLAdditionalSpecialtyKey2]		,t.[FLAdditionalSpecialtyKey2]
			   ,e.[FLAdditionalSpecialtyKey3]		,t.[FLAdditionalSpecialtyKey3]
			   ,e.[FLMailingAddress1]				,t.[FLMailingAddress1]
			   ,e.[FLMailingAddress2]				,t.[FLMailingAddress2]
			   ,e.[FLMailingCity]					,t.[FLMailingCity]
			   ,e.[FLMailingState]					,t.[FLMailingState]
			   ,e.[FLMailingZip]					,t.[FLMailingZip]
			   ,e.[RecordStatus]					,t.[RecordStatus]
			   ,e.[RecordStatusDescription]			,t.[RecordStatusDescription]
		from #stgfl e
		full join #test_stgfl t on e.[PracticeNPI] = t.[PracticeNPI]
									  and e.[Rank] = t.[Rank]

	create table #stgfl_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #stgfl_names values
		 (1,'PracticeSubpartNPI','test_PracticeSubpartNPI')
		,(2,'AddressType','test_AddressType')
		,(3,'Address1','test_Address1')
		,(4,'Address2','test_Address2')
		,(5,'City','test_City')
		,(6,'StateCode','test_StateCode')
		,(7,'ZipCode','test_ZipCode')
		,(8,'LocationName','test_LocationName')
		,(9,'AcceptsNewPatients','test_AcceptsNewPatients')
		,(10,'PhoneNumber','test_PhoneNumber')
		,(11,'FaxNumber','test_FaxNumber')
		,(12,'PrimaryLocation','test_PrimaryLocation')
		,(13,'IsEHRServiceOffered','test_IsEHRServiceOffered')
		,(14,'WebsiteUrl','test_WebsiteUrl')
		,(15,'Flesiid1','test_Flesiid1')
		,(16,'FlesiidType1','test_FlesiidType1')
		,(17,'FlesiidDesc1','test_FlesiidDesc1')
		,(18,'FlesiidEffectiveDate1','test_FlesiidEffectiveDate1')
		,(19,'FlesiidTerminationDate1','test_FlesiidTerminationDate1')
		,(20,'Flesiid2','test_Flesiid2')
		,(21,'FlesiidType2','test_FlesiidType2')
		,(22,'FlesiidDesc2','test_FlesiidDesc2')
		,(23,'FlesiidEffectiveDate2','test_FlesiidEffectiveDate2')
		,(24,'FlesiidTerminationDate2','test_FlesiidTerminationDate2')
		,(25,'Flesiid3','test_Flesiid3')
		,(26,'FlesiidType3','test_FlesiidType3')
		,(27,'FlesiidDesc3','test_FlesiidDesc3')
		,(28,'FlesiidEffectiveDate3','test_FlesiidEffectiveDate3')
		,(29,'FlesiidTerminationDate3','test_FlesiidTerminationDate3')
		,(30,'Flesiid4','test_Flesiid4')
		,(31,'FlesiidType4','test_FlesiidType4')
		,(32,'FlesiidDesc4','test_FlesiidDesc4')
		,(33,'FlesiidEffectiveDate4','test_FlesiidEffectiveDate4')
		,(34,'FlesiidTerminationDate4','test_FlesiidTerminationDate4')
		,(35,'Flesiid5','test_Flesiid5')
		,(36,'FlesiidType5','test_FlesiidType5')
		,(37,'FlesiidDesc5','test_FlesiidDesc5')
		,(38,'FlesiidEffectiveDate5','test_FlesiidEffectiveDate5')
		,(39,'FlesiidTerminationDate5','test_FlesiidTerminationDate5')
		,(40,'Flesiid6','test_Flesiid6')
		,(41,'FlesiidType6','test_FlesiidType6')
		,(42,'FlesiidDesc6','test_FlesiidDesc6')
		,(43,'FlesiidEffectiveDate6','test_FlesiidEffectiveDate6')
		,(44,'FlesiidTerminationDate6','test_FlesiidTerminationDate6')
		,(45,'Flesiid7','test_Flesiid7')
		,(46,'FlesiidType7','test_FlesiidType7')
		,(47,'FlesiidDesc7','test_FlesiidDesc7')
		,(48,'FlesiidEffectiveDate7','test_FlesiidEffectiveDate7')
		,(49,'FlesiidTerminationDate7','test_FlesiidTerminationDate7')
		,(50,'Flesiid8','test_Flesiid8')
		,(51,'FlesiidType8','test_FlesiidType8')
		,(52,'FlesiidDesc8','test_FlesiidDesc8')
		,(53,'FlesiidEffectiveDate8','test_FlesiidEffectiveDate8')
		,(54,'FlesiidTerminationDate8','test_FlesiidTerminationDate8')
		,(55,'Flesiid9','test_Flesiid9')
		,(56,'FlesiidType9','test_FlesiidType9')
		,(57,'FlesiidDesc9','test_FlesiidDesc9')
		,(58,'FlesiidEffectiveDate9','test_FlesiidEffectiveDate9')
		,(59,'FlesiidTerminationDate9','test_FlesiidTerminationDate9')
		,(60,'CustomFields','test_CustomFields')
		,(61,'PatientMinimumAge','test_PatientMinimumAge')
		,(62,'PatientMaximumAge','test_PatientMaximumAge')
		,(63,'IsWheelchairAccessibleExamRoom','test_IsWheelchairAccessibleExamRoom')
		,(64,'FLHoursOpenMon','test_FLHoursOpenMon')
		,(65,'FLHoursCloseMon','test_FLHoursCloseMon')
		,(66,'FLHoursOpenTues','test_FLHoursOpenTues')
		,(67,'FLHoursCloseTues','test_FLHoursCloseTues')
		,(68,'FLHoursOpenWed','test_FLHoursOpenWed')
		,(69,'FLHoursCloseWed','test_FLHoursCloseWed')
		,(70,'FLHoursOpenThurs','test_FLHoursOpenThurs')
		,(71,'FLHoursCloseThurs','test_FLHoursCloseThurs')
		,(72,'FLHoursOpenFri','test_FLHoursOpenFri')
		,(73,'FLHoursCloseFri','test_FLHoursCloseFri')
		,(74,'FLHoursOpenSat','test_FLHoursOpenSat')
		,(75,'FLHoursCloseSat','test_FLHoursCloseSat')
		,(76,'FLHoursOpenSun','test_FLHoursOpenSun')
		,(77,'FLHoursCloseSun','test_FLHoursCloseSun')
		,(78,'OfficeHours','test_OfficeHours')
		,(79,'FLEffectiveDate','test_FLEffectiveDate')
		,(80,'FLTerminationDate','test_FLTerminationDate')
		,(81,'FLTerminationReason','test_FLTerminationReason')
		,(82,'FLTerminationReasonKey','test_FLTerminationReasonKey')
		,(83,'FLHandicapAccessible','test_FLHandicapAccessible')
		,(84,'FLCategory','test_FLCategory')
		,(85,'FLCategoryKey','test_FLCategoryKey')
		,(86,'FLShowInDirectory','test_FLShowInDirectory')
		,(87,'AcceptsNewPatientKey','test_AcceptsNewPatientKey')
		,(88,'LocationSpecialtyCode','test_LocationSpecialtyCode')
		,(89,'FLAdditionalSpecialty1','test_FLAdditionalSpecialty1')
		,(90,'FLAdditionalSpecialty2','test_FLAdditionalSpecialty2')
		,(91,'FLAdditionalSpecialty3','test_FLAdditionalSpecialty3')
		,(92,'FLLanguage1','test_FLLanguage1')
		,(93,'FLLanguage2','test_FLLanguage2')
		,(94,'FLLanguage3','test_FLLanguage3')
		,(95,'FLLanguage4','test_FLLanguage4')
		,(96,'SpecialtyKey','test_SpecialtyKey')
		,(97,'FLAdditionalSpecialtyKey1','test_FLAdditionalSpecialtyKey1')
		,(98,'FLAdditionalSpecialtyKey2','test_FLAdditionalSpecialtyKey2')
		,(99,'FLAdditionalSpecialtyKey3','test_FLAdditionalSpecialtyKey3')
		,(100,'FLMailingAddress1','test_FLMailingAddress1')
		,(101,'FLMailingAddress2','test_FLMailingAddress2')
		,(102,'FLMailingCity','test_FLMailingCity')
		,(103,'FLMailingState','test_FLMailingState')
		,(104,'FLMailingZip','test_FLMailingZip')
		,(105,'RecordStatus','test_RecordStatus')
		,(106,'RecordStatusDescription','test_RecordStatusDescription')
	
	set @loop_counter = 1
	while (@loop_counter <= 106)
		begin
			select @exist_col_name = exist_col_name from #stgfl_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #stgfl_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #StgFacilityLocation set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #StgFacilityLocation set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select count(distinct '+@test_col_name+') from #StgFacilityLocation) = 0 alter table #StgFacilityLocation drop column '+@test_col_name
			set @sqlText4 = N'if (select count(distinct '+@exist_col_name+') from #StgFacilityLocation) = 0 alter table #StgFacilityLocation drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'StgFacilityLocation'
	select * from #StgFacilityLocation where Diff_flag = 1

	select p.[NPI], pl.[PracticeLocationKey]
		,cast(NULL as int) as [Rank]
		,pl.[Address1]
		,pl.[Address2]
		,pl.[City]
		,pl.[State]
		,pl.[ZipCode]
		,pl.[MailingAddress1]
		,pl.[MailingAddress2]
		,pl.[MailingCity]
		,pl.[MailingState]
		,pl.[MailingZipCode]
		,pl.[CountyName]
		,pl.[CountryCode]
		,pl.[FIPSCountyCode]
		,pl.[FIPSStateCountyCode]
		,pl.[CensusBlockID]
		,pl.[LocationName]
		,pl.[AcceptsNewPatientKey]
		,pl.[OfficeHours]
		,pl.[PhoneNumber]
		,pl.[FaxNumber]
		,pl.[EffectiveDate]
		,pl.[TerminationDate]
		,pl.[IsMailing]
		,pl.[IsServicing]
		,pl.[IsPrimary]
		,pl.[IsADACompliant]
		,pl.[LocationAcceptSignLanguage]
		,pl.[LocationHasOBServices]
		,pl.[IsAddressScrubbed]
		,pl.[IsMailingAddressScrubbed]
		,pl.[IsEHRServiceOffered]
		,pl.[WebsiteUrl]
		,pl.[PatientMinimumAge]
		,pl.[PatientMaximumAge]
		,pl.[IsWheelchairAccessibleExamRoom]
		,pl.[InDirectory]
		,pl.[TerminationReasonKey]
		,pl.[LocationCategoryKey]
		,pl.[IsHandicapAccessible]
		,pl.[SubPartNPI]
		,pl.[CustomFields]
	into #fl
	from [ProviderNetwork].[dbo].[PracticeLocation] pl
	join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
	where p.[NPI] like '99998%'

	;with [orderRecord] as (select [NPI]
								,[PracticeLocationKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [PracticeLocationKey]
											 ) as Rank_number 
							from #fl)
	update [orderRecord] set [Rank] = Rank_number

	select p.[NPI], pl.[PracticeLocationKey]
		,cast(NULL as int) as [Rank]
		,pl.[Address1]
		,pl.[Address2]
		,pl.[City]
		,pl.[State]
		,pl.[ZipCode]
		,pl.[MailingAddress1]
		,pl.[MailingAddress2]
		,pl.[MailingCity]
		,pl.[MailingState]
		,pl.[MailingZipCode]
		,pl.[CountyName]
		,pl.[CountryCode]
		,pl.[FIPSCountyCode]
		,pl.[FIPSStateCountyCode]
		,pl.[CensusBlockID]
		,pl.[LocationName]
		,pl.[AcceptsNewPatientKey]
		,pl.[OfficeHours]
		,pl.[PhoneNumber]
		,pl.[FaxNumber]
		,pl.[EffectiveDate]
		,pl.[TerminationDate]
		,pl.[IsMailing]
		,pl.[IsServicing]
		,pl.[IsPrimary]
		,pl.[IsADACompliant]
		,pl.[LocationAcceptSignLanguage]
		,pl.[LocationHasOBServices]
		,pl.[IsAddressScrubbed]
		,pl.[IsMailingAddressScrubbed]
		,pl.[IsEHRServiceOffered]
		,pl.[WebsiteUrl]
		,pl.[PatientMinimumAge]
		,pl.[PatientMaximumAge]
		,pl.[IsWheelchairAccessibleExamRoom]
		,pl.[InDirectory]
		,pl.[TerminationReasonKey]
		,pl.[LocationCategoryKey]
		,pl.[IsHandicapAccessible]
		,pl.[SubPartNPI]
		,pl.[CustomFields]
	into #test_fl
	from [ProviderNetwork].[dbo].[PracticeLocation] pl
	join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
	where p.[NPI] like '99999%'

	;with [orderRecord] as (select [NPI]
								,[PracticeLocationKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [PracticeLocationKey]
											 ) as Rank_number 
							from #test_fl)
	update [orderRecord] set [Rank] = Rank_number

	create table #FacilityLocation
		([NPI] varchar (10)
		,[Diff_flag] bit
		,[Address1] varchar(100)				,[test_Address1] varchar(100)
		,[Address2] varchar(100)				,[test_Address2] varchar(100)
		,[City] varchar(50)						,[test_City] varchar(50)
		,[State] char(2)						,[test_State] char(2)
		,[ZipCode] varchar(10)					,[test_ZipCode] varchar(10)
		,[MailingAddress1] varchar(100)			,[test_MailingAddress1] varchar(100)
		,[MailingAddress2] varchar(100)			,[test_MailingAddress2] varchar(100)
		,[MailingCity] varchar(50)				,[test_MailingCity] varchar(50)
		,[MailingState] char(2)					,[test_MailingState] char(2)
		,[MailingZipCode] varchar(10)			,[test_MailingZipCode] varchar(10)
		,[CountyName] varchar(60)				,[test_CountyName] varchar(60)
		,[CountryCode] varchar(10)				,[test_CountryCode] varchar(10)
		,[FIPSCountyCode] varchar(20)			,[test_FIPSCountyCode] varchar(20)
		,[FIPSStateCountyCode] varchar(20)		,[test_FIPSStateCountyCode] varchar(20)
		,[CensusBlockID] varchar(20)			,[test_CensusBlockID] varchar(20)
		,[LocationName] varchar(100)			,[test_LocationName] varchar(100)
		,[AcceptsNewPatientKey] int				,[test_AcceptsNewPatientKey] int
		,[OfficeHours] varchar(4000)			,[test_OfficeHours] varchar(4000)
		,[PhoneNumber] varchar(20)				,[test_PhoneNumber] varchar(20)
		,[FaxNumber] varchar(20)				,[test_FaxNumber] varchar(20)
		,[EffectiveDate] date					,[test_EffectiveDate] date
		,[TerminationDate] date					,[test_TerminationDate] date
		,[IsMailing] bit						,[test_IsMailing] bit
		,[IsServicing] bit						,[test_IsServicing] bit
		,[IsPrimary] bit						,[test_IsPrimary] bit
		,[IsADACompliant] bit					,[test_IsADACompliant] bit
		,[LocationAcceptSignLanguage] bit		,[test_LocationAcceptSignLanguage] bit
		,[LocationHasOBServices] bit			,[test_LocationHasOBServices] bit
		,[IsAddressScrubbed] bit				,[test_IsAddressScrubbed] bit
		,[IsMailingAddressScrubbed] bit			,[test_IsMailingAddressScrubbed] bit
		,[IsEHRServiceOffered] bit				,[test_IsEHRServiceOffered] bit
		,[WebsiteUrl] varchar(500)				,[test_WebsiteUrl] varchar(500)
		,[PatientMinimumAge] int				,[test_PatientMinimumAge] int
		,[PatientMaximumAge] int				,[test_PatientMaximumAge] int
		,[IsWheelchairAccessibleExamRoom] bit	,[test_IsWheelchairAccessibleExamRoom] bit
		,[InDirectory] bit						,[test_InDirectory] bit
		,[TerminationReasonKey] int				,[test_TerminationReasonKey] int
		,[LocationCategoryKey] int				,[test_LocationCategoryKey] int
		,[IsHandicapAccessible] bit				,[test_IsHandicapAccessible] bit
		,[SubPartNPI] varchar(10)				,[test_SubPartNPI] varchar(10)
		,[CustomFields] varchar(max)			,[test_CustomFields] varchar(max)
		)

	insert into #FacilityLocation
		([NPI]
		,[Address1]							,[test_Address1]
		,[Address2]							,[test_Address2]
		,[City]								,[test_City]
		,[State]							,[test_State]
		,[ZipCode]							,[test_ZipCode]
		,[MailingAddress1]					,[test_MailingAddress1]
		,[MailingAddress2]					,[test_MailingAddress2]
		,[MailingCity]						,[test_MailingCity]
		,[MailingState]						,[test_MailingState]
		,[MailingZipCode]					,[test_MailingZipCode]
		,[CountyName]						,[test_CountyName]
		,[CountryCode]						,[test_CountryCode]
		,[FIPSCountyCode]					,[test_FIPSCountyCode]
		,[FIPSStateCountyCode]				,[test_FIPSStateCountyCode]
		,[CensusBlockID]					,[test_CensusBlockID]
		,[LocationName]						,[test_LocationName]
		,[AcceptsNewPatientKey]				,[test_AcceptsNewPatientKey]
		,[OfficeHours]						,[test_OfficeHours]
		,[PhoneNumber]						,[test_PhoneNumber]
		,[FaxNumber]						,[test_FaxNumber]
		,[EffectiveDate]					,[test_EffectiveDate]
		,[TerminationDate]					,[test_TerminationDate]
		,[IsMailing]						,[test_IsMailing]
		,[IsServicing]						,[test_IsServicing]
		,[IsPrimary]						,[test_IsPrimary]
		,[IsADACompliant]					,[test_IsADACompliant]
		,[LocationAcceptSignLanguage]		,[test_LocationAcceptSignLanguage]
		,[LocationHasOBServices]			,[test_LocationHasOBServices]
		,[IsAddressScrubbed]				,[test_IsAddressScrubbed]
		,[IsMailingAddressScrubbed]			,[test_IsMailingAddressScrubbed]
		,[IsEHRServiceOffered]				,[test_IsEHRServiceOffered]
		,[WebsiteUrl]						,[test_WebsiteUrl]
		,[PatientMinimumAge]				,[test_PatientMinimumAge]
		,[PatientMaximumAge]				,[test_PatientMaximumAge]
		,[IsWheelchairAccessibleExamRoom]	,[test_IsWheelchairAccessibleExamRoom]
		,[InDirectory]						,[test_InDirectory]
		,[TerminationReasonKey]				,[test_TerminationReasonKey]
		,[LocationCategoryKey]				,[test_LocationCategoryKey]
		,[IsHandicapAccessible]				,[test_IsHandicapAccessible]
		,[SubPartNPI]						,[test_SubPartNPI]
		,[CustomFields]						,[test_CustomFields]
		)
		select t.[NPI]
			   ,e.[Address1]						,t.[Address1]
			   ,e.[Address2]						,t.[Address2]
			   ,e.[City]							,t.[City]
			   ,e.[State]							,t.[State]
			   ,e.[ZipCode]							,t.[ZipCode]
			   ,e.[MailingAddress1]					,t.[MailingAddress1]
			   ,e.[MailingAddress2]					,t.[MailingAddress2]
			   ,e.[MailingCity]						,t.[MailingCity]
			   ,e.[MailingState]					,t.[MailingState]
			   ,e.[MailingZipCode]					,t.[MailingZipCode]
			   ,e.[CountyName]						,t.[CountyName]
			   ,e.[CountryCode]						,t.[CountryCode]
			   ,e.[FIPSCountyCode]					,t.[FIPSCountyCode]
			   ,e.[FIPSStateCountyCode]				,t.[FIPSStateCountyCode]
			   ,e.[CensusBlockID]					,t.[CensusBlockID]
			   ,e.[LocationName]					,t.[LocationName]
			   ,e.[AcceptsNewPatientKey]			,t.[AcceptsNewPatientKey]
			   ,e.[OfficeHours]						,t.[OfficeHours]
			   ,e.[PhoneNumber]						,t.[PhoneNumber]
			   ,e.[FaxNumber]						,t.[FaxNumber]
			   ,e.[EffectiveDate]					,t.[EffectiveDate]
			   ,e.[TerminationDate]					,t.[TerminationDate]
			   ,e.[IsMailing]						,t.[IsMailing]
			   ,e.[IsServicing]						,t.[IsServicing]
			   ,e.[IsPrimary]						,t.[IsPrimary]
			   ,e.[IsADACompliant]					,t.[IsADACompliant]
			   ,e.[LocationAcceptSignLanguage]		,t.[LocationAcceptSignLanguage]
			   ,e.[LocationHasOBServices]			,t.[LocationHasOBServices]
			   ,e.[IsAddressScrubbed]				,t.[IsAddressScrubbed]
			   ,e.[IsMailingAddressScrubbed]		,t.[IsMailingAddressScrubbed]
			   ,e.[IsEHRServiceOffered]				,t.[IsEHRServiceOffered]
			   ,e.[WebsiteUrl]						,t.[WebsiteUrl]
			   ,e.[PatientMinimumAge]				,t.[PatientMinimumAge]
			   ,e.[PatientMaximumAge]				,t.[PatientMaximumAge]
			   ,e.[IsWheelchairAccessibleExamRoom]	,t.[IsWheelchairAccessibleExamRoom]
			   ,e.[InDirectory]						,t.[InDirectory]
			   ,e.[TerminationReasonKey]			,t.[TerminationReasonKey]
			   ,e.[LocationCategoryKey]				,t.[LocationCategoryKey]
			   ,e.[IsHandicapAccessible]			,t.[IsHandicapAccessible]
			   ,e.[SubPartNPI]						,t.[SubPartNPI]
			   ,e.[CustomFields]					,t.[CustomFields]
		from #fl e
		full join #test_fl t on e.[NPI] = replace(t.[NPI],'99999','99998')
						   and e.[Rank] = t.[Rank]

	create table #fl_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #fl_names values
		   (1,'Address1','test_Address1')
		  ,(2,'Address2','test_Address2')
		  ,(3,'City','test_City')
		  ,(4,'State','test_State')
		  ,(5,'ZipCode','test_ZipCode')
		  ,(6,'MailingAddress1','test_MailingAddress1')
		  ,(7,'MailingAddress2','test_MailingAddress2')
		  ,(8,'MailingCity','test_MailingCity')
		  ,(9,'MailingState','test_MailingState')
		  ,(10,'MailingZipCode','test_MailingZipCode')
		  ,(11,'CountyName','test_CountyName')
		  ,(12,'CountryCode','test_CountryCode')
		  ,(13,'FIPSCountyCode','test_FIPSCountyCode')
		  ,(14,'FIPSStateCountyCode','test_FIPSStateCountyCode')
		  ,(15,'CensusBlockID','test_CensusBlockID')
		  ,(16,'LocationName','test_LocationName')
		  ,(17,'AcceptsNewPatientKey','test_AcceptsNewPatientKey')
		  ,(18,'OfficeHours','test_OfficeHours')
		  ,(19,'PhoneNumber','test_PhoneNumber')
		  ,(20,'FaxNumber','test_FaxNumber')
		  ,(21,'EffectiveDate','test_EffectiveDate')
		  ,(22,'TerminationDate','test_TerminationDate')
		  ,(23,'IsMailing','test_IsMailing')
		  ,(24,'IsServicing','test_IsServicing')
		  ,(25,'IsPrimary','test_IsPrimary')
		  ,(26,'IsADACompliant','test_IsADACompliant')
		  ,(27,'LocationAcceptSignLanguage','test_LocationAcceptSignLanguage')
		  ,(28,'LocationHasOBServices','test_LocationHasOBServices')
		  ,(29,'IsAddressScrubbed','test_IsAddressScrubbed')
		  ,(30,'IsMailingAddressScrubbed','test_IsMailingAddressScrubbed')
		  ,(31,'IsEHRServiceOffered','test_IsEHRServiceOffered')
		  ,(32,'WebsiteUrl','test_WebsiteUrl')
		  ,(33,'PatientMinimumAge','test_PatientMinimumAge')
		  ,(34,'PatientMaximumAge','test_PatientMaximumAge')
		  ,(35,'IsWheelchairAccessibleExamRoom','test_IsWheelchairAccessibleExamRoom')
		  ,(36,'InDirectory','test_InDirectory')
		  ,(37,'TerminationReasonKey','test_TerminationReasonKey')
		  ,(38,'LocationCategoryKey','test_LocationCategoryKey')
		  ,(39,'IsHandicapAccessible','test_IsHandicapAccessible')
		  ,(40,'SubPartNPI','test_SubPartNPI')
		  ,(41,'CustomFields','test_CustomFields')

	set @loop_counter = 1
	while (@loop_counter <= 41)
		begin
			select @exist_col_name = exist_col_name from #fl_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #fl_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #FacilityLocation set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #FacilityLocation set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select count(distinct '+@test_col_name+') from #FacilityLocation) = 0 alter table #FacilityLocation drop column '+@test_col_name
			set @sqlText4 = N'if (select count(distinct '+@exist_col_name+') from #FacilityLocation) = 0 alter table #FacilityLocation drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'OLTP Facility Location'
	select * from #FacilityLocation where Diff_flag = 1


--############################## FACILITY LOCATION COMMUNICATION ##############################

	select [PracticeNPI]
		,[StgPracticeLocationCommunicationKey]
		,[PracticeSubpartNPI]
		,[LocationName]
		,[CommunicationCategory]
		,[CommunicationCategoryKey]
		,[LocationCommunicationType]
		,[LocationCommunicationTypeKey]
		,[CommunicationValue]
		,[RecordStatus]
		,[RecordStatusDescription]
		,cast(NULL as int) as [Rank]
	into #stgflc
	from [ProviderNetworkStaging].[dbo].[StgPracticeLocationCommunication]
	where [BatchID] = -5

	;with [orderRecord] as (select [PracticeNPI]
								,[StgPracticeLocationCommunicationKey]
								,[Rank]
								,rank() over (partition by [PracticeNPI] 
											  order by [StgPracticeLocationCommunicationKey]
											 ) as Rank_number 
							from #stgflc)
	update [orderRecord] set [Rank] = Rank_number

	select [PracticeNPI]
		,[StgPracticeLocationCommunicationKey]
		,[PracticeSubpartNPI]
		,[LocationName]
		,[CommunicationCategory]
		,[CommunicationCategoryKey]
		,[LocationCommunicationType]
		,[LocationCommunicationTypeKey]
		,[CommunicationValue]
		,[RecordStatus]
		,[RecordStatusDescription]
		,cast(NULL as int) as [Rank]
	into #test_stgflc
	from [ProviderNetworkStaging].[dbo].[StgPracticeLocationCommunication]
	where [BatchID] = @BatchID

	;with [orderRecord] as (select [PracticeNPI]
								,[StgPracticeLocationCommunicationKey]
								,[Rank]
								,rank() over (partition by [PracticeNPI] 
											  order by [StgPracticeLocationCommunicationKey]
											 ) as Rank_number 
							from #test_stgflc)
	update [orderRecord] set [Rank] = Rank_number

	create table #StgFacilityLocationCommunication
		([PracticeNPI] varchar (10)
		,[Diff_flag] bit
		,[PracticeSubpartNPI] varchar(255)			,[test_PracticeSubpartNPI] varchar(255)
		,[LocationName] varchar(255)				,[test_LocationName] varchar(255)
		,[CommunicationCategory] varchar(255)		,[test_CommunicationCategory] varchar(255)
		,[CommunicationCategoryKey] int				,[test_CommunicationCategoryKey] int
		,[LocationCommunicationType] varchar(255)	,[test_LocationCommunicationType] varchar(255)
		,[LocationCommunicationTypeKey] int			,[test_LocationCommunicationTypeKey] int
		,[CommunicationValue] varchar(1000)			,[test_CommunicationValue] varchar(1000)
		,[RecordStatus] varchar(2)					,[test_RecordStatus] varchar(2)
		,[RecordStatusDescription] varchar(100)		,[test_RecordStatusDescription] varchar(100)
		)

	insert into #StgFacilityLocationCommunication
		([PracticeNPI]
		,[PracticeSubpartNPI]			,[test_PracticeSubpartNPI]
		,[LocationName]					,[test_LocationName]
		,[CommunicationCategory]		,[test_CommunicationCategory]
		,[CommunicationCategoryKey]		,[test_CommunicationCategoryKey]
		,[LocationCommunicationType]	,[test_LocationCommunicationType]
		,[LocationCommunicationTypeKey]	,[test_LocationCommunicationTypeKey]
		,[CommunicationValue]			,[test_CommunicationValue]
		,[RecordStatus]					,[test_RecordStatus]
		,[RecordStatusDescription]		,[test_RecordStatusDescription]
		)
		select t.[PracticeNPI]
			   ,e.[PracticeSubpartNPI]			,t.[PracticeSubpartNPI]
			   ,e.[LocationName]				,t.[LocationName]
			   ,e.[CommunicationCategory]		,t.[CommunicationCategory]
			   ,e.[CommunicationCategoryKey]	,t.[CommunicationCategoryKey]
			   ,e.[LocationCommunicationType]	,t.[LocationCommunicationType]
			   ,e.[LocationCommunicationTypeKey],t.[LocationCommunicationTypeKey]
			   ,e.[CommunicationValue]			,t.[CommunicationValue]
			   ,e.[RecordStatus]				,t.[RecordStatus]
			   ,e.[RecordStatusDescription]		,t.[RecordStatusDescription]
		from #stgflc e
		full join #test_stgflc t on e.[PracticeNPI] = t.[PracticeNPI]
									   and e.[Rank] = t.[Rank]

	create table #stgflc_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #stgflc_names values
		  (1,'PracticeSubpartNPI','test_PracticeSubpartNPI')
		 ,(2,'LocationName','test_LocationName')
		 ,(3,'CommunicationCategory','test_CommunicationCategory')
		 ,(4,'CommunicationCategoryKey','test_CommunicationCategoryKey')
		 ,(5,'LocationCommunicationType','test_LocationCommunicationType')
		 ,(6,'LocationCommunicationTypeKey','test_LocationCommunicationTypeKey')
		 ,(7,'CommunicationValue','test_CommunicationValue')
		 ,(8,'RecordStatus','test_RecordStatus')
		 ,(9,'RecordStatusDescription','test_RecordStatusDescription')

	set @loop_counter = 1
	while (@loop_counter <= 9)
		begin
			select @exist_col_name = exist_col_name from #stgflc_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #stgflc_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #StgFacilityLocationCommunication set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #StgFacilityLocationCommunication set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select count(distinct '+@test_col_name+') from #StgFacilityLocationCommunication) = 0 alter table #StgFacilityLocationCommunication drop column '+@test_col_name
			set @sqlText4 = N'if (select count(distinct '+@exist_col_name+') from #StgFacilityLocationCommunication) = 0 alter table #StgFacilityLocationCommunication drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'StgFacilityLocationCommunication'
	select * from #StgFacilityLocationCommunication where Diff_flag = 1

	select p.[NPI], plc.[PracticeLocationCommunicationKey]
		,cast(NULL as int) as [Rank]
		,plc.[CommunicationCategoryKey]
		,plc.[LocationCommunicationTypeKey]
		,plc.[CommunicationValue]
		,plc.[IsActive]
		,plc.[IsPrimary]
	into #flc
	from [ProviderNetwork].[dbo].[PracticeLocationCommunication] plc
	join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = plc.[PracticeLocationKey]
	join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
	where p.[NPI] like '99998%'

	;with [orderRecord] as (select [NPI]
								,[PracticeLocationCommunicationKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [PracticeLocationCommunicationKey]
											 ) as Rank_number 
							from #flc)
	update [orderRecord] set [Rank] = Rank_number

	select p.[NPI], plc.[PracticeLocationCommunicationKey]
		,cast(NULL as int) as [Rank]
		,plc.[CommunicationCategoryKey]
		,plc.[LocationCommunicationTypeKey]
		,plc.[CommunicationValue]
		,plc.[IsActive]
		,plc.[IsPrimary]
	into #test_flc
	from [ProviderNetwork].[dbo].[PracticeLocationCommunication] plc
	join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = plc.[PracticeLocationKey]
	join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
	where p.[NPI] like '99999%'

	;with [orderRecord] as (select [NPI]
								,[PracticeLocationCommunicationKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [PracticeLocationCommunicationKey]
											 ) as Rank_number 
							from #test_flc)
	update [orderRecord] set [Rank] = Rank_number

	create table #FacilityLocationCommunication
		([NPI] varchar (10)
		,[Diff_flag] bit
		,[CommunicationCategoryKey] int		,[test_CommunicationCategoryKey] int
		,[LocationCommunicationTypeKey] int	,[test_LocationCommunicationTypeKey] int
		,[CommunicationValue] varchar(1000)	,[test_CommunicationValue] varchar(1000)
		,[IsActive] bit						,[test_IsActive] bit
		,[IsPrimary] bit					,[test_IsPrimary] bit
		)

	insert into #FacilityLocationCommunication
		([NPI]
		,[CommunicationCategoryKey]		,[test_CommunicationCategoryKey]
		,[LocationCommunicationTypeKey]	,[test_LocationCommunicationTypeKey]
		,[CommunicationValue]			,[test_CommunicationValue]
		,[IsActive]						,[test_IsActive]
		,[IsPrimary]					,[test_IsPrimary]
		)
		select t.[NPI]
			   ,e.[CommunicationCategoryKey]		,t.[CommunicationCategoryKey]
			   ,e.[LocationCommunicationTypeKey]	,t.[LocationCommunicationTypeKey]
			   ,e.[CommunicationValue]				,t.[CommunicationValue]
			   ,e.[IsActive]						,t.[IsActive]
			   ,e.[IsPrimary]						,t.[IsPrimary]
		from #flc e
		full join #test_flc t on e.[NPI] = replace(t.[NPI],'99999','99998')
							and e.[Rank] = t.[Rank]

	create table #flc_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #flc_names values
		    (1,'CommunicationCategoryKey','test_CommunicationCategoryKey')
		   ,(2,'LocationCommunicationTypeKey','test_LocationCommunicationTypeKey')
		   ,(3,'CommunicationValue','test_CommunicationValue')
		   ,(4,'IsActive','test_IsActive')
		   ,(5,'IsPrimary','test_IsPrimary')

	set @loop_counter = 1
	while (@loop_counter <= 5)
		begin
			select @exist_col_name = exist_col_name from #flc_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #flc_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #FacilityLocationCommunication set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #FacilityLocationCommunication set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select count(distinct '+@test_col_name+') from #FacilityLocationCommunication) = 0 alter table #FacilityLocationCommunication drop column '+@test_col_name
			set @sqlText4 = N'if (select count(distinct '+@exist_col_name+') from #FacilityLocationCommunication) = 0 alter table #FacilityLocationCommunication drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'OLTP Facility Location Communication'
	select * from #FacilityLocationCommunication where Diff_flag = 1


--############################## FLCC ASSIGNMENT ##############################

	select [PracticeNPI]
		,[StgPracticeLocationContractComponentKey]
		,[LocationName]
		,[Address1]
		,[PracticeSubpartNPI]
		,[TIN]
		,[BusinessName]
		,[ContractId]
		,[AffiliationId]
		,[NetworkName]
		,[SubnetworkName]
		,[FLCCAssignmentEffectiveDate]
		,[FLCCAssignmentTerminationDate]
		,[RecordStatus]
		,[ErrorDescription]
		,cast(NULL as int) as [Rank]
	into #stgflcc
	from [ProviderNetworkStaging].[dbo].[StgPracticeLocationContractComponent]
	where [BatchID] = -5

	;with [orderRecord] as (select [PracticeNPI]
								,[StgPracticeLocationContractComponentKey]
								,[Rank]
								,rank() over (partition by [PracticeNPI] 
											  order by [StgPracticeLocationContractComponentKey]
											 ) as Rank_number 
							from #stgflcc)
	update [orderRecord] set [Rank] = Rank_number

	select [PracticeNPI]
		,[StgPracticeLocationContractComponentKey]
		,[LocationName]
		,[Address1]
		,[PracticeSubpartNPI]
		,[TIN]
		,[BusinessName]
		,[ContractId]
		,[AffiliationId]
		,[NetworkName]
		,[SubnetworkName]
		,[FLCCAssignmentEffectiveDate]
		,[FLCCAssignmentTerminationDate]
		,[RecordStatus]
		,[ErrorDescription]
		,cast(NULL as int) as [Rank]
	into #test_stgflcc
	from [ProviderNetworkStaging].[dbo].[StgPracticeLocationContractComponent]
	where [BatchID] = @BatchID

	;with [orderRecord] as (select [PracticeNPI]
								,[StgPracticeLocationContractComponentKey]
								,[Rank]
								,rank() over (partition by [PracticeNPI] 
											  order by [StgPracticeLocationContractComponentKey]
											 ) as Rank_number 
							from #test_stgflcc)
	update [orderRecord] set [Rank] = Rank_number

	create table #StgFacilityLocationContractComponent
		([PracticeNPI] varchar (10)
		,[Diff_flag] bit
		,[LocationName] varchar(255)			,[test_LocationName] varchar(255)
		,[Address1] varchar(100)				,[test_Address1] varchar(100)
		,[PracticeSubpartNPI] varchar(10)		,[test_PracticeSubpartNPI] varchar(10)
		,[TIN] varchar(9)						,[test_TIN] varchar(9)
		,[BusinessName] varchar(255)			,[test_BusinessName] varchar(255)
		,[ContractId] varchar(255)				,[test_ContractId] varchar(255)
		,[AffiliationId] varchar(255)			,[test_AffiliationId] varchar(255)
		,[NetworkName] varchar(255)				,[test_NetworkName] varchar(255)
		,[SubnetworkName] varchar(255)			,[test_SubnetworkName] varchar(255)
		,[FLCCAssignmentEffectiveDate] date		,[test_FLCCAssignmentEffectiveDate] date
		,[FLCCAssignmentTerminationDate] date	,[test_FLCCAssignmentTerminationDate] date
		,[RecordStatus] varchar(2)				,[test_RecordStatus] varchar(2)
		,[ErrorDescription] varchar(255)		,[test_ErrorDescription] varchar(255)
		)

	insert into #StgFacilityLocationContractComponent
		([PracticeNPI]
		,[LocationName]					,[test_LocationName]
		,[Address1]						,[test_Address1]
		,[PracticeSubpartNPI]			,[test_PracticeSubpartNPI]
		,[TIN]							,[test_TIN]
		,[BusinessName]					,[test_BusinessName]
		,[ContractId]					,[test_ContractId]
		,[AffiliationId]				,[test_AffiliationId]
		,[NetworkName]					,[test_NetworkName]
		,[SubnetworkName]				,[test_SubnetworkName]
		,[FLCCAssignmentEffectiveDate]	,[test_FLCCAssignmentEffectiveDate]
		,[FLCCAssignmentTerminationDate],[test_FLCCAssignmentTerminationDate]
		,[RecordStatus]					,[test_RecordStatus]
		,[ErrorDescription]				,[test_ErrorDescription]
		)
		select t.[PracticeNPI]
			   ,e.[LocationName]					,t.[LocationName]
			   ,e.[Address1]						,t.[Address1]
			   ,e.[PracticeSubpartNPI]				,t.[PracticeSubpartNPI]
			   ,e.[TIN]								,t.[TIN]
			   ,e.[BusinessName]					,t.[BusinessName]
			   ,e.[ContractId]						,t.[ContractId]
			   ,e.[AffiliationId]					,t.[AffiliationId]
			   ,e.[NetworkName]						,t.[NetworkName]
			   ,e.[SubnetworkName]					,t.[SubnetworkName]
			   ,e.[FLCCAssignmentEffectiveDate]		,t.[FLCCAssignmentEffectiveDate]
			   ,e.[FLCCAssignmentTerminationDate]	,t.[FLCCAssignmentTerminationDate]
			   ,e.[RecordStatus]					,t.[RecordStatus]
			   ,e.[ErrorDescription]				,t.[ErrorDescription]
		from #stgflcc e
		full join #test_stgflcc t on e.[PracticeNPI] = t.[PracticeNPI]
										and e.[Rank] = t.[Rank]

	create table #stgflcc_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #stgflcc_names values
		   (1,'LocationName','test_LocationName')
		  ,(2,'Address1','test_Address1')
		  ,(3,'PracticeSubpartNPI','test_PracticeSubpartNPI')
		  ,(4,'TIN','test_TIN')
		  ,(5,'BusinessName','test_BusinessName')
		  ,(6,'ContractId','test_ContractId')
		  ,(7,'AffiliationId','test_AffiliationId')
		  ,(8,'NetworkName','test_NetworkName')
		  ,(9,'SubnetworkName','test_SubnetworkName')
		  ,(10,'FLCCAssignmentEffectiveDate','test_FLCCAssignmentEffectiveDate')
		  ,(11,'FLCCAssignmentTerminationDate','test_FLCCAssignmentTerminationDate')
		  ,(12,'RecordStatus','test_RecordStatus')
		  ,(13,'ErrorDescription','test_ErrorDescription')

	set @loop_counter = 1
	while (@loop_counter <= 13)
		begin
			select @exist_col_name = exist_col_name from #stgflcc_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #stgflcc_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #StgFacilityLocationContractComponent set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #StgFacilityLocationContractComponent set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select count(distinct '+@test_col_name+') from #StgFacilityLocationContractComponent) = 0 alter table #StgFacilityLocationContractComponent drop column '+@test_col_name
			set @sqlText4 = N'if (select count(distinct '+@exist_col_name+') from #StgFacilityLocationContractComponent) = 0 alter table #StgFacilityLocationContractComponent drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'StgFacilityLocationContractComponent'
	select * from #StgFacilityLocationContractComponent where Diff_flag = 1

	select p.[NPI], plcc.[PracticeLocationContractComponentKey]
		,cast(NULL as int) as [Rank]
		,plcc.[EffectiveDate]
		,plcc.[TerminationDate]
	into #flcc
	from [ProviderNetwork].[dbo].[PracticeLocationContractComponent] plcc
	join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = plcc.[PracticeLocationKey]
	join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
	where p.[NPI] like '99998%'

	;with [orderRecord] as (select [NPI]
								,[PracticeLocationContractComponentKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [PracticeLocationContractComponentKey]
											 ) as Rank_number 
							from #flcc)
	update [orderRecord] set [Rank] = Rank_number

	select p.[NPI], plcc.[PracticeLocationContractComponentKey]
		,cast(NULL as int) as [Rank]
		,plcc.[EffectiveDate]
		,plcc.[TerminationDate]
	into #test_flcc
	from [ProviderNetwork].[dbo].[PracticeLocationContractComponent] plcc
	join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = plcc.[PracticeLocationKey]
	join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
	where p.[NPI] like '99999%'

	;with [orderRecord] as (select [NPI]
								,[PracticeLocationContractComponentKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [PracticeLocationContractComponentKey]
											 ) as Rank_number 
							from #test_flcc)
	update [orderRecord] set [Rank] = Rank_number

	create table #FacilityLocationContractComponent
		([NPI] varchar (10)
		,[Diff_flag] bit
		,[EffectiveDate] date	,[test_EffectiveDate] date	
		,[TerminationDate] date	,[test_TerminationDate] date
		)

	insert into #FacilityLocationContractComponent
		([NPI]
		,[EffectiveDate] 	,[test_EffectiveDate] 	
		,[TerminationDate] 	,[test_TerminationDate] 
		)
		select t.[NPI]
			,e.[EffectiveDate] 	 ,t.[EffectiveDate] 	
			,e.[TerminationDate] ,t.[TerminationDate]
		from #flcc e
		full join #test_flcc t on e.[NPI] = replace(t.[NPI],'99999','99998')
							 and e.[Rank] = t.[Rank]

	create table #flcc_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #flcc_names values
		    (1,'EffectiveDate','test_EffectiveDate')
		   ,(2,'TerminationDate','test_TerminationDate')

	set @loop_counter = 1
	while (@loop_counter <= 2)
		begin
			select @exist_col_name = exist_col_name from #flcc_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #flcc_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #FacilityLocationContractComponent set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #FacilityLocationContractComponent set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select count(distinct '+@test_col_name+') from #FacilityLocationContractComponent) = 0 alter table #FacilityLocationContractComponent drop column '+@test_col_name
			set @sqlText4 = N'if (select count(distinct '+@exist_col_name+') from #FacilityLocationContractComponent) = 0 alter table #FacilityLocationContractComponent drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'OLTP Facility Location Contract Component'
	select * from #FacilityLocationContractComponent where Diff_flag = 1


--############################## FACILITY LOCATION LANGUAGE ##############################

	select [PracticeNPI]
		,[StgPracticeLocationLanguageKey]
		,[PracticeSubpartNPI]
		,[LocationName]
		,[LanguageCode]
		,[Priority]
		,[RecordStatus]
		,[RecordStatusDescription]
		,cast(NULL as int) as [Rank]
	into #stgfll
	from [ProviderNetworkStaging].[dbo].[StgPracticeLocationLanguage]
	where [BatchID] = -5

	;with [orderRecord] as (select [PracticeNPI]
								,[StgPracticeLocationLanguageKey]
								,[Rank]
								,rank() over (partition by [PracticeNPI] 
											  order by [StgPracticeLocationLanguageKey]
											 ) as Rank_number 
							from #stgfll)
	update [orderRecord] set [Rank] = Rank_number

	select [PracticeNPI]
		,[StgPracticeLocationLanguageKey]
		,[PracticeSubpartNPI]
		,[LocationName]
		,[LanguageCode]
		,[Priority]
		,[RecordStatus]
		,[RecordStatusDescription]
		,cast(NULL as int) as [Rank]
	into #test_stgfll
	from [ProviderNetworkStaging].[dbo].[StgPracticeLocationLanguage]
	where [BatchID] = @BatchID

	;with [orderRecord] as (select [PracticeNPI]
								,[StgPracticeLocationLanguageKey]
								,[Rank]
								,rank() over (partition by [PracticeNPI] 
											  order by [StgPracticeLocationLanguageKey]
											 ) as Rank_number 
							from #test_stgfll)
	update [orderRecord] set [Rank] = Rank_number

	create table #StgFacilityLocationLanguage
		([PracticeNPI] varchar (10)
		,[Diff_flag] bit
		,[PracticeSubpartNPI] varchar(10)		,[test_PracticeSubpartNPI] varchar(10)
		,[LocationName] varchar(255)			,[test_LocationName] varchar(255)
		,[LanguageCode] varchar(10)				,[test_LanguageCode] varchar(10)
		,[Priority] int							,[test_Priority] int
		,[RecordStatus] varchar(2)				,[test_RecordStatus] varchar(2)
		,[RecordStatusDescription] varchar(100)	,[test_RecordStatusDescription] varchar(100)
		)

	insert into #StgFacilityLocationLanguage
		([PracticeNPI]
		,[PracticeSubpartNPI]		,[test_PracticeSubpartNPI]
		,[LocationName]				,[test_LocationName]
		,[LanguageCode]				,[test_LanguageCode]
		,[Priority]					,[test_Priority]
		,[RecordStatus]				,[test_RecordStatus]
		,[RecordStatusDescription]	,[test_RecordStatusDescription]
		)
		select t.[PracticeNPI]
			   ,e.[PracticeSubpartNPI]		,t.[PracticeSubpartNPI]
			   ,e.[LocationName]			,t.[LocationName]
			   ,e.[LanguageCode]			,t.[LanguageCode]
			   ,e.[Priority]				,t.[Priority]
			   ,e.[RecordStatus]			,t.[RecordStatus]
			   ,e.[RecordStatusDescription]	,t.[RecordStatusDescription]
		from #stgfll e
		full join #test_stgfll t on e.[PracticeNPI] = t.[PracticeNPI]
									   and e.[Rank] = t.[Rank]
	
	create table #stgfll_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #stgfll_names values
		    (1,'PracticeSubpartNPI','test_PracticeSubpartNPI')
		   ,(2,'LocationName','test_LocationName')
		   ,(3,'LanguageCode','test_LanguageCode')
		   ,(4,'Priority','test_Priority')
		   ,(5,'RecordStatus','test_RecordStatus')
		   ,(6,'RecordStatusDescription','test_RecordStatusDescription')

	set @loop_counter = 1
	while (@loop_counter <= 6)
		begin
			select @exist_col_name = exist_col_name from #stgfll_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #stgfll_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #StgFacilityLocationLanguage set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #StgFacilityLocationLanguage set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select count(distinct '+@test_col_name+') from #StgFacilityLocationLanguage) = 0 alter table #StgFacilityLocationLanguage drop column '+@test_col_name
			set @sqlText4 = N'if (select count(distinct '+@exist_col_name+') from #StgFacilityLocationLanguage) = 0 alter table #StgFacilityLocationLanguage drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'StgFacilityLocationLanguage'
	select * from #StgFacilityLocationLanguage where Diff_flag = 1

	select p.[NPI], pll.[PracticeLocationLanguageKey]
		,cast(NULL as int) as [Rank]
		,pll.[Language]
		,pll.[Priority]
		,pll.[IsActive]
	into #fll
	from [ProviderNetwork].[dbo].[PracticeLocationLanguage] pll
	join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = pll.[PracticeLocationKey]
	join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
	where p.[NPI] like '99998%'

	;with [orderRecord] as (select [NPI]
								,[Language]
								,[PracticeLocationLanguageKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [Language]
													  ,[PracticeLocationLanguageKey]
											 ) as Rank_number 
							from #fll)
	update [orderRecord] set [Rank] = Rank_number

	select p.[NPI], pll.[PracticeLocationLanguageKey]
		,cast(NULL as int) as [Rank]
		,pll.[Language]
		,pll.[Priority]
		,pll.[IsActive]
	into #test_fll
	from [ProviderNetwork].[dbo].[PracticeLocationLanguage] pll
	join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = pll.[PracticeLocationKey]
	join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
	where p.[NPI] like '99999%'

	;with [orderRecord] as (select [NPI]
								,[Language]
								,[PracticeLocationLanguageKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [Language]
													  ,[PracticeLocationLanguageKey]
											 ) as Rank_number 
							from #test_fll)
	update [orderRecord] set [Rank] = Rank_number

	create table #FacilityLocationLanguage
		([NPI] varchar (10)
		,[Diff_flag] bit
		,[Language] varchar(10) ,[test_Language] varchar(10)	
		,[Priority] tinyint	    ,[test_Priority] tinyint
		,[IsActive] bit		    ,[test_IsActive] bit
		)

	insert into #FacilityLocationLanguage
		([NPI]
		,[Language] ,[test_Language] 	
		,[Priority] ,[test_Priority]
		,[IsActive]	,[test_IsActive]
		)
		select t.[NPI]
			,e.[Language], t.[Language] 	
			,e.[Priority], t.[Priority]
			,e.[IsActive], t.[IsActive]
		from #fll e
		full join #test_fll t on e.[NPI] = replace(t.[NPI],'99999','99998')
							and e.[Rank] = t.[Rank]

	create table #fll_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #fll_names values
		     (1,'Language','test_Language')
			,(2,'Priority','test_Priority')
			,(3,'IsActive','test_IsActive')

	set @loop_counter = 1
	while (@loop_counter <= 3)
		begin
			select @exist_col_name = exist_col_name from #fll_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #fll_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #FacilityLocationLanguage set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #FacilityLocationLanguage set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select count(distinct '+@test_col_name+') from #FacilityLocationLanguage) = 0 alter table #FacilityLocationLanguage drop column '+@test_col_name
			set @sqlText4 = N'if (select count(distinct '+@exist_col_name+') from #FacilityLocationLanguage) = 0 alter table #FacilityLocationLanguage drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'OLTP Facility Location Language'
	select * from #FacilityLocationLanguage where Diff_flag = 1


--############################## FACILITY LOCATION SPECIALTY ##############################

	select [PracticeNPI]
		,[StgPracticeLocationSpecialtyKey]
		,[PracticeSubpartNPI]
		,[LocationName]
		,[Specialty]
		,[StateReportingProviderType]
		,[StateReportingProviderSpecialty]
		,[SpecialtyKey]
		,[StateProviderTypeKey]
		,[StateSpecialtyKey]
		,[Priority]
		,[RecordStatus]
		,[RecordStatusDescription]
		,cast(NULL as int) as [Rank]
	into #stgfls
	from [ProviderNetworkStaging].[dbo].[StgPracticeLocationSpecialty]
	where [BatchID] = -5

	;with [orderRecord] as (select [PracticeNPI]
								,[StgPracticeLocationSpecialtyKey]
								,[Rank]
								,rank() over (partition by [PracticeNPI] 
											  order by [StgPracticeLocationSpecialtyKey]
											 ) as Rank_number 
							from #stgfls)
	update [orderRecord] set [Rank] = Rank_number

	select [PracticeNPI]
		,[StgPracticeLocationSpecialtyKey]
		,[PracticeSubpartNPI]
		,[LocationName]
		,[Specialty]
		,[StateReportingProviderType]
		,[StateReportingProviderSpecialty]
		,[SpecialtyKey]
		,[StateProviderTypeKey]
		,[StateSpecialtyKey]
		,[Priority]
		,[RecordStatus]
		,[RecordStatusDescription]
		,cast(NULL as int) as [Rank]
	into #test_stgfls
	from [ProviderNetworkStaging].[dbo].[StgPracticeLocationSpecialty]
	where [BatchID] = @BatchID

	;with [orderRecord] as (select [PracticeNPI]
								,[StgPracticeLocationSpecialtyKey]
								,[Rank]
								,rank() over (partition by [PracticeNPI] 
											  order by [StgPracticeLocationSpecialtyKey]
											 ) as Rank_number 
							from #test_stgfls)
	update [orderRecord] set [Rank] = Rank_number

	create table #StgFacilityLocationSpecialty
		([PracticeNPI] varchar (10)
		,[Diff_flag] bit
		,[PracticeSubpartNPI] varchar(10)				,[test_PracticeSubpartNPI] varchar(10)
		,[LocationName] varchar(255)					,[test_LocationName] varchar(255)
		,[Specialty] varchar(255)						,[test_Specialty] varchar(255)
		,[StateReportingProviderType] varchar(255)		,[test_StateReportingProviderType] varchar(255)
		,[StateReportingProviderSpecialty] varchar(255)	,[test_StateReportingProviderSpecialty] varchar(255)
		,[SpecialtyKey] int								,[test_SpecialtyKey] int
		,[StateProviderTypeKey] varchar(255)			,[test_StateProviderTypeKey] varchar(255)
		,[StateSpecialtyKey] int						,[test_StateSpecialtyKey] int
		,[Priority] int									,[test_Priority] int
		,[RecordStatus] varchar(2)						,[test_RecordStatus] varchar(2)
		,[RecordStatusDescription] varchar(500)			,[test_RecordStatusDescription] varchar(500)
		)

	insert into #StgFacilityLocationSpecialty
		([PracticeNPI]
		,[PracticeSubpartNPI]				,[test_PracticeSubpartNPI]
		,[LocationName]						,[test_LocationName]
		,[Specialty]						,[test_Specialty]
		,[StateReportingProviderType]		,[test_StateReportingProviderType]
		,[StateReportingProviderSpecialty]	,[test_StateReportingProviderSpecialty]
		,[SpecialtyKey]						,[test_SpecialtyKey]
		,[StateProviderTypeKey]				,[test_StateProviderTypeKey]
		,[StateSpecialtyKey]				,[test_StateSpecialtyKey]
		,[Priority]							,[test_Priority]
		,[RecordStatus]						,[test_RecordStatus]
		,[RecordStatusDescription]			,[test_RecordStatusDescription]
		)
		select t.[PracticeNPI]
			   ,e.[PracticeSubpartNPI]				,t.[PracticeSubpartNPI]
			   ,e.[LocationName]					,t.[LocationName]
			   ,e.[Specialty]						,t.[Specialty]
			   ,e.[StateReportingProviderType]		,t.[StateReportingProviderType]
			   ,e.[StateReportingProviderSpecialty]	,t.[StateReportingProviderSpecialty]
			   ,e.[SpecialtyKey]					,t.[SpecialtyKey]
			   ,e.[StateProviderTypeKey]			,t.[StateProviderTypeKey]
			   ,e.[StateSpecialtyKey]				,t.[StateSpecialtyKey]
			   ,e.[Priority]						,t.[Priority]
			   ,e.[RecordStatus]					,t.[RecordStatus]
			   ,e.[RecordStatusDescription]			,t.[RecordStatusDescription]
		from #stgfls e
		full join #test_stgfls t on e.[PracticeNPI] = t.[PracticeNPI]
									   and e.[Rank] = t.[Rank]

	create table #stgfls_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #stgfls_names values
		     (1,'PracticeSubpartNPI','test_PracticeSubpartNPI')
			,(2,'LocationName','test_LocationName')
			,(3,'Specialty','test_Specialty')
			,(4,'StateReportingProviderType','test_StateReportingProviderType')
			,(5,'StateReportingProviderSpecialty','test_StateReportingProviderSpecialty')
			,(6,'SpecialtyKey','test_SpecialtyKey')
			,(7,'StateProviderTypeKey','test_StateProviderTypeKey')
			,(8,'StateSpecialtyKey','test_StateSpecialtyKey')
			,(9,'Priority','test_Priority')
			,(10,'RecordStatus','test_RecordStatus')
			,(11,'RecordStatusDescription','test_RecordStatusDescription')

	set @loop_counter = 1
	while (@loop_counter <= 11)
		begin
			select @exist_col_name = exist_col_name from #stgfls_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #stgfls_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #StgFacilityLocationSpecialty set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #StgFacilityLocationSpecialty set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select count(distinct '+@test_col_name+') from #StgFacilityLocationSpecialty) = 0 alter table #StgFacilityLocationSpecialty drop column '+@test_col_name
			set @sqlText4 = N'if (select count(distinct '+@exist_col_name+') from #StgFacilityLocationSpecialty) = 0 alter table #StgFacilityLocationSpecialty drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'StgFacilityLocationSpecialty'
	select * from #StgFacilityLocationSpecialty where Diff_flag = 1

	select p.[NPI], pls.[PracticeLocationSpecialtyKey]
		,cast(NULL as int) as [Rank]
		,pls.[SpecialtyKey]
		,pls.[StateProviderTypeKey]
		,pls.[StateSpecialtyKey]
		,pls.[Priority]
		,pls.[IsActive]
	into #fls
	from [ProviderNetwork].[dbo].[PracticeLocationSpecialty] pls
	join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = pls.[PracticeLocationKey]
	join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
	where p.[NPI] like '99998%'

	;with [orderRecord] as (select [NPI]
								,[PracticeLocationSpecialtyKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [PracticeLocationSpecialtyKey]
											 ) as Rank_number 
							from #fls)
	update [orderRecord] set [Rank] = Rank_number

	select p.[NPI], pls.[PracticeLocationSpecialtyKey]
		,cast(NULL as int) as [Rank]
		,pls.[SpecialtyKey]
		,pls.[StateProviderTypeKey]
		,pls.[StateSpecialtyKey]
		,pls.[Priority]
		,pls.[IsActive]
	into #test_fls
	from [ProviderNetwork].[dbo].[PracticeLocationSpecialty] pls
	join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = pls.[PracticeLocationKey]
	join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
	where p.[NPI] like '99999%'

	;with [orderRecord] as (select [NPI]
								,[PracticeLocationSpecialtyKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [PracticeLocationSpecialtyKey]
											 ) as Rank_number 
							from #test_fls)
	update [orderRecord] set [Rank] = Rank_number

	create table #FacilityLocationSpecialty
		([NPI] varchar (10)
		,[Diff_flag] bit
		,[SpecialtyKey] int			,[test_SpecialtyKey] int
		,[StateProviderTypeKey] int	,[test_StateProviderTypeKey] int
		,[StateSpecialtyKey] int	,[test_StateSpecialtyKey] int
		,[Priority] tinyint			,[test_Priority] tinyint
		,[IsActive] bit				,[test_IsActive] bit
		)

	insert into #FacilityLocationSpecialty
		([NPI]
		,[SpecialtyKey]			,[test_SpecialtyKey]
		,[StateProviderTypeKey]	,[test_StateProviderTypeKey]
		,[StateSpecialtyKey]	,[test_StateSpecialtyKey]
		,[Priority]				,[test_Priority]
		,[IsActive]				,[test_IsActive]
		)
		select t.[NPI]
			,e.[SpecialtyKey]			,t.[SpecialtyKey]
			,e.[StateProviderTypeKey]	,t.[StateProviderTypeKey]
			,e.[StateSpecialtyKey]		,t.[StateSpecialtyKey]
			,e.[Priority]				,t.[Priority]
			,e.[IsActive]				,t.[IsActive]
		from #fls e
		full join #test_fls t on e.[NPI] = replace(t.[NPI],'99999','99998')
							and e.[Rank] = t.[Rank]

	create table #fls_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #fls_names values
		 (1,'SpecialtyKey','test_SpecialtyKey')
		,(2,'StateProviderTypeKey','test_StateProviderTypeKey')
		,(3,'StateSpecialtyKey','test_StateSpecialtyKey')
		,(4,'Priority','test_Priority')
		,(5,'IsActive','test_IsActive')

	set @loop_counter = 1
	while (@loop_counter <= 5)
		begin
			select @exist_col_name = exist_col_name from #fls_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #fls_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #FacilityLocationSpecialty set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #FacilityLocationSpecialty set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select count(distinct '+@test_col_name+') from #FacilityLocationSpecialty) = 0 alter table #FacilityLocationSpecialty drop column '+@test_col_name
			set @sqlText4 = N'if (select count(distinct '+@exist_col_name+') from #FacilityLocationSpecialty) = 0 alter table #FacilityLocationSpecialty drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'OLTP Facility Location Specialty'
	select * from #FacilityLocationSpecialty where Diff_flag = 1


--############################## FACILITY LOCATION TYPE ##############################

	select [PracticeNPI]
		,[StgPracticeLocationTypeKey]
		,[PracticeSubpartNPI]
		,[LocationName]
		,[LocationType]
		,[LocationTypeKey]
		,[RecordStatus]
		,[RecordStatusDescription]
		,cast(NULL as int) as [Rank]
	into #stgflt
	from [ProviderNetworkStaging].[dbo].[StgPracticeLocationSpecialty]
	where [BatchID] = -5

	;with [orderRecord] as (select [PracticeNPI]
								,[StgPracticeLocationTypeKey]
								,[Rank]
								,rank() over (partition by [PracticeNPI] 
											  order by [StgPracticeLocationTypeKey]
											 ) as Rank_number 
							from #stgflt)
	update [orderRecord] set [Rank] = Rank_number

	select [PracticeNPI]
		,[StgPracticeLocationTypeKey]
		,[PracticeSubpartNPI]
		,[LocationName]
		,[LocationType]
		,[LocationTypeKey]
		,[RecordStatus]
		,[RecordStatusDescription]
		,cast(NULL as int) as [Rank]
	into #test_stgflt
	from [ProviderNetworkStaging].[dbo].[StgPracticeLocationSpecialty]
	where [BatchID] = @BatchID

	;with [orderRecord] as (select [PracticeNPI]
								,[StgPracticeLocationTypeKey]
								,[Rank]
								,rank() over (partition by [PracticeNPI] 
											  order by [StgPracticeLocationTypeKey]
											 ) as Rank_number 
							from #test_stgflt)
	update [orderRecord] set [Rank] = Rank_number

	create table #StgFacilityLocationType
		([PracticeNPI] varchar (10)
		,[Diff_flag] bit
		,[PracticeSubpartNPI] varchar (10)		,[test_PracticeSubpartNPI] varchar (10)
		,[LocationName] varchar (255)			,[test_LocationName] varchar (255)
		,[LocationType] varchar (255)			,[test_LocationType] varchar (255)
		,[LocationTypeKey] int					,[test_LocationTypeKey] int
		,[RecordStatus] varchar (2)				,[test_RecordStatus] varchar (2)
		,[RecordStatusDescription] varchar (100),[test_RecordStatusDescription] varchar (100)
		)

	insert into #StgFacilityLocationType
		([PracticeNPI]
		,[PracticeSubpartNPI]		,[test_PracticeSubpartNPI]
		,[LocationName]				,[test_LocationName]
		,[LocationType]				,[test_LocationType]
		,[LocationTypeKey]			,[test_LocationTypeKey]
		,[RecordStatus]				,[test_RecordStatus]
		,[RecordStatusDescription]	,[test_RecordStatusDescription]
		)
		select t.[PracticeNPI]
			,e.[PracticeSubpartNPI]		,t.[PracticeSubpartNPI]
			,e.[LocationName]			,t.[LocationName]
			,e.[LocationType]			,t.[LocationType]
			,e.[LocationTypeKey]		,t.[LocationTypeKey]
			,e.[RecordStatus]			,t.[RecordStatus]
			,e.[RecordStatusDescription],t.[RecordStatusDescription]
		from #stgflt e
		full join #test_stgflt t on e.[PracticeNPI] = t.[PracticeNPI]
									   and e.[Rank] = t.[Rank]

	create table #stgflt_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #stgflt_names values
		 (1,'PracticeSubpartNPI','test_PracticeSubpartNPI')
		,(2,'LocationName','test_LocationName')
		,(3,'LocationType','test_LocationType')
		,(4,'LocationTypeKey','test_LocationTypeKey')
		,(5,'RecordStatus','test_RecordStatus')
		,(6,'RecordStatusDescription','test_RecordStatusDescription')

	set @loop_counter = 1
	while (@loop_counter <= 6)
		begin
			select @exist_col_name = exist_col_name from #stgflt_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #stgflt_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #StgFacilityLocationType set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #StgFacilityLocationType set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select count(distinct '+@test_col_name+') from #StgFacilityLocationType) = 0 alter table #StgFacilityLocationType drop column '+@test_col_name
			set @sqlText4 = N'if (select count(distinct '+@exist_col_name+') from #StgFacilityLocationType) = 0 alter table #StgFacilityLocationType drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'StgFacilityLocationType'
	select * from #StgFacilityLocationType where Diff_flag = 1

	select p.[NPI], pls.[PracticeLocationSpecialtyKey]
		,cast(NULL as int) as [Rank]
		,pls.[SpecialtyKey]
		,pls.[StateProviderTypeKey]
		,pls.[StateSpecialtyKey]
		,pls.[Priority]
		,pls.[IsActive]
	into #fls
	from [ProviderNetwork].[dbo].[PracticeLocationSpecialty] pls
	join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = pls.[PracticeLocationKey]
	join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
	where p.[NPI] like '99998%'

	;with [orderRecord] as (select [NPI]
								,[PracticeLocationSpecialtyKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [PracticeLocationSpecialtyKey]
											 ) as Rank_number 
							from #fls)
	update [orderRecord] set [Rank] = Rank_number

	select p.[NPI], pls.[PracticeLocationSpecialtyKey]
		,cast(NULL as int) as [Rank]
		,pls.[SpecialtyKey]
		,pls.[StateProviderTypeKey]
		,pls.[StateSpecialtyKey]
		,pls.[Priority]
		,pls.[IsActive]
	into #test_fls
	from [ProviderNetwork].[dbo].[PracticeLocationSpecialty] pls
	join [ProviderNetwork].[dbo].[PracticeLocation] pl on pl.[PracticeLocationKey] = pls.[PracticeLocationKey]
	join [ProviderNetwork].[dbo].[Practice] p on p.[PracticeKey] = pl.[PracticeKey]
	where p.[NPI] like '99999%'

	;with [orderRecord] as (select [NPI]
								,[PracticeLocationSpecialtyKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [PracticeLocationSpecialtyKey]
											 ) as Rank_number 
							from #test_fls)
	update [orderRecord] set [Rank] = Rank_number

	create table #FacilityLocationSpecialty
		([NPI] varchar (10)
		,[Diff_flag] bit
		,[SpecialtyKey] int			,[test_SpecialtyKey] int
		,[StateProviderTypeKey] int	,[test_StateProviderTypeKey] int
		,[StateSpecialtyKey] int	,[test_StateSpecialtyKey] int
		,[Priority] tinyint			,[test_Priority] tinyint
		,[IsActive] bit				,[test_IsActive] bit
		)

	insert into #FacilityLocationSpecialty
		([NPI]
		,[SpecialtyKey]			,[test_SpecialtyKey]
		,[StateProviderTypeKey]	,[test_StateProviderTypeKey]
		,[StateSpecialtyKey]	,[test_StateSpecialtyKey]
		,[Priority]				,[test_Priority]
		,[IsActive]				,[test_IsActive]
		)
		select t.[NPI]
			,e.[SpecialtyKey]			,t.[SpecialtyKey]
			,e.[StateProviderTypeKey]	,t.[StateProviderTypeKey]
			,e.[StateSpecialtyKey]		,t.[StateSpecialtyKey]
			,e.[Priority]				,t.[Priority]
			,e.[IsActive]				,t.[IsActive]
		from #fls e
		full join #test_fls t on e.[NPI] = replace(t.[NPI],'99999','99998')
							and e.[Rank] = t.[Rank]

	select * from #FacilityLocationSpecialty

	create table #fls_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #fls_names values
		 (1,'SpecialtyKey','test_SpecialtyKey')
		,(2,'StateProviderTypeKey','test_StateProviderTypeKey')
		,(3,'StateSpecialtyKey','test_StateSpecialtyKey')
		,(4,'Priority','test_Priority')
		,(5,'IsActive','test_IsActive')

	set @loop_counter = 1
	while (@loop_counter <= 5)
		begin
			select @exist_col_name = exist_col_name from #fls_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #fls_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #FacilityLocationSpecialty set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #FacilityLocationSpecialty set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select count(distinct '+@test_col_name+') from #FacilityLocationSpecialty) = 0 alter table #FacilityLocationSpecialty drop column '+@test_col_name
			set @sqlText4 = N'if (select count(distinct '+@exist_col_name+') from #FacilityLocationSpecialty) = 0 alter table #FacilityLocationSpecialty drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'OLTP Facility Location Specialty'
	select * from #FacilityLocationSpecialty where Diff_flag = 1

end

