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

--############################## PROVIDER NETWORK MASTER (CF) ##############################

	select [PracticeNPI]
		,[ProviderNPI]
		,[StgProviderNetworkMasterKey]
		,[PracticeName]
		,[PracticeType]
		,[FacilityReportingType]
		,[FacilityStateReporting]
		,[PracticeSubpartNPI]
		,[LocationAddressType]
		,[LocationAddress1]
		,[LocationAddress2]
		,[LocationCity]
		,[LocationState]
		,[LocationZipCode]
		,[LocationName]
		,[LocationAcceptsNewPatients]
		,[LocationPhoneNumber]
		,[LocationFaxNumber]
		,[LocationType]
		,[LocationSpecialtyCode]
		,[FLAdditionalSpecialty1]
		,[FLAdditionalSpecialty2]
		,[FLAdditionalSpecialty3]
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
		,[FLLanguage1]
		,[FLLanguage2]
		,[FLLanguage3]
		,[FLLanguage4]
		,[FLShowInDirectory]
		,[TIN]
		,[BusinessName]
		,[BillingAddress1]
		,[BillingAddress2]
		,[BillingCity]
		,[BillingState]
		,[BillingZipCode]
		,[BillingPhoneNumber]
		,[BillingFaxNumber]
		,[ProviderFirstName]
		,[ProviderLastName]
		,[ProviderMiddleName]
		,[ProviderSuffix]
		,[ProviderGender]
		,[ProviderDateofBirth]
		,[ProviderEmail]
		,[ProviderPhoneNumber]
		,[ProviderFaxNumber]
		,[ProviderMedicaidState]
		,[ProviderIsPCP]
		,[ProviderPrimarySpecialtyCode]
		,[ProviderCredentialCode]
		,[ProviderEngagementPriority]
		,[ApplicationCompleteDate]
		,[CredentialingApprovedDate]
		,[ProviderLocationEffectiveDate]
		,[ProviderLocationTerminationDate]
		,[IsProviderPrimaryLocation]
		,[IsProviderPCPLocation]
		,[ProviderLanguage1]
		,[ProviderLanguage2]
		,[ProviderLanguage3]
		,[ProviderLanguage4]
		,[ProviderlicBoardCertID]
		,[ProviderBoardCertificationType1]
		,[ProviderlicBoardCertEffectiveDate]
		,[ProviderlicBoardCertTerminationDate]
		,[FLHandicapAccessible]
		,[FLTerminationReason]
		,[FLCategory]
		,[FLMailingAddress1]
		,[FLMailingAddress2]
		,[FLMailingCity]
		,[FLMailingState]
		,[FLMailingZip]
		,[BillingMailingAddress1]
		,[BillingMailingAddress2]
		,[BillingMailingCity]
		,[BillingMailingState]
		,[BillingMailingZip]
		,[ProviderAdditionalSpecialty1]
		,[ProviderAdditionalSpecialty2]
		,[ProviderAdditionalSpecialty3]
		,[FLEffectiveDate]
		,[FLTerminationDate]
		,[PLPhoneNumber]
		,[PLFaxNumber]
		,[PLPrimarySpecialty]
		,[PLAdditionalSpecialty1]
		,[PLAdditionalSpecialty2]
		,[PLAdditionalSpecialty3]
		,[PLHoursOpenMon]
		,[PLHoursCloseMon]
		,[PLHoursOpenTues]
		,[PLHoursCloseTues]
		,[PLHoursOpenWed]
		,[PLHoursCloseWed]
		,[PLHoursOpenThurs]
		,[PLHoursCloseThurs]
		,[PLHoursOpenFri]
		,[PLHoursCloseFri]
		,[PLHoursOpenSat]
		,[PLHoursCloseSat]
		,[PLHoursOpenSun]
		,[PLHoursCloseSun]
		,[PLMinimumPatientAge]
		,[PLMaximumPatientAge]
		,[PLShowInDirectory]
		,[PLTerminationReason]
		,[PLCategory]
		,[PLAddress1]
		,[PLAddress2]
		,[PLCity]
		,[PLState]
		,[PLZip]
		,[PLMailingAddress1]
		,[PLMailingAddress2]
		,[PLMailingCity]
		,[PLMailingState]
		,[PLMailingZip]
		,[Plesiid1]
		,[PlesiidType1]
		,[PlesiidDesc1]
		,[PlesiidEffectiveDate1]
		,[PlesiidTerminationDate1]
		,[Plesiid2]
		,[PlesiidType2]
		,[PlesiidDesc2]
		,[PlesiidEffectiveDate2]
		,[PlesiidTerminationDate2]
		,[Plesiid3]
		,[PlesiidType3]
		,[PlesiidDesc3]
		,[PlesiidEffectiveDate3]
		,[PlesiidTerminationDate3]
		,[Plesiid4]
		,[PlesiidType4]
		,[PlesiidDesc4]
		,[PlesiidEffectiveDate4]
		,[PlesiidTerminationDate4]
		,[Plesiid5]
		,[PlesiidType5]
		,[PlesiidDesc5]
		,[PlesiidEffectiveDate5]
		,[PlesiidTerminationDate5]
		,[Plesiid6]
		,[PlesiidType6]
		,[PlesiidDesc6]
		,[PlesiidEffectiveDate6]
		,[PlesiidTerminationDate6]
		,[Plesiid7]
		,[PlesiidType7]
		,[PlesiidDesc7]
		,[PlesiidEffectiveDate7]
		,[PlesiidTerminationDate7]
		,[Plesiid8]
		,[PlesiidType8]
		,[PlesiidDesc8]
		,[PlesiidEffectiveDate8]
		,[PlesiidTerminationDate8]
		,[Plesiid9]
		,[PlesiidType9]
		,[PlesiidDesc9]
		,[PlesiidEffectiveDate9]
		,[PlesiidTerminationDate9]
		,[FacilityMedicaidLicenseID1]
		,[FacilityMedicaidLicenseState1]
		,[FacilityMedicaidLicenseEffectiveDate1]
		,[FacilityMedicaidLicenseTerminationDate1]
		,[FacilityStateLicenseID1]
		,[FacilityStateLicenseState1]
		,[FacilityStateLicenseType1]
		,[FacilityStateLicenseEffectiveDate1]
		,[FacilityStateLicenseTerminationDate1]
		,[FacilityBoardcertificationID1]
		,[FacilityBoardCertificationType1]
		,[FacilityBoardCertificationEffectiveDate1]
		,[FacilityBoardCertificationTerminationDate1]
		,[FacilityMemberAssignment]
		,[FLStateReportingProviderTypePrimary]
		,[FLStateReportingProviderSpecialtyPrimary]
		,[FLStateReportingProviderType1]
		,[FLStateReportingProviderSpecialty1]
		,[FLStateReportingProviderType2]
		,[FLStateReportingProviderSpecialty2]
		,[FLStateReportingProviderType3]
		,[FLStateReportingProviderSpecialty3]
		,[FLAdditionalSpecialty4]
		,[FLStateReportingProviderType4]
		,[FLStateReportingProviderSpecialty4]
		,[FLAdditionalSpecialty5]
		,[FLStateReportingProviderType5]
		,[FLStateReportingProviderSpecialty5]
		,[FLAdditionalSpecialty6]
		,[FLStateReportingProviderType6]
		,[FLStateReportingProviderSpecialty6]
		,[FLAdditionalSpecialty7]
		,[FLStateReportingProviderType7]
		,[FLStateReportingProviderSpecialty7]
		,[FLAdditionalSpecialty8]
		,[FLStateReportingProviderType8]
		,[FLStateReportingProviderSpecialty8]
		,[FLAdditionalSpecialty9]
		,[FLStateReportingProviderType9]
		,[FLStateReportingProviderSpecialty9]
		,[FLCCNetworkName]
		,[FLCCSubnetworkName]
		,[FLCCAffiliationID]
		,[FLCCContractID]
		,[FLCCReimbursementRate]
		,[FLCCAssignmentEffectiveDate]
		,[FLCCAssignmentTerminationDate]
		,[ProviderMedicaidLicenseID1]
		,[ProviderMedicaidLicenseState1]
		,[ProviderMedicaidLicenseEffectiveDate1]
		,[ProviderMedicaidLicenseTerminationDate1]
		,[ProviderStateLicenseID1]
		,[ProviderStateLicenseState1]
		,[ProviderStateLicenseType1]
		,[ProviderStateLicenseEffectiveDate1]
		,[ProviderStateLicenseTerminationDate1]
		,[PLStateReportingProviderTypePrimary]
		,[PLStateReportingProviderSpecialtyPrimary]
		,[PLStateReportingProviderType1]
		,[PLStateReportingProviderSpecialty1]
		,[PLStateReportingProviderType2]
		,[PLStateReportingProviderSpecialty2]
		,[PLStateReportingProviderType3]
		,[PLStateReportingProviderSpecialty3]
		,[PLAdditionalSpecialty4]
		,[PLStateReportingProviderType4]
		,[PLStateReportingProviderSpecialty4]
		,[PLAdditionalSpecialty5]
		,[PLStateReportingProviderType5]
		,[PLStateReportingProviderSpecialty5]
		,[PLAdditionalSpecialty6]
		,[PLStateReportingProviderType6]
		,[PLStateReportingProviderSpecialty6]
		,[PLAdditionalSpecialty7]
		,[PLStateReportingProviderType7]
		,[PLStateReportingProviderSpecialty7]
		,[PLAdditionalSpecialty8]
		,[PLStateReportingProviderType8]
		,[PLStateReportingProviderSpecialty8]
		,[PLAdditionalSpecialty9]
		,[PLStateReportingProviderType9]
		,[PLStateReportingProviderSpecialty9]
		,[PLAcceptsNewPatients]
		,[PhysHospRelNPI1]
		,[PhysHospRelEffectiveDate1]
		,[PhysHospRelTerminationDate1]
		,[PhysHospRelType1]
		,[PhysHospRelPrintInDirectory1]
		,[PhysHospRelNPI2]
		,[PhysHospRelEffectiveDate2]
		,[PhysHospRelTerminationDate2]
		,[PhysHospRelType2]
		,[PhysHospRelPrintInDirectory2]
		,[PhysHospRelNPI3]
		,[PhysHospRelEffectiveDate3]
		,[PhysHospRelTerminationDate3]
		,[PhysHospRelType3]
		,[PhysHospRelPrintInDirectory3]
		,[PhysHospRelNPI4]
		,[PhysHospRelEffectiveDate4]
		,[PhysHospRelTerminationDate4]
		,[PhysHospRelType4]
		,[PhysHospRelPrintInDirectory4]
		,[PhysHospRelNPI5]
		,[PhysHospRelEffectiveDate5]
		,[PhysHospRelTerminationDate5]
		,[PhysHospRelType5]
		,[PhysHospRelPrintInDirectory5]
		,[PLCCNetworkName]
		,[PLCCSubnetworkName]
		,[PLCCAffiliationID]
		,[PLCCContractID]
		,[PLCCReimbursementRate]
		,[PLCCAssignmentEffectiveDate]
		,[PLCCAssignmentTerminationDate]
		,[IsPracticeValid]
		,[IsProviderValid]
		,cast(NULL as int) as [Rank]
	into #pnm
	from [ProviderNetworkStaging].[dbo].[StgProviderNetworkMaster] with (nolock)
	where [BatchID] = -5

	;with [orderRecord] as (select [PracticeNPI]
								,[ProviderNPI]
								,[StgProviderNetworkMasterKey]
								,[Rank]
								,rank() over (partition by [PracticeNPI]
														,[ProviderNPI]
											  order by [StgProviderNetworkMasterKey]
											 ) as Rank_number 
							from #pnm)
	update [orderRecord] set [Rank] = Rank_number

	select [PracticeNPI]
		,[ProviderNPI]
		,[StgProviderNetworkMasterKey]
		,[PracticeName]
		,[PracticeType]
		,[FacilityReportingType]
		,[FacilityStateReporting]
		,[PracticeSubpartNPI]
		,[LocationAddressType]
		,[LocationAddress1]
		,[LocationAddress2]
		,[LocationCity]
		,[LocationState]
		,[LocationZipCode]
		,[LocationName]
		,[LocationAcceptsNewPatients]
		,[LocationPhoneNumber]
		,[LocationFaxNumber]
		,[LocationType]
		,[LocationSpecialtyCode]
		,[FLAdditionalSpecialty1]
		,[FLAdditionalSpecialty2]
		,[FLAdditionalSpecialty3]
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
		,[FLLanguage1]
		,[FLLanguage2]
		,[FLLanguage3]
		,[FLLanguage4]
		,[FLShowInDirectory]
		,[TIN]
		,[BusinessName]
		,[BillingAddress1]
		,[BillingAddress2]
		,[BillingCity]
		,[BillingState]
		,[BillingZipCode]
		,[BillingPhoneNumber]
		,[BillingFaxNumber]
		,[ProviderFirstName]
		,[ProviderLastName]
		,[ProviderMiddleName]
		,[ProviderSuffix]
		,[ProviderGender]
		,[ProviderDateofBirth]
		,[ProviderEmail]
		,[ProviderPhoneNumber]
		,[ProviderFaxNumber]
		,[ProviderMedicaidState]
		,[ProviderIsPCP]
		,[ProviderPrimarySpecialtyCode]
		,[ProviderCredentialCode]
		,[ProviderEngagementPriority]
		,[ApplicationCompleteDate]
		,[CredentialingApprovedDate]
		,[ProviderLocationEffectiveDate]
		,[ProviderLocationTerminationDate]
		,[IsProviderPrimaryLocation]
		,[IsProviderPCPLocation]
		,[ProviderLanguage1]
		,[ProviderLanguage2]
		,[ProviderLanguage3]
		,[ProviderLanguage4]
		,[ProviderlicBoardCertID]
		,[ProviderBoardCertificationType1]
		,[ProviderlicBoardCertEffectiveDate]
		,[ProviderlicBoardCertTerminationDate]
		,[FLHandicapAccessible]
		,[FLTerminationReason]
		,[FLCategory]
		,[FLMailingAddress1]
		,[FLMailingAddress2]
		,[FLMailingCity]
		,[FLMailingState]
		,[FLMailingZip]
		,[BillingMailingAddress1]
		,[BillingMailingAddress2]
		,[BillingMailingCity]
		,[BillingMailingState]
		,[BillingMailingZip]
		,[ProviderAdditionalSpecialty1]
		,[ProviderAdditionalSpecialty2]
		,[ProviderAdditionalSpecialty3]
		,[FLEffectiveDate]
		,[FLTerminationDate]
		,[PLPhoneNumber]
		,[PLFaxNumber]
		,[PLPrimarySpecialty]
		,[PLAdditionalSpecialty1]
		,[PLAdditionalSpecialty2]
		,[PLAdditionalSpecialty3]
		,[PLHoursOpenMon]
		,[PLHoursCloseMon]
		,[PLHoursOpenTues]
		,[PLHoursCloseTues]
		,[PLHoursOpenWed]
		,[PLHoursCloseWed]
		,[PLHoursOpenThurs]
		,[PLHoursCloseThurs]
		,[PLHoursOpenFri]
		,[PLHoursCloseFri]
		,[PLHoursOpenSat]
		,[PLHoursCloseSat]
		,[PLHoursOpenSun]
		,[PLHoursCloseSun]
		,[PLMinimumPatientAge]
		,[PLMaximumPatientAge]
		,[PLShowInDirectory]
		,[PLTerminationReason]
		,[PLCategory]
		,[PLAddress1]
		,[PLAddress2]
		,[PLCity]
		,[PLState]
		,[PLZip]
		,[PLMailingAddress1]
		,[PLMailingAddress2]
		,[PLMailingCity]
		,[PLMailingState]
		,[PLMailingZip]
		,[Plesiid1]
		,[PlesiidType1]
		,[PlesiidDesc1]
		,[PlesiidEffectiveDate1]
		,[PlesiidTerminationDate1]
		,[Plesiid2]
		,[PlesiidType2]
		,[PlesiidDesc2]
		,[PlesiidEffectiveDate2]
		,[PlesiidTerminationDate2]
		,[Plesiid3]
		,[PlesiidType3]
		,[PlesiidDesc3]
		,[PlesiidEffectiveDate3]
		,[PlesiidTerminationDate3]
		,[Plesiid4]
		,[PlesiidType4]
		,[PlesiidDesc4]
		,[PlesiidEffectiveDate4]
		,[PlesiidTerminationDate4]
		,[Plesiid5]
		,[PlesiidType5]
		,[PlesiidDesc5]
		,[PlesiidEffectiveDate5]
		,[PlesiidTerminationDate5]
		,[Plesiid6]
		,[PlesiidType6]
		,[PlesiidDesc6]
		,[PlesiidEffectiveDate6]
		,[PlesiidTerminationDate6]
		,[Plesiid7]
		,[PlesiidType7]
		,[PlesiidDesc7]
		,[PlesiidEffectiveDate7]
		,[PlesiidTerminationDate7]
		,[Plesiid8]
		,[PlesiidType8]
		,[PlesiidDesc8]
		,[PlesiidEffectiveDate8]
		,[PlesiidTerminationDate8]
		,[Plesiid9]
		,[PlesiidType9]
		,[PlesiidDesc9]
		,[PlesiidEffectiveDate9]
		,[PlesiidTerminationDate9]
		,[FacilityMedicaidLicenseID1]
		,[FacilityMedicaidLicenseState1]
		,[FacilityMedicaidLicenseEffectiveDate1]
		,[FacilityMedicaidLicenseTerminationDate1]
		,[FacilityStateLicenseID1]
		,[FacilityStateLicenseState1]
		,[FacilityStateLicenseType1]
		,[FacilityStateLicenseEffectiveDate1]
		,[FacilityStateLicenseTerminationDate1]
		,[FacilityBoardcertificationID1]
		,[FacilityBoardCertificationType1]
		,[FacilityBoardCertificationEffectiveDate1]
		,[FacilityBoardCertificationTerminationDate1]
		,[FacilityMemberAssignment]
		,[FLStateReportingProviderTypePrimary]
		,[FLStateReportingProviderSpecialtyPrimary]
		,[FLStateReportingProviderType1]
		,[FLStateReportingProviderSpecialty1]
		,[FLStateReportingProviderType2]
		,[FLStateReportingProviderSpecialty2]
		,[FLStateReportingProviderType3]
		,[FLStateReportingProviderSpecialty3]
		,[FLAdditionalSpecialty4]
		,[FLStateReportingProviderType4]
		,[FLStateReportingProviderSpecialty4]
		,[FLAdditionalSpecialty5]
		,[FLStateReportingProviderType5]
		,[FLStateReportingProviderSpecialty5]
		,[FLAdditionalSpecialty6]
		,[FLStateReportingProviderType6]
		,[FLStateReportingProviderSpecialty6]
		,[FLAdditionalSpecialty7]
		,[FLStateReportingProviderType7]
		,[FLStateReportingProviderSpecialty7]
		,[FLAdditionalSpecialty8]
		,[FLStateReportingProviderType8]
		,[FLStateReportingProviderSpecialty8]
		,[FLAdditionalSpecialty9]
		,[FLStateReportingProviderType9]
		,[FLStateReportingProviderSpecialty9]
		,[FLCCNetworkName]
		,[FLCCSubnetworkName]
		,[FLCCAffiliationID]
		,[FLCCContractID]
		,[FLCCReimbursementRate]
		,[FLCCAssignmentEffectiveDate]
		,[FLCCAssignmentTerminationDate]
		,[ProviderMedicaidLicenseID1]
		,[ProviderMedicaidLicenseState1]
		,[ProviderMedicaidLicenseEffectiveDate1]
		,[ProviderMedicaidLicenseTerminationDate1]
		,[ProviderStateLicenseID1]
		,[ProviderStateLicenseState1]
		,[ProviderStateLicenseType1]
		,[ProviderStateLicenseEffectiveDate1]
		,[ProviderStateLicenseTerminationDate1]
		,[PLStateReportingProviderTypePrimary]
		,[PLStateReportingProviderSpecialtyPrimary]
		,[PLStateReportingProviderType1]
		,[PLStateReportingProviderSpecialty1]
		,[PLStateReportingProviderType2]
		,[PLStateReportingProviderSpecialty2]
		,[PLStateReportingProviderType3]
		,[PLStateReportingProviderSpecialty3]
		,[PLAdditionalSpecialty4]
		,[PLStateReportingProviderType4]
		,[PLStateReportingProviderSpecialty4]
		,[PLAdditionalSpecialty5]
		,[PLStateReportingProviderType5]
		,[PLStateReportingProviderSpecialty5]
		,[PLAdditionalSpecialty6]
		,[PLStateReportingProviderType6]
		,[PLStateReportingProviderSpecialty6]
		,[PLAdditionalSpecialty7]
		,[PLStateReportingProviderType7]
		,[PLStateReportingProviderSpecialty7]
		,[PLAdditionalSpecialty8]
		,[PLStateReportingProviderType8]
		,[PLStateReportingProviderSpecialty8]
		,[PLAdditionalSpecialty9]
		,[PLStateReportingProviderType9]
		,[PLStateReportingProviderSpecialty9]
		,[PLAcceptsNewPatients]
		,[PhysHospRelNPI1]
		,[PhysHospRelEffectiveDate1]
		,[PhysHospRelTerminationDate1]
		,[PhysHospRelType1]
		,[PhysHospRelPrintInDirectory1]
		,[PhysHospRelNPI2]
		,[PhysHospRelEffectiveDate2]
		,[PhysHospRelTerminationDate2]
		,[PhysHospRelType2]
		,[PhysHospRelPrintInDirectory2]
		,[PhysHospRelNPI3]
		,[PhysHospRelEffectiveDate3]
		,[PhysHospRelTerminationDate3]
		,[PhysHospRelType3]
		,[PhysHospRelPrintInDirectory3]
		,[PhysHospRelNPI4]
		,[PhysHospRelEffectiveDate4]
		,[PhysHospRelTerminationDate4]
		,[PhysHospRelType4]
		,[PhysHospRelPrintInDirectory4]
		,[PhysHospRelNPI5]
		,[PhysHospRelEffectiveDate5]
		,[PhysHospRelTerminationDate5]
		,[PhysHospRelType5]
		,[PhysHospRelPrintInDirectory5]
		,[PLCCNetworkName]
		,[PLCCSubnetworkName]
		,[PLCCAffiliationID]
		,[PLCCContractID]
		,[PLCCReimbursementRate]
		,[PLCCAssignmentEffectiveDate]
		,[PLCCAssignmentTerminationDate]
		,[IsPracticeValid]
		,[IsProviderValid]
		,cast(NULL as int) as [Rank]
	into #test_pnm
	from [ProviderNetworkStaging].[dbo].[StgProviderNetworkMaster] with (nolock)
	where [BatchID] = @BatchID

	;with [orderRecord] as (select [PracticeNPI]
								,[ProviderNPI]
								,[StgProviderNetworkMasterKey]
								,[Rank]
								,rank() over (partition by [PracticeNPI]
														,[ProviderNPI]
											  order by [StgProviderNetworkMasterKey]
											 ) as Rank_number 
							from #test_pnm)
	update [orderRecord] set [Rank] = Rank_number

	create table #ProviderNetworkMaster
		([PracticeNPI] varchar(110)
		,[ProviderNPI] varchar(110)
		,[Diff_flag] varchar(1)
		,[PracticeName] varchar(355)									,[test_PracticeName] varchar(355)
		,[PracticeType] varchar(355)									,[test_PracticeType] varchar(355)
		,[FacilityReportingType] varchar(355)							,[test_FacilityReportingType] varchar(355)
		,[FacilityStateReporting] varchar(355)							,[test_FacilityStateReporting] varchar(355)
		,[PracticeSubpartNPI] varchar(110)								,[test_PracticeSubpartNPI] varchar(110)
		,[LocationAddressType] varchar(120)								,[test_LocationAddressType] varchar(120)
		,[LocationAddress1] varchar(200)								,[test_LocationAddress1] varchar(200)
		,[LocationAddress2] varchar(200)								,[test_LocationAddress2] varchar(200)
		,[LocationCity] varchar(150)									,[test_LocationCity] varchar(150)
		,[LocationState] varchar(102)									,[test_LocationState] varchar(102)
		,[LocationZipCode] varchar(110)									,[test_LocationZipCode] varchar(110)
		,[LocationName] varchar(355)									,[test_LocationName] varchar(355)
		,[LocationAcceptsNewPatients] varchar(150)						,[test_LocationAcceptsNewPatients] varchar(150)
		,[LocationPhoneNumber] varchar(120)								,[test_LocationPhoneNumber] varchar(120)
		,[LocationFaxNumber] varchar(120)								,[test_LocationFaxNumber] varchar(120)
		,[LocationType] varchar(1000)									,[test_LocationType] varchar(1000)
		,[LocationSpecialtyCode] varchar(110)							,[test_LocationSpecialtyCode] varchar(110)
		,[FLAdditionalSpecialty1] varchar(110)							,[test_FLAdditionalSpecialty1] varchar(110)
		,[FLAdditionalSpecialty2] varchar(110)							,[test_FLAdditionalSpecialty2] varchar(110)
		,[FLAdditionalSpecialty3] varchar(110)							,[test_FLAdditionalSpecialty3] varchar(110)
		,[PrimaryLocation] varchar(101)									,[test_PrimaryLocation] varchar(101)
		,[IsEHRServiceOffered] varchar(101)								,[test_IsEHRServiceOffered] varchar(101)
		,[WebsiteUrl] varchar(600)										,[test_WebsiteUrl] varchar(600)
		,[Flesiid1] varchar(110)										,[test_Flesiid1] varchar(110)
		,[FlesiidType1] varchar(110)									,[test_FlesiidType1] varchar(110)
		,[FlesiidDesc1] varchar(355)									,[test_FlesiidDesc1] varchar(355)
		,[FlesiidEffectiveDate1] varchar(15)							,[test_FlesiidEffectiveDate1] varchar(15)
		,[FlesiidTerminationDate1] varchar(15)							,[test_FlesiidTerminationDate1] varchar(15)
		,[Flesiid2] varchar(110)										,[test_Flesiid2] varchar(110)
		,[FlesiidType2] varchar(110)									,[test_FlesiidType2] varchar(110)
		,[FlesiidDesc2] varchar(355)									,[test_FlesiidDesc2] varchar(355)
		,[FlesiidEffectiveDate2] varchar(15)							,[test_FlesiidEffectiveDate2] varchar(15)
		,[FlesiidTerminationDate2] varchar(15)							,[test_FlesiidTerminationDate2] varchar(15)
		,[Flesiid3] varchar(110)										,[test_Flesiid3] varchar(110)
		,[FlesiidType3] varchar(110)									,[test_FlesiidType3] varchar(110)
		,[FlesiidDesc3] varchar(355)									,[test_FlesiidDesc3] varchar(355)
		,[FlesiidEffectiveDate3] varchar(15)							,[test_FlesiidEffectiveDate3] varchar(15)
		,[FlesiidTerminationDate3] varchar(15)							,[test_FlesiidTerminationDate3] varchar(15)
		,[Flesiid4] varchar(110)										,[test_Flesiid4] varchar(110)
		,[FlesiidType4] varchar(110)									,[test_FlesiidType4] varchar(110)
		,[FlesiidDesc4] varchar(355)									,[test_FlesiidDesc4] varchar(355)
		,[FlesiidEffectiveDate4] varchar(15)							,[test_FlesiidEffectiveDate4] varchar(15)
		,[FlesiidTerminationDate4] varchar(15)							,[test_FlesiidTerminationDate4] varchar(15)
		,[Flesiid5] varchar(110)										,[test_Flesiid5] varchar(110)
		,[FlesiidType5] varchar(110)									,[test_FlesiidType5] varchar(110)
		,[FlesiidDesc5] varchar(355)									,[test_FlesiidDesc5] varchar(355)
		,[FlesiidEffectiveDate5] varchar(15)							,[test_FlesiidEffectiveDate5] varchar(15)
		,[FlesiidTerminationDate5] varchar(15)							,[test_FlesiidTerminationDate5] varchar(15)
		,[Flesiid6] varchar(110)										,[test_Flesiid6] varchar(110)
		,[FlesiidType6] varchar(110)									,[test_FlesiidType6] varchar(110)
		,[FlesiidDesc6] varchar(355)									,[test_FlesiidDesc6] varchar(355)
		,[FlesiidEffectiveDate6] varchar(15)							,[test_FlesiidEffectiveDate6] varchar(15)
		,[FlesiidTerminationDate6] varchar(15)							,[test_FlesiidTerminationDate6] varchar(15)
		,[Flesiid7] varchar(110)										,[test_Flesiid7] varchar(110)
		,[FlesiidType7] varchar(110)									,[test_FlesiidType7] varchar(110)
		,[FlesiidDesc7] varchar(355)									,[test_FlesiidDesc7] varchar(355)
		,[FlesiidEffectiveDate7] varchar(15)							,[test_FlesiidEffectiveDate7] varchar(15)
		,[FlesiidTerminationDate7] varchar(15)							,[test_FlesiidTerminationDate7] varchar(15)
		,[Flesiid8] varchar(110)										,[test_Flesiid8] varchar(110)
		,[FlesiidType8] varchar(110)									,[test_FlesiidType8] varchar(110)
		,[FlesiidDesc8] varchar(355)									,[test_FlesiidDesc8] varchar(355)
		,[FlesiidEffectiveDate8] varchar(15)							,[test_FlesiidEffectiveDate8] varchar(15)
		,[FlesiidTerminationDate8] varchar(15)							,[test_FlesiidTerminationDate8] varchar(15)
		,[Flesiid9] varchar(110)										,[test_Flesiid9] varchar(110)
		,[FlesiidType9] varchar(110)									,[test_FlesiidType9] varchar(110)
		,[FlesiidDesc9] varchar(355)									,[test_FlesiidDesc9] varchar(355)
		,[FlesiidEffectiveDate9] varchar(15)							,[test_FlesiidEffectiveDate9] varchar(15)
		,[FlesiidTerminationDate9] varchar(15)							,[test_FlesiidTerminationDate9] varchar(15)
		,[PatientMinimumAge] varchar(110)								,[test_PatientMinimumAge] varchar(110)
		,[PatientMaximumAge] varchar(110)								,[test_PatientMaximumAge] varchar(110)
		,[IsWheelchairAccessibleExamRoom] varchar(101)					,[test_IsWheelchairAccessibleExamRoom] varchar(101)
		,[FLHoursOpenMon] varchar(200)									,[test_FLHoursOpenMon] varchar(200)
		,[FLHoursCloseMon] varchar(200)									,[test_FLHoursCloseMon] varchar(200)
		,[FLHoursOpenTues] varchar(200)									,[test_FLHoursOpenTues] varchar(200)
		,[FLHoursCloseTues] varchar(200)								,[test_FLHoursCloseTues] varchar(200)
		,[FLHoursOpenWed] varchar(200)									,[test_FLHoursOpenWed] varchar(200)
		,[FLHoursCloseWed] varchar(200)									,[test_FLHoursCloseWed] varchar(200)
		,[FLHoursOpenThurs] varchar(200)								,[test_FLHoursOpenThurs] varchar(200)
		,[FLHoursCloseThurs] varchar(200)								,[test_FLHoursCloseThurs] varchar(200)
		,[FLHoursOpenFri] varchar(200)									,[test_FLHoursOpenFri] varchar(200)
		,[FLHoursCloseFri] varchar(200)									,[test_FLHoursCloseFri] varchar(200)
		,[FLHoursOpenSat] varchar(200)									,[test_FLHoursOpenSat] varchar(200)
		,[FLHoursCloseSat] varchar(200)									,[test_FLHoursCloseSat] varchar(200)
		,[FLHoursOpenSun] varchar(200)									,[test_FLHoursOpenSun] varchar(200)
		,[FLHoursCloseSun] varchar(200)									,[test_FLHoursCloseSun] varchar(200)
		,[FLLanguage1] varchar(200)										,[test_FLLanguage1] varchar(200)
		,[FLLanguage2] varchar(200)										,[test_FLLanguage2] varchar(200)
		,[FLLanguage3] varchar(200)										,[test_FLLanguage3] varchar(200)
		,[FLLanguage4] varchar(200)										,[test_FLLanguage4] varchar(200)
		,[FLShowInDirectory] varchar(101)								,[test_FLShowInDirectory] varchar(101)
		,[TIN] varchar(109)												,[test_TIN] varchar(109)
		,[BusinessName] varchar(355)									,[test_BusinessName] varchar(355)
		,[BillingAddress1] varchar(200)									,[test_BillingAddress1] varchar(200)
		,[BillingAddress2] varchar(200)									,[test_BillingAddress2] varchar(200)
		,[BillingCity] varchar(150)										,[test_BillingCity] varchar(150)
		,[BillingState] varchar(102)									,[test_BillingState] varchar(102)
		,[BillingZipCode] varchar(110)									,[test_BillingZipCode] varchar(110)
		,[BillingPhoneNumber] varchar(120)								,[test_BillingPhoneNumber] varchar(120)
		,[BillingFaxNumber] varchar(120)								,[test_BillingFaxNumber] varchar(120)
		,[ProviderFirstName] varchar(355)								,[test_ProviderFirstName] varchar(355)
		,[ProviderLastName] varchar(355)								,[test_ProviderLastName] varchar(355)
		,[ProviderMiddleName] varchar(355)								,[test_ProviderMiddleName] varchar(355)
		,[ProviderSuffix] varchar(110)									,[test_ProviderSuffix] varchar(110)
		,[ProviderGender] varchar(125)									,[test_ProviderGender] varchar(125)
		,[ProviderDateofBirth] varchar(110)								,[test_ProviderDateofBirth] varchar(110)
		,[ProviderEmail] varchar(1100)									,[test_ProviderEmail] varchar(1100)
		,[ProviderPhoneNumber] varchar(120)								,[test_ProviderPhoneNumber] varchar(120)
		,[ProviderFaxNumber] varchar(120)								,[test_ProviderFaxNumber] varchar(120)
		,[ProviderMedicaidState] varchar(1100)							,[test_ProviderMedicaidState] varchar(1100)
		,[ProviderIsPCP] varchar(110)									,[test_ProviderIsPCP] varchar(110)
		,[ProviderPrimarySpecialtyCode] varchar(110)					,[test_ProviderPrimarySpecialtyCode] varchar(110)
		,[ProviderCredentialCode] varchar(500)							,[test_ProviderCredentialCode] varchar(500)
		,[ProviderEngagementPriority] varchar(110)						,[test_ProviderEngagementPriority] varchar(110)
		,[ApplicationCompleteDate] varchar(15)							,[test_ApplicationCompleteDate] varchar(15)
		,[CredentialingApprovedDate] varchar(15)						,[test_CredentialingApprovedDate] varchar(15)
		,[ProviderLocationEffectiveDate] varchar(15)					,[test_ProviderLocationEffectiveDate] varchar(15)
		,[ProviderLocationTerminationDate] varchar(15)					,[test_ProviderLocationTerminationDate] varchar(15)
		,[IsProviderPrimaryLocation] varchar(101)						,[test_IsProviderPrimaryLocation] varchar(101)
		,[IsProviderPCPLocation] varchar(101)							,[test_IsProviderPCPLocation] varchar(101)
		,[ProviderLanguage1] varchar(255)								,[test_ProviderLanguage1] varchar(255)
		,[ProviderLanguage2] varchar(255)								,[test_ProviderLanguage2] varchar(255)
		,[ProviderLanguage3] varchar(255)								,[test_ProviderLanguage3] varchar(255)
		,[ProviderLanguage4] varchar(255)								,[test_ProviderLanguage4] varchar(255)
		,[ProviderlicBoardCertID] varchar(355)							,[test_ProviderlicBoardCertID] varchar(355)
		,[ProviderBoardCertificationType1] varchar(355)					,[test_ProviderBoardCertificationType1] varchar(355)
		,[ProviderlicBoardCertEffectiveDate] varchar(15)				,[test_ProviderlicBoardCertEffectiveDate] varchar(15)
		,[ProviderlicBoardCertTerminationDate] varchar(15)				,[test_ProviderlicBoardCertTerminationDate] varchar(15)
		,[FLHandicapAccessible] varchar(101)							,[test_FLHandicapAccessible] varchar(101)
		,[FLTerminationReason] varchar(1100)							,[test_FLTerminationReason] varchar(1100)
		,[FLCategory] varchar(110)										,[test_FLCategory] varchar(110)
		,[FLMailingAddress1] varchar(200)								,[test_FLMailingAddress1] varchar(200)
		,[FLMailingAddress2] varchar(200)								,[test_FLMailingAddress2] varchar(200)
		,[FLMailingCity] varchar(150)									,[test_FLMailingCity] varchar(150)
		,[FLMailingState] varchar(102)									,[test_FLMailingState] varchar(102)
		,[FLMailingZip] varchar(110)									,[test_FLMailingZip] varchar(110)
		,[BillingMailingAddress1] varchar(200)							,[test_BillingMailingAddress1] varchar(200)
		,[BillingMailingAddress2] varchar(200)							,[test_BillingMailingAddress2] varchar(200)
		,[BillingMailingCity] varchar(150)								,[test_BillingMailingCity] varchar(150)
		,[BillingMailingState] varchar(102)								,[test_BillingMailingState] varchar(102)
		,[BillingMailingZip] varchar(110)								,[test_BillingMailingZip] varchar(110)
		,[ProviderAdditionalSpecialty1] varchar(110)					,[test_ProviderAdditionalSpecialty1] varchar(110)
		,[ProviderAdditionalSpecialty2] varchar(110)					,[test_ProviderAdditionalSpecialty2] varchar(110)
		,[ProviderAdditionalSpecialty3] varchar(110)					,[test_ProviderAdditionalSpecialty3] varchar(110)
		,[FLEffectiveDate] varchar(15)									,[test_FLEffectiveDate] varchar(15)
		,[FLTerminationDate] varchar(15)								,[test_FLTerminationDate] varchar(15)
		,[PLPhoneNumber] varchar(120)									,[test_PLPhoneNumber] varchar(120)
		,[PLFaxNumber] varchar(120)										,[test_PLFaxNumber] varchar(120)
		,[PLPrimarySpecialty] varchar(110)								,[test_PLPrimarySpecialty] varchar(110)
		,[PLAdditionalSpecialty1] varchar(110)							,[test_PLAdditionalSpecialty1] varchar(110)
		,[PLAdditionalSpecialty2] varchar(110)							,[test_PLAdditionalSpecialty2] varchar(110)
		,[PLAdditionalSpecialty3] varchar(110)							,[test_PLAdditionalSpecialty3] varchar(110)
		,[PLHoursOpenMon] varchar(200)									,[test_PLHoursOpenMon] varchar(200)
		,[PLHoursCloseMon] varchar(200)									,[test_PLHoursCloseMon] varchar(200)
		,[PLHoursOpenTues] varchar(200)									,[test_PLHoursOpenTues] varchar(200)
		,[PLHoursCloseTues] varchar(200)								,[test_PLHoursCloseTues] varchar(200)
		,[PLHoursOpenWed] varchar(200)									,[test_PLHoursOpenWed] varchar(200)
		,[PLHoursCloseWed] varchar(200)									,[test_PLHoursCloseWed] varchar(200)
		,[PLHoursOpenThurs] varchar(200)								,[test_PLHoursOpenThurs] varchar(200)
		,[PLHoursCloseThurs] varchar(200)								,[test_PLHoursCloseThurs] varchar(200)
		,[PLHoursOpenFri] varchar(200)									,[test_PLHoursOpenFri] varchar(200)
		,[PLHoursCloseFri] varchar(200)									,[test_PLHoursCloseFri] varchar(200)
		,[PLHoursOpenSat] varchar(200)									,[test_PLHoursOpenSat] varchar(200)
		,[PLHoursCloseSat] varchar(200)									,[test_PLHoursCloseSat] varchar(200)
		,[PLHoursOpenSun] varchar(200)									,[test_PLHoursOpenSun] varchar(200)
		,[PLHoursCloseSun] varchar(200)									,[test_PLHoursCloseSun] varchar(200)
		,[PLMinimumPatientAge] varchar(110)								,[test_PLMinimumPatientAge] varchar(110)
		,[PLMaximumPatientAge] varchar(110)								,[test_PLMaximumPatientAge] varchar(110)
		,[PLShowInDirectory] varchar(101)								,[test_PLShowInDirectory] varchar(101)
		,[PLTerminationReason] varchar(1100)							,[test_PLTerminationReason] varchar(1100)
		,[PLCategory] varchar(110)										,[test_PLCategory] varchar(110)
		,[PLAddress1] varchar(200)										,[test_PLAddress1] varchar(200)
		,[PLAddress2] varchar(200)										,[test_PLAddress2] varchar(200)
		,[PLCity] varchar(150)											,[test_PLCity] varchar(150)
		,[PLState] varchar(102)											,[test_PLState] varchar(102)
		,[PLZip] varchar(110)											,[test_PLZip] varchar(110)
		,[PLMailingAddress1] varchar(200)								,[test_PLMailingAddress1] varchar(200)
		,[PLMailingAddress2] varchar(200)								,[test_PLMailingAddress2] varchar(200)
		,[PLMailingCity] varchar(150)									,[test_PLMailingCity] varchar(150)
		,[PLMailingState] varchar(102)									,[test_PLMailingState] varchar(102)
		,[PLMailingZip] varchar(110)									,[test_PLMailingZip] varchar(110)
		,[Plesiid1] varchar(110)										,[test_Plesiid1] varchar(110)
		,[PlesiidType1] varchar(110)									,[test_PlesiidType1] varchar(110)
		,[PlesiidDesc1] varchar(355)									,[test_PlesiidDesc1] varchar(355)
		,[PlesiidEffectiveDate1] varchar(15)							,[test_PlesiidEffectiveDate1] varchar(15)
		,[PlesiidTerminationDate1] varchar(15)							,[test_PlesiidTerminationDate1] varchar(15)
		,[Plesiid2] varchar(110)										,[test_Plesiid2] varchar(110)
		,[PlesiidType2] varchar(110)									,[test_PlesiidType2] varchar(110)
		,[PlesiidDesc2] varchar(355)									,[test_PlesiidDesc2] varchar(355)
		,[PlesiidEffectiveDate2] varchar(15)							,[test_PlesiidEffectiveDate2] varchar(15)
		,[PlesiidTerminationDate2] varchar(15)							,[test_PlesiidTerminationDate2] varchar(15)
		,[Plesiid3] varchar(110)										,[test_Plesiid3] varchar(110)
		,[PlesiidType3] varchar(110)									,[test_PlesiidType3] varchar(110)
		,[PlesiidDesc3] varchar(355)									,[test_PlesiidDesc3] varchar(355)
		,[PlesiidEffectiveDate3] varchar(15)							,[test_PlesiidEffectiveDate3] varchar(15)
		,[PlesiidTerminationDate3] varchar(15)							,[test_PlesiidTerminationDate3] varchar(15)
		,[Plesiid4] varchar(110)										,[test_Plesiid4] varchar(110)
		,[PlesiidType4] varchar(110)									,[test_PlesiidType4] varchar(110)
		,[PlesiidDesc4] varchar(355)									,[test_PlesiidDesc4] varchar(355)
		,[PlesiidEffectiveDate4] varchar(15)							,[test_PlesiidEffectiveDate4] varchar(15)
		,[PlesiidTerminationDate4] varchar(15)							,[test_PlesiidTerminationDate4] varchar(15)
		,[Plesiid5] varchar(110)										,[test_Plesiid5] varchar(110)
		,[PlesiidType5] varchar(110)									,[test_PlesiidType5] varchar(110)
		,[PlesiidDesc5] varchar(355)									,[test_PlesiidDesc5] varchar(355)
		,[PlesiidEffectiveDate5] varchar(15)							,[test_PlesiidEffectiveDate5] varchar(15)
		,[PlesiidTerminationDate5] varchar(15)							,[test_PlesiidTerminationDate5] varchar(15)
		,[Plesiid6] varchar(110)										,[test_Plesiid6] varchar(110)
		,[PlesiidType6] varchar(110)									,[test_PlesiidType6] varchar(110)
		,[PlesiidDesc6] varchar(355)									,[test_PlesiidDesc6] varchar(355)
		,[PlesiidEffectiveDate6] varchar(15)							,[test_PlesiidEffectiveDate6] varchar(15)
		,[PlesiidTerminationDate6] varchar(15)							,[test_PlesiidTerminationDate6] varchar(15)
		,[Plesiid7] varchar(110)										,[test_Plesiid7] varchar(110)
		,[PlesiidType7] varchar(110)									,[test_PlesiidType7] varchar(110)
		,[PlesiidDesc7] varchar(355)									,[test_PlesiidDesc7] varchar(355)
		,[PlesiidEffectiveDate7] varchar(15)							,[test_PlesiidEffectiveDate7] varchar(15)
		,[PlesiidTerminationDate7] varchar(15)							,[test_PlesiidTerminationDate7] varchar(15)
		,[Plesiid8] varchar(110)										,[test_Plesiid8] varchar(110)
		,[PlesiidType8] varchar(110)									,[test_PlesiidType8] varchar(110)
		,[PlesiidDesc8] varchar(355)									,[test_PlesiidDesc8] varchar(355)
		,[PlesiidEffectiveDate8] varchar(15)							,[test_PlesiidEffectiveDate8] varchar(15)
		,[PlesiidTerminationDate8] varchar(15)							,[test_PlesiidTerminationDate8] varchar(15)
		,[Plesiid9] varchar(110)										,[test_Plesiid9] varchar(110)
		,[PlesiidType9] varchar(110)									,[test_PlesiidType9] varchar(110)
		,[PlesiidDesc9] varchar(355)									,[test_PlesiidDesc9] varchar(355)
		,[PlesiidEffectiveDate9] varchar(15)							,[test_PlesiidEffectiveDate9] varchar(15)
		,[PlesiidTerminationDate9] varchar(15)							,[test_PlesiidTerminationDate9] varchar(15)
		,[FacilityMedicaidLicenseID1] varchar(355)						,[test_FacilityMedicaidLicenseID1] varchar(355)
		,[FacilityMedicaidLicenseState1] varchar(102)					,[test_FacilityMedicaidLicenseState1] varchar(102)
		,[FacilityMedicaidLicenseEffectiveDate1] varchar(15)			,[test_FacilityMedicaidLicenseEffectiveDate1] varchar(15)
		,[FacilityMedicaidLicenseTerminationDate1] varchar(15)			,[test_FacilityMedicaidLicenseTerminationDate1] varchar(15)
		,[FacilityStateLicenseID1] varchar(355)							,[test_FacilityStateLicenseID1] varchar(355)
		,[FacilityStateLicenseState1] varchar(102)						,[test_FacilityStateLicenseState1] varchar(102)
		,[FacilityStateLicenseType1] varchar(355)						,[test_FacilityStateLicenseType1] varchar(355)
		,[FacilityStateLicenseEffectiveDate1] varchar(15)				,[test_FacilityStateLicenseEffectiveDate1] varchar(15)
		,[FacilityStateLicenseTerminationDate1] varchar(15)				,[test_FacilityStateLicenseTerminationDate1] varchar(15)
		,[FacilityBoardcertificationID1] varchar(355)					,[test_FacilityBoardcertificationID1] varchar(355)
		,[FacilityBoardCertificationType1] varchar(355)					,[test_FacilityBoardCertificationType1] varchar(355)
		,[FacilityBoardCertificationEffectiveDate1] varchar(15)			,[test_FacilityBoardCertificationEffectiveDate1] varchar(15)
		,[FacilityBoardCertificationTerminationDate1] varchar(15)		,[test_FacilityBoardCertificationTerminationDate1] varchar(15)
		,[FacilityMemberAssignment] varchar(110)						,[test_FacilityMemberAssignment] varchar(110)
		,[FLStateReportingProviderTypePrimary] varchar(110)				,[test_FLStateReportingProviderTypePrimary] varchar(110)
		,[FLStateReportingProviderSpecialtyPrimary] varchar(110)		,[test_FLStateReportingProviderSpecialtyPrimary] varchar(110)
		,[FLStateReportingProviderType1] varchar(110)					,[test_FLStateReportingProviderType1] varchar(110)
		,[FLStateReportingProviderSpecialty1] varchar(110)				,[test_FLStateReportingProviderSpecialty1] varchar(110)
		,[FLStateReportingProviderType2] varchar(110)					,[test_FLStateReportingProviderType2] varchar(110)
		,[FLStateReportingProviderSpecialty2] varchar(110)				,[test_FLStateReportingProviderSpecialty2] varchar(110)
		,[FLStateReportingProviderType3] varchar(110)					,[test_FLStateReportingProviderType3] varchar(110)
		,[FLStateReportingProviderSpecialty3] varchar(110)				,[test_FLStateReportingProviderSpecialty3] varchar(110)
		,[FLAdditionalSpecialty4] varchar(110)							,[test_FLAdditionalSpecialty4] varchar(110)
		,[FLStateReportingProviderType4] varchar(110)					,[test_FLStateReportingProviderType4] varchar(110)
		,[FLStateReportingProviderSpecialty4] varchar(110)				,[test_FLStateReportingProviderSpecialty4] varchar(110)
		,[FLAdditionalSpecialty5] varchar(110)							,[test_FLAdditionalSpecialty5] varchar(110)
		,[FLStateReportingProviderType5] varchar(110)					,[test_FLStateReportingProviderType5] varchar(110)
		,[FLStateReportingProviderSpecialty5] varchar(110)				,[test_FLStateReportingProviderSpecialty5] varchar(110)
		,[FLAdditionalSpecialty6] varchar(110)							,[test_FLAdditionalSpecialty6] varchar(110)
		,[FLStateReportingProviderType6] varchar(110)					,[test_FLStateReportingProviderType6] varchar(110)
		,[FLStateReportingProviderSpecialty6] varchar(110)				,[test_FLStateReportingProviderSpecialty6] varchar(110)
		,[FLAdditionalSpecialty7] varchar(110)							,[test_FLAdditionalSpecialty7] varchar(110)
		,[FLStateReportingProviderType7] varchar(110)					,[test_FLStateReportingProviderType7] varchar(110)
		,[FLStateReportingProviderSpecialty7] varchar(110)				,[test_FLStateReportingProviderSpecialty7] varchar(110)
		,[FLAdditionalSpecialty8] varchar(110)							,[test_FLAdditionalSpecialty8] varchar(110)
		,[FLStateReportingProviderType8] varchar(110)					,[test_FLStateReportingProviderType8] varchar(110)
		,[FLStateReportingProviderSpecialty8] varchar(110)				,[test_FLStateReportingProviderSpecialty8] varchar(110)
		,[FLAdditionalSpecialty9] varchar(110)							,[test_FLAdditionalSpecialty9] varchar(110)
		,[FLStateReportingProviderType9] varchar(110)					,[test_FLStateReportingProviderType9] varchar(110)
		,[FLStateReportingProviderSpecialty9] varchar(110)				,[test_FLStateReportingProviderSpecialty9] varchar(110)
		,[FLCCNetworkName] varchar(355)									,[test_FLCCNetworkName] varchar(355)
		,[FLCCSubnetworkName] varchar(355)								,[test_FLCCSubnetworkName] varchar(355)
		,[FLCCAffiliationID] varchar(355)								,[test_FLCCAffiliationID] varchar(355)
		,[FLCCContractID] varchar(355)									,[test_FLCCContractID] varchar(355)
		,[FLCCReimbursementRate] varchar(355)							,[test_FLCCReimbursementRate] varchar(355)
		,[FLCCAssignmentEffectiveDate] varchar(15)						,[test_FLCCAssignmentEffectiveDate] varchar(15)
		,[FLCCAssignmentTerminationDate] varchar(15)					,[test_FLCCAssignmentTerminationDate] varchar(15)
		,[ProviderMedicaidLicenseID1] varchar(355)						,[test_ProviderMedicaidLicenseID1] varchar(355)
		,[ProviderMedicaidLicenseState1] varchar(102)					,[test_ProviderMedicaidLicenseState1] varchar(102)
		,[ProviderMedicaidLicenseEffectiveDate1] varchar(15)			,[test_ProviderMedicaidLicenseEffectiveDate1] varchar(15)
		,[ProviderMedicaidLicenseTerminationDate1] varchar(15)			,[test_ProviderMedicaidLicenseTerminationDate1] varchar(15)
		,[ProviderStateLicenseID1] varchar(355)							,[test_ProviderStateLicenseID1] varchar(355)
		,[ProviderStateLicenseState1] varchar(102)						,[test_ProviderStateLicenseState1] varchar(102)
		,[ProviderStateLicenseType1] varchar(355)						,[test_ProviderStateLicenseType1] varchar(355)
		,[ProviderStateLicenseEffectiveDate1] varchar(15)				,[test_ProviderStateLicenseEffectiveDate1] varchar(15)
		,[ProviderStateLicenseTerminationDate1] varchar(15)				,[test_ProviderStateLicenseTerminationDate1] varchar(15)
		,[PLStateReportingProviderTypePrimary] varchar(110)				,[test_PLStateReportingProviderTypePrimary] varchar(110)
		,[PLStateReportingProviderSpecialtyPrimary] varchar(110)		,[test_PLStateReportingProviderSpecialtyPrimary] varchar(110)
		,[PLStateReportingProviderType1] varchar(110)					,[test_PLStateReportingProviderType1] varchar(110)
		,[PLStateReportingProviderSpecialty1] varchar(110)				,[test_PLStateReportingProviderSpecialty1] varchar(110)
		,[PLStateReportingProviderType2] varchar(110)					,[test_PLStateReportingProviderType2] varchar(110)
		,[PLStateReportingProviderSpecialty2] varchar(110)				,[test_PLStateReportingProviderSpecialty2] varchar(110)
		,[PLStateReportingProviderType3] varchar(110)					,[test_PLStateReportingProviderType3] varchar(110)
		,[PLStateReportingProviderSpecialty3] varchar(110)				,[test_PLStateReportingProviderSpecialty3] varchar(110)
		,[PLAdditionalSpecialty4] varchar(110)							,[test_PLAdditionalSpecialty4] varchar(110)
		,[PLStateReportingProviderType4] varchar(110)					,[test_PLStateReportingProviderType4] varchar(110)
		,[PLStateReportingProviderSpecialty4] varchar(110)				,[test_PLStateReportingProviderSpecialty4] varchar(110)
		,[PLAdditionalSpecialty5] varchar(110)							,[test_PLAdditionalSpecialty5] varchar(110)
		,[PLStateReportingProviderType5] varchar(110)					,[test_PLStateReportingProviderType5] varchar(110)
		,[PLStateReportingProviderSpecialty5] varchar(110)				,[test_PLStateReportingProviderSpecialty5] varchar(110)
		,[PLAdditionalSpecialty6] varchar(110)							,[test_PLAdditionalSpecialty6] varchar(110)
		,[PLStateReportingProviderType6] varchar(110)					,[test_PLStateReportingProviderType6] varchar(110)
		,[PLStateReportingProviderSpecialty6] varchar(110)				,[test_PLStateReportingProviderSpecialty6] varchar(110)
		,[PLAdditionalSpecialty7] varchar(110)							,[test_PLAdditionalSpecialty7] varchar(110)
		,[PLStateReportingProviderType7] varchar(110)					,[test_PLStateReportingProviderType7] varchar(110)
		,[PLStateReportingProviderSpecialty7] varchar(110)				,[test_PLStateReportingProviderSpecialty7] varchar(110)
		,[PLAdditionalSpecialty8] varchar(110)							,[test_PLAdditionalSpecialty8] varchar(110)
		,[PLStateReportingProviderType8] varchar(110)					,[test_PLStateReportingProviderType8] varchar(110)
		,[PLStateReportingProviderSpecialty8] varchar(110)				,[test_PLStateReportingProviderSpecialty8] varchar(110)
		,[PLAdditionalSpecialty9] varchar(110)							,[test_PLAdditionalSpecialty9] varchar(110)
		,[PLStateReportingProviderType9] varchar(110)					,[test_PLStateReportingProviderType9] varchar(110)
		,[PLStateReportingProviderSpecialty9] varchar(110)				,[test_PLStateReportingProviderSpecialty9] varchar(110)
		,[PLAcceptsNewPatients] varchar(150)							,[test_PLAcceptsNewPatients] varchar(150)
		,[PhysHospRelNPI1] varchar(110)									,[test_PhysHospRelNPI1] varchar(110)
		,[PhysHospRelEffectiveDate1] varchar(15)						,[test_PhysHospRelEffectiveDate1] varchar(15)
		,[PhysHospRelTerminationDate1] varchar(15)						,[test_PhysHospRelTerminationDate1] varchar(15)
		,[PhysHospRelType1] varchar(355)								,[test_PhysHospRelType1] varchar(355)
		,[PhysHospRelPrintInDirectory1] varchar(101)					,[test_PhysHospRelPrintInDirectory1] varchar(101)
		,[PhysHospRelNPI2] varchar(110)									,[test_PhysHospRelNPI2] varchar(110)
		,[PhysHospRelEffectiveDate2] varchar(15)						,[test_PhysHospRelEffectiveDate2] varchar(15)
		,[PhysHospRelTerminationDate2] varchar(15)						,[test_PhysHospRelTerminationDate2] varchar(15)
		,[PhysHospRelType2] varchar(355)								,[test_PhysHospRelType2] varchar(355)
		,[PhysHospRelPrintInDirectory2] varchar(101)					,[test_PhysHospRelPrintInDirectory2] varchar(101)
		,[PhysHospRelNPI3] varchar(110)									,[test_PhysHospRelNPI3] varchar(110)
		,[PhysHospRelEffectiveDate3] varchar(15)						,[test_PhysHospRelEffectiveDate3] varchar(15)
		,[PhysHospRelTerminationDate3] varchar(15)						,[test_PhysHospRelTerminationDate3] varchar(15)
		,[PhysHospRelType3] varchar(355)								,[test_PhysHospRelType3] varchar(355)
		,[PhysHospRelPrintInDirectory3] varchar(101)					,[test_PhysHospRelPrintInDirectory3] varchar(101)
		,[PhysHospRelNPI4] varchar(110)									,[test_PhysHospRelNPI4] varchar(110)
		,[PhysHospRelEffectiveDate4] varchar(15)						,[test_PhysHospRelEffectiveDate4] varchar(15)
		,[PhysHospRelTerminationDate4] varchar(15)						,[test_PhysHospRelTerminationDate4] varchar(15)
		,[PhysHospRelType4] varchar(355)								,[test_PhysHospRelType4] varchar(355)
		,[PhysHospRelPrintInDirectory4] varchar(101)					,[test_PhysHospRelPrintInDirectory4] varchar(101)
		,[PhysHospRelNPI5] varchar(110)									,[test_PhysHospRelNPI5] varchar(110)
		,[PhysHospRelEffectiveDate5] varchar(15)						,[test_PhysHospRelEffectiveDate5] varchar(15)
		,[PhysHospRelTerminationDate5] varchar(15)						,[test_PhysHospRelTerminationDate5] varchar(15)
		,[PhysHospRelType5] varchar(355)								,[test_PhysHospRelType5] varchar(355)
		,[PhysHospRelPrintInDirectory5] varchar(101)					,[test_PhysHospRelPrintInDirectory5] varchar(101)
		,[PLCCNetworkName] varchar(355)									,[test_PLCCNetworkName] varchar(355)
		,[PLCCSubnetworkName] varchar(355)								,[test_PLCCSubnetworkName] varchar(355)
		,[PLCCAffiliationID] varchar(355)								,[test_PLCCAffiliationID] varchar(355)
		,[PLCCContractID] varchar(355)									,[test_PLCCContractID] varchar(355)
		,[PLCCReimbursementRate] varchar(355)							,[test_PLCCReimbursementRate] varchar(355)
		,[PLCCAssignmentEffectiveDate] varchar(15)						,[test_PLCCAssignmentEffectiveDate] varchar(15)
		,[PLCCAssignmentTerminationDate] varchar(15)					,[test_PLCCAssignmentTerminationDate] varchar(15)
		,[IsPracticeValid] varchar(1)									,[test_IsPracticeValid] varchar(1)
		,[IsProviderValid] varchar(1)									,[test_IsProviderValid] varchar(1) 
		)

	insert into #ProviderNetworkMaster
		([PracticeNPI]
		,[ProviderNPI]
		,[PracticeName]									,[test_PracticeName]
		,[PracticeType]									,[test_PracticeType]
		,[FacilityReportingType]						,[test_FacilityReportingType]
		,[FacilityStateReporting]						,[test_FacilityStateReporting]
		,[PracticeSubpartNPI]							,[test_PracticeSubpartNPI]
		,[LocationAddressType]							,[test_LocationAddressType]
		,[LocationAddress1]								,[test_LocationAddress1]
		,[LocationAddress2]								,[test_LocationAddress2]
		,[LocationCity]									,[test_LocationCity]
		,[LocationState]								,[test_LocationState]
		,[LocationZipCode]								,[test_LocationZipCode]
		,[LocationName]									,[test_LocationName]
		,[LocationAcceptsNewPatients]					,[test_LocationAcceptsNewPatients]
		,[LocationPhoneNumber]							,[test_LocationPhoneNumber]
		,[LocationFaxNumber]							,[test_LocationFaxNumber]
		,[LocationType]									,[test_LocationType]
		,[LocationSpecialtyCode]						,[test_LocationSpecialtyCode]
		,[FLAdditionalSpecialty1]						,[test_FLAdditionalSpecialty1]
		,[FLAdditionalSpecialty2]						,[test_FLAdditionalSpecialty2]
		,[FLAdditionalSpecialty3]						,[test_FLAdditionalSpecialty3]
		,[PrimaryLocation]								,[test_PrimaryLocation]
		,[IsEHRServiceOffered]							,[test_IsEHRServiceOffered]
		,[WebsiteUrl]									,[test_WebsiteUrl]
		,[Flesiid1]										,[test_Flesiid1]
		,[FlesiidType1]									,[test_FlesiidType1]
		,[FlesiidDesc1]									,[test_FlesiidDesc1]
		,[FlesiidEffectiveDate1]						,[test_FlesiidEffectiveDate1]
		,[FlesiidTerminationDate1]						,[test_FlesiidTerminationDate1]
		,[Flesiid2]										,[test_Flesiid2]
		,[FlesiidType2]									,[test_FlesiidType2]
		,[FlesiidDesc2]									,[test_FlesiidDesc2]
		,[FlesiidEffectiveDate2]						,[test_FlesiidEffectiveDate2]
		,[FlesiidTerminationDate2]						,[test_FlesiidTerminationDate2]
		,[Flesiid3]										,[test_Flesiid3]
		,[FlesiidType3]									,[test_FlesiidType3]
		,[FlesiidDesc3]									,[test_FlesiidDesc3]
		,[FlesiidEffectiveDate3]						,[test_FlesiidEffectiveDate3]
		,[FlesiidTerminationDate3]						,[test_FlesiidTerminationDate3]
		,[Flesiid4]										,[test_Flesiid4]
		,[FlesiidType4]									,[test_FlesiidType4]
		,[FlesiidDesc4]									,[test_FlesiidDesc4]
		,[FlesiidEffectiveDate4]						,[test_FlesiidEffectiveDate4]
		,[FlesiidTerminationDate4]						,[test_FlesiidTerminationDate4]
		,[Flesiid5]										,[test_Flesiid5]
		,[FlesiidType5]									,[test_FlesiidType5]
		,[FlesiidDesc5]									,[test_FlesiidDesc5]
		,[FlesiidEffectiveDate5]						,[test_FlesiidEffectiveDate5]
		,[FlesiidTerminationDate5]						,[test_FlesiidTerminationDate5]
		,[Flesiid6]										,[test_Flesiid6]
		,[FlesiidType6]									,[test_FlesiidType6]
		,[FlesiidDesc6]									,[test_FlesiidDesc6]
		,[FlesiidEffectiveDate6]						,[test_FlesiidEffectiveDate6]
		,[FlesiidTerminationDate6]						,[test_FlesiidTerminationDate6]
		,[Flesiid7]										,[test_Flesiid7]
		,[FlesiidType7]									,[test_FlesiidType7]
		,[FlesiidDesc7]									,[test_FlesiidDesc7]
		,[FlesiidEffectiveDate7]						,[test_FlesiidEffectiveDate7]
		,[FlesiidTerminationDate7]						,[test_FlesiidTerminationDate7]
		,[Flesiid8]										,[test_Flesiid8]
		,[FlesiidType8]									,[test_FlesiidType8]
		,[FlesiidDesc8]									,[test_FlesiidDesc8]
		,[FlesiidEffectiveDate8]						,[test_FlesiidEffectiveDate8]
		,[FlesiidTerminationDate8]						,[test_FlesiidTerminationDate8]
		,[Flesiid9]										,[test_Flesiid9]
		,[FlesiidType9]									,[test_FlesiidType9]
		,[FlesiidDesc9]									,[test_FlesiidDesc9]
		,[FlesiidEffectiveDate9]						,[test_FlesiidEffectiveDate9]
		,[FlesiidTerminationDate9]						,[test_FlesiidTerminationDate9]
		,[PatientMinimumAge]							,[test_PatientMinimumAge]
		,[PatientMaximumAge]							,[test_PatientMaximumAge]
		,[IsWheelchairAccessibleExamRoom]				,[test_IsWheelchairAccessibleExamRoom]
		,[FLHoursOpenMon]								,[test_FLHoursOpenMon]
		,[FLHoursCloseMon]								,[test_FLHoursCloseMon]
		,[FLHoursOpenTues]								,[test_FLHoursOpenTues]
		,[FLHoursCloseTues]								,[test_FLHoursCloseTues]
		,[FLHoursOpenWed]								,[test_FLHoursOpenWed]
		,[FLHoursCloseWed]								,[test_FLHoursCloseWed]
		,[FLHoursOpenThurs]								,[test_FLHoursOpenThurs]
		,[FLHoursCloseThurs]							,[test_FLHoursCloseThurs]
		,[FLHoursOpenFri]								,[test_FLHoursOpenFri]
		,[FLHoursCloseFri]								,[test_FLHoursCloseFri]
		,[FLHoursOpenSat]								,[test_FLHoursOpenSat]
		,[FLHoursCloseSat]								,[test_FLHoursCloseSat]
		,[FLHoursOpenSun]								,[test_FLHoursOpenSun]
		,[FLHoursCloseSun]								,[test_FLHoursCloseSun]
		,[FLLanguage1]									,[test_FLLanguage1]
		,[FLLanguage2]									,[test_FLLanguage2]
		,[FLLanguage3]									,[test_FLLanguage3]
		,[FLLanguage4]									,[test_FLLanguage4]
		,[FLShowInDirectory]							,[test_FLShowInDirectory]
		,[TIN]											,[test_TIN]
		,[BusinessName]									,[test_BusinessName]
		,[BillingAddress1]								,[test_BillingAddress1]
		,[BillingAddress2]								,[test_BillingAddress2]
		,[BillingCity]									,[test_BillingCity]
		,[BillingState]									,[test_BillingState]
		,[BillingZipCode]								,[test_BillingZipCode]
		,[BillingPhoneNumber]							,[test_BillingPhoneNumber]
		,[BillingFaxNumber]								,[test_BillingFaxNumber]
		,[ProviderFirstName]							,[test_ProviderFirstName]
		,[ProviderLastName]								,[test_ProviderLastName]
		,[ProviderMiddleName]							,[test_ProviderMiddleName]
		,[ProviderSuffix]								,[test_ProviderSuffix]
		,[ProviderGender]								,[test_ProviderGender]
		,[ProviderDateofBirth]							,[test_ProviderDateofBirth]
		,[ProviderEmail]								,[test_ProviderEmail]
		,[ProviderPhoneNumber]							,[test_ProviderPhoneNumber]
		,[ProviderFaxNumber]							,[test_ProviderFaxNumber]
		,[ProviderMedicaidState]						,[test_ProviderMedicaidState]
		,[ProviderIsPCP]								,[test_ProviderIsPCP]
		,[ProviderPrimarySpecialtyCode]					,[test_ProviderPrimarySpecialtyCode]
		,[ProviderCredentialCode]						,[test_ProviderCredentialCode]
		,[ProviderEngagementPriority]					,[test_ProviderEngagementPriority]
		,[ApplicationCompleteDate]						,[test_ApplicationCompleteDate]
		,[CredentialingApprovedDate]					,[test_CredentialingApprovedDate]
		,[ProviderLocationEffectiveDate]				,[test_ProviderLocationEffectiveDate]
		,[ProviderLocationTerminationDate]				,[test_ProviderLocationTerminationDate]
		,[IsProviderPrimaryLocation]					,[test_IsProviderPrimaryLocation]
		,[IsProviderPCPLocation]						,[test_IsProviderPCPLocation]
		,[ProviderLanguage1]							,[test_ProviderLanguage1]
		,[ProviderLanguage2]							,[test_ProviderLanguage2]
		,[ProviderLanguage3]							,[test_ProviderLanguage3]
		,[ProviderLanguage4]							,[test_ProviderLanguage4]
		,[ProviderlicBoardCertID]						,[test_ProviderlicBoardCertID]
		,[ProviderBoardCertificationType1]				,[test_ProviderBoardCertificationType1]
		,[ProviderlicBoardCertEffectiveDate]			,[test_ProviderlicBoardCertEffectiveDate]
		,[ProviderlicBoardCertTerminationDate]			,[test_ProviderlicBoardCertTerminationDate]
		,[FLHandicapAccessible]							,[test_FLHandicapAccessible]
		,[FLTerminationReason]							,[test_FLTerminationReason]
		,[FLCategory]									,[test_FLCategory]
		,[FLMailingAddress1]							,[test_FLMailingAddress1]
		,[FLMailingAddress2]							,[test_FLMailingAddress2]
		,[FLMailingCity]								,[test_FLMailingCity]
		,[FLMailingState]								,[test_FLMailingState]
		,[FLMailingZip]									,[test_FLMailingZip]
		,[BillingMailingAddress1]						,[test_BillingMailingAddress1]
		,[BillingMailingAddress2]						,[test_BillingMailingAddress2]
		,[BillingMailingCity]							,[test_BillingMailingCity]
		,[BillingMailingState]							,[test_BillingMailingState]
		,[BillingMailingZip]							,[test_BillingMailingZip]
		,[ProviderAdditionalSpecialty1]					,[test_ProviderAdditionalSpecialty1]
		,[ProviderAdditionalSpecialty2]					,[test_ProviderAdditionalSpecialty2]
		,[ProviderAdditionalSpecialty3]					,[test_ProviderAdditionalSpecialty3]
		,[FLEffectiveDate]								,[test_FLEffectiveDate]
		,[FLTerminationDate]							,[test_FLTerminationDate]
		,[PLPhoneNumber]								,[test_PLPhoneNumber]
		,[PLFaxNumber]									,[test_PLFaxNumber]
		,[PLPrimarySpecialty]							,[test_PLPrimarySpecialty]
		,[PLAdditionalSpecialty1]						,[test_PLAdditionalSpecialty1]
		,[PLAdditionalSpecialty2]						,[test_PLAdditionalSpecialty2]
		,[PLAdditionalSpecialty3]						,[test_PLAdditionalSpecialty3]
		,[PLHoursOpenMon]								,[test_PLHoursOpenMon]
		,[PLHoursCloseMon]								,[test_PLHoursCloseMon]
		,[PLHoursOpenTues]								,[test_PLHoursOpenTues]
		,[PLHoursCloseTues]								,[test_PLHoursCloseTues]
		,[PLHoursOpenWed]								,[test_PLHoursOpenWed]
		,[PLHoursCloseWed]								,[test_PLHoursCloseWed]
		,[PLHoursOpenThurs]								,[test_PLHoursOpenThurs]
		,[PLHoursCloseThurs]							,[test_PLHoursCloseThurs]
		,[PLHoursOpenFri]								,[test_PLHoursOpenFri]
		,[PLHoursCloseFri]								,[test_PLHoursCloseFri]
		,[PLHoursOpenSat]								,[test_PLHoursOpenSat]
		,[PLHoursCloseSat]								,[test_PLHoursCloseSat]
		,[PLHoursOpenSun]								,[test_PLHoursOpenSun]
		,[PLHoursCloseSun]								,[test_PLHoursCloseSun]
		,[PLMinimumPatientAge]							,[test_PLMinimumPatientAge]
		,[PLMaximumPatientAge]							,[test_PLMaximumPatientAge]
		,[PLShowInDirectory]							,[test_PLShowInDirectory]
		,[PLTerminationReason]							,[test_PLTerminationReason]
		,[PLCategory]									,[test_PLCategory]
		,[PLAddress1]									,[test_PLAddress1]
		,[PLAddress2]									,[test_PLAddress2]
		,[PLCity]										,[test_PLCity]
		,[PLState]										,[test_PLState]
		,[PLZip]										,[test_PLZip]
		,[PLMailingAddress1]							,[test_PLMailingAddress1]
		,[PLMailingAddress2]							,[test_PLMailingAddress2]
		,[PLMailingCity]								,[test_PLMailingCity]
		,[PLMailingState]								,[test_PLMailingState]
		,[PLMailingZip]									,[test_PLMailingZip]
		,[Plesiid1]										,[test_Plesiid1]
		,[PlesiidType1]									,[test_PlesiidType1]
		,[PlesiidDesc1]									,[test_PlesiidDesc1]
		,[PlesiidEffectiveDate1]						,[test_PlesiidEffectiveDate1]
		,[PlesiidTerminationDate1]						,[test_PlesiidTerminationDate1]
		,[Plesiid2]										,[test_Plesiid2]
		,[PlesiidType2]									,[test_PlesiidType2]
		,[PlesiidDesc2]									,[test_PlesiidDesc2]
		,[PlesiidEffectiveDate2]						,[test_PlesiidEffectiveDate2]
		,[PlesiidTerminationDate2]						,[test_PlesiidTerminationDate2]
		,[Plesiid3]										,[test_Plesiid3]
		,[PlesiidType3]									,[test_PlesiidType3]
		,[PlesiidDesc3]									,[test_PlesiidDesc3]
		,[PlesiidEffectiveDate3]						,[test_PlesiidEffectiveDate3]
		,[PlesiidTerminationDate3]						,[test_PlesiidTerminationDate3]
		,[Plesiid4]										,[test_Plesiid4]
		,[PlesiidType4]									,[test_PlesiidType4]
		,[PlesiidDesc4]									,[test_PlesiidDesc4]
		,[PlesiidEffectiveDate4]						,[test_PlesiidEffectiveDate4]
		,[PlesiidTerminationDate4]						,[test_PlesiidTerminationDate4]
		,[Plesiid5]										,[test_Plesiid5]
		,[PlesiidType5]									,[test_PlesiidType5]
		,[PlesiidDesc5]									,[test_PlesiidDesc5]
		,[PlesiidEffectiveDate5]						,[test_PlesiidEffectiveDate5]
		,[PlesiidTerminationDate5]						,[test_PlesiidTerminationDate5]
		,[Plesiid6]										,[test_Plesiid6]
		,[PlesiidType6]									,[test_PlesiidType6]
		,[PlesiidDesc6]									,[test_PlesiidDesc6]
		,[PlesiidEffectiveDate6]						,[test_PlesiidEffectiveDate6]
		,[PlesiidTerminationDate6]						,[test_PlesiidTerminationDate6]
		,[Plesiid7]										,[test_Plesiid7]
		,[PlesiidType7]									,[test_PlesiidType7]
		,[PlesiidDesc7]									,[test_PlesiidDesc7]
		,[PlesiidEffectiveDate7]						,[test_PlesiidEffectiveDate7]
		,[PlesiidTerminationDate7]						,[test_PlesiidTerminationDate7]
		,[Plesiid8]										,[test_Plesiid8]
		,[PlesiidType8]									,[test_PlesiidType8]
		,[PlesiidDesc8]									,[test_PlesiidDesc8]
		,[PlesiidEffectiveDate8]						,[test_PlesiidEffectiveDate8]
		,[PlesiidTerminationDate8]						,[test_PlesiidTerminationDate8]
		,[Plesiid9]										,[test_Plesiid9]
		,[PlesiidType9]									,[test_PlesiidType9]
		,[PlesiidDesc9]									,[test_PlesiidDesc9]
		,[PlesiidEffectiveDate9]						,[test_PlesiidEffectiveDate9]
		,[PlesiidTerminationDate9]						,[test_PlesiidTerminationDate9]
		,[FacilityMedicaidLicenseID1]					,[test_FacilityMedicaidLicenseID1]
		,[FacilityMedicaidLicenseState1]				,[test_FacilityMedicaidLicenseState1]
		,[FacilityMedicaidLicenseEffectiveDate1]		,[test_FacilityMedicaidLicenseEffectiveDate1]
		,[FacilityMedicaidLicenseTerminationDate1]		,[test_FacilityMedicaidLicenseTerminationDate1]
		,[FacilityStateLicenseID1]						,[test_FacilityStateLicenseID1]
		,[FacilityStateLicenseState1]					,[test_FacilityStateLicenseState1]
		,[FacilityStateLicenseType1]					,[test_FacilityStateLicenseType1]
		,[FacilityStateLicenseEffectiveDate1]			,[test_FacilityStateLicenseEffectiveDate1]
		,[FacilityStateLicenseTerminationDate1]			,[test_FacilityStateLicenseTerminationDate1]
		,[FacilityBoardcertificationID1]				,[test_FacilityBoardcertificationID1]
		,[FacilityBoardCertificationType1]				,[test_FacilityBoardCertificationType1]
		,[FacilityBoardCertificationEffectiveDate1]		,[test_FacilityBoardCertificationEffectiveDate1]
		,[FacilityBoardCertificationTerminationDate1]	,[test_FacilityBoardCertificationTerminationDate1]
		,[FacilityMemberAssignment]						,[test_FacilityMemberAssignment]
		,[FLStateReportingProviderTypePrimary]			,[test_FLStateReportingProviderTypePrimary]
		,[FLStateReportingProviderSpecialtyPrimary]		,[test_FLStateReportingProviderSpecialtyPrimary]
		,[FLStateReportingProviderType1]				,[test_FLStateReportingProviderType1]
		,[FLStateReportingProviderSpecialty1]			,[test_FLStateReportingProviderSpecialty1]
		,[FLStateReportingProviderType2]				,[test_FLStateReportingProviderType2]
		,[FLStateReportingProviderSpecialty2]			,[test_FLStateReportingProviderSpecialty2]
		,[FLStateReportingProviderType3]				,[test_FLStateReportingProviderType3]
		,[FLStateReportingProviderSpecialty3]			,[test_FLStateReportingProviderSpecialty3]
		,[FLAdditionalSpecialty4]						,[test_FLAdditionalSpecialty4]
		,[FLStateReportingProviderType4]				,[test_FLStateReportingProviderType4]
		,[FLStateReportingProviderSpecialty4]			,[test_FLStateReportingProviderSpecialty4]
		,[FLAdditionalSpecialty5]						,[test_FLAdditionalSpecialty5]
		,[FLStateReportingProviderType5]				,[test_FLStateReportingProviderType5]
		,[FLStateReportingProviderSpecialty5]			,[test_FLStateReportingProviderSpecialty5]
		,[FLAdditionalSpecialty6]						,[test_FLAdditionalSpecialty6]
		,[FLStateReportingProviderType6]				,[test_FLStateReportingProviderType6]
		,[FLStateReportingProviderSpecialty6]			,[test_FLStateReportingProviderSpecialty6]
		,[FLAdditionalSpecialty7]						,[test_FLAdditionalSpecialty7]
		,[FLStateReportingProviderType7]				,[test_FLStateReportingProviderType7]
		,[FLStateReportingProviderSpecialty7]			,[test_FLStateReportingProviderSpecialty7]
		,[FLAdditionalSpecialty8]						,[test_FLAdditionalSpecialty8]
		,[FLStateReportingProviderType8]				,[test_FLStateReportingProviderType8]
		,[FLStateReportingProviderSpecialty8]			,[test_FLStateReportingProviderSpecialty8]
		,[FLAdditionalSpecialty9]						,[test_FLAdditionalSpecialty9]
		,[FLStateReportingProviderType9]				,[test_FLStateReportingProviderType9]
		,[FLStateReportingProviderSpecialty9]			,[test_FLStateReportingProviderSpecialty9]
		,[FLCCNetworkName]								,[test_FLCCNetworkName]
		,[FLCCSubnetworkName]							,[test_FLCCSubnetworkName]
		,[FLCCAffiliationID]							,[test_FLCCAffiliationID]
		,[FLCCContractID]								,[test_FLCCContractID]
		,[FLCCReimbursementRate]						,[test_FLCCReimbursementRate]
		,[FLCCAssignmentEffectiveDate]					,[test_FLCCAssignmentEffectiveDate]
		,[FLCCAssignmentTerminationDate]				,[test_FLCCAssignmentTerminationDate]
		,[ProviderMedicaidLicenseID1]					,[test_ProviderMedicaidLicenseID1]
		,[ProviderMedicaidLicenseState1]				,[test_ProviderMedicaidLicenseState1]
		,[ProviderMedicaidLicenseEffectiveDate1]		,[test_ProviderMedicaidLicenseEffectiveDate1]
		,[ProviderMedicaidLicenseTerminationDate1]		,[test_ProviderMedicaidLicenseTerminationDate1]
		,[ProviderStateLicenseID1]						,[test_ProviderStateLicenseID1]
		,[ProviderStateLicenseState1]					,[test_ProviderStateLicenseState1]
		,[ProviderStateLicenseType1]					,[test_ProviderStateLicenseType1]
		,[ProviderStateLicenseEffectiveDate1]			,[test_ProviderStateLicenseEffectiveDate1]
		,[ProviderStateLicenseTerminationDate1]			,[test_ProviderStateLicenseTerminationDate1]
		,[PLStateReportingProviderTypePrimary]			,[test_PLStateReportingProviderTypePrimary]
		,[PLStateReportingProviderSpecialtyPrimary]		,[test_PLStateReportingProviderSpecialtyPrimary]
		,[PLStateReportingProviderType1]				,[test_PLStateReportingProviderType1]
		,[PLStateReportingProviderSpecialty1]			,[test_PLStateReportingProviderSpecialty1]
		,[PLStateReportingProviderType2]				,[test_PLStateReportingProviderType2]
		,[PLStateReportingProviderSpecialty2]			,[test_PLStateReportingProviderSpecialty2]
		,[PLStateReportingProviderType3]				,[test_PLStateReportingProviderType3]
		,[PLStateReportingProviderSpecialty3]			,[test_PLStateReportingProviderSpecialty3]
		,[PLAdditionalSpecialty4]						,[test_PLAdditionalSpecialty4]
		,[PLStateReportingProviderType4]				,[test_PLStateReportingProviderType4]
		,[PLStateReportingProviderSpecialty4]			,[test_PLStateReportingProviderSpecialty4]
		,[PLAdditionalSpecialty5]						,[test_PLAdditionalSpecialty5]
		,[PLStateReportingProviderType5]				,[test_PLStateReportingProviderType5]
		,[PLStateReportingProviderSpecialty5]			,[test_PLStateReportingProviderSpecialty5]
		,[PLAdditionalSpecialty6]						,[test_PLAdditionalSpecialty6]
		,[PLStateReportingProviderType6]				,[test_PLStateReportingProviderType6]
		,[PLStateReportingProviderSpecialty6]			,[test_PLStateReportingProviderSpecialty6]
		,[PLAdditionalSpecialty7]						,[test_PLAdditionalSpecialty7]
		,[PLStateReportingProviderType7]				,[test_PLStateReportingProviderType7]
		,[PLStateReportingProviderSpecialty7]			,[test_PLStateReportingProviderSpecialty7]
		,[PLAdditionalSpecialty8]						,[test_PLAdditionalSpecialty8]
		,[PLStateReportingProviderType8]				,[test_PLStateReportingProviderType8]
		,[PLStateReportingProviderSpecialty8]			,[test_PLStateReportingProviderSpecialty8]
		,[PLAdditionalSpecialty9]						,[test_PLAdditionalSpecialty9]
		,[PLStateReportingProviderType9]				,[test_PLStateReportingProviderType9]
		,[PLStateReportingProviderSpecialty9]			,[test_PLStateReportingProviderSpecialty9]
		,[PLAcceptsNewPatients]							,[test_PLAcceptsNewPatients]
		,[PhysHospRelNPI1]								,[test_PhysHospRelNPI1]
		,[PhysHospRelEffectiveDate1]					,[test_PhysHospRelEffectiveDate1]
		,[PhysHospRelTerminationDate1]					,[test_PhysHospRelTerminationDate1]
		,[PhysHospRelType1]								,[test_PhysHospRelType1]
		,[PhysHospRelPrintInDirectory1]					,[test_PhysHospRelPrintInDirectory1]
		,[PhysHospRelNPI2]								,[test_PhysHospRelNPI2]
		,[PhysHospRelEffectiveDate2]					,[test_PhysHospRelEffectiveDate2]
		,[PhysHospRelTerminationDate2]					,[test_PhysHospRelTerminationDate2]
		,[PhysHospRelType2]								,[test_PhysHospRelType2]
		,[PhysHospRelPrintInDirectory2]					,[test_PhysHospRelPrintInDirectory2]
		,[PhysHospRelNPI3]								,[test_PhysHospRelNPI3]
		,[PhysHospRelEffectiveDate3]					,[test_PhysHospRelEffectiveDate3]
		,[PhysHospRelTerminationDate3]					,[test_PhysHospRelTerminationDate3]
		,[PhysHospRelType3]								,[test_PhysHospRelType3]
		,[PhysHospRelPrintInDirectory3]					,[test_PhysHospRelPrintInDirectory3]
		,[PhysHospRelNPI4]								,[test_PhysHospRelNPI4]
		,[PhysHospRelEffectiveDate4]					,[test_PhysHospRelEffectiveDate4]
		,[PhysHospRelTerminationDate4]					,[test_PhysHospRelTerminationDate4]
		,[PhysHospRelType4]								,[test_PhysHospRelType4]
		,[PhysHospRelPrintInDirectory4]					,[test_PhysHospRelPrintInDirectory4]
		,[PhysHospRelNPI5]								,[test_PhysHospRelNPI5]
		,[PhysHospRelEffectiveDate5]					,[test_PhysHospRelEffectiveDate5]
		,[PhysHospRelTerminationDate5]					,[test_PhysHospRelTerminationDate5]
		,[PhysHospRelType5]								,[test_PhysHospRelType5]
		,[PhysHospRelPrintInDirectory5]					,[test_PhysHospRelPrintInDirectory5]
		,[PLCCNetworkName]								,[test_PLCCNetworkName]
		,[PLCCSubnetworkName]							,[test_PLCCSubnetworkName]
		,[PLCCAffiliationID]							,[test_PLCCAffiliationID]
		,[PLCCContractID]								,[test_PLCCContractID]
		,[PLCCReimbursementRate]						,[test_PLCCReimbursementRate]
		,[PLCCAssignmentEffectiveDate]					,[test_PLCCAssignmentEffectiveDate]
		,[PLCCAssignmentTerminationDate]				,[test_PLCCAssignmentTerminationDate]
		,[IsPracticeValid]								,[test_IsPracticeValid]
		,[IsProviderValid]								,[test_IsProviderValid]    
		)
		select t.[PracticeNPI]
			,t.[ProviderNPI]
			,e.[PracticeName]										,t.[PracticeName]
			,e.[PracticeType]										,t.[PracticeType]
			,e.[FacilityReportingType]								,t.[FacilityReportingType]
			,e.[FacilityStateReporting]								,t.[FacilityStateReporting]
			,e.[PracticeSubpartNPI]									,t.[PracticeSubpartNPI]
			,e.[LocationAddressType]								,t.[LocationAddressType]
			,e.[LocationAddress1]									,t.[LocationAddress1]
			,e.[LocationAddress2]									,t.[LocationAddress2]
			,e.[LocationCity]										,t.[LocationCity]
			,e.[LocationState]										,t.[LocationState]
			,e.[LocationZipCode]									,t.[LocationZipCode]
			,e.[LocationName]										,t.[LocationName]
			,e.[LocationAcceptsNewPatients]							,t.[LocationAcceptsNewPatients]
			,e.[LocationPhoneNumber]								,t.[LocationPhoneNumber]
			,e.[LocationFaxNumber]									,t.[LocationFaxNumber]
			,e.[LocationType]										,t.[LocationType]
			,e.[LocationSpecialtyCode]								,t.[LocationSpecialtyCode]
			,e.[FLAdditionalSpecialty1]								,t.[FLAdditionalSpecialty1]
			,e.[FLAdditionalSpecialty2]								,t.[FLAdditionalSpecialty2]
			,e.[FLAdditionalSpecialty3]								,t.[FLAdditionalSpecialty3]
			,e.[PrimaryLocation]									,t.[PrimaryLocation]
			,e.[IsEHRServiceOffered]								,t.[IsEHRServiceOffered]
			,e.[WebsiteUrl]											,t.[WebsiteUrl]
			,e.[Flesiid1]											,t.[Flesiid1]
			,e.[FlesiidType1]										,t.[FlesiidType1]
			,e.[FlesiidDesc1]										,t.[FlesiidDesc1]
			,e.[FlesiidEffectiveDate1]								,t.[FlesiidEffectiveDate1]
			,e.[FlesiidTerminationDate1]							,t.[FlesiidTerminationDate1]
			,e.[Flesiid2]											,t.[Flesiid2]
			,e.[FlesiidType2]										,t.[FlesiidType2]
			,e.[FlesiidDesc2]										,t.[FlesiidDesc2]
			,e.[FlesiidEffectiveDate2]								,t.[FlesiidEffectiveDate2]
			,e.[FlesiidTerminationDate2]							,t.[FlesiidTerminationDate2]
			,e.[Flesiid3]											,t.[Flesiid3]
			,e.[FlesiidType3]										,t.[FlesiidType3]
			,e.[FlesiidDesc3]										,t.[FlesiidDesc3]
			,e.[FlesiidEffectiveDate3]								,t.[FlesiidEffectiveDate3]
			,e.[FlesiidTerminationDate3]							,t.[FlesiidTerminationDate3]
			,e.[Flesiid4]											,t.[Flesiid4]
			,e.[FlesiidType4]										,t.[FlesiidType4]
			,e.[FlesiidDesc4]										,t.[FlesiidDesc4]
			,e.[FlesiidEffectiveDate4]								,t.[FlesiidEffectiveDate4]
			,e.[FlesiidTerminationDate4]							,t.[FlesiidTerminationDate4]
			,e.[Flesiid5]											,t.[Flesiid5]
			,e.[FlesiidType5]										,t.[FlesiidType5]
			,e.[FlesiidDesc5]										,t.[FlesiidDesc5]
			,e.[FlesiidEffectiveDate5]								,t.[FlesiidEffectiveDate5]
			,e.[FlesiidTerminationDate5]							,t.[FlesiidTerminationDate5]
			,e.[Flesiid6]											,t.[Flesiid6]
			,e.[FlesiidType6]										,t.[FlesiidType6]
			,e.[FlesiidDesc6]										,t.[FlesiidDesc6]
			,e.[FlesiidEffectiveDate6]								,t.[FlesiidEffectiveDate6]
			,e.[FlesiidTerminationDate6]							,t.[FlesiidTerminationDate6]
			,e.[Flesiid7]											,t.[Flesiid7]
			,e.[FlesiidType7]										,t.[FlesiidType7]
			,e.[FlesiidDesc7]										,t.[FlesiidDesc7]
			,e.[FlesiidEffectiveDate7]								,t.[FlesiidEffectiveDate7]
			,e.[FlesiidTerminationDate7]							,t.[FlesiidTerminationDate7]
			,e.[Flesiid8]											,t.[Flesiid8]
			,e.[FlesiidType8]										,t.[FlesiidType8]
			,e.[FlesiidDesc8]										,t.[FlesiidDesc8]
			,e.[FlesiidEffectiveDate8]								,t.[FlesiidEffectiveDate8]
			,e.[FlesiidTerminationDate8]							,t.[FlesiidTerminationDate8]
			,e.[Flesiid9]											,t.[Flesiid9]
			,e.[FlesiidType9]										,t.[FlesiidType9]
			,e.[FlesiidDesc9]										,t.[FlesiidDesc9]
			,e.[FlesiidEffectiveDate9]								,t.[FlesiidEffectiveDate9]
			,e.[FlesiidTerminationDate9]							,t.[FlesiidTerminationDate9]
			,e.[PatientMinimumAge]									,t.[PatientMinimumAge]
			,e.[PatientMaximumAge]									,t.[PatientMaximumAge]
			,e.[IsWheelchairAccessibleExamRoom]						,t.[IsWheelchairAccessibleExamRoom]
			,e.[FLHoursOpenMon]										,t.[FLHoursOpenMon]
			,e.[FLHoursCloseMon]									,t.[FLHoursCloseMon]
			,e.[FLHoursOpenTues]									,t.[FLHoursOpenTues]
			,e.[FLHoursCloseTues]									,t.[FLHoursCloseTues]
			,e.[FLHoursOpenWed]										,t.[FLHoursOpenWed]
			,e.[FLHoursCloseWed]									,t.[FLHoursCloseWed]
			,e.[FLHoursOpenThurs]									,t.[FLHoursOpenThurs]
			,e.[FLHoursCloseThurs]									,t.[FLHoursCloseThurs]
			,e.[FLHoursOpenFri]										,t.[FLHoursOpenFri]
			,e.[FLHoursCloseFri]									,t.[FLHoursCloseFri]
			,e.[FLHoursOpenSat]										,t.[FLHoursOpenSat]
			,e.[FLHoursCloseSat]									,t.[FLHoursCloseSat]
			,e.[FLHoursOpenSun]										,t.[FLHoursOpenSun]
			,e.[FLHoursCloseSun]									,t.[FLHoursCloseSun]
			,e.[FLLanguage1]										,t.[FLLanguage1]
			,e.[FLLanguage2]										,t.[FLLanguage2]
			,e.[FLLanguage3]										,t.[FLLanguage3]
			,e.[FLLanguage4]										,t.[FLLanguage4]
			,e.[FLShowInDirectory]									,t.[FLShowInDirectory]
			,e.[TIN]												,t.[TIN]
			,e.[BusinessName]										,t.[BusinessName]
			,e.[BillingAddress1]									,t.[BillingAddress1]
			,e.[BillingAddress2]									,t.[BillingAddress2]
			,e.[BillingCity]										,t.[BillingCity]
			,e.[BillingState]										,t.[BillingState]
			,e.[BillingZipCode]										,t.[BillingZipCode]
			,e.[BillingPhoneNumber]									,t.[BillingPhoneNumber]
			,e.[BillingFaxNumber]									,t.[BillingFaxNumber]
			,e.[ProviderFirstName]									,t.[ProviderFirstName]
			,e.[ProviderLastName]									,t.[ProviderLastName]
			,e.[ProviderMiddleName]									,t.[ProviderMiddleName]
			,e.[ProviderSuffix]										,t.[ProviderSuffix]
			,e.[ProviderGender]										,t.[ProviderGender]
			,e.[ProviderDateofBirth]								,t.[ProviderDateofBirth]
			,e.[ProviderEmail]										,t.[ProviderEmail]
			,e.[ProviderPhoneNumber]								,t.[ProviderPhoneNumber]
			,e.[ProviderFaxNumber]									,t.[ProviderFaxNumber]
			,e.[ProviderMedicaidState]								,t.[ProviderMedicaidState]
			,e.[ProviderIsPCP]										,t.[ProviderIsPCP]
			,e.[ProviderPrimarySpecialtyCode]						,t.[ProviderPrimarySpecialtyCode]
			,e.[ProviderCredentialCode]								,t.[ProviderCredentialCode]
			,e.[ProviderEngagementPriority]							,t.[ProviderEngagementPriority]
			,e.[ApplicationCompleteDate]							,t.[ApplicationCompleteDate]
			,e.[CredentialingApprovedDate]							,t.[CredentialingApprovedDate]
			,e.[ProviderLocationEffectiveDate]						,t.[ProviderLocationEffectiveDate]
			,e.[ProviderLocationTerminationDate]					,t.[ProviderLocationTerminationDate]
			,e.[IsProviderPrimaryLocation]							,t.[IsProviderPrimaryLocation]
			,e.[IsProviderPCPLocation]								,t.[IsProviderPCPLocation]
			,e.[ProviderLanguage1]									,t.[ProviderLanguage1]
			,e.[ProviderLanguage2]									,t.[ProviderLanguage2]
			,e.[ProviderLanguage3]									,t.[ProviderLanguage3]
			,e.[ProviderLanguage4]									,t.[ProviderLanguage4]
			,e.[ProviderlicBoardCertID]								,t.[ProviderlicBoardCertID]
			,e.[ProviderBoardCertificationType1]					,t.[ProviderBoardCertificationType1]
			,e.[ProviderlicBoardCertEffectiveDate]					,t.[ProviderlicBoardCertEffectiveDate]
			,e.[ProviderlicBoardCertTerminationDate]				,t.[ProviderlicBoardCertTerminationDate]
			,e.[FLHandicapAccessible]								,t.[FLHandicapAccessible]
			,e.[FLTerminationReason]								,t.[FLTerminationReason]
			,e.[FLCategory]											,t.[FLCategory]
			,e.[FLMailingAddress1]									,t.[FLMailingAddress1]
			,e.[FLMailingAddress2]									,t.[FLMailingAddress2]
			,e.[FLMailingCity]										,t.[FLMailingCity]
			,e.[FLMailingState]										,t.[FLMailingState]
			,e.[FLMailingZip]										,t.[FLMailingZip]
			,e.[BillingMailingAddress1]								,t.[BillingMailingAddress1]
			,e.[BillingMailingAddress2]								,t.[BillingMailingAddress2]
			,e.[BillingMailingCity]									,t.[BillingMailingCity]
			,e.[BillingMailingState]								,t.[BillingMailingState]
			,e.[BillingMailingZip]									,t.[BillingMailingZip]
			,e.[ProviderAdditionalSpecialty1]						,t.[ProviderAdditionalSpecialty1]
			,e.[ProviderAdditionalSpecialty2]						,t.[ProviderAdditionalSpecialty2]
			,e.[ProviderAdditionalSpecialty3]						,t.[ProviderAdditionalSpecialty3]
			,e.[FLEffectiveDate]									,t.[FLEffectiveDate]
			,e.[FLTerminationDate]									,t.[FLTerminationDate]
			,e.[PLPhoneNumber]										,t.[PLPhoneNumber]
			,e.[PLFaxNumber]										,t.[PLFaxNumber]
			,e.[PLPrimarySpecialty]									,t.[PLPrimarySpecialty]
			,e.[PLAdditionalSpecialty1]								,t.[PLAdditionalSpecialty1]
			,e.[PLAdditionalSpecialty2]								,t.[PLAdditionalSpecialty2]
			,e.[PLAdditionalSpecialty3]								,t.[PLAdditionalSpecialty3]
			,e.[PLHoursOpenMon]										,t.[PLHoursOpenMon]
			,e.[PLHoursCloseMon]									,t.[PLHoursCloseMon]
			,e.[PLHoursOpenTues]									,t.[PLHoursOpenTues]
			,e.[PLHoursCloseTues]									,t.[PLHoursCloseTues]
			,e.[PLHoursOpenWed]										,t.[PLHoursOpenWed]
			,e.[PLHoursCloseWed]									,t.[PLHoursCloseWed]
			,e.[PLHoursOpenThurs]									,t.[PLHoursOpenThurs]
			,e.[PLHoursCloseThurs]									,t.[PLHoursCloseThurs]
			,e.[PLHoursOpenFri]										,t.[PLHoursOpenFri]
			,e.[PLHoursCloseFri]									,t.[PLHoursCloseFri]
			,e.[PLHoursOpenSat]										,t.[PLHoursOpenSat]
			,e.[PLHoursCloseSat]									,t.[PLHoursCloseSat]
			,e.[PLHoursOpenSun]										,t.[PLHoursOpenSun]
			,e.[PLHoursCloseSun]									,t.[PLHoursCloseSun]
			,e.[PLMinimumPatientAge]								,t.[PLMinimumPatientAge]
			,e.[PLMaximumPatientAge]								,t.[PLMaximumPatientAge]
			,e.[PLShowInDirectory]									,t.[PLShowInDirectory]
			,e.[PLTerminationReason]								,t.[PLTerminationReason]
			,e.[PLCategory]											,t.[PLCategory]
			,e.[PLAddress1]											,t.[PLAddress1]
			,e.[PLAddress2]											,t.[PLAddress2]
			,e.[PLCity]												,t.[PLCity]
			,e.[PLState]											,t.[PLState]
			,e.[PLZip]												,t.[PLZip]
			,e.[PLMailingAddress1]									,t.[PLMailingAddress1]
			,e.[PLMailingAddress2]									,t.[PLMailingAddress2]
			,e.[PLMailingCity]										,t.[PLMailingCity]
			,e.[PLMailingState]										,t.[PLMailingState]
			,e.[PLMailingZip]										,t.[PLMailingZip]
			,e.[Plesiid1]											,t.[Plesiid1]
			,e.[PlesiidType1]										,t.[PlesiidType1]
			,e.[PlesiidDesc1]										,t.[PlesiidDesc1]
			,e.[PlesiidEffectiveDate1]								,t.[PlesiidEffectiveDate1]
			,e.[PlesiidTerminationDate1]							,t.[PlesiidTerminationDate1]
			,e.[Plesiid2]											,t.[Plesiid2]
			,e.[PlesiidType2]										,t.[PlesiidType2]
			,e.[PlesiidDesc2]										,t.[PlesiidDesc2]
			,e.[PlesiidEffectiveDate2]								,t.[PlesiidEffectiveDate2]
			,e.[PlesiidTerminationDate2]							,t.[PlesiidTerminationDate2]
			,e.[Plesiid3]											,t.[Plesiid3]
			,e.[PlesiidType3]										,t.[PlesiidType3]
			,e.[PlesiidDesc3]										,t.[PlesiidDesc3]
			,e.[PlesiidEffectiveDate3]								,t.[PlesiidEffectiveDate3]
			,e.[PlesiidTerminationDate3]							,t.[PlesiidTerminationDate3]
			,e.[Plesiid4]											,t.[Plesiid4]
			,e.[PlesiidType4]										,t.[PlesiidType4]
			,e.[PlesiidDesc4]										,t.[PlesiidDesc4]
			,e.[PlesiidEffectiveDate4]								,t.[PlesiidEffectiveDate4]
			,e.[PlesiidTerminationDate4]							,t.[PlesiidTerminationDate4]
			,e.[Plesiid5]											,t.[Plesiid5]
			,e.[PlesiidType5]										,t.[PlesiidType5]
			,e.[PlesiidDesc5]										,t.[PlesiidDesc5]
			,e.[PlesiidEffectiveDate5]								,t.[PlesiidEffectiveDate5]
			,e.[PlesiidTerminationDate5]							,t.[PlesiidTerminationDate5]
			,e.[Plesiid6]											,t.[Plesiid6]
			,e.[PlesiidType6]										,t.[PlesiidType6]
			,e.[PlesiidDesc6]										,t.[PlesiidDesc6]
			,e.[PlesiidEffectiveDate6]								,t.[PlesiidEffectiveDate6]
			,e.[PlesiidTerminationDate6]							,t.[PlesiidTerminationDate6]
			,e.[Plesiid7]											,t.[Plesiid7]
			,e.[PlesiidType7]										,t.[PlesiidType7]
			,e.[PlesiidDesc7]										,t.[PlesiidDesc7]
			,e.[PlesiidEffectiveDate7]								,t.[PlesiidEffectiveDate7]
			,e.[PlesiidTerminationDate7]							,t.[PlesiidTerminationDate7]
			,e.[Plesiid8]											,t.[Plesiid8]
			,e.[PlesiidType8]										,t.[PlesiidType8]
			,e.[PlesiidDesc8]										,t.[PlesiidDesc8]
			,e.[PlesiidEffectiveDate8]								,t.[PlesiidEffectiveDate8]
			,e.[PlesiidTerminationDate8]							,t.[PlesiidTerminationDate8]
			,e.[Plesiid9]											,t.[Plesiid9]
			,e.[PlesiidType9]										,t.[PlesiidType9]
			,e.[PlesiidDesc9]										,t.[PlesiidDesc9]
			,e.[PlesiidEffectiveDate9]								,t.[PlesiidEffectiveDate9]
			,e.[PlesiidTerminationDate9]							,t.[PlesiidTerminationDate9]
			,e.[FacilityMedicaidLicenseID1]							,t.[FacilityMedicaidLicenseID1]
			,e.[FacilityMedicaidLicenseState1]						,t.[FacilityMedicaidLicenseState1]
			,e.[FacilityMedicaidLicenseEffectiveDate1]				,t.[FacilityMedicaidLicenseEffectiveDate1]
			,e.[FacilityMedicaidLicenseTerminationDate1]			,t.[FacilityMedicaidLicenseTerminationDate1]
			,e.[FacilityStateLicenseID1]							,t.[FacilityStateLicenseID1]
			,e.[FacilityStateLicenseState1]							,t.[FacilityStateLicenseState1]
			,e.[FacilityStateLicenseType1]							,t.[FacilityStateLicenseType1]
			,e.[FacilityStateLicenseEffectiveDate1]					,t.[FacilityStateLicenseEffectiveDate1]
			,e.[FacilityStateLicenseTerminationDate1]				,t.[FacilityStateLicenseTerminationDate1]
			,e.[FacilityBoardcertificationID1]						,t.[FacilityBoardcertificationID1]
			,e.[FacilityBoardCertificationType1]					,t.[FacilityBoardCertificationType1]
			,e.[FacilityBoardCertificationEffectiveDate1]			,t.[FacilityBoardCertificationEffectiveDate1]
			,e.[FacilityBoardCertificationTerminationDate1]			,t.[FacilityBoardCertificationTerminationDate1]
			,e.[FacilityMemberAssignment]							,t.[FacilityMemberAssignment]
			,e.[FLStateReportingProviderTypePrimary]				,t.[FLStateReportingProviderTypePrimary]
			,e.[FLStateReportingProviderSpecialtyPrimary]			,t.[FLStateReportingProviderSpecialtyPrimary]
			,e.[FLStateReportingProviderType1]						,t.[FLStateReportingProviderType1]
			,e.[FLStateReportingProviderSpecialty1]					,t.[FLStateReportingProviderSpecialty1]
			,e.[FLStateReportingProviderType2]						,t.[FLStateReportingProviderType2]
			,e.[FLStateReportingProviderSpecialty2]					,t.[FLStateReportingProviderSpecialty2]
			,e.[FLStateReportingProviderType3]						,t.[FLStateReportingProviderType3]
			,e.[FLStateReportingProviderSpecialty3]					,t.[FLStateReportingProviderSpecialty3]
			,e.[FLAdditionalSpecialty4]								,t.[FLAdditionalSpecialty4]
			,e.[FLStateReportingProviderType4]						,t.[FLStateReportingProviderType4]
			,e.[FLStateReportingProviderSpecialty4]					,t.[FLStateReportingProviderSpecialty4]
			,e.[FLAdditionalSpecialty5]								,t.[FLAdditionalSpecialty5]
			,e.[FLStateReportingProviderType5]						,t.[FLStateReportingProviderType5]
			,e.[FLStateReportingProviderSpecialty5]					,t.[FLStateReportingProviderSpecialty5]
			,e.[FLAdditionalSpecialty6]								,t.[FLAdditionalSpecialty6]
			,e.[FLStateReportingProviderType6]						,t.[FLStateReportingProviderType6]
			,e.[FLStateReportingProviderSpecialty6]					,t.[FLStateReportingProviderSpecialty6]
			,e.[FLAdditionalSpecialty7]								,t.[FLAdditionalSpecialty7]
			,e.[FLStateReportingProviderType7]						,t.[FLStateReportingProviderType7]
			,e.[FLStateReportingProviderSpecialty7]					,t.[FLStateReportingProviderSpecialty7]
			,e.[FLAdditionalSpecialty8]								,t.[FLAdditionalSpecialty8]
			,e.[FLStateReportingProviderType8]						,t.[FLStateReportingProviderType8]
			,e.[FLStateReportingProviderSpecialty8]					,t.[FLStateReportingProviderSpecialty8]
			,e.[FLAdditionalSpecialty9]								,t.[FLAdditionalSpecialty9]
			,e.[FLStateReportingProviderType9]						,t.[FLStateReportingProviderType9]
			,e.[FLStateReportingProviderSpecialty9]					,t.[FLStateReportingProviderSpecialty9]
			,e.[FLCCNetworkName]									,t.[FLCCNetworkName]
			,e.[FLCCSubnetworkName]									,t.[FLCCSubnetworkName]
			,e.[FLCCAffiliationID]									,t.[FLCCAffiliationID]
			,e.[FLCCContractID]										,t.[FLCCContractID]
			,e.[FLCCReimbursementRate]								,t.[FLCCReimbursementRate]
			,e.[FLCCAssignmentEffectiveDate]						,t.[FLCCAssignmentEffectiveDate]
			,e.[FLCCAssignmentTerminationDate]						,t.[FLCCAssignmentTerminationDate]
			,e.[ProviderMedicaidLicenseID1]							,t.[ProviderMedicaidLicenseID1]
			,e.[ProviderMedicaidLicenseState1]						,t.[ProviderMedicaidLicenseState1]
			,e.[ProviderMedicaidLicenseEffectiveDate1]				,t.[ProviderMedicaidLicenseEffectiveDate1]
			,e.[ProviderMedicaidLicenseTerminationDate1]			,t.[ProviderMedicaidLicenseTerminationDate1]
			,e.[ProviderStateLicenseID1]							,t.[ProviderStateLicenseID1]
			,e.[ProviderStateLicenseState1]							,t.[ProviderStateLicenseState1]
			,e.[ProviderStateLicenseType1]							,t.[ProviderStateLicenseType1]
			,e.[ProviderStateLicenseEffectiveDate1]					,t.[ProviderStateLicenseEffectiveDate1]
			,e.[ProviderStateLicenseTerminationDate1]				,t.[ProviderStateLicenseTerminationDate1]
			,e.[PLStateReportingProviderTypePrimary]				,t.[PLStateReportingProviderTypePrimary]
			,e.[PLStateReportingProviderSpecialtyPrimary]			,t.[PLStateReportingProviderSpecialtyPrimary]
			,e.[PLStateReportingProviderType1]						,t.[PLStateReportingProviderType1]
			,e.[PLStateReportingProviderSpecialty1]					,t.[PLStateReportingProviderSpecialty1]
			,e.[PLStateReportingProviderType2]						,t.[PLStateReportingProviderType2]
			,e.[PLStateReportingProviderSpecialty2]					,t.[PLStateReportingProviderSpecialty2]
			,e.[PLStateReportingProviderType3]						,t.[PLStateReportingProviderType3]
			,e.[PLStateReportingProviderSpecialty3]					,t.[PLStateReportingProviderSpecialty3]
			,e.[PLAdditionalSpecialty4]								,t.[PLAdditionalSpecialty4]
			,e.[PLStateReportingProviderType4]						,t.[PLStateReportingProviderType4]
			,e.[PLStateReportingProviderSpecialty4]					,t.[PLStateReportingProviderSpecialty4]
			,e.[PLAdditionalSpecialty5]								,t.[PLAdditionalSpecialty5]
			,e.[PLStateReportingProviderType5]						,t.[PLStateReportingProviderType5]
			,e.[PLStateReportingProviderSpecialty5]					,t.[PLStateReportingProviderSpecialty5]
			,e.[PLAdditionalSpecialty6]								,t.[PLAdditionalSpecialty6]
			,e.[PLStateReportingProviderType6]						,t.[PLStateReportingProviderType6]
			,e.[PLStateReportingProviderSpecialty6]					,t.[PLStateReportingProviderSpecialty6]
			,e.[PLAdditionalSpecialty7]								,t.[PLAdditionalSpecialty7]
			,e.[PLStateReportingProviderType7]						,t.[PLStateReportingProviderType7]
			,e.[PLStateReportingProviderSpecialty7]					,t.[PLStateReportingProviderSpecialty7]
			,e.[PLAdditionalSpecialty8]								,t.[PLAdditionalSpecialty8]
			,e.[PLStateReportingProviderType8]						,t.[PLStateReportingProviderType8]
			,e.[PLStateReportingProviderSpecialty8]					,t.[PLStateReportingProviderSpecialty8]
			,e.[PLAdditionalSpecialty9]								,t.[PLAdditionalSpecialty9]
			,e.[PLStateReportingProviderType9]						,t.[PLStateReportingProviderType9]
			,e.[PLStateReportingProviderSpecialty9]					,t.[PLStateReportingProviderSpecialty9]
			,e.[PLAcceptsNewPatients]								,t.[PLAcceptsNewPatients]
			,e.[PhysHospRelNPI1]									,t.[PhysHospRelNPI1]
			,e.[PhysHospRelEffectiveDate1]							,t.[PhysHospRelEffectiveDate1]
			,e.[PhysHospRelTerminationDate1]						,t.[PhysHospRelTerminationDate1]
			,e.[PhysHospRelType1]									,t.[PhysHospRelType1]
			,e.[PhysHospRelPrintInDirectory1]						,t.[PhysHospRelPrintInDirectory1]
			,e.[PhysHospRelNPI2]									,t.[PhysHospRelNPI2]
			,e.[PhysHospRelEffectiveDate2]							,t.[PhysHospRelEffectiveDate2]
			,e.[PhysHospRelTerminationDate2]						,t.[PhysHospRelTerminationDate2]
			,e.[PhysHospRelType2]									,t.[PhysHospRelType2]
			,e.[PhysHospRelPrintInDirectory2]						,t.[PhysHospRelPrintInDirectory2]
			,e.[PhysHospRelNPI3]									,t.[PhysHospRelNPI3]
			,e.[PhysHospRelEffectiveDate3]							,t.[PhysHospRelEffectiveDate3]
			,e.[PhysHospRelTerminationDate3]						,t.[PhysHospRelTerminationDate3]
			,e.[PhysHospRelType3]									,t.[PhysHospRelType3]
			,e.[PhysHospRelPrintInDirectory3]						,t.[PhysHospRelPrintInDirectory3]
			,e.[PhysHospRelNPI4]									,t.[PhysHospRelNPI4]
			,e.[PhysHospRelEffectiveDate4]							,t.[PhysHospRelEffectiveDate4]
			,e.[PhysHospRelTerminationDate4]						,t.[PhysHospRelTerminationDate4]
			,e.[PhysHospRelType4]									,t.[PhysHospRelType4]
			,e.[PhysHospRelPrintInDirectory4]						,t.[PhysHospRelPrintInDirectory4]
			,e.[PhysHospRelNPI5]									,t.[PhysHospRelNPI5]
			,e.[PhysHospRelEffectiveDate5]							,t.[PhysHospRelEffectiveDate5]
			,e.[PhysHospRelTerminationDate5]						,t.[PhysHospRelTerminationDate5]
			,e.[PhysHospRelType5]									,t.[PhysHospRelType5]
			,e.[PhysHospRelPrintInDirectory5]						,t.[PhysHospRelPrintInDirectory5]
			,e.[PLCCNetworkName]									,t.[PLCCNetworkName]
			,e.[PLCCSubnetworkName]									,t.[PLCCSubnetworkName]
			,e.[PLCCAffiliationID]									,t.[PLCCAffiliationID]
			,e.[PLCCContractID]										,t.[PLCCContractID]
			,e.[PLCCReimbursementRate]								,t.[PLCCReimbursementRate]
			,e.[PLCCAssignmentEffectiveDate]						,t.[PLCCAssignmentEffectiveDate]
			,e.[PLCCAssignmentTerminationDate]						,t.[PLCCAssignmentTerminationDate]
			,e.[IsPracticeValid]									,t.[IsPracticeValid]
			,e.[IsProviderValid]									,t.[IsProviderValid]  
		from #pnm e
		full join #test_pnm t on isnull(e.[PracticeNPI],'1') = isnull(t.[PracticeNPI],'1')
							 and isnull(e.[ProviderNPI],'1') = isnull(t.[ProviderNPI],'1')
												and e.[Rank] = t.[Rank]

	create table #pnm_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #pnm_names values
		 (1,'PracticeName','test_PracticeName')
		,(2,'PracticeType','test_PracticeType')
		,(3,'FacilityReportingType','test_FacilityReportingType')
		,(4,'FacilityStateReporting','test_FacilityStateReporting')
		,(5,'PracticeSubpartNPI','test_PracticeSubpartNPI')
		,(6,'LocationAddressType','test_LocationAddressType')
		,(7,'LocationAddress1','test_LocationAddress1')
		,(8,'LocationAddress2','test_LocationAddress2')
		,(9,'LocationCity','test_LocationCity')
		,(10,'LocationState','test_LocationState')
		,(11,'LocationZipCode','test_LocationZipCode')
		,(12,'LocationName','test_LocationName')
		,(13,'LocationAcceptsNewPatients','test_LocationAcceptsNewPatients')
		,(14,'LocationPhoneNumber','test_LocationPhoneNumber')
		,(15,'LocationFaxNumber','test_LocationFaxNumber')
		,(16,'LocationType','test_LocationType')
		,(17,'LocationSpecialtyCode','test_LocationSpecialtyCode')
		,(18,'FLAdditionalSpecialty1','test_FLAdditionalSpecialty1')
		,(19,'FLAdditionalSpecialty2','test_FLAdditionalSpecialty2')
		,(20,'FLAdditionalSpecialty3','test_FLAdditionalSpecialty3')
		,(21,'PrimaryLocation','test_PrimaryLocation')
		,(22,'IsEHRServiceOffered','test_IsEHRServiceOffered')
		,(23,'WebsiteUrl','test_WebsiteUrl')
		,(24,'Flesiid1','test_Flesiid1')
		,(25,'FlesiidType1','test_FlesiidType1')
		,(26,'FlesiidDesc1','test_FlesiidDesc1')
		,(27,'FlesiidEffectiveDate1','test_FlesiidEffectiveDate1')
		,(28,'FlesiidTerminationDate1','test_FlesiidTerminationDate1')
		,(29,'Flesiid2','test_Flesiid2')
		,(30,'FlesiidType2','test_FlesiidType2')
		,(31,'FlesiidDesc2','test_FlesiidDesc2')
		,(32,'FlesiidEffectiveDate2','test_FlesiidEffectiveDate2')
		,(33,'FlesiidTerminationDate2','test_FlesiidTerminationDate2')
		,(34,'Flesiid3','test_Flesiid3')
		,(35,'FlesiidType3','test_FlesiidType3')
		,(36,'FlesiidDesc3','test_FlesiidDesc3')
		,(37,'FlesiidEffectiveDate3','test_FlesiidEffectiveDate3')
		,(38,'FlesiidTerminationDate3','test_FlesiidTerminationDate3')
		,(39,'Flesiid4','test_Flesiid4')
		,(40,'FlesiidType4','test_FlesiidType4')
		,(41,'FlesiidDesc4','test_FlesiidDesc4')
		,(42,'FlesiidEffectiveDate4','test_FlesiidEffectiveDate4')
		,(43,'FlesiidTerminationDate4','test_FlesiidTerminationDate4')
		,(44,'Flesiid5','test_Flesiid5')
		,(45,'FlesiidType5','test_FlesiidType5')
		,(46,'FlesiidDesc5','test_FlesiidDesc5')
		,(47,'FlesiidEffectiveDate5','test_FlesiidEffectiveDate5')
		,(48,'FlesiidTerminationDate5','test_FlesiidTerminationDate5')
		,(49,'Flesiid6','test_Flesiid6')
		,(50,'FlesiidType6','test_FlesiidType6')
		,(51,'FlesiidDesc6','test_FlesiidDesc6')
		,(52,'FlesiidEffectiveDate6','test_FlesiidEffectiveDate6')
		,(53,'FlesiidTerminationDate6','test_FlesiidTerminationDate6')
		,(54,'Flesiid7','test_Flesiid7')
		,(55,'FlesiidType7','test_FlesiidType7')
		,(56,'FlesiidDesc7','test_FlesiidDesc7')
		,(57,'FlesiidEffectiveDate7','test_FlesiidEffectiveDate7')
		,(58,'FlesiidTerminationDate7','test_FlesiidTerminationDate7')
		,(59,'Flesiid8','test_Flesiid8')
		,(60,'FlesiidType8','test_FlesiidType8')
		,(61,'FlesiidDesc8','test_FlesiidDesc8')
		,(62,'FlesiidEffectiveDate8','test_FlesiidEffectiveDate8')
		,(63,'FlesiidTerminationDate8','test_FlesiidTerminationDate8')
		,(64,'Flesiid9','test_Flesiid9')
		,(65,'FlesiidType9','test_FlesiidType9')
		,(66,'FlesiidDesc9','test_FlesiidDesc9')
		,(67,'FlesiidEffectiveDate9','test_FlesiidEffectiveDate9')
		,(68,'FlesiidTerminationDate9','test_FlesiidTerminationDate9')
		,(69,'PatientMinimumAge','test_PatientMinimumAge')
		,(70,'PatientMaximumAge','test_PatientMaximumAge')
		,(71,'IsWheelchairAccessibleExamRoom','test_IsWheelchairAccessibleExamRoom')
		,(72,'FLHoursOpenMon','test_FLHoursOpenMon')
		,(73,'FLHoursCloseMon','test_FLHoursCloseMon')
		,(74,'FLHoursOpenTues','test_FLHoursOpenTues')
		,(75,'FLHoursCloseTues','test_FLHoursCloseTues')
		,(76,'FLHoursOpenWed','test_FLHoursOpenWed')
		,(77,'FLHoursCloseWed','test_FLHoursCloseWed')
		,(78,'FLHoursOpenThurs','test_FLHoursOpenThurs')
		,(79,'FLHoursCloseThurs','test_FLHoursCloseThurs')
		,(80,'FLHoursOpenFri','test_FLHoursOpenFri')
		,(81,'FLHoursCloseFri','test_FLHoursCloseFri')
		,(82,'FLHoursOpenSat','test_FLHoursOpenSat')
		,(83,'FLHoursCloseSat','test_FLHoursCloseSat')
		,(84,'FLHoursOpenSun','test_FLHoursOpenSun')
		,(85,'FLHoursCloseSun','test_FLHoursCloseSun')
		,(86,'FLLanguage1','test_FLLanguage1')
		,(87,'FLLanguage2','test_FLLanguage2')
		,(88,'FLLanguage3','test_FLLanguage3')
		,(89,'FLLanguage4','test_FLLanguage4')
		,(90,'FLShowInDirectory','test_FLShowInDirectory')
		,(91,'TIN','test_TIN')
		,(92,'BusinessName','test_BusinessName')
		,(93,'BillingAddress1','test_BillingAddress1')
		,(94,'BillingAddress2','test_BillingAddress2')
		,(95,'BillingCity','test_BillingCity')
		,(96,'BillingState','test_BillingState')
		,(97,'BillingZipCode','test_BillingZipCode')
		,(98,'BillingPhoneNumber','test_BillingPhoneNumber')
		,(99,'BillingFaxNumber','test_BillingFaxNumber')
		,(100,'ProviderFirstName','test_ProviderFirstName')
		,(101,'ProviderLastName','test_ProviderLastName')
		,(102,'ProviderMiddleName','test_ProviderMiddleName')
		,(103,'ProviderSuffix','test_ProviderSuffix')
		,(104,'ProviderGender','test_ProviderGender')
		,(105,'ProviderDateofBirth','test_ProviderDateofBirth')
		,(106,'ProviderEmail','test_ProviderEmail')
		,(107,'ProviderPhoneNumber','test_ProviderPhoneNumber')
		,(108,'ProviderFaxNumber','test_ProviderFaxNumber')
		,(109,'ProviderMedicaidState','test_ProviderMedicaidState')
		,(110,'ProviderIsPCP','test_ProviderIsPCP')
		,(111,'ProviderPrimarySpecialtyCode','test_ProviderPrimarySpecialtyCode')
		,(112,'ProviderCredentialCode','test_ProviderCredentialCode')
		,(113,'ProviderEngagementPriority','test_ProviderEngagementPriority')
		,(114,'ApplicationCompleteDate','test_ApplicationCompleteDate')
		,(115,'CredentialingApprovedDate','test_CredentialingApprovedDate')
		,(116,'ProviderLocationEffectiveDate','test_ProviderLocationEffectiveDate')
		,(117,'ProviderLocationTerminationDate','test_ProviderLocationTerminationDate')
		,(118,'IsProviderPrimaryLocation','test_IsProviderPrimaryLocation')
		,(119,'IsProviderPCPLocation','test_IsProviderPCPLocation')
		,(120,'ProviderLanguage1','test_ProviderLanguage1')
		,(121,'ProviderLanguage2','test_ProviderLanguage2')
		,(122,'ProviderLanguage3','test_ProviderLanguage3')
		,(123,'ProviderLanguage4','test_ProviderLanguage4')
		,(124,'ProviderlicBoardCertID','test_ProviderlicBoardCertID')
		,(125,'ProviderBoardCertificationType1','test_ProviderBoardCertificationType1')
		,(126,'ProviderlicBoardCertEffectiveDate','test_ProviderlicBoardCertEffectiveDate')
		,(127,'ProviderlicBoardCertTerminationDate','test_ProviderlicBoardCertTerminationDate')
		,(128,'FLHandicapAccessible','test_FLHandicapAccessible')
		,(129,'FLTerminationReason','test_FLTerminationReason')
		,(130,'FLCategory','test_FLCategory')
		,(131,'FLMailingAddress1','test_FLMailingAddress1')
		,(132,'FLMailingAddress2','test_FLMailingAddress2')
		,(133,'FLMailingCity','test_FLMailingCity')
		,(134,'FLMailingState','test_FLMailingState')
		,(135,'FLMailingZip','test_FLMailingZip')
		,(136,'BillingMailingAddress1','test_BillingMailingAddress1')
		,(137,'BillingMailingAddress2','test_BillingMailingAddress2')
		,(138,'BillingMailingCity','test_BillingMailingCity')
		,(139,'BillingMailingState','test_BillingMailingState')
		,(140,'BillingMailingZip','test_BillingMailingZip')
		,(141,'ProviderAdditionalSpecialty1','test_ProviderAdditionalSpecialty1')
		,(142,'ProviderAdditionalSpecialty2','test_ProviderAdditionalSpecialty2')
		,(143,'ProviderAdditionalSpecialty3','test_ProviderAdditionalSpecialty3')
		,(144,'FLEffectiveDate','test_FLEffectiveDate')
		,(145,'FLTerminationDate','test_FLTerminationDate')
		,(146,'PLPhoneNumber','test_PLPhoneNumber')
		,(147,'PLFaxNumber','test_PLFaxNumber')
		,(148,'PLPrimarySpecialty','test_PLPrimarySpecialty')
		,(149,'PLAdditionalSpecialty1','test_PLAdditionalSpecialty1')
		,(150,'PLAdditionalSpecialty2','test_PLAdditionalSpecialty2')
		,(151,'PLAdditionalSpecialty3','test_PLAdditionalSpecialty3')
		,(152,'PLHoursOpenMon','test_PLHoursOpenMon')
		,(153,'PLHoursCloseMon','test_PLHoursCloseMon')
		,(154,'PLHoursOpenTues','test_PLHoursOpenTues')
		,(155,'PLHoursCloseTues','test_PLHoursCloseTues')
		,(156,'PLHoursOpenWed','test_PLHoursOpenWed')
		,(157,'PLHoursCloseWed','test_PLHoursCloseWed')
		,(158,'PLHoursOpenThurs','test_PLHoursOpenThurs')
		,(159,'PLHoursCloseThurs','test_PLHoursCloseThurs')
		,(160,'PLHoursOpenFri','test_PLHoursOpenFri')
		,(161,'PLHoursCloseFri','test_PLHoursCloseFri')
		,(162,'PLHoursOpenSat','test_PLHoursOpenSat')
		,(163,'PLHoursCloseSat','test_PLHoursCloseSat')
		,(164,'PLHoursOpenSun','test_PLHoursOpenSun')
		,(165,'PLHoursCloseSun','test_PLHoursCloseSun')
		,(166,'PLMinimumPatientAge','test_PLMinimumPatientAge')
		,(167,'PLMaximumPatientAge','test_PLMaximumPatientAge')
		,(168,'PLShowInDirectory','test_PLShowInDirectory')
		,(169,'PLTerminationReason','test_PLTerminationReason')
		,(170,'PLCategory','test_PLCategory')
		,(171,'PLAddress1','test_PLAddress1')
		,(172,'PLAddress2','test_PLAddress2')
		,(173,'PLCity','test_PLCity')
		,(174,'PLState','test_PLState')
		,(175,'PLZip','test_PLZip')
		,(176,'PLMailingAddress1','test_PLMailingAddress1')
		,(177,'PLMailingAddress2','test_PLMailingAddress2')
		,(178,'PLMailingCity','test_PLMailingCity')
		,(179,'PLMailingState','test_PLMailingState')
		,(180,'PLMailingZip','test_PLMailingZip')
		,(181,'Plesiid1','test_Plesiid1')
		,(182,'PlesiidType1','test_PlesiidType1')
		,(183,'PlesiidDesc1','test_PlesiidDesc1')
		,(184,'PlesiidEffectiveDate1','test_PlesiidEffectiveDate1')
		,(185,'PlesiidTerminationDate1','test_PlesiidTerminationDate1')
		,(186,'Plesiid2','test_Plesiid2')
		,(187,'PlesiidType2','test_PlesiidType2')
		,(188,'PlesiidDesc2','test_PlesiidDesc2')
		,(189,'PlesiidEffectiveDate2','test_PlesiidEffectiveDate2')
		,(190,'PlesiidTerminationDate2','test_PlesiidTerminationDate2')
		,(191,'Plesiid3','test_Plesiid3')
		,(192,'PlesiidType3','test_PlesiidType3')
		,(193,'PlesiidDesc3','test_PlesiidDesc3')
		,(194,'PlesiidEffectiveDate3','test_PlesiidEffectiveDate3')
		,(195,'PlesiidTerminationDate3','test_PlesiidTerminationDate3')
		,(196,'Plesiid4','test_Plesiid4')
		,(197,'PlesiidType4','test_PlesiidType4')
		,(198,'PlesiidDesc4','test_PlesiidDesc4')
		,(199,'PlesiidEffectiveDate4','test_PlesiidEffectiveDate4')
		,(200,'PlesiidTerminationDate4','test_PlesiidTerminationDate4')
		,(201,'Plesiid5','test_Plesiid5')
		,(202,'PlesiidType5','test_PlesiidType5')
		,(203,'PlesiidDesc5','test_PlesiidDesc5')
		,(204,'PlesiidEffectiveDate5','test_PlesiidEffectiveDate5')
		,(205,'PlesiidTerminationDate5','test_PlesiidTerminationDate5')
		,(206,'Plesiid6','test_Plesiid6')
		,(207,'PlesiidType6','test_PlesiidType6')
		,(208,'PlesiidDesc6','test_PlesiidDesc6')
		,(209,'PlesiidEffectiveDate6','test_PlesiidEffectiveDate6')
		,(210,'PlesiidTerminationDate6','test_PlesiidTerminationDate6')
		,(211,'Plesiid7','test_Plesiid7')
		,(212,'PlesiidType7','test_PlesiidType7')
		,(213,'PlesiidDesc7','test_PlesiidDesc7')
		,(214,'PlesiidEffectiveDate7','test_PlesiidEffectiveDate7')
		,(215,'PlesiidTerminationDate7','test_PlesiidTerminationDate7')
		,(216,'Plesiid8','test_Plesiid8')
		,(217,'PlesiidType8','test_PlesiidType8')
		,(218,'PlesiidDesc8','test_PlesiidDesc8')
		,(219,'PlesiidEffectiveDate8','test_PlesiidEffectiveDate8')
		,(220,'PlesiidTerminationDate8','test_PlesiidTerminationDate8')
		,(221,'Plesiid9','test_Plesiid9')
		,(222,'PlesiidType9','test_PlesiidType9')
		,(223,'PlesiidDesc9','test_PlesiidDesc9')
		,(224,'PlesiidEffectiveDate9','test_PlesiidEffectiveDate9')
		,(225,'PlesiidTerminationDate9','test_PlesiidTerminationDate9')
		,(226,'FacilityMedicaidLicenseID1','test_FacilityMedicaidLicenseID1')
		,(227,'FacilityMedicaidLicenseState1','test_FacilityMedicaidLicenseState1')
		,(228,'FacilityMedicaidLicenseEffectiveDate1','test_FacilityMedicaidLicenseEffectiveDate1')
		,(229,'FacilityMedicaidLicenseTerminationDate1','test_FacilityMedicaidLicenseTerminationDate1')
		,(230,'FacilityStateLicenseID1','test_FacilityStateLicenseID1')
		,(231,'FacilityStateLicenseState1','test_FacilityStateLicenseState1')
		,(232,'FacilityStateLicenseType1','test_FacilityStateLicenseType1')
		,(233,'FacilityStateLicenseEffectiveDate1','test_FacilityStateLicenseEffectiveDate1')
		,(234,'FacilityStateLicenseTerminationDate1','test_FacilityStateLicenseTerminationDate1')
		,(235,'FacilityBoardcertificationID1','test_FacilityBoardcertificationID1')
		,(236,'FacilityBoardCertificationType1','test_FacilityBoardCertificationType1')
		,(237,'FacilityBoardCertificationEffectiveDate1','test_FacilityBoardCertificationEffectiveDate1')
		,(238,'FacilityBoardCertificationTerminationDate1','test_FacilityBoardCertificationTerminationDate1')
		,(239,'FacilityMemberAssignment','test_FacilityMemberAssignment')
		,(240,'FLStateReportingProviderTypePrimary','test_FLStateReportingProviderTypePrimary')
		,(241,'FLStateReportingProviderSpecialtyPrimary','test_FLStateReportingProviderSpecialtyPrimary')
		,(242,'FLStateReportingProviderType1','test_FLStateReportingProviderType1')
		,(243,'FLStateReportingProviderSpecialty1','test_FLStateReportingProviderSpecialty1')
		,(244,'FLStateReportingProviderType2','test_FLStateReportingProviderType2')
		,(245,'FLStateReportingProviderSpecialty2','test_FLStateReportingProviderSpecialty2')
		,(246,'FLStateReportingProviderType3','test_FLStateReportingProviderType3')
		,(247,'FLStateReportingProviderSpecialty3','test_FLStateReportingProviderSpecialty3')
		,(248,'FLAdditionalSpecialty4','test_FLAdditionalSpecialty4')
		,(249,'FLStateReportingProviderType4','test_FLStateReportingProviderType4')
		,(250,'FLStateReportingProviderSpecialty4','test_FLStateReportingProviderSpecialty4')
		,(251,'FLAdditionalSpecialty5','test_FLAdditionalSpecialty5')
		,(252,'FLStateReportingProviderType5','test_FLStateReportingProviderType5')
		,(253,'FLStateReportingProviderSpecialty5','test_FLStateReportingProviderSpecialty5')
		,(254,'FLAdditionalSpecialty6','test_FLAdditionalSpecialty6')
		,(255,'FLStateReportingProviderType6','test_FLStateReportingProviderType6')
		,(256,'FLStateReportingProviderSpecialty6','test_FLStateReportingProviderSpecialty6')
		,(257,'FLAdditionalSpecialty7','test_FLAdditionalSpecialty7')
		,(258,'FLStateReportingProviderType7','test_FLStateReportingProviderType7')
		,(259,'FLStateReportingProviderSpecialty7','test_FLStateReportingProviderSpecialty7')
		,(260,'FLAdditionalSpecialty8','test_FLAdditionalSpecialty8')
		,(261,'FLStateReportingProviderType8','test_FLStateReportingProviderType8')
		,(262,'FLStateReportingProviderSpecialty8','test_FLStateReportingProviderSpecialty8')
		,(263,'FLAdditionalSpecialty9','test_FLAdditionalSpecialty9')
		,(264,'FLStateReportingProviderType9','test_FLStateReportingProviderType9')
		,(265,'FLStateReportingProviderSpecialty9','test_FLStateReportingProviderSpecialty9')
		,(266,'FLCCNetworkName','test_FLCCNetworkName')
		,(267,'FLCCSubnetworkName','test_FLCCSubnetworkName')
		,(268,'FLCCAffiliationID','test_FLCCAffiliationID')
		,(269,'FLCCContractID','test_FLCCContractID')
		,(270,'FLCCReimbursementRate','test_FLCCReimbursementRate')
		,(271,'FLCCAssignmentEffectiveDate','test_FLCCAssignmentEffectiveDate')
		,(272,'FLCCAssignmentTerminationDate','test_FLCCAssignmentTerminationDate')
		,(273,'ProviderMedicaidLicenseID1','test_ProviderMedicaidLicenseID1')
		,(274,'ProviderMedicaidLicenseState1','test_ProviderMedicaidLicenseState1')
		,(275,'ProviderMedicaidLicenseEffectiveDate1','test_ProviderMedicaidLicenseEffectiveDate1')
		,(276,'ProviderMedicaidLicenseTerminationDate1','test_ProviderMedicaidLicenseTerminationDate1')
		,(277,'ProviderStateLicenseID1','test_ProviderStateLicenseID1')
		,(278,'ProviderStateLicenseState1','test_ProviderStateLicenseState1')
		,(279,'ProviderStateLicenseType1','test_ProviderStateLicenseType1')
		,(280,'ProviderStateLicenseEffectiveDate1','test_ProviderStateLicenseEffectiveDate1')
		,(281,'ProviderStateLicenseTerminationDate1','test_ProviderStateLicenseTerminationDate1')
		,(282,'PLStateReportingProviderTypePrimary','test_PLStateReportingProviderTypePrimary')
		,(283,'PLStateReportingProviderSpecialtyPrimary','test_PLStateReportingProviderSpecialtyPrimary')
		,(284,'PLStateReportingProviderType1','test_PLStateReportingProviderType1')
		,(285,'PLStateReportingProviderSpecialty1','test_PLStateReportingProviderSpecialty1')
		,(286,'PLStateReportingProviderType2','test_PLStateReportingProviderType2')
		,(287,'PLStateReportingProviderSpecialty2','test_PLStateReportingProviderSpecialty2')
		,(288,'PLStateReportingProviderType3','test_PLStateReportingProviderType3')
		,(289,'PLStateReportingProviderSpecialty3','test_PLStateReportingProviderSpecialty3')
		,(290,'PLAdditionalSpecialty4','test_PLAdditionalSpecialty4')
		,(291,'PLStateReportingProviderType4','test_PLStateReportingProviderType4')
		,(292,'PLStateReportingProviderSpecialty4','test_PLStateReportingProviderSpecialty4')
		,(293,'PLAdditionalSpecialty5','test_PLAdditionalSpecialty5')
		,(294,'PLStateReportingProviderType5','test_PLStateReportingProviderType5')
		,(295,'PLStateReportingProviderSpecialty5','test_PLStateReportingProviderSpecialty5')
		,(296,'PLAdditionalSpecialty6','test_PLAdditionalSpecialty6')
		,(297,'PLStateReportingProviderType6','test_PLStateReportingProviderType6')
		,(298,'PLStateReportingProviderSpecialty6','test_PLStateReportingProviderSpecialty6')
		,(299,'PLAdditionalSpecialty7','test_PLAdditionalSpecialty7')
		,(300,'PLStateReportingProviderType7','test_PLStateReportingProviderType7')
		,(301,'PLStateReportingProviderSpecialty7','test_PLStateReportingProviderSpecialty7')
		,(302,'PLAdditionalSpecialty8','test_PLAdditionalSpecialty8')
		,(303,'PLStateReportingProviderType8','test_PLStateReportingProviderType8')
		,(304,'PLStateReportingProviderSpecialty8','test_PLStateReportingProviderSpecialty8')
		,(305,'PLAdditionalSpecialty9','test_PLAdditionalSpecialty9')
		,(306,'PLStateReportingProviderType9','test_PLStateReportingProviderType9')
		,(307,'PLStateReportingProviderSpecialty9','test_PLStateReportingProviderSpecialty9')
		,(308,'PLAcceptsNewPatients','test_PLAcceptsNewPatients')
		,(309,'PhysHospRelNPI1','test_PhysHospRelNPI1')
		,(310,'PhysHospRelEffectiveDate1','test_PhysHospRelEffectiveDate1')
		,(311,'PhysHospRelTerminationDate1','test_PhysHospRelTerminationDate1')
		,(312,'PhysHospRelType1','test_PhysHospRelType1')
		,(313,'PhysHospRelPrintInDirectory1','test_PhysHospRelPrintInDirectory1')
		,(314,'PhysHospRelNPI2','test_PhysHospRelNPI2')
		,(315,'PhysHospRelEffectiveDate2','test_PhysHospRelEffectiveDate2')
		,(316,'PhysHospRelTerminationDate2','test_PhysHospRelTerminationDate2')
		,(317,'PhysHospRelType2','test_PhysHospRelType2')
		,(318,'PhysHospRelPrintInDirectory2','test_PhysHospRelPrintInDirectory2')
		,(319,'PhysHospRelNPI3','test_PhysHospRelNPI3')
		,(320,'PhysHospRelEffectiveDate3','test_PhysHospRelEffectiveDate3')
		,(321,'PhysHospRelTerminationDate3','test_PhysHospRelTerminationDate3')
		,(322,'PhysHospRelType3','test_PhysHospRelType3')
		,(323,'PhysHospRelPrintInDirectory3','test_PhysHospRelPrintInDirectory3')
		,(324,'PhysHospRelNPI4','test_PhysHospRelNPI4')
		,(325,'PhysHospRelEffectiveDate4','test_PhysHospRelEffectiveDate4')
		,(326,'PhysHospRelTerminationDate4','test_PhysHospRelTerminationDate4')
		,(327,'PhysHospRelType4','test_PhysHospRelType4')
		,(328,'PhysHospRelPrintInDirectory4','test_PhysHospRelPrintInDirectory4')
		,(329,'PhysHospRelNPI5','test_PhysHospRelNPI5')
		,(330,'PhysHospRelEffectiveDate5','test_PhysHospRelEffectiveDate5')
		,(331,'PhysHospRelTerminationDate5','test_PhysHospRelTerminationDate5')
		,(332,'PhysHospRelType5','test_PhysHospRelType5')
		,(333,'PhysHospRelPrintInDirectory5','test_PhysHospRelPrintInDirectory5')
		,(334,'PLCCNetworkName','test_PLCCNetworkName')
		,(335,'PLCCSubnetworkName','test_PLCCSubnetworkName')
		,(336,'PLCCAffiliationID','test_PLCCAffiliationID')
		,(337,'PLCCContractID','test_PLCCContractID')
		,(338,'PLCCReimbursementRate','test_PLCCReimbursementRate')
		,(339,'PLCCAssignmentEffectiveDate','test_PLCCAssignmentEffectiveDate')
		,(340,'PLCCAssignmentTerminationDate','test_PLCCAssignmentTerminationDate')
		,(341,'IsPracticeValid','test_IsPracticeValid')
		,(342,'IsProviderValid','test_IsProviderValid')  

	set @loop_counter = 1
	while (@loop_counter <= 342)
		begin
			select @exist_col_name = exist_col_name from #pnm_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #pnm_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #ProviderNetworkMaster set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #ProviderNetworkMaster set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #ProviderNetworkMaster) = 0 alter table #ProviderNetworkMaster drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #ProviderNetworkMaster) = 0 alter table #ProviderNetworkMaster drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'ProviderNetworkMaster'
	select * from #ProviderNetworkMaster where Diff_flag = 1


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
	from [ProviderNetworkStaging].[dbo].[ProviderNetworkException] with (nolock)
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
	left join [ProviderNetworkStaging].[dbo].[StgPractice] p with (nolock) on t.[StgTableName] = 'StgPractice' 
																	and t.[StgTablePrimaryKey] = p.[StgPracticeKey]
	left join [ProviderNetworkStaging].[dbo].[StgPracticeBilling] pb with (nolock) on t.[StgTableName] = 'StgPracticeBilling' 
																			and t.[StgTablePrimaryKey] = pb.[StgPracticeBillingKey]
	left join [ProviderNetworkStaging].[dbo].[StgPracticeLocation] spl with (nolock) on t.[StgTableName] = 'StgPracticeLocation' 
																			  and t.[StgTablePrimaryKey] = spl.[StgPracticeLocationKey]
	left join [ProviderNetworkStaging].[dbo].[StgPracticeLocationLanguage] pll with (nolock) on t.[StgTableName] = 'StgPracticeLocationLanguage' 
																					  and t.[StgTablePrimaryKey] = pll.[StgPracticeLocationLanguageKey]
	left join [ProviderNetworkStaging].[dbo].[StgPracticeLocationCommunication] plc with (nolock) on t.[StgTableName] = 'StgPracticeLocationCommunication' 
																						   and t.[StgTablePrimaryKey] = plc.[StgPracticeLocationCommunicationKey]
	left join [ProviderNetworkStaging].[dbo].[StgPracticeLocationSpecialty] pls with (nolock) on t.[StgTableName] = 'StgPracticeLocationSpecialty' 
																					   and t.[StgTablePrimaryKey] = pls.[StgPracticeLocationSpecialtyKey]
	left join [ProviderNetworkStaging].[dbo].[StgPracticeLocationContractComponent] flcc with (nolock) on t.[StgTableName] = 'StgPracticeLocationContractComponent' 
																								and t.[StgTablePrimaryKey] = flcc.[StgPracticeLocationContractComponentKey]
	left join [ProviderNetworkStaging].[dbo].[StgPracticeLocationProvider] plp with (nolock) on t.[StgTableName] = 'StgPracticeLocationProvider' 
																					  and t.[StgTablePrimaryKey] = plp.[StgPracticeLocationProviderKey]
	left join [ProviderNetworkStaging].[dbo].[StgPracticeLocationProviderSpecialty] plps with (nolock) on t.[StgTableName] = 'StgPracticeLocationProviderSpecialty' 
																								and t.[StgTablePrimaryKey] = plps.[StgPracticeLocationProviderSpecialtyKey]
	left join [ProviderNetworkStaging].[dbo].[StgProviderNetworkMaster] pnm with (nolock) on t.[StgTableName] = 'StgProviderNetworkMaster' 
																				   and t.[StgTablePrimaryKey] = pnm.[StgProviderNetworkMasterKey]
	left join [ProviderNetworkStaging].[dbo].[StgProvider] pp with (nolock) on t.[StgTableName] = 'StgProvider' 
																	 and t.[StgTablePrimaryKey] = pp.[StgProviderKey]
	left join [ProviderNetworkStaging].[dbo].[StgProviderCredential] pc with (nolock) on t.[StgTableName] = 'StgProviderCredential' 
																			   and t.[StgTablePrimaryKey] = pc.[StgProviderCredentialKey]
	left join [ProviderNetworkStaging].[dbo].[StgProviderLanguage] pl with (nolock) on t.[StgTableName] = 'StgProviderLanguage' 
																			 and t.[StgTablePrimaryKey] = pl.[StgProviderLanguageKey]
	left join [ProviderNetworkStaging].[dbo].[StgProviderLocationContractComponent] plcc with (nolock) on t.[StgTableName] = 'StgProviderLocationContractComponent' 
																								and t.[StgTablePrimaryKey] = plcc.[StgProviderLocationContractComponentKey]
	left join [ProviderNetworkStaging].[dbo].[StgProviderLocationHospitalRelationship] plhr with (nolock) on t.[StgTableName] = 'StgProviderLocationHospitalRelationship' 
																								   and t.[StgTablePrimaryKey] = plhr.[StgProviderLocationHospitalRelationshipKey]
	left join [ProviderNetworkStaging].[dbo].[StgProviderSpecialty] ps with (nolock) on t.[StgTableName] = 'StgProviderSpecialty' 
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
	from [ProviderNetworkStaging].[dbo].[ProviderNetworkException] with (nolock)
	where [BatchID] = @BatchID

	update t
	set t.[Contract_ID] = cc.[ContractId]
	from #test_pne t
	join [ProviderNetworkStaging].[dbo].[StgContractComponent] cc with (nolock) on t.[StgTableName] = 'StgContractComponent' 
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
	left join [ProviderNetworkStaging].[dbo].[StgPractice] p with (nolock) on t.[StgTableName] = 'StgPractice' 
																	and t.[StgTablePrimaryKey] = p.[StgPracticeKey]
	left join [ProviderNetworkStaging].[dbo].[StgPracticeBilling] pb with (nolock) on t.[StgTableName] = 'StgPracticeBilling' 
																			and t.[StgTablePrimaryKey] = pb.[StgPracticeBillingKey]
	left join [ProviderNetworkStaging].[dbo].[StgPracticeLocation] spl with (nolock) on t.[StgTableName] = 'StgPracticeLocation' 
																			  and t.[StgTablePrimaryKey] = spl.[StgPracticeLocationKey]
	left join [ProviderNetworkStaging].[dbo].[StgPracticeLocationLanguage] pll with (nolock) on t.[StgTableName] = 'StgPracticeLocationLanguage' 
																					  and t.[StgTablePrimaryKey] = pll.[StgPracticeLocationLanguageKey]
	left join [ProviderNetworkStaging].[dbo].[StgPracticeLocationCommunication] plc with (nolock) on t.[StgTableName] = 'StgPracticeLocationCommunication' 
																						   and t.[StgTablePrimaryKey] = plc.[StgPracticeLocationCommunicationKey]
	left join [ProviderNetworkStaging].[dbo].[StgPracticeLocationSpecialty] pls with (nolock) on t.[StgTableName] = 'StgPracticeLocationSpecialty' 
																					   and t.[StgTablePrimaryKey] = pls.[StgPracticeLocationSpecialtyKey]
	left join [ProviderNetworkStaging].[dbo].[StgPracticeLocationContractComponent] flcc with (nolock) on t.[StgTableName] = 'StgPracticeLocationContractComponent' 
																								and t.[StgTablePrimaryKey] = flcc.[StgPracticeLocationContractComponentKey]
	left join [ProviderNetworkStaging].[dbo].[StgPracticeLocationProvider] plp with (nolock) on t.[StgTableName] = 'StgPracticeLocationProvider' 
																					  and t.[StgTablePrimaryKey] = plp.[StgPracticeLocationProviderKey]
	left join [ProviderNetworkStaging].[dbo].[StgPracticeLocationProviderSpecialty] plps with (nolock) on t.[StgTableName] = 'StgPracticeLocationProviderSpecialty' 
																								and t.[StgTablePrimaryKey] = plps.[StgPracticeLocationProviderSpecialtyKey]
	left join [ProviderNetworkStaging].[dbo].[StgProviderNetworkMaster] pnm with (nolock) on t.[StgTableName] = 'StgProviderNetworkMaster' 
																				   and t.[StgTablePrimaryKey] = pnm.[StgProviderNetworkMasterKey]
	left join [ProviderNetworkStaging].[dbo].[StgProvider] pp with (nolock) on t.[StgTableName] = 'StgProvider' 
																	 and t.[StgTablePrimaryKey] = pp.[StgProviderKey]
	left join [ProviderNetworkStaging].[dbo].[StgProviderCredential] pc with (nolock) on t.[StgTableName] = 'StgProviderCredential' 
																			   and t.[StgTablePrimaryKey] = pc.[StgProviderCredentialKey]
	left join [ProviderNetworkStaging].[dbo].[StgProviderLanguage] pl with (nolock) on t.[StgTableName] = 'StgProviderLanguage' 
																			 and t.[StgTablePrimaryKey] = pl.[StgProviderLanguageKey]
	left join [ProviderNetworkStaging].[dbo].[StgProviderLocationContractComponent] plcc with (nolock) on t.[StgTableName] = 'StgProviderLocationContractComponent' 
																								and t.[StgTablePrimaryKey] = plcc.[StgProviderLocationContractComponentKey]
	left join [ProviderNetworkStaging].[dbo].[StgProviderLocationHospitalRelationship] plhr with (nolock) on t.[StgTableName] = 'StgProviderLocationHospitalRelationship' 
																								   and t.[StgTablePrimaryKey] = plhr.[StgProviderLocationHospitalRelationshipKey]
	left join [ProviderNetworkStaging].[dbo].[StgProviderSpecialty] ps with (nolock) on t.[StgTableName] = 'StgProviderSpecialty' 
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
			
			set @sqlText1 = N'update #ProviderNetworkException set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where isnull('+@test_col_name+','''')=isnull('+@exist_col_name+','''')'
			set @sqlText2 = N'update #ProviderNetworkException set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #ProviderNetworkException) = 0 alter table #ProviderNetworkException drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #ProviderNetworkException) = 0 alter table #ProviderNetworkException drop column '+@exist_col_name

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
	from [ProviderNetworkStaging].[dbo].[StgContractComponent] with (nolock)
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
	from [ProviderNetworkStaging].[dbo].[StgContractComponent] with (nolock)
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
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #StgContractComponent) = 0 alter table #StgContractComponent drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #StgContractComponent) = 0 alter table #StgContractComponent drop column '+@exist_col_name

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
		from [ProviderNetwork].[dbo].[ContractComponent] e  with (nolock)
		full join [ProviderNetwork].[dbo].[ContractComponent] t  with (nolock) on e.[ContractId] = replace(t.[ContractId],'99999','99998')
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
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #ContractComponent) = 0 alter table #ContractComponent drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #ContractComponent) = 0 alter table #ContractComponent drop column '+@exist_col_name

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
		from [ProviderNetworkStaging].[dbo].[StgPractice] e with (nolock)
		full join [ProviderNetworkStaging].[dbo].[StgPractice] t with (nolock) on e.[PracticeNPI] = t.[PracticeNPI]
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
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #StgFacility) = 0 alter table #StgFacility drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #StgFacility) = 0 alter table #StgFacility drop column '+@exist_col_name

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
		from [ProviderNetwork].[dbo].[Practice] e with (nolock)
		full join [ProviderNetwork].[dbo].[Practice] t with (nolock) on e.[NPI] = replace(t.[NPI],'99999','99998')
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
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #Facility) = 0 alter table #Facility drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #Facility) = 0 alter table #Facility drop column '+@exist_col_name

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
	from [ProviderNetworkStaging].[dbo].[StgPracticeBilling] with (nolock)
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
	from [ProviderNetworkStaging].[dbo].[StgPracticeBilling] with (nolock)
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
		([PracticeNPI] varchar(10)
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
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #StgFacilityBilling) = 0 alter table #StgFacilityBilling drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #StgFacilityBilling) = 0 alter table #StgFacilityBilling drop column '+@exist_col_name

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
	from [ProviderNetwork].[dbo].[PracticeBilling] pb with (nolock)
	join [ProviderNetwork].[dbo].[Practice] p with (nolock) on p.[PracticeKey] = pb.[PracticeKey]
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
	from [ProviderNetwork].[dbo].[PracticeBilling] pb with (nolock)
	join [ProviderNetwork].[dbo].[Practice] p with (nolock) on p.[PracticeKey] = pb.[PracticeKey]
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
		([PracticeNPI] varchar(10)
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
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #FacilityBilling) = 0 alter table #FacilityBilling drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #FacilityBilling) = 0 alter table #FacilityBilling drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'OLTP Facility Billing'
	select * from #FacilityBilling where Diff_flag = 1


--############################## FACILITY LICENSE ##############################

	select [PracticeNPI]
		,[StgPracticeLicenseDetailsKey]
		,[PracticeLicenseID]
		,[PracticeLicenseState]
		,[PracticeLicenseType]
		,[PracticeLicenseEffectiveDate]
		,[PracticeLicenseTerminationDate]
		,[LicenseTypeKey]
		,[LicenseCategoryKey]
		,[RecordStatus]
		,[RecordStatusDescription]
		,cast(NULL as int) as [Rank]
	into #stgflic
	from [ProviderNetworkStaging].[dbo].[StgPracticeLicenseDetails] with (nolock)
	where [BatchID] = -5

	;with [orderRecord] as (select [PracticeNPI]
								,[StgPracticeLicenseDetailsKey]
								,[Rank]
								,rank() over (partition by [PracticeNPI] 
											  order by [StgPracticeLicenseDetailsKey]
											 ) as Rank_number 
							from #stgflic)
	update [orderRecord] set [Rank] = Rank_number

	select [PracticeNPI]
		,[StgPracticeLicenseDetailsKey]
		,[PracticeLicenseID]
		,[PracticeLicenseState]
		,[PracticeLicenseType]
		,[PracticeLicenseEffectiveDate]
		,[PracticeLicenseTerminationDate]
		,[LicenseTypeKey]
		,[LicenseCategoryKey]
		,[RecordStatus]
		,[RecordStatusDescription]
		,cast(NULL as int) as [Rank]
	into #test_stgflic
	from [ProviderNetworkStaging].[dbo].[StgPracticeLicenseDetails] with (nolock)
	where [BatchID] = @BatchID

	;with [orderRecord] as (select [PracticeNPI]
								,[StgPracticeLicenseDetailsKey]
								,[Rank]
								,rank() over (partition by [PracticeNPI] 
											  order by [StgPracticeLicenseDetailsKey]
											 ) as Rank_number 
							from #test_stgflic)
	update [orderRecord] set [Rank] = Rank_number

	create table #StgFacilityLicense
		([PracticeNPI] varchar(10)
		,[Diff_flag] bit
		,[PracticeLicenseID] varchar(255)		,[test_PracticeLicenseID] varchar(255)
		,[PracticeLicenseState] varchar(102)	,[test_PracticeLicenseState] varchar(102)
		,[PracticeLicenseType] varchar(355)		,[test_PracticeLicenseType] varchar(355)
		,[PracticeLicenseEffectiveDate] date	,[test_PracticeLicenseEffectiveDate] date
		,[PracticeLicenseTerminationDate] date	,[test_PracticeLicenseTerminationDate] date
		,[LicenseTypeKey] int					,[test_LicenseTypeKey] int
		,[LicenseCategoryKey] int				,[test_LicenseCategoryKey] int
		,[RecordStatus] varchar(2)				,[test_RecordStatus] varchar(2)
		,[RecordStatusDescription] varchar(100)	,[test_RecordStatusDescription] varchar(100)
		)

	insert into #StgFacilityLicense
		([PracticeNPI]
		,[PracticeLicenseID]				,[test_PracticeLicenseID]
		,[PracticeLicenseState]				,[test_PracticeLicenseState]
		,[PracticeLicenseType]				,[test_PracticeLicenseType]
		,[PracticeLicenseEffectiveDate]		,[test_PracticeLicenseEffectiveDate]
		,[PracticeLicenseTerminationDate]	,[test_PracticeLicenseTerminationDate]
		,[LicenseTypeKey]					,[test_LicenseTypeKey]
		,[LicenseCategoryKey]				,[test_LicenseCategoryKey]
		,[RecordStatus]						,[test_RecordStatus]
		,[RecordStatusDescription]			,[test_RecordStatusDescription]
		)
		select t.[PracticeNPI]
			,e.[PracticeLicenseID]				,t.[PracticeLicenseID]
			,e.[PracticeLicenseState]			,t.[PracticeLicenseState]
			,e.[PracticeLicenseType]			,t.[PracticeLicenseType]
			,e.[PracticeLicenseEffectiveDate]	,t.[PracticeLicenseEffectiveDate]
			,e.[PracticeLicenseTerminationDate]	,t.[PracticeLicenseTerminationDate]
			,e.[LicenseTypeKey]					,t.[LicenseTypeKey]
			,e.[LicenseCategoryKey]				,t.[LicenseCategoryKey]
			,e.[RecordStatus]					,t.[RecordStatus]
			,e.[RecordStatusDescription]		,t.[RecordStatusDescription]
		from #stgflic e
		full join #test_stgflic t on e.[PracticeNPI] = t.[PracticeNPI]
										and e.[Rank] = t.[Rank]

	--select * from #StgFacilityLicense
	
	create table #stgflic_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #stgflic_names values
		 (1,'PracticeLicenseID','test_PracticeLicenseID')
		,(2,'PracticeLicenseState','test_PracticeLicenseState')
		,(3,'PracticeLicenseType','test_PracticeLicenseType')
		,(4,'PracticeLicenseEffectiveDate','test_PracticeLicenseEffectiveDate')
		,(5,'PracticeLicenseTerminationDate','test_PracticeLicenseTerminationDate')
		,(6,'LicenseTypeKey','test_LicenseTypeKey')
		,(7,'LicenseCategoryKey','test_LicenseCategoryKey')
		,(8,'RecordStatus','test_RecordStatus')
		,(9,'RecordStatusDescription','test_RecordStatusDescription')

	set @loop_counter = 1
	while (@loop_counter <= 9)
		begin
			select @exist_col_name = exist_col_name from #stgflic_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #stgflic_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #StgFacilityLicense set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #StgFacilityLicense set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #StgFacilityLicense) = 0 alter table #StgFacilityLicense drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #StgFacilityLicense) = 0 alter table #StgFacilityLicense drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'StgFacilityLicense'
	select * from #StgFacilityLicense where Diff_flag = 1

	select p.[NPI], pld.[PracticeLicenseDetailsKey]
		,cast(NULL as int) as [Rank]
		,pld.[LicenseTypeKey]
		,pld.[LicenseCategoryKey]
		,pld.[LicenseNumber]
		,pld.[StateCode]
		,pld.[EffectiveDate]
		,pld.[TerminationDate]
		,pld.[IsActive]
	into #flic
	from [ProviderNetwork].[dbo].[PracticeLicenseDetails] pld
	join [ProviderNetwork].[dbo].[Practice] p with (nolock) on p.[PracticeKey] = pld.[PracticeKey]
	where p.[NPI] like '99998%'

	;with [orderRecord] as (select [NPI]
								,[PracticeLicenseDetailsKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [PracticeLicenseDetailsKey]
											 ) as Rank_number 
							from #flic)
	update [orderRecord] set [Rank] = Rank_number

	select p.[NPI], pld.[PracticeLicenseDetailsKey]
		,cast(NULL as int) as [Rank]
		,pld.[LicenseTypeKey]
		,pld.[LicenseCategoryKey]
		,pld.[LicenseNumber]
		,pld.[StateCode]
		,pld.[EffectiveDate]
		,pld.[TerminationDate]
		,pld.[IsActive]
	into #test_flic
	from [ProviderNetwork].[dbo].[PracticeLicenseDetails] pld
	join [ProviderNetwork].[dbo].[Practice] p with (nolock) on p.[PracticeKey] = pld.[PracticeKey]
	where p.[NPI] like '99999%'

	;with [orderRecord] as (select [NPI]
								,[PracticeLicenseDetailsKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [PracticeLicenseDetailsKey]
											 ) as Rank_number 
							from #test_flic)
	update [orderRecord] set [Rank] = Rank_number

	create table #FacilityLicense
		([NPI] varchar(10)
		,[Diff_flag] bit
		,[LicenseTypeKey] int			,[test_LicenseTypeKey] int
		,[LicenseCategoryKey] int		,[test_LicenseCategoryKey] int
		,[LicenseNumber] varchar(255)	,[test_LicenseNumber] varchar(255)
		,[StateCode] char(2)			,[test_StateCode] char(2)
		,[EffectiveDate] datetime		,[test_EffectiveDate] datetime
		,[TerminationDate] datetime		,[test_TerminationDate] datetime
		,[IsActive] bit					,[test_IsActive] bit
		)

	insert into #FacilityLicense
		([NPI]
		,[LicenseTypeKey]		,[test_LicenseTypeKey]
		,[LicenseCategoryKey]	,[test_LicenseCategoryKey]
		,[LicenseNumber]		,[test_LicenseNumber]
		,[StateCode]			,[test_StateCode]
		,[EffectiveDate]		,[test_EffectiveDate]
		,[TerminationDate]		,[test_TerminationDate]
		,[IsActive]				,[test_IsActive]
		)
		select t.[NPI]
			,e.[LicenseTypeKey]		,t.[LicenseTypeKey]
			,e.[LicenseCategoryKey]	,t.[LicenseCategoryKey]
			,e.[LicenseNumber]		,t.[LicenseNumber]
			,e.[StateCode]			,t.[StateCode]
			,e.[EffectiveDate]		,t.[EffectiveDate]
			,e.[TerminationDate]	,t.[TerminationDate]
			,e.[IsActive]			,t.[IsActive]
		from #flic e
		full join #test_flic t on e.[NPI] = replace(t.[NPI],'99999','99998')
							 and e.[Rank] = t.[Rank]

	--select * from #FacilityLicense
	
	create table #flic_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #flic_names values
		 (1,'LicenseTypeKey','test_LicenseTypeKey')
		,(2,'LicenseCategoryKey','test_LicenseCategoryKey')
		,(3,'LicenseNumber','test_LicenseNumber')
		,(4,'StateCode','test_StateCode')
		,(5,'EffectiveDate','test_EffectiveDate')
		,(6,'TerminationDate','test_TerminationDate')
		,(7,'IsActive','test_IsActive')

	set @loop_counter = 1
	while (@loop_counter <= 7)
		begin
			select @exist_col_name = exist_col_name from #flic_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #flic_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #FacilityLicense set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #FacilityLicense set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #FacilityLicense) = 0 alter table #FacilityLicense drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #FacilityLicense) = 0 alter table #FacilityLicense drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'OLTP Facility License'
	select * from #FacilityLicense where Diff_flag = 1


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
	from [ProviderNetworkStaging].[dbo].[StgPracticeLocation] with (nolock)
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
	from [ProviderNetworkStaging].[dbo].[StgPracticeLocation] with (nolock)
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
		([PracticeNPI] varchar(10)
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
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #StgFacilityLocation) = 0 alter table #StgFacilityLocation drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #StgFacilityLocation) = 0 alter table #StgFacilityLocation drop column '+@exist_col_name

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
	from [ProviderNetwork].[dbo].[PracticeLocation] pl with (nolock)
	join [ProviderNetwork].[dbo].[Practice] p with (nolock) on p.[PracticeKey] = pl.[PracticeKey]
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
	from [ProviderNetwork].[dbo].[PracticeLocation] pl with (nolock)
	join [ProviderNetwork].[dbo].[Practice] p with (nolock) on p.[PracticeKey] = pl.[PracticeKey]
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
		([NPI] varchar(10)
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
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #FacilityLocation) = 0 alter table #FacilityLocation drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #FacilityLocation) = 0 alter table #FacilityLocation drop column '+@exist_col_name

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
	from [ProviderNetworkStaging].[dbo].[StgPracticeLocationCommunication] with (nolock)
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
	from [ProviderNetworkStaging].[dbo].[StgPracticeLocationCommunication] with (nolock)
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
		([PracticeNPI] varchar(10)
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
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #StgFacilityLocationCommunication) = 0 alter table #StgFacilityLocationCommunication drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #StgFacilityLocationCommunication) = 0 alter table #StgFacilityLocationCommunication drop column '+@exist_col_name

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
	from [ProviderNetwork].[dbo].[PracticeLocationCommunication] plc with (nolock)
	join [ProviderNetwork].[dbo].[PracticeLocation] pl with (nolock) on pl.[PracticeLocationKey] = plc.[PracticeLocationKey]
	join [ProviderNetwork].[dbo].[Practice] p with (nolock) on p.[PracticeKey] = pl.[PracticeKey]
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
	from [ProviderNetwork].[dbo].[PracticeLocationCommunication] plc with (nolock)
	join [ProviderNetwork].[dbo].[PracticeLocation] pl with (nolock) on pl.[PracticeLocationKey] = plc.[PracticeLocationKey]
	join [ProviderNetwork].[dbo].[Practice] p with (nolock) on p.[PracticeKey] = pl.[PracticeKey]
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
		([NPI] varchar(10)
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
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #FacilityLocationCommunication) = 0 alter table #FacilityLocationCommunication drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #FacilityLocationCommunication) = 0 alter table #FacilityLocationCommunication drop column '+@exist_col_name

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
	from [ProviderNetworkStaging].[dbo].[StgPracticeLocationContractComponent] with (nolock)
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
	from [ProviderNetworkStaging].[dbo].[StgPracticeLocationContractComponent] with (nolock)
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
		([PracticeNPI] varchar(10)
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
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #StgFacilityLocationContractComponent) = 0 alter table #StgFacilityLocationContractComponent drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #StgFacilityLocationContractComponent) = 0 alter table #StgFacilityLocationContractComponent drop column '+@exist_col_name

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
	from [ProviderNetwork].[dbo].[PracticeLocationContractComponent] plcc with (nolock)
	join [ProviderNetwork].[dbo].[PracticeLocation] pl with (nolock) on pl.[PracticeLocationKey] = plcc.[PracticeLocationKey]
	join [ProviderNetwork].[dbo].[Practice] p with (nolock) on p.[PracticeKey] = pl.[PracticeKey]
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
	from [ProviderNetwork].[dbo].[PracticeLocationContractComponent] plcc with (nolock)
	join [ProviderNetwork].[dbo].[PracticeLocation] pl with (nolock) on pl.[PracticeLocationKey] = plcc.[PracticeLocationKey]
	join [ProviderNetwork].[dbo].[Practice] p with (nolock) on p.[PracticeKey] = pl.[PracticeKey]
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
		([NPI] varchar(10)
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
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #FacilityLocationContractComponent) = 0 alter table #FacilityLocationContractComponent drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #FacilityLocationContractComponent) = 0 alter table #FacilityLocationContractComponent drop column '+@exist_col_name

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
	from [ProviderNetworkStaging].[dbo].[StgPracticeLocationLanguage] with (nolock)
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
	from [ProviderNetworkStaging].[dbo].[StgPracticeLocationLanguage] with (nolock)
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
		([PracticeNPI] varchar(10)
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
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #StgFacilityLocationLanguage) = 0 alter table #StgFacilityLocationLanguage drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #StgFacilityLocationLanguage) = 0 alter table #StgFacilityLocationLanguage drop column '+@exist_col_name

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
	from [ProviderNetwork].[dbo].[PracticeLocationLanguage] pll with (nolock)
	join [ProviderNetwork].[dbo].[PracticeLocation] pl with (nolock) on pl.[PracticeLocationKey] = pll.[PracticeLocationKey]
	join [ProviderNetwork].[dbo].[Practice] p with (nolock) on p.[PracticeKey] = pl.[PracticeKey]
	where p.[NPI] like '99998%'

	;with [orderRecord] as (select [NPI]
								,[Language]
								,[Priority]
								,[PracticeLocationLanguageKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [Language]
													  ,[Priority]
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
	from [ProviderNetwork].[dbo].[PracticeLocationLanguage] pll with (nolock)
	join [ProviderNetwork].[dbo].[PracticeLocation] pl with (nolock) on pl.[PracticeLocationKey] = pll.[PracticeLocationKey]
	join [ProviderNetwork].[dbo].[Practice] p with (nolock) on p.[PracticeKey] = pl.[PracticeKey]
	where p.[NPI] like '99999%'

	;with [orderRecord] as (select [NPI]
								,[Language]
								,[Priority]
								,[PracticeLocationLanguageKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [Language]
													  ,[Priority]
													  ,[PracticeLocationLanguageKey]
											 ) as Rank_number 
							from #test_fll)
	update [orderRecord] set [Rank] = Rank_number

	create table #FacilityLocationLanguage
		([NPI] varchar(10)
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
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #FacilityLocationLanguage) = 0 alter table #FacilityLocationLanguage drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #FacilityLocationLanguage) = 0 alter table #FacilityLocationLanguage drop column '+@exist_col_name

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
	from [ProviderNetworkStaging].[dbo].[StgPracticeLocationSpecialty] with (nolock)
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
	from [ProviderNetworkStaging].[dbo].[StgPracticeLocationSpecialty] with (nolock)
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
		([PracticeNPI] varchar(10)
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
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #StgFacilityLocationSpecialty) = 0 alter table #StgFacilityLocationSpecialty drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #StgFacilityLocationSpecialty) = 0 alter table #StgFacilityLocationSpecialty drop column '+@exist_col_name

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
	from [ProviderNetwork].[dbo].[PracticeLocationSpecialty] pls with (nolock)
	join [ProviderNetwork].[dbo].[PracticeLocation] pl with (nolock) on pl.[PracticeLocationKey] = pls.[PracticeLocationKey]
	join [ProviderNetwork].[dbo].[Practice] p with (nolock) on p.[PracticeKey] = pl.[PracticeKey]
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
	from [ProviderNetwork].[dbo].[PracticeLocationSpecialty] pls with (nolock)
	join [ProviderNetwork].[dbo].[PracticeLocation] pl with (nolock) on pl.[PracticeLocationKey] = pls.[PracticeLocationKey]
	join [ProviderNetwork].[dbo].[Practice] p with (nolock) on p.[PracticeKey] = pl.[PracticeKey]
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
		([NPI] varchar(10)
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
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #FacilityLocationSpecialty) = 0 alter table #FacilityLocationSpecialty drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #FacilityLocationSpecialty) = 0 alter table #FacilityLocationSpecialty drop column '+@exist_col_name

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
	from [ProviderNetworkStaging].[dbo].[StgPracticeLocationType] with (nolock)
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
	from [ProviderNetworkStaging].[dbo].[StgPracticeLocationType] with (nolock)
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
		([PracticeNPI] varchar(10)
		,[Diff_flag] bit
		,[PracticeSubpartNPI] varchar(10)		,[test_PracticeSubpartNPI] varchar(10)
		,[LocationName] varchar(255)			,[test_LocationName] varchar(255)
		,[LocationType] varchar(255)			,[test_LocationType] varchar(255)
		,[LocationTypeKey] int					,[test_LocationTypeKey] int
		,[RecordStatus] varchar(2)				,[test_RecordStatus] varchar(2)
		,[RecordStatusDescription] varchar(100),[test_RecordStatusDescription] varchar(100)
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

	--select * from #StgFacilityLocationType

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
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #StgFacilityLocationType) = 0 alter table #StgFacilityLocationType drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #StgFacilityLocationType) = 0 alter table #StgFacilityLocationType drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'StgFacilityLocationType'
	select * from #StgFacilityLocationType where Diff_flag = 1

	select p.[NPI], plt.[PracticeLocationTypeKey]
		,cast(NULL as int) as [Rank]
		,plt.[LocationTypeKey]
	into #flt
	from [ProviderNetwork].[dbo].[PracticeLocationType] plt with (nolock)
	join [ProviderNetwork].[dbo].[PracticeLocation] pl with (nolock) on pl.[PracticeLocationKey] = plt.[PracticeLocationKey]
	join [ProviderNetwork].[dbo].[Practice] p with (nolock) on p.[PracticeKey] = pl.[PracticeKey]
	where p.[NPI] like '99998%'

	;with [orderRecord] as (select [NPI]
								,[PracticeLocationTypeKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [PracticeLocationTypeKey]
											 ) as Rank_number 
							from #flt)
	update [orderRecord] set [Rank] = Rank_number

	select p.[NPI], plt.[PracticeLocationTypeKey]
		,cast(NULL as int) as [Rank]
		,plt.[LocationTypeKey]
	into #test_flt
	from [ProviderNetwork].[dbo].[PracticeLocationType] plt with (nolock)
	join [ProviderNetwork].[dbo].[PracticeLocation] pl with (nolock) on pl.[PracticeLocationKey] = plt.[PracticeLocationKey]
	join [ProviderNetwork].[dbo].[Practice] p with (nolock) on p.[PracticeKey] = pl.[PracticeKey]
	where p.[NPI] like '99999%'

	;with [orderRecord] as (select [NPI]
								,[PracticeLocationTypeKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [PracticeLocationTypeKey]
											 ) as Rank_number 
							from #test_flt)
	update [orderRecord] set [Rank] = Rank_number

	create table #FacilityLocationType
		([NPI] varchar(10)
		,[Diff_flag] bit
		,[LocationTypeKey] int	,[test_LocationTypeKey] int
		)

	insert into #FacilityLocationType
		([NPI]
		,[LocationTypeKey]	,[test_LocationTypeKey]
		)
		select t.[NPI]
			,e.[LocationTypeKey] ,t.[LocationTypeKey]
		from #flt e
		full join #test_flt t on e.[NPI] = replace(t.[NPI],'99999','99998')
							and e.[Rank] = t.[Rank]

	--select * from #FacilityLocationType
	
	update #FacilityLocationType set [LocationTypeKey] = NULL, [test_LocationTypeKey] = NULL where [LocationTypeKey] = [test_LocationTypeKey]

	update #FacilityLocationType set [Diff_flag] = 1 where isnull([LocationTypeKey],'') <> isnull([test_LocationTypeKey],'')

	if (select count(distinct [LocationTypeKey]) from #FacilityLocationType) = 0 alter table #FacilityLocationType drop column [LocationTypeKey]

	if (select count(distinct [test_LocationTypeKey]) from #FacilityLocationType) = 0 alter table #FacilityLocationType drop column [test_LocationTypeKey]

	select 'OLTP Facility Location Type'
	select * from #FacilityLocationType where Diff_flag = 1


--############################## PROVIDER ##############################

	select [ProviderNPI]
		,[StgProviderKey]
		,[FirstName]
		,[LastName]
		,[MiddleName]
		,[Suffix]
		,[Gender]
		,[DateofBirth]
		,[ApplicationCompleteDate]
		,[CredentialingApprovedDate]
		,[PhoneNumber]
		,[Email]
		,[FaxNumber]
		,[IsPCP]
		,[ProviderPrimarySpecialtyCode]
		,[ProviderAdditionalSpecialty1]
		,[ProviderAdditionalSpecialty2]
		,[ProviderAdditionalSpecialty3]
		,[AdditionalSpecialtyKey1]
		,[AdditionalSpecialtyKey2]
		,[AdditionalSpecialtyKey3]
		,[ProviderlicBoardCertID]
		,[ProviderlicBoardCertEffectiveDate]
		,[ProviderlicBoardCertTerminationDate]
		,[SpecialtyKey]
		,[RecordStatus]
		,[RecordStatusDescription]
		,cast(NULL as int) as [Rank]
	into #stgp
	from [ProviderNetworkStaging].[dbo].[StgProvider] with (nolock)
	where [BatchID] = -5

	;with [orderRecord] as (select [ProviderNPI]
								,[StgProviderKey]
								,[Rank]
								,rank() over (partition by [ProviderNPI] 
											  order by [StgProviderKey]
											 ) as Rank_number 
							from #stgp)
	update [orderRecord] set [Rank] = Rank_number

	select [ProviderNPI]
		,[StgProviderKey]
		,[FirstName]
		,[LastName]
		,[MiddleName]
		,[Suffix]
		,[Gender]
		,[DateofBirth]
		,[ApplicationCompleteDate]
		,[CredentialingApprovedDate]
		,[PhoneNumber]
		,[Email]
		,[FaxNumber]
		,[IsPCP]
		,[ProviderPrimarySpecialtyCode]
		,[ProviderAdditionalSpecialty1]
		,[ProviderAdditionalSpecialty2]
		,[ProviderAdditionalSpecialty3]
		,[AdditionalSpecialtyKey1]
		,[AdditionalSpecialtyKey2]
		,[AdditionalSpecialtyKey3]
		,[ProviderlicBoardCertID]
		,[ProviderlicBoardCertEffectiveDate]
		,[ProviderlicBoardCertTerminationDate]
		,[SpecialtyKey]
		,[RecordStatus]
		,[RecordStatusDescription]
		,cast(NULL as int) as [Rank]
	into #test_stgp
	from [ProviderNetworkStaging].[dbo].[StgProvider] with (nolock)
	where [BatchID] = @BatchID

	;with [orderRecord] as (select [ProviderNPI]
								,[StgProviderKey]
								,[Rank]
								,rank() over (partition by [ProviderNPI] 
											  order by [StgProviderKey]
											 ) as Rank_number 
							from #test_stgp)
	update [orderRecord] set [Rank] = Rank_number

	create table #StgProvider
		([ProviderNPI] varchar(10)
		,[Diff_flag] bit
		,[FirstName] varchar(255)						,[test_FirstName] varchar(255)
		,[LastName] varchar(255)						,[test_LastName] varchar(255)
		,[MiddleName] varchar(255)						,[test_MiddleName] varchar(255)
		,[Suffix] varchar(10)							,[test_Suffix] varchar(10)
		,[Gender] varchar(1)							,[test_Gender] varchar(1)
		,[DateofBirth] date								,[test_DateofBirth] date
		,[ApplicationCompleteDate] date					,[test_ApplicationCompleteDate] date
		,[CredentialingApprovedDate] date				,[test_CredentialingApprovedDate] date
		,[PhoneNumber]  varchar(20)						,[test_PhoneNumber]  varchar(20)
		,[Email] varchar(1000)							,[test_Email] varchar(1000)
		,[FaxNumber] varchar(20)						,[test_FaxNumber] varchar(20)
		,[IsPCP] varchar(1)								,[test_IsPCP] varchar(1)
		,[ProviderPrimarySpecialtyCode] varchar(10)		,[test_ProviderPrimarySpecialtyCode] varchar(10)
		,[ProviderAdditionalSpecialty1] varchar(10)		,[test_ProviderAdditionalSpecialty1] varchar(10)
		,[ProviderAdditionalSpecialty2] varchar(10)		,[test_ProviderAdditionalSpecialty2] varchar(10)
		,[ProviderAdditionalSpecialty3] varchar(10)		,[test_ProviderAdditionalSpecialty3] varchar(10)
		,[AdditionalSpecialtyKey1] int					,[test_AdditionalSpecialtyKey1] int
		,[AdditionalSpecialtyKey2] int					,[test_AdditionalSpecialtyKey2] int
		,[AdditionalSpecialtyKey3] int					,[test_AdditionalSpecialtyKey3] int
		,[ProviderlicBoardCertID] varchar(255)			,[test_ProviderlicBoardCertID] varchar(255)
		,[ProviderlicBoardCertEffectiveDate] date		,[test_ProviderlicBoardCertEffectiveDate] date
		,[ProviderlicBoardCertTerminationDate] date		,[test_ProviderlicBoardCertTerminationDate] date
		,[SpecialtyKey] int								,[test_SpecialtyKey] int
		,[RecordStatus] varchar(2)						,[test_RecordStatus] varchar(2)
		,[RecordStatusDescription] varchar(100)			,[test_RecordStatusDescription] varchar(100)
		)

	insert into #StgProvider
		([ProviderNPI]
		,[FirstName]							,[test_FirstName]
		,[LastName]								,[test_LastName]
		,[MiddleName]							,[test_MiddleName]
		,[Suffix]								,[test_Suffix]
		,[Gender]								,[test_Gender]
		,[DateofBirth]							,[test_DateofBirth]
		,[ApplicationCompleteDate]				,[test_ApplicationCompleteDate]
		,[CredentialingApprovedDate]			,[test_CredentialingApprovedDate]
		,[PhoneNumber]							,[test_PhoneNumber]
		,[Email]								,[test_Email]
		,[FaxNumber]							,[test_FaxNumber]
		,[IsPCP]								,[test_IsPCP]
		,[ProviderPrimarySpecialtyCode]			,[test_ProviderPrimarySpecialtyCode]
		,[ProviderAdditionalSpecialty1]			,[test_ProviderAdditionalSpecialty1]
		,[ProviderAdditionalSpecialty2]			,[test_ProviderAdditionalSpecialty2]
		,[ProviderAdditionalSpecialty3]			,[test_ProviderAdditionalSpecialty3]
		,[AdditionalSpecialtyKey1]				,[test_AdditionalSpecialtyKey1]
		,[AdditionalSpecialtyKey2]				,[test_AdditionalSpecialtyKey2]
		,[AdditionalSpecialtyKey3]				,[test_AdditionalSpecialtyKey3]
		,[ProviderlicBoardCertID]				,[test_ProviderlicBoardCertID]
		,[ProviderlicBoardCertEffectiveDate]	,[test_ProviderlicBoardCertEffectiveDate]
		,[ProviderlicBoardCertTerminationDate]	,[test_ProviderlicBoardCertTerminationDate]
		,[SpecialtyKey]							,[test_SpecialtyKey]
		,[RecordStatus]							,[test_RecordStatus]
		,[RecordStatusDescription]				,[test_RecordStatusDescription]
		)
		select t.[ProviderNPI]
			,e.[FirstName]								,t.[FirstName]
			,e.[LastName]								,t.[LastName]
			,e.[MiddleName]								,t.[MiddleName]
			,e.[Suffix]									,t.[Suffix]
			,e.[Gender]									,t.[Gender]
			,e.[DateofBirth]							,t.[DateofBirth]
			,e.[ApplicationCompleteDate]				,t.[ApplicationCompleteDate]
			,e.[CredentialingApprovedDate]				,t.[CredentialingApprovedDate]
			,e.[PhoneNumber]							,t.[PhoneNumber]
			,e.[Email]									,t.[Email]
			,e.[FaxNumber]								,t.[FaxNumber]
			,e.[IsPCP]									,t.[IsPCP]
			,e.[ProviderPrimarySpecialtyCode]			,t.[ProviderPrimarySpecialtyCode]
			,e.[ProviderAdditionalSpecialty1]			,t.[ProviderAdditionalSpecialty1]
			,e.[ProviderAdditionalSpecialty2]			,t.[ProviderAdditionalSpecialty2]
			,e.[ProviderAdditionalSpecialty3]			,t.[ProviderAdditionalSpecialty3]
			,e.[AdditionalSpecialtyKey1]				,t.[AdditionalSpecialtyKey1]
			,e.[AdditionalSpecialtyKey2]				,t.[AdditionalSpecialtyKey2]
			,e.[AdditionalSpecialtyKey3]				,t.[AdditionalSpecialtyKey3]
			,e.[ProviderlicBoardCertID]					,t.[ProviderlicBoardCertID]
			,e.[ProviderlicBoardCertEffectiveDate]		,t.[ProviderlicBoardCertEffectiveDate]
			,e.[ProviderlicBoardCertTerminationDate]	,t.[ProviderlicBoardCertTerminationDate]
			,e.[SpecialtyKey]							,t.[SpecialtyKey]
			,e.[RecordStatus]							,t.[RecordStatus]
			,e.[RecordStatusDescription]				,t.[RecordStatusDescription]
		from #stgp e
		full join #test_stgp t on e.[ProviderNPI] = t.[ProviderNPI]
									 and e.[Rank] = t.[Rank]

	--select * from #StgProvider

	create table #stgp_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #stgp_names values
		 (1,'FirstName','test_FirstName')
		,(2,'LastName','test_LastName')
		,(3,'MiddleName','test_MiddleName')
		,(4,'Suffix','test_Suffix')
		,(5,'Gender','test_Gender')
		,(6,'DateofBirth','test_DateofBirth')
		,(7,'ApplicationCompleteDate','test_ApplicationCompleteDate')
		,(8,'CredentialingApprovedDate','test_CredentialingApprovedDate')
		,(9,'PhoneNumber','test_PhoneNumber')
		,(10,'Email','test_Email')
		,(11,'FaxNumber','test_FaxNumber')
		,(12,'IsPCP','test_IsPCP')
		,(13,'ProviderPrimarySpecialtyCode','test_ProviderPrimarySpecialtyCode')
		,(14,'ProviderAdditionalSpecialty1','test_ProviderAdditionalSpecialty1')
		,(15,'ProviderAdditionalSpecialty2','test_ProviderAdditionalSpecialty2')
		,(16,'ProviderAdditionalSpecialty3','test_ProviderAdditionalSpecialty3')
		,(17,'AdditionalSpecialtyKey1','test_AdditionalSpecialtyKey1')
		,(18,'AdditionalSpecialtyKey2','test_AdditionalSpecialtyKey2')
		,(19,'AdditionalSpecialtyKey3','test_AdditionalSpecialtyKey3')
		,(20,'ProviderlicBoardCertID','test_ProviderlicBoardCertID')
		,(21,'ProviderlicBoardCertEffectiveDate','test_ProviderlicBoardCertEffectiveDate')
		,(22,'ProviderlicBoardCertTerminationDate','test_ProviderlicBoardCertTerminationDate')
		,(23,'SpecialtyKey','test_SpecialtyKey')
		,(24,'RecordStatus','test_RecordStatus')
		,(25,'RecordStatusDescription','test_RecordStatusDescription')

	set @loop_counter = 1
	while (@loop_counter <= 25)
		begin
			select @exist_col_name = exist_col_name from #stgp_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #stgp_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #StgProvider set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #StgProvider set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #StgProvider) = 0 alter table #StgProvider drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #StgProvider) = 0 alter table #StgProvider drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'StgProvider'
	select * from #StgProvider where Diff_flag = 1

	create table #Provider
		([NPI] varchar(10)
		,[Diff_flag] bit
		,[FirstName] varchar(255)				,[test_FirstName] varchar(255)
		,[LastName] varchar(255)				,[test_LastName] varchar(255)
		,[MiddleName] varchar(255)				,[test_MiddleName] varchar(255)
		,[Suffix] varchar(10)					,[test_Suffix] varchar(10)
		,[Salutation] varchar(10)				,[test_Salutation] varchar(10)
		,[Gender] char(1)						,[test_Gender] char(1)
		,[DateofBirth] date						,[test_DateofBirth] date
		,[PhoneNumber] varchar(20)				,[test_PhoneNumber] varchar(20)
		,[Email] varchar(1000)					,[test_Email] varchar(1000)
		,[FaxNumber] varchar(20)				,[test_FaxNumber] varchar(20)
		,[AcceptsMedicaid] bit					,[test_AcceptsMedicaid] bit
		,[IsDeceased] bit						,[test_IsDeceased] bit
		,[IsSoleProprietor] bit					,[test_IsSoleProprietor] bit
		,[Sanctions] bit						,[test_Sanctions] bit
		,[Restrictions] bit						,[test_Restrictions] bit
		,[SanctionsDetails] varchar(7000)		,[test_SanctionsDetails] varchar(7000)
		,[RestrictionDetails] varchar(7000)		,[test_RestrictionDetails] varchar(7000)
		,[AcceptsWorkersCompensation] bit		,[test_AcceptsWorkersCompensation] bit
		,[IsPCP] bit							,[test_IsPCP] bit
		,[BillingFlag] bit						,[test_BillingFlag] bit
		,[CoopFlag] bit							,[test_CoopFlag] bit
		,[EngagementPriorityKey] int			,[test_EngagementPriorityKey] int
		,[CredentialingApplicationDate] date	,[test_CredentialingApplicationDate] date
		,[CredentialingApprovalDate] date		,[test_CredentialingApprovalDate] date
		,[CustomFields] varchar(max)			,[test_CustomFields] varchar(max)
		)

	insert into #Provider
		([NPI]
		,[FirstName]						,[test_FirstName]
		,[LastName]							,[test_LastName]
		,[MiddleName]						,[test_MiddleName]
		,[Suffix]							,[test_Suffix]
		,[Salutation]						,[test_Salutation]
		,[Gender]							,[test_Gender]
		,[DateofBirth]						,[test_DateofBirth]
		,[PhoneNumber]						,[test_PhoneNumber]
		,[Email]							,[test_Email]
		,[FaxNumber]						,[test_FaxNumber]
		,[AcceptsMedicaid]					,[test_AcceptsMedicaid]
		,[IsDeceased]						,[test_IsDeceased]
		,[IsSoleProprietor]					,[test_IsSoleProprietor]
		,[Sanctions]						,[test_Sanctions]
		,[Restrictions]						,[test_Restrictions]
		,[SanctionsDetails]					,[test_SanctionsDetails]
		,[RestrictionDetails]				,[test_RestrictionDetails]
		,[AcceptsWorkersCompensation]		,[test_AcceptsWorkersCompensation]
		,[IsPCP]							,[test_IsPCP]
		,[BillingFlag]						,[test_BillingFlag]
		,[CoopFlag]							,[test_CoopFlag]
		,[EngagementPriorityKey]			,[test_EngagementPriorityKey]
		,[CredentialingApplicationDate]		,[test_CredentialingApplicationDate]
		,[CredentialingApprovalDate]		,[test_CredentialingApprovalDate]
		,[CustomFields]						,[test_CustomFields]
		)
		select t.[NPI]
			,e.[FirstName]						,t.[FirstName]
			,e.[LastName]						,t.[LastName]
			,e.[MiddleName]						,t.[MiddleName]
			,e.[Suffix]							,t.[Suffix]
			,e.[Salutation]						,t.[Salutation]
			,e.[Gender]							,t.[Gender]
			,e.[DateofBirth]					,t.[DateofBirth]
			,e.[PhoneNumber]					,t.[PhoneNumber]
			,e.[Email]							,t.[Email]
			,e.[FaxNumber]						,t.[FaxNumber]
			,e.[AcceptsMedicaid]				,t.[AcceptsMedicaid]
			,e.[IsDeceased]						,t.[IsDeceased]
			,e.[IsSoleProprietor]				,t.[IsSoleProprietor]
			,e.[Sanctions]						,t.[Sanctions]
			,e.[Restrictions]					,t.[Restrictions]
			,e.[SanctionsDetails]				,t.[SanctionsDetails]
			,e.[RestrictionDetails]				,t.[RestrictionDetails]
			,e.[AcceptsWorkersCompensation]		,t.[AcceptsWorkersCompensation]
			,e.[IsPCP]							,t.[IsPCP]
			,e.[BillingFlag]					,t.[BillingFlag]
			,e.[CoopFlag]						,t.[CoopFlag]
			,e.[EngagementPriorityKey]			,t.[EngagementPriorityKey]
			,e.[CredentialingApplicationDate]	,t.[CredentialingApplicationDate]
			,e.[CredentialingApprovalDate]		,t.[CredentialingApprovalDate]
			,e.[CustomFields]					,t.[CustomFields]
		from [ProviderNetwork].[dbo].[Provider] e with (nolock)
		full join [ProviderNetwork].[dbo].[Provider] t with (nolock) on e.[NPI] = replace(t.[NPI],'99999','99998')
		where e.[NPI] like '99998%'
			and t.[NPI] like '99999%'

	--select * from #Provider

	create table #p_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #p_names values
		 (1,'FirstName','test_FirstName')
		,(2,'LastName','test_LastName')
		,(3,'MiddleName','test_MiddleName')
		,(4,'Suffix','test_Suffix')
		,(5,'Salutation','test_Salutation')
		,(6,'Gender','test_Gender')
		,(7,'DateofBirth','test_DateofBirth')
		,(8,'PhoneNumber','test_PhoneNumber')
		,(9,'Email','test_Email')
		,(10,'FaxNumber','test_FaxNumber')
		,(11,'AcceptsMedicaid','test_AcceptsMedicaid')
		,(12,'IsDeceased','test_IsDeceased')
		,(13,'IsSoleProprietor','test_IsSoleProprietor')
		,(14,'Sanctions','test_Sanctions')
		,(15,'Restrictions','test_Restrictions')
		,(16,'SanctionsDetails','test_SanctionsDetails')
		,(17,'RestrictionDetails','test_RestrictionDetails')
		,(18,'AcceptsWorkersCompensation','test_AcceptsWorkersCompensation')
		,(19,'IsPCP','test_IsPCP')
		,(20,'BillingFlag','test_BillingFlag')
		,(21,'CoopFlag','test_CoopFlag')
		,(22,'EngagementPriorityKey','test_EngagementPriorityKey')
		,(23,'CredentialingApplicationDate','test_CredentialingApplicationDate')
		,(24,'CredentialingApprovalDate','test_CredentialingApprovalDate')
		,(25,'CustomFields','test_CustomFields')

	set @loop_counter = 1
	while (@loop_counter <= 25)
		begin
			select @exist_col_name = exist_col_name from #p_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #p_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #Provider set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #Provider set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #Provider) = 0 alter table #Provider drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #Provider) = 0 alter table #Provider drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'OLTP Provider'
	select * from #Provider where Diff_flag = 1


--############################## PROVIDER LOCATION ##############################

	select [PracticeNPI]
		,[ProviderNPI]
		,[StgPracticeLocationProviderKey]
		,[PracticeSubpartNPI]
		,[ProviderLastName]
		,[ProviderFirstName]
		,[ProviderMiddleName]
		,[ProviderPrimarySpecialtyCode]
		,[AddressType]
		,[PLAddress1]
		,[PLAddress2]
		,[PLCity]
		,[PLStateCode]
		,[PLZip]
		,[LocationName]
		,[IsProviderPrimaryLocation]
		,[IsProviderPCPLocation]
		,[ProviderLocationEffectiveDate]
		,[ProviderLocationTerminationDate]
		,[PLTerminationReason]
		,[PLTerminationReasonKey]
		,[PLShowInDirectory]
		,[PLHoursOpenMon]
		,[PLHoursCloseMon]
		,[PLHoursOpenTues]
		,[PLHoursCloseTues]
		,[PLHoursOpenWed]
		,[PLHoursCloseWed]
		,[PLHoursOpenThurs]
		,[PLHoursCloseThurs]
		,[PLHoursOpenFri]
		,[PLHoursCloseFri]
		,[PLHoursOpenSat]
		,[PLHoursCloseSat]
		,[PLHoursOpenSun]
		,[PLHoursCloseSun]
		,[OfficeHours]
		,[PLMinimumPatientAge]
		,[PLMaximumPatientAge]
		,[PLLocationCategory]
		,[PLPhoneNumber]
		,[PLFaxNumber]
		,[LocationCategoryKey]
		,[PLMailingAddress1]
		,[PLMailingAddress2]
		,[PLMailingCity]
		,[PLMailingState]
		,[PLMailingZip]
		,[Plesiid1]
		,[PlesiidType1]
		,[PlesiidDesc1]
		,[PlesiidEffectiveDate1]
		,[PlesiidTerminationDate1]
		,[Plesiid2]
		,[PlesiidType2]
		,[PlesiidDesc2]
		,[PlesiidEffectiveDate2]
		,[PlesiidTerminationDate2]
		,[Plesiid3]
		,[PlesiidType3]
		,[PlesiidDesc3]
		,[PlesiidEffectiveDate3]
		,[PlesiidTerminationDate3]
		,[Plesiid4]
		,[PlesiidType4]
		,[PlesiidDesc4]
		,[PlesiidEffectiveDate4]
		,[PlesiidTerminationDate4]
		,[Plesiid5]
		,[PlesiidType5]
		,[PlesiidDesc5]
		,[PlesiidEffectiveDate5]
		,[PlesiidTerminationDate5]
		,[Plesiid6]
		,[PlesiidType6]
		,[PlesiidDesc6]
		,[PlesiidEffectiveDate6]
		,[PlesiidTerminationDate6]
		,[Plesiid7]
		,[PlesiidType7]
		,[PlesiidDesc7]
		,[PlesiidEffectiveDate7]
		,[PlesiidTerminationDate7]
		,[Plesiid8]
		,[PlesiidType8]
		,[PlesiidDesc8]
		,[PlesiidEffectiveDate8]
		,[PlesiidTerminationDate8]
		,[Plesiid9]
		,[PlesiidType9]
		,[PlesiidDesc9]
		,[PlesiidEffectiveDate9]
		,[PlesiidTerminationDate9]
		,[CustomFields]
		,[IsPracticeValid]
		,[IsProviderValid]
		,[RecordStatus]
		,[RecordStatusDescription]
		,[PLAcceptsNewPatients]
		,[PLAcceptsNewPatientKey]
		,cast(NULL as int) as [Rank]
	into #stgpl
	from [ProviderNetworkStaging].[dbo].[StgPracticeLocationProvider] with (nolock)
	where [BatchID] = -5

	;with [orderRecord] as (select [PracticeNPI] 
								,[ProviderNPI]
								,[StgPracticeLocationProviderKey]
								,[Rank]
								,rank() over (partition by [PracticeNPI]
													,[ProviderNPI] 
											  order by [StgPracticeLocationProviderKey]
											 ) as Rank_number 
							from #stgpl)
	update [orderRecord] set [Rank] = Rank_number

	select [PracticeNPI]
		,[ProviderNPI]
		,[StgPracticeLocationProviderKey]
		,[PracticeSubpartNPI]
		,[ProviderLastName]
		,[ProviderFirstName]
		,[ProviderMiddleName]
		,[ProviderPrimarySpecialtyCode]
		,[AddressType]
		,[PLAddress1]
		,[PLAddress2]
		,[PLCity]
		,[PLStateCode]
		,[PLZip]
		,[LocationName]
		,[IsProviderPrimaryLocation]
		,[IsProviderPCPLocation]
		,[ProviderLocationEffectiveDate]
		,[ProviderLocationTerminationDate]
		,[PLTerminationReason]
		,[PLTerminationReasonKey]
		,[PLShowInDirectory]
		,[PLHoursOpenMon]
		,[PLHoursCloseMon]
		,[PLHoursOpenTues]
		,[PLHoursCloseTues]
		,[PLHoursOpenWed]
		,[PLHoursCloseWed]
		,[PLHoursOpenThurs]
		,[PLHoursCloseThurs]
		,[PLHoursOpenFri]
		,[PLHoursCloseFri]
		,[PLHoursOpenSat]
		,[PLHoursCloseSat]
		,[PLHoursOpenSun]
		,[PLHoursCloseSun]
		,[OfficeHours]
		,[PLMinimumPatientAge]
		,[PLMaximumPatientAge]
		,[PLLocationCategory]
		,[PLPhoneNumber]
		,[PLFaxNumber]
		,[LocationCategoryKey]
		,[PLMailingAddress1]
		,[PLMailingAddress2]
		,[PLMailingCity]
		,[PLMailingState]
		,[PLMailingZip]
		,[Plesiid1]
		,[PlesiidType1]
		,[PlesiidDesc1]
		,[PlesiidEffectiveDate1]
		,[PlesiidTerminationDate1]
		,[Plesiid2]
		,[PlesiidType2]
		,[PlesiidDesc2]
		,[PlesiidEffectiveDate2]
		,[PlesiidTerminationDate2]
		,[Plesiid3]
		,[PlesiidType3]
		,[PlesiidDesc3]
		,[PlesiidEffectiveDate3]
		,[PlesiidTerminationDate3]
		,[Plesiid4]
		,[PlesiidType4]
		,[PlesiidDesc4]
		,[PlesiidEffectiveDate4]
		,[PlesiidTerminationDate4]
		,[Plesiid5]
		,[PlesiidType5]
		,[PlesiidDesc5]
		,[PlesiidEffectiveDate5]
		,[PlesiidTerminationDate5]
		,[Plesiid6]
		,[PlesiidType6]
		,[PlesiidDesc6]
		,[PlesiidEffectiveDate6]
		,[PlesiidTerminationDate6]
		,[Plesiid7]
		,[PlesiidType7]
		,[PlesiidDesc7]
		,[PlesiidEffectiveDate7]
		,[PlesiidTerminationDate7]
		,[Plesiid8]
		,[PlesiidType8]
		,[PlesiidDesc8]
		,[PlesiidEffectiveDate8]
		,[PlesiidTerminationDate8]
		,[Plesiid9]
		,[PlesiidType9]
		,[PlesiidDesc9]
		,[PlesiidEffectiveDate9]
		,[PlesiidTerminationDate9]
		,[CustomFields]
		,[IsPracticeValid]
		,[IsProviderValid]
		,[RecordStatus]
		,[RecordStatusDescription]
		,[PLAcceptsNewPatients]
		,[PLAcceptsNewPatientKey]
		,cast(NULL as int) as [Rank]
	into #test_stgpl
	from [ProviderNetworkStaging].[dbo].[StgPracticeLocationProvider] with (nolock)
	where [BatchID] = @BatchID

	;with [orderRecord] as (select [PracticeNPI] 
								,[ProviderNPI]
								,[StgPracticeLocationProviderKey]
								,[Rank]
								,rank() over (partition by [PracticeNPI]
													,[ProviderNPI] 
											  order by [StgPracticeLocationProviderKey]
											 ) as Rank_number 
							from #test_stgpl)
	update [orderRecord] set [Rank] = Rank_number

	create table #StgProviderLocation
		([PracticeNPI] varchar(10)
		,[ProviderNPI] varchar(10)
		,[Diff_flag] bit
		,[PracticeSubpartNPI] varchar(10)			,[test_PracticeSubpartNPI] varchar(10)
		,[ProviderLastName] varchar(255)			,[test_ProviderLastName] varchar(255)
		,[ProviderFirstName] varchar(255)			,[test_ProviderFirstName] varchar(255)
		,[ProviderMiddleName] varchar(255)			,[test_ProviderMiddleName] varchar(255)
		,[ProviderPrimarySpecialtyCode] varchar(10)	,[test_ProviderPrimarySpecialtyCode] varchar(10)
		,[AddressType] varchar(10)					,[test_AddressType] varchar(10)
		,[PLAddress1] varchar(100)					,[test_PLAddress1] varchar(100)
		,[PLAddress2] varchar(100)					,[test_PLAddress2] varchar(100)
		,[PLCity] varchar(50)						,[test_PLCity] varchar(50)
		,[PLStateCode] char(2)						,[test_PLStateCode] char(2)
		,[PLZip] varchar(10)						,[test_PLZip] varchar(10)
		,[LocationName] varchar(255)				,[test_LocationName] varchar(255)
		,[IsProviderPrimaryLocation] char(1)		,[test_IsProviderPrimaryLocation] char(1)
		,[IsProviderPCPLocation] char(1)			,[test_IsProviderPCPLocation] char(1)
		,[ProviderLocationEffectiveDate] date		,[test_ProviderLocationEffectiveDate] date
		,[ProviderLocationTerminationDate] date		,[test_ProviderLocationTerminationDate] date
		,[PLTerminationReason] varchar(10)			,[test_PLTerminationReason] varchar(10)
		,[PLTerminationReasonKey] int				,[test_PLTerminationReasonKey] int
		,[PLShowInDirectory] char(1)				,[test_PLShowInDirectory] char(1)
		,[PLHoursOpenMon] varchar(200)				,[test_PLHoursOpenMon] varchar(200)
		,[PLHoursCloseMon] varchar(200)				,[test_PLHoursCloseMon] varchar(200)
		,[PLHoursOpenTues] varchar(200)				,[test_PLHoursOpenTues] varchar(200)
		,[PLHoursCloseTues] varchar(200)			,[test_PLHoursCloseTues] varchar(200)
		,[PLHoursOpenWed] varchar(200)				,[test_PLHoursOpenWed] varchar(200)
		,[PLHoursCloseWed] varchar(200)				,[test_PLHoursCloseWed] varchar(200)
		,[PLHoursOpenThurs] varchar(200)			,[test_PLHoursOpenThurs] varchar(200)
		,[PLHoursCloseThurs] varchar(200)			,[test_PLHoursCloseThurs] varchar(200)
		,[PLHoursOpenFri] varchar(200)				,[test_PLHoursOpenFri] varchar(200)
		,[PLHoursCloseFri] varchar(200)				,[test_PLHoursCloseFri] varchar(200)
		,[PLHoursOpenSat] varchar(200)				,[test_PLHoursOpenSat] varchar(200)
		,[PLHoursCloseSat] varchar(200)				,[test_PLHoursCloseSat] varchar(200)
		,[PLHoursOpenSun] varchar(200)				,[test_PLHoursOpenSun] varchar(200)
		,[PLHoursCloseSun] varchar(200)				,[test_PLHoursCloseSun] varchar(200)
		,[OfficeHours] varchar(4000)				,[test_OfficeHours] varchar(4000)
		,[PLMinimumPatientAge] int					,[test_PLMinimumPatientAge] int
		,[PLMaximumPatientAge] int					,[test_PLMaximumPatientAge] int
		,[PLLocationCategory] varchar(10)			,[test_PLLocationCategory] varchar(10)
		,[PLPhoneNumber] varchar(1000)				,[test_PLPhoneNumber] varchar(1000)
		,[PLFaxNumber] varchar(1000)				,[test_PLFaxNumber] varchar(1000)
		,[LocationCategoryKey] int					,[test_LocationCategoryKey] int
		,[PLMailingAddress1] varchar(100)			,[test_PLMailingAddress1] varchar(100)
		,[PLMailingAddress2] varchar(100)			,[test_PLMailingAddress2] varchar(100)
		,[PLMailingCity] varchar(50)				,[test_PLMailingCity] varchar(50)
		,[PLMailingState] varchar(2)				,[test_PLMailingState] varchar(2)
		,[PLMailingZip] varchar(10)					,[test_PLMailingZip] varchar(10)
		,[Plesiid1] varchar(50)						,[test_Plesiid1] varchar(50)
		,[PlesiidType1] varchar(6)					,[test_PlesiidType1] varchar(6)
		,[PlesiidDesc1] varchar(255)				,[test_PlesiidDesc1] varchar(255)
		,[PlesiidEffectiveDate1] date				,[test_PlesiidEffectiveDate1] date
		,[PlesiidTerminationDate1] date				,[test_PlesiidTerminationDate1] date
		,[Plesiid2] varchar(50)						,[test_Plesiid2] varchar(50)
		,[PlesiidType2] varchar(6)					,[test_PlesiidType2] varchar(6)
		,[PlesiidDesc2] varchar(255)				,[test_PlesiidDesc2] varchar(255)
		,[PlesiidEffectiveDate2] date				,[test_PlesiidEffectiveDate2] date
		,[PlesiidTerminationDate2] date				,[test_PlesiidTerminationDate2] date
		,[Plesiid3] varchar(50)						,[test_Plesiid3] varchar(50)
		,[PlesiidType3] varchar(6)					,[test_PlesiidType3] varchar(6)
		,[PlesiidDesc3] varchar(255)				,[test_PlesiidDesc3] varchar(255)
		,[PlesiidEffectiveDate3] date				,[test_PlesiidEffectiveDate3] date
		,[PlesiidTerminationDate3] date				,[test_PlesiidTerminationDate3] date
		,[Plesiid4] varchar(50)						,[test_Plesiid4] varchar(50)
		,[PlesiidType4] varchar(6)					,[test_PlesiidType4] varchar(6)
		,[PlesiidDesc4] varchar(255)				,[test_PlesiidDesc4] varchar(255)
		,[PlesiidEffectiveDate4] date				,[test_PlesiidEffectiveDate4] date
		,[PlesiidTerminationDate4] date				,[test_PlesiidTerminationDate4] date
		,[Plesiid5] varchar(50)						,[test_Plesiid5] varchar(50)
		,[PlesiidType5] varchar(6)					,[test_PlesiidType5] varchar(6)
		,[PlesiidDesc5] varchar(255)				,[test_PlesiidDesc5] varchar(255)
		,[PlesiidEffectiveDate5] date				,[test_PlesiidEffectiveDate5] date
		,[PlesiidTerminationDate5] date				,[test_PlesiidTerminationDate5] date
		,[Plesiid6] varchar(50)						,[test_Plesiid6] varchar(50)
		,[PlesiidType6] varchar(6)					,[test_PlesiidType6] varchar(6)
		,[PlesiidDesc6] varchar(255)				,[test_PlesiidDesc6] varchar(255)
		,[PlesiidEffectiveDate6] date				,[test_PlesiidEffectiveDate6] date
		,[PlesiidTerminationDate6] date				,[test_PlesiidTerminationDate6] date
		,[Plesiid7] varchar(50)						,[test_Plesiid7] varchar(50)
		,[PlesiidType7] varchar(6)					,[test_PlesiidType7] varchar(6)
		,[PlesiidDesc7] varchar(255)				,[test_PlesiidDesc7] varchar(255)
		,[PlesiidEffectiveDate7] date				,[test_PlesiidEffectiveDate7] date
		,[PlesiidTerminationDate7] date				,[test_PlesiidTerminationDate7] date
		,[Plesiid8] varchar(50)						,[test_Plesiid8] varchar(50)
		,[PlesiidType8] varchar(6)					,[test_PlesiidType8] varchar(6)
		,[PlesiidDesc8] varchar(255)				,[test_PlesiidDesc8] varchar(255)
		,[PlesiidEffectiveDate8] date				,[test_PlesiidEffectiveDate8] date
		,[PlesiidTerminationDate8] date				,[test_PlesiidTerminationDate8] date
		,[Plesiid9] varchar(50)						,[test_Plesiid9] varchar(50)
		,[PlesiidType9] varchar(6)					,[test_PlesiidType9] varchar(6)
		,[PlesiidDesc9] varchar(255)				,[test_PlesiidDesc9] varchar(255)
		,[PlesiidEffectiveDate9] date				,[test_PlesiidEffectiveDate9] date
		,[PlesiidTerminationDate9] date				,[test_PlesiidTerminationDate9] date
		,[CustomFields] varchar(max)				,[test_CustomFields] varchar(max)
		,[IsPracticeValid] char(1)					,[test_IsPracticeValid] char(1)
		,[IsProviderValid] char(1)					,[test_IsProviderValid] char(1)
		,[RecordStatus] varchar(2)					,[test_RecordStatus] varchar(2)
		,[RecordStatusDescription] varchar(100)		,[test_RecordStatusDescription] varchar(100)
		,[PLAcceptsNewPatients] varchar(50)			,[test_PLAcceptsNewPatients] varchar(50)
		,[PLAcceptsNewPatientKey] int				,[test_PLAcceptsNewPatientKey] int
		)

	insert into #StgProviderLocation
		([PracticeNPI]
		,[ProviderNPI]
		,[PracticeSubpartNPI]				,[test_PracticeSubpartNPI]
		,[ProviderLastName]					,[test_ProviderLastName]
		,[ProviderFirstName]				,[test_ProviderFirstName]
		,[ProviderMiddleName]				,[test_ProviderMiddleName]
		,[ProviderPrimarySpecialtyCode]		,[test_ProviderPrimarySpecialtyCode]
		,[AddressType]						,[test_AddressType]
		,[PLAddress1]						,[test_PLAddress1]
		,[PLAddress2]						,[test_PLAddress2]
		,[PLCity]							,[test_PLCity]
		,[PLStateCode]						,[test_PLStateCode]
		,[PLZip]							,[test_PLZip]
		,[LocationName]						,[test_LocationName]
		,[IsProviderPrimaryLocation]		,[test_IsProviderPrimaryLocation]
		,[IsProviderPCPLocation]			,[test_IsProviderPCPLocation]
		,[ProviderLocationEffectiveDate]	,[test_ProviderLocationEffectiveDate]
		,[ProviderLocationTerminationDate]	,[test_ProviderLocationTerminationDate]
		,[PLTerminationReason]				,[test_PLTerminationReason]
		,[PLTerminationReasonKey]			,[test_PLTerminationReasonKey]
		,[PLShowInDirectory]				,[test_PLShowInDirectory]
		,[PLHoursOpenMon]					,[test_PLHoursOpenMon]
		,[PLHoursCloseMon]					,[test_PLHoursCloseMon]
		,[PLHoursOpenTues]					,[test_PLHoursOpenTues]
		,[PLHoursCloseTues]					,[test_PLHoursCloseTues]
		,[PLHoursOpenWed]					,[test_PLHoursOpenWed]
		,[PLHoursCloseWed]					,[test_PLHoursCloseWed]
		,[PLHoursOpenThurs]					,[test_PLHoursOpenThurs]
		,[PLHoursCloseThurs]				,[test_PLHoursCloseThurs]
		,[PLHoursOpenFri]					,[test_PLHoursOpenFri]
		,[PLHoursCloseFri]					,[test_PLHoursCloseFri]
		,[PLHoursOpenSat]					,[test_PLHoursOpenSat]
		,[PLHoursCloseSat]					,[test_PLHoursCloseSat]
		,[PLHoursOpenSun]					,[test_PLHoursOpenSun]
		,[PLHoursCloseSun]					,[test_PLHoursCloseSun]
		,[OfficeHours]						,[test_OfficeHours]
		,[PLMinimumPatientAge]				,[test_PLMinimumPatientAge]
		,[PLMaximumPatientAge]				,[test_PLMaximumPatientAge]
		,[PLLocationCategory]				,[test_PLLocationCategory]
		,[PLPhoneNumber]					,[test_PLPhoneNumber]
		,[PLFaxNumber]						,[test_PLFaxNumber]
		,[LocationCategoryKey]				,[test_LocationCategoryKey]
		,[PLMailingAddress1]				,[test_PLMailingAddress1]
		,[PLMailingAddress2]				,[test_PLMailingAddress2]
		,[PLMailingCity]					,[test_PLMailingCity]
		,[PLMailingState]					,[test_PLMailingState]
		,[PLMailingZip]						,[test_PLMailingZip]
		,[Plesiid1]							,[test_Plesiid1]
		,[PlesiidType1]						,[test_PlesiidType1]
		,[PlesiidDesc1]						,[test_PlesiidDesc1]
		,[PlesiidEffectiveDate1]			,[test_PlesiidEffectiveDate1]
		,[PlesiidTerminationDate1]			,[test_PlesiidTerminationDate1]
		,[Plesiid2]							,[test_Plesiid2]
		,[PlesiidType2]						,[test_PlesiidType2]
		,[PlesiidDesc2]						,[test_PlesiidDesc2]
		,[PlesiidEffectiveDate2]			,[test_PlesiidEffectiveDate2]
		,[PlesiidTerminationDate2]			,[test_PlesiidTerminationDate2]
		,[Plesiid3]							,[test_Plesiid3]
		,[PlesiidType3]						,[test_PlesiidType3]
		,[PlesiidDesc3]						,[test_PlesiidDesc3]
		,[PlesiidEffectiveDate3]			,[test_PlesiidEffectiveDate3]
		,[PlesiidTerminationDate3]			,[test_PlesiidTerminationDate3]
		,[Plesiid4]							,[test_Plesiid4]
		,[PlesiidType4]						,[test_PlesiidType4]
		,[PlesiidDesc4]						,[test_PlesiidDesc4]
		,[PlesiidEffectiveDate4]			,[test_PlesiidEffectiveDate4]
		,[PlesiidTerminationDate4]			,[test_PlesiidTerminationDate4]
		,[Plesiid5]							,[test_Plesiid5]
		,[PlesiidType5]						,[test_PlesiidType5]
		,[PlesiidDesc5]						,[test_PlesiidDesc5]
		,[PlesiidEffectiveDate5]			,[test_PlesiidEffectiveDate5]
		,[PlesiidTerminationDate5]			,[test_PlesiidTerminationDate5]
		,[Plesiid6]							,[test_Plesiid6]
		,[PlesiidType6]						,[test_PlesiidType6]
		,[PlesiidDesc6]						,[test_PlesiidDesc6]
		,[PlesiidEffectiveDate6]			,[test_PlesiidEffectiveDate6]
		,[PlesiidTerminationDate6]			,[test_PlesiidTerminationDate6]
		,[Plesiid7]							,[test_Plesiid7]
		,[PlesiidType7]						,[test_PlesiidType7]
		,[PlesiidDesc7]						,[test_PlesiidDesc7]
		,[PlesiidEffectiveDate7]			,[test_PlesiidEffectiveDate7]
		,[PlesiidTerminationDate7]			,[test_PlesiidTerminationDate7]
		,[Plesiid8]							,[test_Plesiid8]
		,[PlesiidType8]						,[test_PlesiidType8]
		,[PlesiidDesc8]						,[test_PlesiidDesc8]
		,[PlesiidEffectiveDate8]			,[test_PlesiidEffectiveDate8]
		,[PlesiidTerminationDate8]			,[test_PlesiidTerminationDate8]
		,[Plesiid9]							,[test_Plesiid9]
		,[PlesiidType9]						,[test_PlesiidType9]
		,[PlesiidDesc9]						,[test_PlesiidDesc9]
		,[PlesiidEffectiveDate9]			,[test_PlesiidEffectiveDate9]
		,[PlesiidTerminationDate9]			,[test_PlesiidTerminationDate9]
		,[CustomFields]						,[test_CustomFields]
		,[IsPracticeValid]					,[test_IsPracticeValid]
		,[IsProviderValid]					,[test_IsProviderValid]
		,[RecordStatus]						,[test_RecordStatus]
		,[RecordStatusDescription]			,[test_RecordStatusDescription]
		,[PLAcceptsNewPatients]				,[test_PLAcceptsNewPatients]
		,[PLAcceptsNewPatientKey]			,[test_PLAcceptsNewPatientKey]
		)
		select t.[PracticeNPI]
			,t.[ProviderNPI]
			,e.[PracticeSubpartNPI]					,t.[PracticeSubpartNPI]
			,e.[ProviderLastName]					,t.[ProviderLastName]
			,e.[ProviderFirstName]					,t.[ProviderFirstName]
			,e.[ProviderMiddleName]					,t.[ProviderMiddleName]
			,e.[ProviderPrimarySpecialtyCode]		,t.[ProviderPrimarySpecialtyCode]
			,e.[AddressType]						,t.[AddressType]
			,e.[PLAddress1]							,t.[PLAddress1]
			,e.[PLAddress2]							,t.[PLAddress2]
			,e.[PLCity]								,t.[PLCity]
			,e.[PLStateCode]						,t.[PLStateCode]
			,e.[PLZip]								,t.[PLZip]
			,e.[LocationName]						,t.[LocationName]
			,e.[IsProviderPrimaryLocation]			,t.[IsProviderPrimaryLocation]
			,e.[IsProviderPCPLocation]				,t.[IsProviderPCPLocation]
			,e.[ProviderLocationEffectiveDate]		,t.[ProviderLocationEffectiveDate]
			,e.[ProviderLocationTerminationDate]	,t.[ProviderLocationTerminationDate]
			,e.[PLTerminationReason]				,t.[PLTerminationReason]
			,e.[PLTerminationReasonKey]				,t.[PLTerminationReasonKey]
			,e.[PLShowInDirectory]					,t.[PLShowInDirectory]
			,e.[PLHoursOpenMon]						,t.[PLHoursOpenMon]
			,e.[PLHoursCloseMon]					,t.[PLHoursCloseMon]
			,e.[PLHoursOpenTues]					,t.[PLHoursOpenTues]
			,e.[PLHoursCloseTues]					,t.[PLHoursCloseTues]
			,e.[PLHoursOpenWed]						,t.[PLHoursOpenWed]
			,e.[PLHoursCloseWed]					,t.[PLHoursCloseWed]
			,e.[PLHoursOpenThurs]					,t.[PLHoursOpenThurs]
			,e.[PLHoursCloseThurs]					,t.[PLHoursCloseThurs]
			,e.[PLHoursOpenFri]						,t.[PLHoursOpenFri]
			,e.[PLHoursCloseFri]					,t.[PLHoursCloseFri]
			,e.[PLHoursOpenSat]						,t.[PLHoursOpenSat]
			,e.[PLHoursCloseSat]					,t.[PLHoursCloseSat]
			,e.[PLHoursOpenSun]						,t.[PLHoursOpenSun]
			,e.[PLHoursCloseSun]					,t.[PLHoursCloseSun]
			,e.[OfficeHours]						,t.[OfficeHours]
			,e.[PLMinimumPatientAge]				,t.[PLMinimumPatientAge]
			,e.[PLMaximumPatientAge]				,t.[PLMaximumPatientAge]
			,e.[PLLocationCategory]					,t.[PLLocationCategory]
			,e.[PLPhoneNumber]						,t.[PLPhoneNumber]
			,e.[PLFaxNumber]						,t.[PLFaxNumber]
			,e.[LocationCategoryKey]				,t.[LocationCategoryKey]
			,e.[PLMailingAddress1]					,t.[PLMailingAddress1]
			,e.[PLMailingAddress2]					,t.[PLMailingAddress2]
			,e.[PLMailingCity]						,t.[PLMailingCity]
			,e.[PLMailingState]						,t.[PLMailingState]
			,e.[PLMailingZip]						,t.[PLMailingZip]
			,e.[Plesiid1]							,t.[Plesiid1]
			,e.[PlesiidType1]						,t.[PlesiidType1]
			,e.[PlesiidDesc1]						,t.[PlesiidDesc1]
			,e.[PlesiidEffectiveDate1]				,t.[PlesiidEffectiveDate1]
			,e.[PlesiidTerminationDate1]			,t.[PlesiidTerminationDate1]
			,e.[Plesiid2]							,t.[Plesiid2]
			,e.[PlesiidType2]						,t.[PlesiidType2]
			,e.[PlesiidDesc2]						,t.[PlesiidDesc2]
			,e.[PlesiidEffectiveDate2]				,t.[PlesiidEffectiveDate2]
			,e.[PlesiidTerminationDate2]			,t.[PlesiidTerminationDate2]
			,e.[Plesiid3]							,t.[Plesiid3]
			,e.[PlesiidType3]						,t.[PlesiidType3]
			,e.[PlesiidDesc3]						,t.[PlesiidDesc3]
			,e.[PlesiidEffectiveDate3]				,t.[PlesiidEffectiveDate3]
			,e.[PlesiidTerminationDate3]			,t.[PlesiidTerminationDate3]
			,e.[Plesiid4]							,t.[Plesiid4]
			,e.[PlesiidType4]						,t.[PlesiidType4]
			,e.[PlesiidDesc4]						,t.[PlesiidDesc4]
			,e.[PlesiidEffectiveDate4]				,t.[PlesiidEffectiveDate4]
			,e.[PlesiidTerminationDate4]			,t.[PlesiidTerminationDate4]
			,e.[Plesiid5]							,t.[Plesiid5]
			,e.[PlesiidType5]						,t.[PlesiidType5]
			,e.[PlesiidDesc5]						,t.[PlesiidDesc5]
			,e.[PlesiidEffectiveDate5]				,t.[PlesiidEffectiveDate5]
			,e.[PlesiidTerminationDate5]			,t.[PlesiidTerminationDate5]
			,e.[Plesiid6]							,t.[Plesiid6]
			,e.[PlesiidType6]						,t.[PlesiidType6]
			,e.[PlesiidDesc6]						,t.[PlesiidDesc6]
			,e.[PlesiidEffectiveDate6]				,t.[PlesiidEffectiveDate6]
			,e.[PlesiidTerminationDate6]			,t.[PlesiidTerminationDate6]
			,e.[Plesiid7]							,t.[Plesiid7]
			,e.[PlesiidType7]						,t.[PlesiidType7]
			,e.[PlesiidDesc7]						,t.[PlesiidDesc7]
			,e.[PlesiidEffectiveDate7]				,t.[PlesiidEffectiveDate7]
			,e.[PlesiidTerminationDate7]			,t.[PlesiidTerminationDate7]
			,e.[Plesiid8]							,t.[Plesiid8]
			,e.[PlesiidType8]						,t.[PlesiidType8]
			,e.[PlesiidDesc8]						,t.[PlesiidDesc8]
			,e.[PlesiidEffectiveDate8]				,t.[PlesiidEffectiveDate8]
			,e.[PlesiidTerminationDate8]			,t.[PlesiidTerminationDate8]
			,e.[Plesiid9]							,t.[Plesiid9]
			,e.[PlesiidType9]						,t.[PlesiidType9]
			,e.[PlesiidDesc9]						,t.[PlesiidDesc9]
			,e.[PlesiidEffectiveDate9]				,t.[PlesiidEffectiveDate9]
			,e.[PlesiidTerminationDate9]			,t.[PlesiidTerminationDate9]
			,e.[CustomFields]						,t.[CustomFields]
			,e.[IsPracticeValid]					,t.[IsPracticeValid]
			,e.[IsProviderValid]					,t.[IsProviderValid]
			,e.[RecordStatus]						,t.[RecordStatus]
			,e.[RecordStatusDescription]			,t.[RecordStatusDescription]
			,e.[PLAcceptsNewPatients]				,t.[PLAcceptsNewPatients]
			,e.[PLAcceptsNewPatientKey]				,t.[PLAcceptsNewPatientKey]
		from #stgpl e
		full join #test_stgpl t on e.[PracticeNPI] = t.[PracticeNPI]
							   and e.[ProviderNPI] = t.[ProviderNPI]
									  and e.[Rank] = t.[Rank]

	--select * from #StgProviderLocation

	create table #stgpl_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #stgpl_names values
		 (1,'PracticeSubpartNPI','test_PracticeSubpartNPI')
		,(2,'ProviderLastName','test_ProviderLastName')
		,(3,'ProviderFirstName','test_ProviderFirstName')
		,(4,'ProviderMiddleName','test_ProviderMiddleName')
		,(5,'ProviderPrimarySpecialtyCode','test_ProviderPrimarySpecialtyCode')
		,(6,'AddressType','test_AddressType')
		,(7,'PLAddress1','test_PLAddress1')
		,(8,'PLAddress2','test_PLAddress2')
		,(9,'PLCity','test_PLCity')
		,(10,'PLStateCode','test_PLStateCode')
		,(11,'PLZip','test_PLZip')
		,(12,'LocationName','test_LocationName')
		,(13,'IsProviderPrimaryLocation','test_IsProviderPrimaryLocation')
		,(14,'IsProviderPCPLocation','test_IsProviderPCPLocation')
		,(15,'ProviderLocationEffectiveDate','test_ProviderLocationEffectiveDate')
		,(16,'ProviderLocationTerminationDate','test_ProviderLocationTerminationDate')
		,(17,'PLTerminationReason','test_PLTerminationReason')
		,(18,'PLTerminationReasonKey','test_PLTerminationReasonKey')
		,(19,'PLShowInDirectory','test_PLShowInDirectory')
		,(20,'PLHoursOpenMon','test_PLHoursOpenMon')
		,(21,'PLHoursCloseMon','test_PLHoursCloseMon')
		,(22,'PLHoursOpenTues','test_PLHoursOpenTues')
		,(23,'PLHoursCloseTues','test_PLHoursCloseTues')
		,(24,'PLHoursOpenWed','test_PLHoursOpenWed')
		,(25,'PLHoursCloseWed','test_PLHoursCloseWed')
		,(26,'PLHoursOpenThurs','test_PLHoursOpenThurs')
		,(27,'PLHoursCloseThurs','test_PLHoursCloseThurs')
		,(28,'PLHoursOpenFri','test_PLHoursOpenFri')
		,(29,'PLHoursCloseFri','test_PLHoursCloseFri')
		,(30,'PLHoursOpenSat','test_PLHoursOpenSat')
		,(31,'PLHoursCloseSat','test_PLHoursCloseSat')
		,(32,'PLHoursOpenSun','test_PLHoursOpenSun')
		,(33,'PLHoursCloseSun','test_PLHoursCloseSun')
		,(34,'OfficeHours','test_OfficeHours')
		,(35,'PLMinimumPatientAge','test_PLMinimumPatientAge')
		,(36,'PLMaximumPatientAge','test_PLMaximumPatientAge')
		,(37,'PLLocationCategory','test_PLLocationCategory')
		,(38,'PLPhoneNumber','test_PLPhoneNumber')
		,(39,'PLFaxNumber','test_PLFaxNumber')
		,(40,'LocationCategoryKey','test_LocationCategoryKey')
		,(41,'PLMailingAddress1','test_PLMailingAddress1')
		,(42,'PLMailingAddress2','test_PLMailingAddress2')
		,(43,'PLMailingCity','test_PLMailingCity')
		,(44,'PLMailingState','test_PLMailingState')
		,(45,'PLMailingZip','test_PLMailingZip')
		,(46,'Plesiid1','test_Plesiid1')
		,(47,'PlesiidType1','test_PlesiidType1')
		,(48,'PlesiidDesc1','test_PlesiidDesc1')
		,(49,'PlesiidEffectiveDate1','test_PlesiidEffectiveDate1')
		,(50,'PlesiidTerminationDate1','test_PlesiidTerminationDate1')
		,(51,'Plesiid2','test_Plesiid2')
		,(52,'PlesiidType2','test_PlesiidType2')
		,(53,'PlesiidDesc2','test_PlesiidDesc2')
		,(54,'PlesiidEffectiveDate2','test_PlesiidEffectiveDate2')
		,(55,'PlesiidTerminationDate2','test_PlesiidTerminationDate2')
		,(56,'Plesiid3','test_Plesiid3')
		,(57,'PlesiidType3','test_PlesiidType3')
		,(58,'PlesiidDesc3','test_PlesiidDesc3')
		,(59,'PlesiidEffectiveDate3','test_PlesiidEffectiveDate3')
		,(60,'PlesiidTerminationDate3','test_PlesiidTerminationDate3')
		,(61,'Plesiid4','test_Plesiid4')
		,(62,'PlesiidType4','test_PlesiidType4')
		,(63,'PlesiidDesc4','test_PlesiidDesc4')
		,(64,'PlesiidEffectiveDate4','test_PlesiidEffectiveDate4')
		,(65,'PlesiidTerminationDate4','test_PlesiidTerminationDate4')
		,(66,'Plesiid5','test_Plesiid5')
		,(67,'PlesiidType5','test_PlesiidType5')
		,(68,'PlesiidDesc5','test_PlesiidDesc5')
		,(69,'PlesiidEffectiveDate5','test_PlesiidEffectiveDate5')
		,(70,'PlesiidTerminationDate5','test_PlesiidTerminationDate5')
		,(71,'Plesiid6','test_Plesiid6')
		,(72,'PlesiidType6','test_PlesiidType6')
		,(73,'PlesiidDesc6','test_PlesiidDesc6')
		,(74,'PlesiidEffectiveDate6','test_PlesiidEffectiveDate6')
		,(75,'PlesiidTerminationDate6','test_PlesiidTerminationDate6')
		,(76,'Plesiid7','test_Plesiid7')
		,(77,'PlesiidType7','test_PlesiidType7')
		,(78,'PlesiidDesc7','test_PlesiidDesc7')
		,(79,'PlesiidEffectiveDate7','test_PlesiidEffectiveDate7')
		,(80,'PlesiidTerminationDate7','test_PlesiidTerminationDate7')
		,(81,'Plesiid8','test_Plesiid8')
		,(82,'PlesiidType8','test_PlesiidType8')
		,(83,'PlesiidDesc8','test_PlesiidDesc8')
		,(84,'PlesiidEffectiveDate8','test_PlesiidEffectiveDate8')
		,(85,'PlesiidTerminationDate8','test_PlesiidTerminationDate8')
		,(86,'Plesiid9','test_Plesiid9')
		,(87,'PlesiidType9','test_PlesiidType9')
		,(88,'PlesiidDesc9','test_PlesiidDesc9')
		,(89,'PlesiidEffectiveDate9','test_PlesiidEffectiveDate9')
		,(90,'PlesiidTerminationDate9','test_PlesiidTerminationDate9')
		,(91,'CustomFields','test_CustomFields')
		,(92,'IsPracticeValid','test_IsPracticeValid')
		,(93,'IsProviderValid','test_IsProviderValid')
		,(94,'RecordStatus','test_RecordStatus')
		,(95,'RecordStatusDescription','test_RecordStatusDescription')
		,(96,'PLAcceptsNewPatients','test_PLAcceptsNewPatients')
		,(97,'PLAcceptsNewPatientKey','test_PLAcceptsNewPatientKey')

	set @loop_counter = 1
	while (@loop_counter <= 97)
		begin
			select @exist_col_name = exist_col_name from #stgpl_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #stgpl_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #StgProviderLocation set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #StgProviderLocation set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #StgProviderLocation) = 0 alter table #StgProviderLocation drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #StgProviderLocation) = 0 alter table #StgProviderLocation drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'StgProviderLocation'
	select * from #StgProviderLocation where Diff_flag = 1

	select p.[NPI]
		,plp.[PracticeLocationProviderKey]
		,cast(NULL as int) as [Rank]
		,plp.[EffectiveDate]
		,plp.[TerminationDate]
		,plp.[IsPrimaryLocation]
		,plp.[IsPCP]
		,plp.[OfficeHours]
		,plp.[InDirectory]
		,plp.[PatientMinimumAge]
		,plp.[PatientMaximumAge]
		,plp.[AcceptsNewPatientKey]
		,plp.[TerminationReasonKey]
		,plp.[LocationCategoryKey]
		,plp.[MailingAddress1]
		,plp.[MailingAddress2]
		,plp.[MailingCity]
		,plp.[MailingState]
		,plp.[MailingZipCode]
		,plp.[IsMailingAddressScrubbed]
		,plp.[CustomFields]
	into #pl
	from [ProviderNetwork].[dbo].[PracticeLocationProvider] plp with (nolock)
	join [ProviderNetwork].[dbo].[PracticeLocation] pl with (nolock) on pl.[PracticeLocationKey] = plp.[PracticeLocationKey]
	join [ProviderNetwork].[dbo].[Practice] p with (nolock) on p.[PracticeKey] = pl.[PracticeKey]
	where p.[NPI] like '99998%'

	;with [orderRecord] as (select [NPI]
								,[PracticeLocationProviderKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [PracticeLocationProviderKey]
											 ) as Rank_number 
							from #pl)
	update [orderRecord] set [Rank] = Rank_number

	select p.[NPI]
		,plp.[PracticeLocationProviderKey]
		,cast(NULL as int) as [Rank]
		,plp.[EffectiveDate]
		,plp.[TerminationDate]
		,plp.[IsPrimaryLocation]
		,plp.[IsPCP]
		,plp.[OfficeHours]
		,plp.[InDirectory]
		,plp.[PatientMinimumAge]
		,plp.[PatientMaximumAge]
		,plp.[AcceptsNewPatientKey]
		,plp.[TerminationReasonKey]
		,plp.[LocationCategoryKey]
		,plp.[MailingAddress1]
		,plp.[MailingAddress2]
		,plp.[MailingCity]
		,plp.[MailingState]
		,plp.[MailingZipCode]
		,plp.[IsMailingAddressScrubbed]
		,plp.[CustomFields]
	into #test_pl
	from [ProviderNetwork].[dbo].[PracticeLocationProvider] plp with (nolock)
	join [ProviderNetwork].[dbo].[PracticeLocation] pl with (nolock) on pl.[PracticeLocationKey] = plp.[PracticeLocationKey]
	join [ProviderNetwork].[dbo].[Practice] p with (nolock) on p.[PracticeKey] = pl.[PracticeKey]
	where p.[NPI] like '99999%'

	;with [orderRecord] as (select [NPI]
								,[PracticeLocationProviderKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [PracticeLocationProviderKey]
											 ) as Rank_number 
							from #test_pl)
	update [orderRecord] set [Rank] = Rank_number

	create table #ProviderLocation
		([NPI] varchar(10)
		,[Diff_flag] bit
		,[EffectiveDate] date				,[test_EffectiveDate] date
		,[TerminationDate] date				,[test_TerminationDate] date
		,[IsPrimaryLocation] bit			,[test_IsPrimaryLocation] bit
		,[IsPCP] bit						,[test_IsPCP] bit
		,[OfficeHours] varchar(4000)		,[test_OfficeHours] varchar(4000)
		,[InDirectory] bit					,[test_InDirectory] bit
		,[PatientMinimumAge] int			,[test_PatientMinimumAge] int
		,[PatientMaximumAge] int			,[test_PatientMaximumAge] int
		,[AcceptsNewPatientKey] int			,[test_AcceptsNewPatientKey] int
		,[TerminationReasonKey] int			,[test_TerminationReasonKey] int
		,[LocationCategoryKey] int			,[test_LocationCategoryKey] int
		,[MailingAddress1] varchar(100)		,[test_MailingAddress1] varchar(100)
		,[MailingAddress2] varchar(100)		,[test_MailingAddress2] varchar(100)
		,[MailingCity] varchar(50)			,[test_MailingCity] varchar(50)
		,[MailingState] char(2)				,[test_MailingState] char(2)
		,[MailingZipCode] varchar(10)		,[test_MailingZipCode] varchar(10)
		,[IsMailingAddressScrubbed] bit		,[test_IsMailingAddressScrubbed] bit
		,[CustomFields] varchar(max)		,[test_CustomFields] varchar(max)
		)

	insert into #ProviderLocation
		([NPI]
		,[EffectiveDate]				,[test_EffectiveDate]
		,[TerminationDate]				,[test_TerminationDate]
		,[IsPrimaryLocation]			,[test_IsPrimaryLocation]
		,[IsPCP]						,[test_IsPCP]
		,[OfficeHours]					,[test_OfficeHours]
		,[InDirectory]					,[test_InDirectory]
		,[PatientMinimumAge]			,[test_PatientMinimumAge]
		,[PatientMaximumAge]			,[test_PatientMaximumAge]
		,[AcceptsNewPatientKey]			,[test_AcceptsNewPatientKey]
		,[TerminationReasonKey]			,[test_TerminationReasonKey]
		,[LocationCategoryKey]			,[test_LocationCategoryKey]
		,[MailingAddress1]				,[test_MailingAddress1]
		,[MailingAddress2]				,[test_MailingAddress2]
		,[MailingCity]					,[test_MailingCity]
		,[MailingState]					,[test_MailingState]
		,[MailingZipCode]				,[test_MailingZipCode]
		,[IsMailingAddressScrubbed]		,[test_IsMailingAddressScrubbed]
		,[CustomFields]					,[test_CustomFields]
		)
		select t.[NPI]
			,e.[EffectiveDate]				,t.[EffectiveDate]
			,e.[TerminationDate]			,t.[TerminationDate]
			,e.[IsPrimaryLocation]			,t.[IsPrimaryLocation]
			,e.[IsPCP]						,t.[IsPCP]
			,e.[OfficeHours]				,t.[OfficeHours]
			,e.[InDirectory]				,t.[InDirectory]
			,e.[PatientMinimumAge]			,t.[PatientMinimumAge]
			,e.[PatientMaximumAge]			,t.[PatientMaximumAge]
			,e.[AcceptsNewPatientKey]		,t.[AcceptsNewPatientKey]
			,e.[TerminationReasonKey]		,t.[TerminationReasonKey]
			,e.[LocationCategoryKey]		,t.[LocationCategoryKey]
			,e.[MailingAddress1]			,t.[MailingAddress1]
			,e.[MailingAddress2]			,t.[MailingAddress2]
			,e.[MailingCity]				,t.[MailingCity]
			,e.[MailingState]				,t.[MailingState]
			,e.[MailingZipCode]				,t.[MailingZipCode]
			,e.[IsMailingAddressScrubbed]	,t.[IsMailingAddressScrubbed]
			,e.[CustomFields]				,t.[CustomFields]
		from #pl e
		full join #test_pl t on e.[NPI] = replace(t.[NPI],'99999','99998')
						   and e.[Rank] = t.[Rank]

	--select * from #ProviderLocation

	create table #pl_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #pl_names values
		 (1,'EffectiveDate','test_EffectiveDate')
		,(2,'TerminationDate','test_TerminationDate')
		,(3,'IsPrimaryLocation','test_IsPrimaryLocation')
		,(4,'IsPCP','test_IsPCP')
		,(5,'OfficeHours','test_OfficeHours')
		,(6,'InDirectory','test_InDirectory')
		,(7,'PatientMinimumAge','test_PatientMinimumAge')
		,(8,'PatientMaximumAge','test_PatientMaximumAge')
		,(9,'AcceptsNewPatientKey','test_AcceptsNewPatientKey')
		,(10,'TerminationReasonKey','test_TerminationReasonKey')
		,(11,'LocationCategoryKey','test_LocationCategoryKey')
		,(12,'MailingAddress1','test_MailingAddress1')
		,(13,'MailingAddress2','test_MailingAddress2')
		,(14,'MailingCity','test_MailingCity')
		,(15,'MailingState','test_MailingState')
		,(16,'MailingZipCode','test_MailingZipCode')
		,(17,'IsMailingAddressScrubbed','test_IsMailingAddressScrubbed')
		,(18,'CustomFields','test_CustomFields')

	set @loop_counter = 1
	while (@loop_counter <= 18)
		begin
			select @exist_col_name = exist_col_name from #pl_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #pl_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #ProviderLocation set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #ProviderLocation set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #ProviderLocation) = 0 alter table #ProviderLocation drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #ProviderLocation) = 0 alter table #ProviderLocation drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'OLTP Provider Location'
	select * from #ProviderLocation where Diff_flag = 1


--############################## PROVIDER LOCATION COMMUNICATION ##############################

	select [PracticeNPI]
		,[StgPracticeLocationProviderCommunicationKey]
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
	into #stgplc
	from [ProviderNetworkStaging].[dbo].[StgPracticeLocationProviderCommunication] with (nolock)
	where [BatchID] = -5

	;with [orderRecord] as (select [PracticeNPI]
								,[StgPracticeLocationProviderCommunicationKey]
								,[Rank]
								,rank() over (partition by [PracticeNPI] 
											  order by [StgPracticeLocationProviderCommunicationKey]
											 ) as Rank_number 
							from #stgplc)
	update [orderRecord] set [Rank] = Rank_number

	select [PracticeNPI]
		,[StgPracticeLocationProviderCommunicationKey]
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
	into #test_stgplc
	from [ProviderNetworkStaging].[dbo].[StgPracticeLocationProviderCommunication] with (nolock)
	where [BatchID] = @BatchID

	;with [orderRecord] as (select [PracticeNPI]
								,[StgPracticeLocationProviderCommunicationKey]
								,[Rank]
								,rank() over (partition by [PracticeNPI] 
											  order by [StgPracticeLocationProviderCommunicationKey]
											 ) as Rank_number 
							from #test_stgplc)
	update [orderRecord] set [Rank] = Rank_number

	create table #StgProviderLocationCommunication
		([PracticeNPI] varchar(10)
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

	insert into #StgProviderLocationCommunication
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
		from #stgplc e
		full join #test_stgplc t on e.[PracticeNPI] = t.[PracticeNPI]
									   and e.[Rank] = t.[Rank]

	--select * from #StgProviderLocationCommunication
	
	create table #stgplc_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #stgplc_names values
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
			select @exist_col_name = exist_col_name from #stgplc_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #stgplc_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #StgProviderLocationCommunication set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #StgProviderLocationCommunication set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #StgProviderLocationCommunication) = 0 alter table #StgProviderLocationCommunication drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #StgProviderLocationCommunication) = 0 alter table #StgProviderLocationCommunication drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'StgProviderLocationCommunication'
	select * from #StgProviderLocationCommunication where Diff_flag = 1

	select p.[NPI], plc.[PracticeLocationProviderCommunicationKey]
		,cast(NULL as int) as [Rank]
		,plc.[CommunicationCategoryKey]
		,plc.[LocationCommunicationTypeKey]
		,plc.[CommunicationValue]
		,plc.[IsActive]
		,plc.[IsPrimary]
	into #plc
	from [ProviderNetwork].[dbo].[PracticeLocationProviderCommunication] plc with (nolock)
	join [ProviderNetwork].[dbo].[PracticeLocationProvider] plp on plp.[PracticeLocationProviderKey] = plc.[PracticeLocationProviderKey]
	join [ProviderNetwork].[dbo].[PracticeLocation] pl with (nolock) on pl.[PracticeLocationKey] = plp.[PracticeLocationKey]
	join [ProviderNetwork].[dbo].[Practice] p with (nolock) on p.[PracticeKey] = pl.[PracticeKey]
	where p.[NPI] like '99998%'

	;with [orderRecord] as (select [NPI]
								,[PracticeLocationProviderCommunicationKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [PracticeLocationProviderCommunicationKey]
											 ) as Rank_number 
							from #plc)
	update [orderRecord] set [Rank] = Rank_number

	select p.[NPI], plc.[PracticeLocationProviderCommunicationKey]
		,cast(NULL as int) as [Rank]
		,plc.[CommunicationCategoryKey]
		,plc.[LocationCommunicationTypeKey]
		,plc.[CommunicationValue]
		,plc.[IsActive]
		,plc.[IsPrimary]
	into #test_plc
	from [ProviderNetwork].[dbo].[PracticeLocationProviderCommunication] plc with (nolock)
	join [ProviderNetwork].[dbo].[PracticeLocationProvider] plp on plp.[PracticeLocationProviderKey] = plc.[PracticeLocationProviderKey]
	join [ProviderNetwork].[dbo].[PracticeLocation] pl with (nolock) on pl.[PracticeLocationKey] = plp.[PracticeLocationKey]
	join [ProviderNetwork].[dbo].[Practice] p with (nolock) on p.[PracticeKey] = pl.[PracticeKey]
	where p.[NPI] like '99999%'

	;with [orderRecord] as (select [NPI]
								,[PracticeLocationProviderCommunicationKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [PracticeLocationProviderCommunicationKey]
											 ) as Rank_number 
							from #test_plc)
	update [orderRecord] set [Rank] = Rank_number

	create table #ProviderLocationCommunication
		([NPI] varchar(10)
		,[Diff_flag] bit
		,[CommunicationCategoryKey] int		,[test_CommunicationCategoryKey] int
		,[LocationCommunicationTypeKey] int	,[test_LocationCommunicationTypeKey] int
		,[CommunicationValue] varchar(1000)	,[test_CommunicationValue] varchar(1000)
		,[IsActive] bit						,[test_IsActive] bit
		,[IsPrimary] bit					,[test_IsPrimary] bit
		)

	insert into #ProviderLocationCommunication
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
		from #plc e
		full join #test_plc t on e.[NPI] = replace(t.[NPI],'99999','99998')
							and e.[Rank] = t.[Rank]
	
	--select * from #ProviderLocationCommunication

	create table #plc_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #plc_names values
		    (1,'CommunicationCategoryKey','test_CommunicationCategoryKey')
		   ,(2,'LocationCommunicationTypeKey','test_LocationCommunicationTypeKey')
		   ,(3,'CommunicationValue','test_CommunicationValue')
		   ,(4,'IsActive','test_IsActive')
		   ,(5,'IsPrimary','test_IsPrimary')

	set @loop_counter = 1
	while (@loop_counter <= 5)
		begin
			select @exist_col_name = exist_col_name from #plc_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #plc_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #ProviderLocationCommunication set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #ProviderLocationCommunication set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #ProviderLocationCommunication) = 0 alter table #ProviderLocationCommunication drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #ProviderLocationCommunication) = 0 alter table #ProviderLocationCommunication drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'OLTP Provider Location Communication'
	select * from #ProviderLocationCommunication where Diff_flag = 1


--############################## PROVIDER LOCATION SPECIALTY ##############################

	select [PracticeNPI]
		,[StgPracticeLocationProviderSpecialtyKey]
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
	into #stgpls
	from [ProviderNetworkStaging].[dbo].[StgPracticeLocationProviderSpecialty] with (nolock)
	where [BatchID] = -5

	;with [orderRecord] as (select [PracticeNPI]
								,[StgPracticeLocationProviderSpecialtyKey]
								,[Rank]
								,rank() over (partition by [PracticeNPI] 
											  order by [StgPracticeLocationProviderSpecialtyKey]
											 ) as Rank_number 
							from #stgpls)
	update [orderRecord] set [Rank] = Rank_number

	select [PracticeNPI]
		,[StgPracticeLocationProviderSpecialtyKey]
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
	into #test_stgpls
	from [ProviderNetworkStaging].[dbo].[StgPracticeLocationProviderSpecialty] with (nolock)
	where [BatchID] = @BatchID

	;with [orderRecord] as (select [PracticeNPI]
								,[StgPracticeLocationProviderSpecialtyKey]
								,[Rank]
								,rank() over (partition by [PracticeNPI] 
											  order by [StgPracticeLocationProviderSpecialtyKey]
											 ) as Rank_number 
							from #test_stgpls)
	update [orderRecord] set [Rank] = Rank_number

	create table #StgProviderLocationSpecialty
		([PracticeNPI] varchar(10)
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

	insert into #StgProviderLocationSpecialty
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
		from #stgpls e
		full join #test_stgpls t on e.[PracticeNPI] = t.[PracticeNPI]
									   and e.[Rank] = t.[Rank]

	--select * from #StgProviderLocationSpecialty
	
	create table #stgpls_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #stgpls_names values
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
			select @exist_col_name = exist_col_name from #stgpls_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #stgpls_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #StgProviderLocationSpecialty set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #StgProviderLocationSpecialty set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #StgProviderLocationSpecialty) = 0 alter table #StgProviderLocationSpecialty drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #StgProviderLocationSpecialty) = 0 alter table #StgProviderLocationSpecialty drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'StgProviderLocationSpecialty'
	select * from #StgProviderLocationSpecialty where Diff_flag = 1

	select p.[NPI], pls.[PracticeLocationProviderSpecialtyKey]
		,cast(NULL as int) as [Rank]
		,pls.[SpecialtyKey]
		,pls.[StateProviderTypeKey]
		,pls.[StateSpecialtyKey]
		,pls.[Priority]
		,pls.[IsActive]
	into #pls
	from [ProviderNetwork].[dbo].[PracticeLocationProviderSpecialty] pls with (nolock)
	join [ProviderNetwork].[dbo].[PracticeLocationProvider] plp on plp.[PracticeLocationProviderKey] = pls.[PracticeLocationProviderKey]
	join [ProviderNetwork].[dbo].[PracticeLocation] pl with (nolock) on pl.[PracticeLocationKey] = plp.[PracticeLocationKey]
	join [ProviderNetwork].[dbo].[Practice] p with (nolock) on p.[PracticeKey] = pl.[PracticeKey]
	where p.[NPI] like '99998%'

	;with [orderRecord] as (select [NPI]
								,[PracticeLocationProviderSpecialtyKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [PracticeLocationProviderSpecialtyKey]
											 ) as Rank_number 
							from #pls)
	update [orderRecord] set [Rank] = Rank_number

	select p.[NPI], pls.[PracticeLocationProviderSpecialtyKey]
		,cast(NULL as int) as [Rank]
		,pls.[SpecialtyKey]
		,pls.[StateProviderTypeKey]
		,pls.[StateSpecialtyKey]
		,pls.[Priority]
		,pls.[IsActive]
	into #test_pls
	from [ProviderNetwork].[dbo].[PracticeLocationProviderSpecialty] pls with (nolock)
	join [ProviderNetwork].[dbo].[PracticeLocationProvider] plp on plp.[PracticeLocationProviderKey] = pls.[PracticeLocationProviderKey]
	join [ProviderNetwork].[dbo].[PracticeLocation] pl with (nolock) on pl.[PracticeLocationKey] = plp.[PracticeLocationKey]
	join [ProviderNetwork].[dbo].[Practice] p with (nolock) on p.[PracticeKey] = pl.[PracticeKey]
	where p.[NPI] like '99999%'

	;with [orderRecord] as (select [NPI]
								,[PracticeLocationProviderSpecialtyKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [PracticeLocationProviderSpecialtyKey]
											 ) as Rank_number 
							from #test_pls)
	update [orderRecord] set [Rank] = Rank_number

	create table #ProviderLocationSpecialty
		([NPI] varchar(10)
		,[Diff_flag] bit
		,[SpecialtyKey] int			,[test_SpecialtyKey] int
		,[StateProviderTypeKey] int	,[test_StateProviderTypeKey] int
		,[StateSpecialtyKey] int	,[test_StateSpecialtyKey] int
		,[Priority] tinyint			,[test_Priority] tinyint
		,[IsActive] bit				,[test_IsActive] bit
		)

	insert into #ProviderLocationSpecialty
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
		from #pls e
		full join #test_pls t on e.[NPI] = replace(t.[NPI],'99999','99998')
							and e.[Rank] = t.[Rank]

	--select * from #ProviderLocationSpecialty
	
	create table #pls_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #pls_names values
		 (1,'SpecialtyKey','test_SpecialtyKey')
		,(2,'StateProviderTypeKey','test_StateProviderTypeKey')
		,(3,'StateSpecialtyKey','test_StateSpecialtyKey')
		,(4,'Priority','test_Priority')
		,(5,'IsActive','test_IsActive')

	set @loop_counter = 1
	while (@loop_counter <= 5)
		begin
			select @exist_col_name = exist_col_name from #pls_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #pls_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #ProviderLocationSpecialty set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #ProviderLocationSpecialty set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #ProviderLocationSpecialty) = 0 alter table #ProviderLocationSpecialty drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #ProviderLocationSpecialty) = 0 alter table #ProviderLocationSpecialty drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'OLTP Provider Location Specialty'
	select * from #ProviderLocationSpecialty where Diff_flag = 1


--############################## PROVIDER CREDENTIAL ##############################

	select [ProviderNPI]
		,[StgProviderCredentialKey]
		,[CredentialKey]
		,[Code]
		,[RecordStatus]
		,[RecordStatusDescription]
		,cast(NULL as int) as [Rank]
	into #stgpc
	from [ProviderNetworkStaging].[dbo].[StgProviderCredential] with (nolock)
	where [BatchID] = -5

	;with [orderRecord] as (select [ProviderNPI]
								,[StgProviderCredentialKey]
								,[Rank]
								,rank() over (partition by [ProviderNPI] 
											  order by [StgProviderCredentialKey]
											 ) as Rank_number 
							from #stgpc)
	update [orderRecord] set [Rank] = Rank_number

	select [ProviderNPI]
		,[StgProviderCredentialKey]
		,[CredentialKey]
		,[Code]
		,[RecordStatus]
		,[RecordStatusDescription]
		,cast(NULL as int) as [Rank]
	into #test_stgpc
	from [ProviderNetworkStaging].[dbo].[StgProviderCredential] with (nolock)
	where [BatchID] = @BatchID

	;with [orderRecord] as (select [ProviderNPI]
								,[StgProviderCredentialKey]
								,[Rank]
								,rank() over (partition by [ProviderNPI] 
											  order by [StgProviderCredentialKey]
											 ) as Rank_number 
							from #test_stgpc)
	update [orderRecord] set [Rank] = Rank_number

	create table #StgProviderCredential
		([ProviderNPI] varchar(10)
		,[Diff_flag] bit
		,[CredentialKey] int					,[test_CredentialKey] int
		,[Code] varchar(10)						,[test_Code] varchar(10)
		,[RecordStatus] varchar(2)				,[test_RecordStatus] varchar(2)
		,[RecordStatusDescription] varchar(100)	,[test_RecordStatusDescription] varchar(100)
		)

	insert into #StgProviderCredential
		([ProviderNPI]
		,[CredentialKey]			,[test_CredentialKey]
		,[Code]						,[test_Code]
		,[RecordStatus]				,[test_RecordStatus]
		,[RecordStatusDescription]	,[test_RecordStatusDescription]
		)
		select t.[ProviderNPI]
			,e.[CredentialKey]				,t.[CredentialKey]
			,e.[Code]						,t.[Code]
			,e.[RecordStatus]				,t.[RecordStatus]
			,e.[RecordStatusDescription]	,t.[RecordStatusDescription]
		from #stgpc e
		full join #test_stgpc t on e.[ProviderNPI] = t.[ProviderNPI]
									  and e.[Rank] = t.[Rank]

	--select * from #StgProviderCredential
	
	create table #stgpc_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #stgpc_names values
		 (1,'CredentialKey','test_CredentialKey')
		,(2,'Code','test_Code')
		,(3,'RecordStatus','test_RecordStatus')
		,(4,'RecordStatusDescription','test_RecordStatusDescription')

	set @loop_counter = 1
	while (@loop_counter <= 4)
		begin
			select @exist_col_name = exist_col_name from #stgpc_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #stgpc_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #StgProviderCredential set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #StgProviderCredential set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #StgProviderCredential) = 0 alter table #StgProviderCredential drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #StgProviderCredential) = 0 alter table #StgProviderCredential drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'StgProviderCredential'
	select * from #StgProviderCredential where Diff_flag = 1

	select p.[NPI], pc.[ProviderCredentialKey]
		,cast(NULL as int) as [Rank]
		,[CredentialKey]
		,[IsActive]
	into #pc
	from [ProviderNetwork].[dbo].[ProviderCredential] pc
	join [ProviderNetwork].[dbo].[Provider] p with (nolock) on p.[ProviderKey] = pc.[ProviderKey]
	where p.[NPI] like '99998%'

	;with [orderRecord] as (select [NPI]
								,[CredentialKey]
								,[ProviderCredentialKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [CredentialKey]
													,[ProviderCredentialKey]
											 ) as Rank_number 
							from #pc)
	update [orderRecord] set [Rank] = Rank_number

	select p.[NPI], pc.[ProviderCredentialKey]
		,cast(NULL as int) as [Rank]
		,[CredentialKey]
		,[IsActive]
	into #test_pc
	from [ProviderNetwork].[dbo].[ProviderCredential] pc
	join [ProviderNetwork].[dbo].[Provider] p with (nolock) on p.[ProviderKey] = pc.[ProviderKey]
	where p.[NPI] like '99999%'

	;with [orderRecord] as (select [NPI]
								,[CredentialKey]
								,[ProviderCredentialKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [CredentialKey]
													,[ProviderCredentialKey]
											 ) as Rank_number 
							from #test_pc)
	update [orderRecord] set [Rank] = Rank_number

	create table #ProviderCredential
		([NPI] varchar(10)
		,[Diff_flag] bit
		,[CredentialKey] int	,[test_CredentialKey] int
		,[IsActive] bit			,[test_IsActive] bit
		)

	insert into #ProviderCredential
		([NPI]
		,[CredentialKey]	,[test_CredentialKey]
		,[IsActive]			,[test_IsActive]
		)
		select t.[NPI]
			,e.[CredentialKey]	,t.[CredentialKey]
			,e.[IsActive]		,t.[IsActive]
		from #pc e
		full join #test_pc t on e.[NPI] = replace(t.[NPI],'99999','99998')
						   and e.[Rank] = t.[Rank]

	--select * from #ProviderCredential
	
	create table #pc_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #pc_names values
		 (1,'CredentialKey','test_CredentialKey')
		,(2,'IsActive','test_IsActive')

	set @loop_counter = 1
	while (@loop_counter <= 2)
		begin
			select @exist_col_name = exist_col_name from #pc_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #pc_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #ProviderCredential set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #ProviderCredential set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #ProviderCredential) = 0 alter table #ProviderCredential drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #ProviderCredential) = 0 alter table #ProviderCredential drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'OLTP Provider Credential'
	select * from #ProviderCredential where Diff_flag = 1


--############################## PROVIDER LANGUAGE ##############################

	select [ProviderNPI]
		,[StgProviderLanguageKey]
		,[LanguageCode]
		,[Priority]
		,[RecordStatus]
		,[RecordStatusDescription]
		,cast(NULL as int) as [Rank]
	into #stgpla
	from [ProviderNetworkStaging].[dbo].[StgProviderLanguage] with (nolock)
	where [BatchID] = -5

	;with [orderRecord] as (select [ProviderNPI]
								,[StgProviderLanguageKey]
								,[Rank]
								,rank() over (partition by [ProviderNPI] 
											  order by [StgProviderLanguageKey]
											 ) as Rank_number 
							from #stgpla)
	update [orderRecord] set [Rank] = Rank_number

	select [ProviderNPI]
		,[StgProviderLanguageKey]
		,[LanguageCode]
		,[Priority]
		,[RecordStatus]
		,[RecordStatusDescription]
		,cast(NULL as int) as [Rank]
	into #test_stgpla
	from [ProviderNetworkStaging].[dbo].[StgProviderLanguage] with (nolock)
	where [BatchID] = @BatchID

	;with [orderRecord] as (select [ProviderNPI]
								,[StgProviderLanguageKey]
								,[Rank]
								,rank() over (partition by [ProviderNPI] 
											  order by [StgProviderLanguageKey]
											 ) as Rank_number 
							from #test_stgpla)
	update [orderRecord] set [Rank] = Rank_number

	create table #StgProviderLanguage
		([ProviderNPI] varchar(10)
		,[Diff_flag] bit
		,[LanguageCode] varchar(10)				,[test_LanguageCode] varchar(10)
		,[Priority] int							,[test_Priority] int
		,[RecordStatus] varchar(2)				,[test_RecordStatus] varchar(2)
		,[RecordStatusDescription] varchar(100)	,[test_RecordStatusDescription] varchar(100)
		)

	insert into #StgProviderLanguage
		([ProviderNPI]
		,[LanguageCode]				,[test_LanguageCode]
		,[Priority]					,[test_Priority]
		,[RecordStatus]				,[test_RecordStatus]
		,[RecordStatusDescription]	,[test_RecordStatusDescription]
		)
		select t.[ProviderNPI]
			   ,e.[LanguageCode]			,t.[LanguageCode]
			   ,e.[Priority]				,t.[Priority]
			   ,e.[RecordStatus]			,t.[RecordStatus]
			   ,e.[RecordStatusDescription]	,t.[RecordStatusDescription]
		from #stgpla e
		full join #test_stgpla t on e.[ProviderNPI] = t.[ProviderNPI]
									   and e.[Rank] = t.[Rank]
	
	--select * from #StgProviderLanguage
	
	create table #stgpla_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #stgpla_names values
		    (1,'LanguageCode','test_LanguageCode')
		   ,(2,'Priority','test_Priority')
		   ,(3,'RecordStatus','test_RecordStatus')
		   ,(4,'RecordStatusDescription','test_RecordStatusDescription')

	set @loop_counter = 1
	while (@loop_counter <= 4)
		begin
			select @exist_col_name = exist_col_name from #stgpla_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #stgpla_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #StgProviderLanguage set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #StgProviderLanguage set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #StgProviderLanguage) = 0 alter table #StgProviderLanguage drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #StgProviderLanguage) = 0 alter table #StgProviderLanguage drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'StgProviderLanguage'
	select * from #StgProviderLanguage where Diff_flag = 1

	select p.[NPI], pl.[ProviderLanguageKey]
		,cast(NULL as int) as [Rank]
		,pl.[Language]
		,pl.[Priority]
		,pl.[IsActive]
	into #pla
	from [ProviderNetwork].[dbo].[ProviderLanguage] pl with (nolock)
	join [ProviderNetwork].[dbo].[Provider] p with (nolock) on p.[ProviderKey] = pl.[ProviderKey]
	where p.[NPI] like '99998%'

	;with [orderRecord] as (select [NPI]
								,[Language]
								,[ProviderLanguageKey]
								,[Priority]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [Language]
													  ,[ProviderLanguageKey]
													  ,[Priority]
											 ) as Rank_number 
							from #pla)
	update [orderRecord] set [Rank] = Rank_number

	select p.[NPI], pl.[ProviderLanguageKey]
		,cast(NULL as int) as [Rank]
		,pl.[Language]
		,pl.[Priority]
		,pl.[IsActive]
	into #test_pla
	from [ProviderNetwork].[dbo].[ProviderLanguage] pl with (nolock)
	join [ProviderNetwork].[dbo].[Provider] p with (nolock) on p.[ProviderKey] = pl.[ProviderKey]
	where p.[NPI] like '99999%'

	;with [orderRecord] as (select [NPI]
								,[Language]
								,[Priority]
								,[ProviderLanguageKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [Language]
													  ,[Priority]
													  ,[ProviderLanguageKey]
											 ) as Rank_number 
							from #test_pla)
	update [orderRecord] set [Rank] = Rank_number

	create table #ProviderLanguage
		([NPI] varchar(10)
		,[Diff_flag] bit
		,[Language] varchar(10) ,[test_Language] varchar(10)	
		,[Priority] tinyint	    ,[test_Priority] tinyint
		,[IsActive] bit		    ,[test_IsActive] bit
		)

	insert into #ProviderLanguage
		([NPI]
		,[Language] ,[test_Language] 	
		,[Priority] ,[test_Priority]
		,[IsActive]	,[test_IsActive]
		)
		select t.[NPI]
			,e.[Language], t.[Language] 	
			,e.[Priority], t.[Priority]
			,e.[IsActive], t.[IsActive]
		from #pla e
		full join #test_pla t on e.[NPI] = replace(t.[NPI],'99999','99998')
							and e.[Rank] = t.[Rank]

	--select * from #ProviderLanguage

	create table #pla_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #pla_names values
		     (1,'Language','test_Language')
			,(2,'Priority','test_Priority')
			,(3,'IsActive','test_IsActive')

	set @loop_counter = 1
	while (@loop_counter <= 3)
		begin
			select @exist_col_name = exist_col_name from #pla_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #pla_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #ProviderLanguage set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #ProviderLanguage set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #ProviderLanguage) = 0 alter table #ProviderLanguage drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #ProviderLanguage) = 0 alter table #ProviderLanguage drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'OLTP Provider Language'
	select * from #ProviderLanguage where Diff_flag = 1


--############################## PROVIDER LICENSE ##############################

	select [ProviderNPI]
		,[StgProviderLicenseDetailsKey]
		,[ProviderLicenseID]
		,[ProviderLicenseState]
		,[ProviderLicenseType]
		,[ProviderLicenseEffectiveDate]
		,[ProviderLicenseTerminationDate]
		,[LicenseTypeKey]
		,[LicenseCategoryKey]
		,[RecordStatus]
		,[RecordStatusDescription]
		,cast(NULL as int) as [Rank]
	into #stgplic
	from [ProviderNetworkStaging].[dbo].[StgProviderLicenseDetails] with (nolock)
	where [BatchID] = -5

	;with [orderRecord] as (select [ProviderNPI]
								,[StgProviderLicenseDetailsKey]
								,[Rank]
								,rank() over (partition by [ProviderNPI] 
											  order by [StgProviderLicenseDetailsKey]
											 ) as Rank_number 
							from #stgplic)
	update [orderRecord] set [Rank] = Rank_number

	select [ProviderNPI]
		,[StgProviderLicenseDetailsKey]
		,[ProviderLicenseID]
		,[ProviderLicenseState]
		,[ProviderLicenseType]
		,[ProviderLicenseEffectiveDate]
		,[ProviderLicenseTerminationDate]
		,[LicenseTypeKey]
		,[LicenseCategoryKey]
		,[RecordStatus]
		,[RecordStatusDescription]
		,cast(NULL as int) as [Rank]
	into #test_stgplic
	from [ProviderNetworkStaging].[dbo].[StgProviderLicenseDetails] with (nolock)
	where [BatchID] = @BatchID

	;with [orderRecord] as (select [ProviderNPI]
								,[StgProviderLicenseDetailsKey]
								,[Rank]
								,rank() over (partition by [ProviderNPI] 
											  order by [StgProviderLicenseDetailsKey]
											 ) as Rank_number 
							from #test_stgplic)
	update [orderRecord] set [Rank] = Rank_number

	create table #StgProviderLicense
		([ProviderNPI] varchar(10)
		,[Diff_flag] bit
		,[ProviderLicenseID] varchar(255)		,[test_ProviderLicenseID] varchar(255)
		,[ProviderLicenseState] varchar(102)	,[test_ProviderLicenseState] varchar(102)
		,[ProviderLicenseType] varchar(355)		,[test_ProviderLicenseType] varchar(355)
		,[ProviderLicenseEffectiveDate] date	,[test_ProviderLicenseEffectiveDate] date
		,[ProviderLicenseTerminationDate] date	,[test_ProviderLicenseTerminationDate] date
		,[LicenseTypeKey] int					,[test_LicenseTypeKey] int
		,[LicenseCategoryKey] int				,[test_LicenseCategoryKey] int
		,[RecordStatus] varchar(2)				,[test_RecordStatus] varchar(2)
		,[RecordStatusDescription] varchar(100)	,[test_RecordStatusDescription] varchar(100)
		)

	insert into #StgProviderLicense
		([ProviderNPI]
		,[ProviderLicenseID]				,[test_ProviderLicenseID]
		,[ProviderLicenseState]				,[test_ProviderLicenseState]
		,[ProviderLicenseType]				,[test_ProviderLicenseType]
		,[ProviderLicenseEffectiveDate]		,[test_ProviderLicenseEffectiveDate]
		,[ProviderLicenseTerminationDate]	,[test_ProviderLicenseTerminationDate]
		,[LicenseTypeKey]					,[test_LicenseTypeKey]
		,[LicenseCategoryKey]				,[test_LicenseCategoryKey]
		,[RecordStatus]						,[test_RecordStatus]
		,[RecordStatusDescription]			,[test_RecordStatusDescription]
		)
		select t.[ProviderNPI]
			,e.[ProviderLicenseID]				,t.[ProviderLicenseID]
			,e.[ProviderLicenseState]			,t.[ProviderLicenseState]
			,e.[ProviderLicenseType]			,t.[ProviderLicenseType]
			,e.[ProviderLicenseEffectiveDate]	,t.[ProviderLicenseEffectiveDate]
			,e.[ProviderLicenseTerminationDate]	,t.[ProviderLicenseTerminationDate]
			,e.[LicenseTypeKey]					,t.[LicenseTypeKey]
			,e.[LicenseCategoryKey]				,t.[LicenseCategoryKey]
			,e.[RecordStatus]					,t.[RecordStatus]
			,e.[RecordStatusDescription]		,t.[RecordStatusDescription]
		from #stgplic e
		full join #test_stgplic t on e.[ProviderNPI] = t.[ProviderNPI]
										and e.[Rank] = t.[Rank]

	--select * from #StgProviderLicense
	
	create table #stgplic_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #stgplic_names values
		 (1,'ProviderLicenseID','test_ProviderLicenseID')
		,(2,'ProviderLicenseState','test_ProviderLicenseState')
		,(3,'ProviderLicenseType','test_ProviderLicenseType')
		,(4,'ProviderLicenseEffectiveDate','test_ProviderLicenseEffectiveDate')
		,(5,'ProviderLicenseTerminationDate','test_ProviderLicenseTerminationDate')
		,(6,'LicenseTypeKey','test_LicenseTypeKey')
		,(7,'LicenseCategoryKey','test_LicenseCategoryKey')
		,(8,'RecordStatus','test_RecordStatus')
		,(9,'RecordStatusDescription','test_RecordStatusDescription')

	set @loop_counter = 1
	while (@loop_counter <= 9)
		begin
			select @exist_col_name = exist_col_name from #stgplic_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #stgplic_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #StgProviderLicense set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #StgProviderLicense set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #StgProviderLicense) = 0 alter table #StgProviderLicense drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #StgProviderLicense) = 0 alter table #StgProviderLicense drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'StgProviderLicense'
	select * from #StgProviderLicense where Diff_flag = 1

	select p.[NPI], pld.[ProviderLicenseDetailsKey]
		,cast(NULL as int) as [Rank]
		,pld.[LicenseTypeKey]
		,pld.[LicenseCategoryKey]
		,pld.[LicenseNumber]
		,pld.[StateCode]
		,pld.[EffectiveDate]
		,pld.[TerminationDate]
		,pld.[IsActive]
	into #plic
	from [ProviderNetwork].[dbo].[ProviderLicenseDetails] pld
	join [ProviderNetwork].[dbo].[Provider] p with (nolock) on p.[ProviderKey] = pld.[ProviderKey]
	where p.[NPI] like '99998%'

	;with [orderRecord] as (select [NPI]
								,[ProviderLicenseDetailsKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [ProviderLicenseDetailsKey]
											 ) as Rank_number 
							from #plic)
	update [orderRecord] set [Rank] = Rank_number

	select p.[NPI], pld.[ProviderLicenseDetailsKey]
		,cast(NULL as int) as [Rank]
		,pld.[LicenseTypeKey]
		,pld.[LicenseCategoryKey]
		,pld.[LicenseNumber]
		,pld.[StateCode]
		,pld.[EffectiveDate]
		,pld.[TerminationDate]
		,pld.[IsActive]
	into #test_plic
	from [ProviderNetwork].[dbo].[ProviderLicenseDetails] pld
	join [ProviderNetwork].[dbo].[Provider] p with (nolock) on p.[ProviderKey] = pld.[ProviderKey]
	where p.[NPI] like '99999%'

	;with [orderRecord] as (select [NPI]
								,[ProviderLicenseDetailsKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [ProviderLicenseDetailsKey]
											 ) as Rank_number 
							from #test_plic)
	update [orderRecord] set [Rank] = Rank_number

	create table #ProviderLicense
		([NPI] varchar(10)
		,[Diff_flag] bit
		,[LicenseTypeKey] int			,[test_LicenseTypeKey] int
		,[LicenseCategoryKey] int		,[test_LicenseCategoryKey] int
		,[LicenseNumber] varchar(255)	,[test_LicenseNumber] varchar(255)
		,[StateCode] char(2)			,[test_StateCode] char(2)
		,[EffectiveDate] datetime		,[test_EffectiveDate] datetime
		,[TerminationDate] datetime		,[test_TerminationDate] datetime
		,[IsActive] bit					,[test_IsActive] bit
		)

	insert into #ProviderLicense
		([NPI]
		,[LicenseTypeKey]		,[test_LicenseTypeKey]
		,[LicenseCategoryKey]	,[test_LicenseCategoryKey]
		,[LicenseNumber]		,[test_LicenseNumber]
		,[StateCode]			,[test_StateCode]
		,[EffectiveDate]		,[test_EffectiveDate]
		,[TerminationDate]		,[test_TerminationDate]
		,[IsActive]				,[test_IsActive]
		)
		select t.[NPI]
			,e.[LicenseTypeKey]		,t.[LicenseTypeKey]
			,e.[LicenseCategoryKey]	,t.[LicenseCategoryKey]
			,e.[LicenseNumber]		,t.[LicenseNumber]
			,e.[StateCode]			,t.[StateCode]
			,e.[EffectiveDate]		,t.[EffectiveDate]
			,e.[TerminationDate]	,t.[TerminationDate]
			,e.[IsActive]			,t.[IsActive]
		from #plic e
		full join #test_plic t on e.[NPI] = replace(t.[NPI],'99999','99998')
							 and e.[Rank] = t.[Rank]

	--select * from #ProviderLicense
	
	create table #plic_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #plic_names values
		 (1,'LicenseTypeKey','test_LicenseTypeKey')
		,(2,'LicenseCategoryKey','test_LicenseCategoryKey')
		,(3,'LicenseNumber','test_LicenseNumber')
		,(4,'StateCode','test_StateCode')
		,(5,'EffectiveDate','test_EffectiveDate')
		,(6,'TerminationDate','test_TerminationDate')
		,(7,'IsActive','test_IsActive')

	set @loop_counter = 1
	while (@loop_counter <= 7)
		begin
			select @exist_col_name = exist_col_name from #plic_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #plic_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #ProviderLicense set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #ProviderLicense set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #ProviderLicense) = 0 alter table #ProviderLicense drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #ProviderLicense) = 0 alter table #ProviderLicense drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'OLTP Provider License'
	select * from #ProviderLicense where Diff_flag = 1


--############################## PLCC ASSIGNMENT ##############################

	select [PracticeNPI]
		,[StgProviderLocationContractComponentKey]
		,[LocationName]
		,[Address1]
		,[TIN]
		,[BusinessName]
		,[ContractId]
		,[AffiliationId]
		,[NetworkName]
		,[SubnetworkName]
		,[PLCCAssignmentEffectiveDate]
		,[PLCCAssignmentTerminationDate]
		,[RecordStatus]
		,[ErrorDescription]
		,cast(NULL as int) as [Rank]
	into #stgplcc
	from [ProviderNetworkStaging].[dbo].[StgProviderLocationContractComponent] with (nolock)
	where [BatchID] = -5

	;with [orderRecord] as (select [PracticeNPI]
								,[StgProviderLocationContractComponentKey]
								,[Rank]
								,rank() over (partition by [PracticeNPI] 
											  order by [StgProviderLocationContractComponentKey]
											 ) as Rank_number 
							from #stgplcc)
	update [orderRecord] set [Rank] = Rank_number

	select [PracticeNPI]
		,[StgProviderLocationContractComponentKey]
		,[LocationName]
		,[Address1]
		,[TIN]
		,[BusinessName]
		,[ContractId]
		,[AffiliationId]
		,[NetworkName]
		,[SubnetworkName]
		,[PLCCAssignmentEffectiveDate]
		,[PLCCAssignmentTerminationDate]
		,[RecordStatus]
		,[ErrorDescription]
		,cast(NULL as int) as [Rank]
	into #test_stgplcc
	from [ProviderNetworkStaging].[dbo].[StgProviderLocationContractComponent] with (nolock)
	where [BatchID] = @BatchID

	;with [orderRecord] as (select [PracticeNPI]
								,[StgProviderLocationContractComponentKey]
								,[Rank]
								,rank() over (partition by [PracticeNPI] 
											  order by [StgProviderLocationContractComponentKey]
											 ) as Rank_number 
							from #test_stgplcc)
	update [orderRecord] set [Rank] = Rank_number

	create table #StgProviderLocationContractComponent
		([PracticeNPI] varchar(10)
		,[Diff_flag] bit
		,[LocationName] varchar(255)			,[test_LocationName] varchar(255)
		,[Address1] varchar(100)				,[test_Address1] varchar(100)
		,[TIN] varchar(9)						,[test_TIN] varchar(9)
		,[BusinessName] varchar(255)			,[test_BusinessName] varchar(255)
		,[ContractId] varchar(255)				,[test_ContractId] varchar(255)
		,[AffiliationId] varchar(255)			,[test_AffiliationId] varchar(255)
		,[NetworkName] varchar(255)				,[test_NetworkName] varchar(255)
		,[SubnetworkName] varchar(255)			,[test_SubnetworkName] varchar(255)
		,[PLCCAssignmentEffectiveDate] date		,[test_PLCCAssignmentEffectiveDate] date
		,[PLCCAssignmentTerminationDate] date	,[test_PLCCAssignmentTerminationDate] date
		,[RecordStatus] varchar(2)				,[test_RecordStatus] varchar(2)
		,[ErrorDescription] varchar(255)		,[test_ErrorDescription] varchar(255)
		)

	insert into #StgProviderLocationContractComponent
		([PracticeNPI]
		,[LocationName]					,[test_LocationName]
		,[Address1]						,[test_Address1]
		,[TIN]							,[test_TIN]
		,[BusinessName]					,[test_BusinessName]
		,[ContractId]					,[test_ContractId]
		,[AffiliationId]				,[test_AffiliationId]
		,[NetworkName]					,[test_NetworkName]
		,[SubnetworkName]				,[test_SubnetworkName]
		,[PLCCAssignmentEffectiveDate]	,[test_PLCCAssignmentEffectiveDate]
		,[PLCCAssignmentTerminationDate],[test_PLCCAssignmentTerminationDate]
		,[RecordStatus]					,[test_RecordStatus]
		,[ErrorDescription]				,[test_ErrorDescription]
		)
		select t.[PracticeNPI]
			   ,e.[LocationName]					,t.[LocationName]
			   ,e.[Address1]						,t.[Address1]
			   ,e.[TIN]								,t.[TIN]
			   ,e.[BusinessName]					,t.[BusinessName]
			   ,e.[ContractId]						,t.[ContractId]
			   ,e.[AffiliationId]					,t.[AffiliationId]
			   ,e.[NetworkName]						,t.[NetworkName]
			   ,e.[SubnetworkName]					,t.[SubnetworkName]
			   ,e.[PLCCAssignmentEffectiveDate]		,t.[PLCCAssignmentEffectiveDate]
			   ,e.[PLCCAssignmentTerminationDate]	,t.[PLCCAssignmentTerminationDate]
			   ,e.[RecordStatus]					,t.[RecordStatus]
			   ,e.[ErrorDescription]				,t.[ErrorDescription]
		from #stgplcc e
		full join #test_stgplcc t on e.[PracticeNPI] = t.[PracticeNPI]
										and e.[Rank] = t.[Rank]

	--select * from #StgProviderLocationContractComponent
	
	create table #stgplcc_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #stgplcc_names values
		   (1,'LocationName','test_LocationName')
		  ,(2,'Address1','test_Address1')
		  ,(3,'TIN','test_TIN')
		  ,(4,'BusinessName','test_BusinessName')
		  ,(5,'ContractId','test_ContractId')
		  ,(6,'AffiliationId','test_AffiliationId')
		  ,(7,'NetworkName','test_NetworkName')
		  ,(8,'SubnetworkName','test_SubnetworkName')
		  ,(9,'PLCCAssignmentEffectiveDate','test_PLCCAssignmentEffectiveDate')
		  ,(10,'PLCCAssignmentTerminationDate','test_PLCCAssignmentTerminationDate')
		  ,(11,'RecordStatus','test_RecordStatus')
		  ,(12,'ErrorDescription','test_ErrorDescription')

	set @loop_counter = 1
	while (@loop_counter <= 12)
		begin
			select @exist_col_name = exist_col_name from #stgplcc_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #stgplcc_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #StgProviderLocationContractComponent set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #StgProviderLocationContractComponent set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #StgProviderLocationContractComponent) = 0 alter table #StgProviderLocationContractComponent drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #StgProviderLocationContractComponent) = 0 alter table #StgProviderLocationContractComponent drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'StgProviderLocationContractComponent'
	select * from #StgProviderLocationContractComponent where Diff_flag = 1

	select p.[NPI], plcc.[ProviderLocationContractComponentKey]
		,cast(NULL as int) as [Rank]
		,plcc.[EffectiveDate]
		,plcc.[TerminationDate]
	into #plcc
	from [ProviderNetwork].[dbo].[ProviderLocationContractComponent] plcc with (nolock)
	join [ProviderNetwork].[dbo].[PracticeLocationProvider] plp with (nolock) on plp.[PracticeLocationProviderKey] = plcc.[PracticeLocationProviderKey]
	join [ProviderNetwork].[dbo].[PracticeLocation] pl with (nolock) on pl.[PracticeLocationKey] = plp.[PracticeLocationKey]
	join [ProviderNetwork].[dbo].[Practice] p with (nolock) on p.[PracticeKey] = pl.[PracticeKey]
	where p.[NPI] like '99998%'

	;with [orderRecord] as (select [NPI]
								,[ProviderLocationContractComponentKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [ProviderLocationContractComponentKey]
											 ) as Rank_number 
							from #plcc)
	update [orderRecord] set [Rank] = Rank_number

	select p.[NPI], plcc.[ProviderLocationContractComponentKey]
		,cast(NULL as int) as [Rank]
		,plcc.[EffectiveDate]
		,plcc.[TerminationDate]
	into #test_plcc
	from [ProviderNetwork].[dbo].[ProviderLocationContractComponent] plcc with (nolock)
	join [ProviderNetwork].[dbo].[PracticeLocationProvider] plp with (nolock) on plp.[PracticeLocationProviderKey] = plcc.[PracticeLocationProviderKey]
	join [ProviderNetwork].[dbo].[PracticeLocation] pl with (nolock) on pl.[PracticeLocationKey] = plp.[PracticeLocationKey]
	join [ProviderNetwork].[dbo].[Practice] p with (nolock) on p.[PracticeKey] = pl.[PracticeKey]
	where p.[NPI] like '99999%'

	;with [orderRecord] as (select [NPI]
								,[ProviderLocationContractComponentKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [ProviderLocationContractComponentKey]
											 ) as Rank_number 
							from #test_plcc)
	update [orderRecord] set [Rank] = Rank_number

	create table #ProviderLocationContractComponent
		([NPI] varchar(10)
		,[Diff_flag] bit
		,[EffectiveDate] date	,[test_EffectiveDate] date	
		,[TerminationDate] date	,[test_TerminationDate] date
		)

	insert into #ProviderLocationContractComponent
		([NPI]
		,[EffectiveDate] 	,[test_EffectiveDate] 	
		,[TerminationDate] 	,[test_TerminationDate] 
		)
		select t.[NPI]
			,e.[EffectiveDate] 	 ,t.[EffectiveDate] 	
			,e.[TerminationDate] ,t.[TerminationDate]
		from #plcc e
		full join #test_plcc t on e.[NPI] = replace(t.[NPI],'99999','99998')
							 and e.[Rank] = t.[Rank]

	--select * from #ProviderLocationContractComponent
	
	create table #plcc_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #plcc_names values
		    (1,'EffectiveDate','test_EffectiveDate')
		   ,(2,'TerminationDate','test_TerminationDate')

	set @loop_counter = 1
	while (@loop_counter <= 2)
		begin
			select @exist_col_name = exist_col_name from #plcc_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #plcc_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #ProviderLocationContractComponent set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #ProviderLocationContractComponent set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #ProviderLocationContractComponent) = 0 alter table #ProviderLocationContractComponent drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #ProviderLocationContractComponent) = 0 alter table #ProviderLocationContractComponent drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'OLTP Provider Location Contract Component'
	select * from #ProviderLocationContractComponent where Diff_flag = 1


--############################## PROVIDER LOCATION HOSPITAL RELATIONSHIP ##############################

	select [PracticeNPI]
		,[StgProviderLocationHospitalRelationshipKey]
		,[ProviderNPI]
		,[PracticeSubpartNPI]
		,[LocationName]
		,[Address1]
		,[PhysHospRelNPI]
		,[PhysHospRelEffectiveDate]
		,[PhysHospRelTerminationDate]
		,[PhysHospRelType]
		,[HospitalRelationshipTypeKey]
		,[RecordStatus]
		,[ErrorDescription]
		,cast(NULL as int) as [Rank]
	into #stgplhr
	from [ProviderNetworkStaging].[dbo].[StgProviderLocationHospitalRelationship] with (nolock)
	where [BatchID] = -5

	;with [orderRecord] as (select [PracticeNPI]
								,[StgProviderLocationHospitalRelationshipKey]
								,[Rank]
								,rank() over (partition by [PracticeNPI] 
											  order by [StgProviderLocationHospitalRelationshipKey]
											 ) as Rank_number 
							from #stgplhr)
	update [orderRecord] set [Rank] = Rank_number

	select [PracticeNPI]
		,[StgProviderLocationHospitalRelationshipKey]
		,[ProviderNPI]
		,[PracticeSubpartNPI]
		,[LocationName]
		,[Address1]
		,[PhysHospRelNPI]
		,[PhysHospRelEffectiveDate]
		,[PhysHospRelTerminationDate]
		,[PhysHospRelType]
		,[HospitalRelationshipTypeKey]
		,[RecordStatus]
		,[ErrorDescription]
		,cast(NULL as int) as [Rank]
	into #test_stgplhr
	from [ProviderNetworkStaging].[dbo].[StgProviderLocationHospitalRelationship] with (nolock)
	where [BatchID] = @BatchID

	;with [orderRecord] as (select [PracticeNPI]
								,[StgProviderLocationHospitalRelationshipKey]
								,[Rank]
								,rank() over (partition by [PracticeNPI] 
											  order by [StgProviderLocationHospitalRelationshipKey]
											 ) as Rank_number 
							from #test_stgplhr)
	update [orderRecord] set [Rank] = Rank_number

	create table #StgProviderLocationHospitalRelationship
		([PracticeNPI] varchar(10)
		,[Diff_flag] bit
		,[ProviderNPI] varchar(10)			,[test_ProviderNPI] varchar(10)
		,[PracticeSubpartNPI] varchar(10)	,[test_PracticeSubpartNPI] varchar(10)
		,[LocationName] varchar(255)		,[test_LocationName] varchar(255)
		,[Address1] varchar(100)			,[test_Address1] varchar(100)
		,[PhysHospRelNPI] varchar(10)		,[test_PhysHospRelNPI] varchar(10)
		,[PhysHospRelEffectiveDate] date	,[test_PhysHospRelEffectiveDate] date
		,[PhysHospRelTerminationDate] date	,[test_PhysHospRelTerminationDate] date
		,[PhysHospRelType] varchar(255)		,[test_PhysHospRelType] varchar(255)
		,[HospitalRelationshipTypeKey] int	,[test_HospitalRelationshipTypeKey] int
		,[RecordStatus] varchar(2)			,[test_RecordStatus] varchar(2)
		,[ErrorDescription] varchar(255)	,[test_ErrorDescription] varchar(255)
		)

	insert into #StgProviderLocationHospitalRelationship
		([PracticeNPI]
		,[ProviderNPI]					,[test_ProviderNPI]
		,[PracticeSubpartNPI]			,[test_PracticeSubpartNPI]
		,[LocationName]					,[test_LocationName]
		,[Address1]						,[test_Address1]
		,[PhysHospRelNPI]				,[test_PhysHospRelNPI]
		,[PhysHospRelEffectiveDate]		,[test_PhysHospRelEffectiveDate]
		,[PhysHospRelTerminationDate]	,[test_PhysHospRelTerminationDate]
		,[PhysHospRelType]				,[test_PhysHospRelType]
		,[HospitalRelationshipTypeKey]	,[test_HospitalRelationshipTypeKey]
		,[RecordStatus]					,[test_RecordStatus]
		,[ErrorDescription]				,[test_ErrorDescription]
		)
		select t.[PracticeNPI]
			,e.[ProviderNPI]					,t.[ProviderNPI]
			,e.[PracticeSubpartNPI]				,t.[PracticeSubpartNPI]
			,e.[LocationName]					,t.[LocationName]
			,e.[Address1]						,t.[Address1]
			,e.[PhysHospRelNPI]					,t.[PhysHospRelNPI]
			,e.[PhysHospRelEffectiveDate]		,t.[PhysHospRelEffectiveDate]
			,e.[PhysHospRelTerminationDate]		,t.[PhysHospRelTerminationDate]
			,e.[PhysHospRelType]				,t.[PhysHospRelType]
			,e.[HospitalRelationshipTypeKey]	,t.[HospitalRelationshipTypeKey]
			,e.[RecordStatus]					,t.[RecordStatus]
			,e.[ErrorDescription]				,t.[ErrorDescription]
		from #stgplhr e
		full join #test_stgplhr t on e.[PracticeNPI] = t.[PracticeNPI]
										and e.[Rank] = t.[Rank]

	--select * from #StgProviderLocationHospitalRelationship
	
	create table #stgplhr_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #stgplhr_names values
		 (1,'ProviderNPI','test_ProviderNPI')
		,(2,'PracticeSubpartNPI','test_PracticeSubpartNPI')
		,(3,'LocationName','test_LocationName')
		,(4,'Address1','test_Address1')
		,(5,'PhysHospRelNPI','test_PhysHospRelNPI')
		,(6,'PhysHospRelEffectiveDate','test_PhysHospRelEffectiveDate')
		,(7,'PhysHospRelTerminationDate','test_PhysHospRelTerminationDate')
		,(8,'PhysHospRelType','test_PhysHospRelType')
		,(9,'HospitalRelationshipTypeKey','test_HospitalRelationshipTypeKey')
		,(10,'RecordStatus','test_RecordStatus')
		,(11,'ErrorDescription','test_ErrorDescription')

	set @loop_counter = 1
	while (@loop_counter <= 11)
		begin
			select @exist_col_name = exist_col_name from #stgplhr_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #stgplhr_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #StgProviderLocationHospitalRelationship set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #StgProviderLocationHospitalRelationship set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #StgProviderLocationHospitalRelationship) = 0 alter table #StgProviderLocationHospitalRelationship drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #StgProviderLocationHospitalRelationship) = 0 alter table #StgProviderLocationHospitalRelationship drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'StgProviderLocationHospitalRelationship'
	select * from #StgProviderLocationHospitalRelationship where Diff_flag = 1

	select p.[NPI], plhr.[ProviderLocationHospitalRelationshipKey]
		,cast(NULL as int) as [Rank]
		,replace(phr.[NPI],'99998','99999') as [RelFacilityNPI]
		,plhr.[HospitalRelationshipTypeKey]
		,plhr.[EffectiveDate]
		,plhr.[TerminationDate]
	into #plhr
	from [ProviderNetwork].[dbo].[ProviderLocationHospitalRelationship] plhr with (nolock)
	join [ProviderNetwork].[dbo].[PracticeLocationProvider] plp with (nolock) on plp.[PracticeLocationProviderKey] = plhr.[PracticeLocationProviderKey]
	join [ProviderNetwork].[dbo].[PracticeLocation] pl with (nolock) on pl.[PracticeLocationKey] = plp.[PracticeLocationKey]
	join [ProviderNetwork].[dbo].[Practice] p with (nolock) on p.[PracticeKey] = pl.[PracticeKey]
	join [ProviderNetwork].[dbo].[Practice] phr with (nolock) on phr.[PracticeKey] = plhr.[PracticeKey]
	where p.[NPI] like '99998%'

	;with [orderRecord] as (select [NPI]
								,[ProviderLocationHospitalRelationshipKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [ProviderLocationHospitalRelationshipKey]
											 ) as Rank_number 
							from #plhr)
	update [orderRecord] set [Rank] = Rank_number

	select p.[NPI], plhr.[ProviderLocationHospitalRelationshipKey]
		,cast(NULL as int) as [Rank]
		,phr.[NPI] as [RelFacilityNPI]
		,plhr.[HospitalRelationshipTypeKey]
		,plhr.[EffectiveDate]
		,plhr.[TerminationDate]
	into #test_plhr
	from [ProviderNetwork].[dbo].[ProviderLocationHospitalRelationship] plhr with (nolock)
	join [ProviderNetwork].[dbo].[PracticeLocationProvider] plp with (nolock) on plp.[PracticeLocationProviderKey] = plhr.[PracticeLocationProviderKey]
	join [ProviderNetwork].[dbo].[PracticeLocation] pl with (nolock) on pl.[PracticeLocationKey] = plp.[PracticeLocationKey]
	join [ProviderNetwork].[dbo].[Practice] p with (nolock) on p.[PracticeKey] = pl.[PracticeKey]
	join [ProviderNetwork].[dbo].[Practice] phr with (nolock) on phr.[PracticeKey] = plhr.[PracticeKey]
	where p.[NPI] like '99999%'

	;with [orderRecord] as (select [NPI]
								,[ProviderLocationHospitalRelationshipKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [ProviderLocationHospitalRelationshipKey]
											 ) as Rank_number 
							from #test_plhr)
	update [orderRecord] set [Rank] = Rank_number

	create table #ProviderLocationHospitalRelationship
		([NPI] varchar(10)
		,[Diff_flag] bit
		,[RelFacilityNPI] varchar(10)		,[test_RelFacilityNPI] varchar(10)
		,[HospitalRelationshipTypeKey] int	,[test_HospitalRelationshipTypeKey] int
		,[EffectiveDate] date				,[test_EffectiveDate] date
		,[TerminationDate] date				,[test_TerminationDate] date
		)

	insert into #ProviderLocationHospitalRelationship
		([NPI]
		,[RelFacilityNPI]				,[test_RelFacilityNPI]
		,[HospitalRelationshipTypeKey]	,[test_HospitalRelationshipTypeKey]
		,[EffectiveDate]				,[test_EffectiveDate]
		,[TerminationDate]				,[test_TerminationDate]
		)
		select t.[NPI]
			,e.[RelFacilityNPI]					,t.[RelFacilityNPI]
			,e.[HospitalRelationshipTypeKey]	,t.[HospitalRelationshipTypeKey]
			,e.[EffectiveDate]					,t.[EffectiveDate]
			,e.[TerminationDate]				,t.[TerminationDate]
		from #plhr e
		full join #test_plhr t on e.[NPI] = replace(t.[NPI],'99999','99998')
							 and e.[Rank] = t.[Rank]

	--select * from #ProviderLocationHospitalRelationship
	
	create table #plhr_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #plhr_names values
		 (1,'RelFacilityNPI','test_RelFacilityNPI')
		,(2,'HospitalRelationshipTypeKey','test_HospitalRelationshipTypeKey')
		,(3,'EffectiveDate','test_EffectiveDate')
		,(4,'TerminationDate','test_TerminationDate')

	set @loop_counter = 1
	while (@loop_counter <= 4)
		begin
			select @exist_col_name = exist_col_name from #plhr_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #plhr_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #ProviderLocationHospitalRelationship set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #ProviderLocationHospitalRelationship set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #ProviderLocationHospitalRelationship) = 0 alter table #ProviderLocationHospitalRelationship drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #ProviderLocationHospitalRelationship) = 0 alter table #ProviderLocationHospitalRelationship drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'OLTP Provider Location Hospital Relationship'
	select * from #ProviderLocationHospitalRelationship where Diff_flag = 1


--############################## PROVIDER SPECIALTY ##############################

	select [ProviderNPI]
		,[StgProviderSpecialtyKey]
		,[SpecialtyCode]
		,[Priority]
		,[SpecialtyKey]
		,[RecordStatus]
		,[RecordStatusDescription]
		,cast(NULL as int) as [Rank]
	into #stgps
	from [ProviderNetworkStaging].[dbo].[StgProviderSpecialty] with (nolock)
	where [BatchID] = -5

	;with [orderRecord] as (select [ProviderNPI]
								,[SpecialtyCode]
								,[Priority]
								,[StgProviderSpecialtyKey]
								,[Rank]
								,rank() over (partition by [ProviderNPI] 
											  order by [SpecialtyCode]
													,[Priority]
													,[StgProviderSpecialtyKey]
											 ) as Rank_number 
							from #stgps)
	update [orderRecord] set [Rank] = Rank_number

	select [ProviderNPI]
		,[StgProviderSpecialtyKey]
		,[SpecialtyCode]
		,[Priority]
		,[SpecialtyKey]
		,[RecordStatus]
		,[RecordStatusDescription]
		,cast(NULL as int) as [Rank]
	into #test_stgps
	from [ProviderNetworkStaging].[dbo].[StgProviderSpecialty] with (nolock)
	where [BatchID] = @BatchID

	;with [orderRecord] as (select [ProviderNPI]
								,[SpecialtyCode]
								,[Priority]
								,[StgProviderSpecialtyKey]
								,[Rank]
								,rank() over (partition by [ProviderNPI] 
											  order by [SpecialtyCode]
													,[Priority]
													,[StgProviderSpecialtyKey]
											 ) as Rank_number 
							from #test_stgps)
	update [orderRecord] set [Rank] = Rank_number

	create table #StgProviderSpecialty
		([ProviderNPI] varchar(10)
		,[Diff_flag] bit
		,[SpecialtyCode] varchar(10)			,[test_SpecialtyCode] varchar(10)
		,[Priority] int							,[test_Priority] int
		,[SpecialtyKey] int						,[test_SpecialtyKey] int
		,[RecordStatus] varchar(2)				,[test_RecordStatus] varchar(2)
		,[RecordStatusDescription] varchar(100)	,[test_RecordStatusDescription] varchar(100)
		)

	insert into #StgProviderSpecialty
		([ProviderNPI]
		,[SpecialtyCode]			,[test_SpecialtyCode]
		,[Priority]					,[test_Priority]
		,[SpecialtyKey]				,[test_SpecialtyKey]
		,[RecordStatus]				,[test_RecordStatus]
		,[RecordStatusDescription]	,[test_RecordStatusDescription]
		)
		select t.[ProviderNPI]
			,e.[SpecialtyCode]				,t.[SpecialtyCode]
			,e.[Priority]					,t.[Priority]
			,e.[SpecialtyKey]				,t.[SpecialtyKey]
			,e.[RecordStatus]				,t.[RecordStatus]
			,e.[RecordStatusDescription]	,t.[RecordStatusDescription]
		from #stgps e
		full join #test_stgps t on e.[ProviderNPI] = t.[ProviderNPI]
									  and e.[Rank] = t.[Rank]

	--select * from #StgProviderSpecialty
	
	create table #stgps_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #stgps_names values
		 (1,'SpecialtyCode','test_SpecialtyCode')
		,(2,'Priority','test_Priority')
		,(3,'SpecialtyKey','test_SpecialtyKey')
		,(4,'RecordStatus','test_RecordStatus')
		,(5,'RecordStatusDescription','test_RecordStatusDescription')

	set @loop_counter = 1
	while (@loop_counter <= 5)
		begin
			select @exist_col_name = exist_col_name from #stgps_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #stgps_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #StgProviderSpecialty set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #StgProviderSpecialty set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #StgProviderSpecialty) = 0 alter table #StgProviderSpecialty drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #StgProviderSpecialty) = 0 alter table #StgProviderSpecialty drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'StgProviderSpecialty'
	select * from #StgProviderSpecialty where Diff_flag = 1

	select p.[NPI], ps.[ProviderSpecialtyKey]
		,cast(NULL as int) as [Rank]
		,[SpecialtyKey]
		,[Priority]
		,[IsActive]
	into #ps
	from [ProviderNetwork].[dbo].[ProviderSpecialty] ps with (nolock)
	join [ProviderNetwork].[dbo].[Provider] p with (nolock) on p.[ProviderKey] = ps.[ProviderKey]
	where p.[NPI] like '99998%'

	;with [orderRecord] as (select [NPI]
								,[ProviderSpecialtyKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [ProviderSpecialtyKey]
											 ) as Rank_number 
							from #ps)
	update [orderRecord] set [Rank] = Rank_number

	select p.[NPI], ps.[ProviderSpecialtyKey]
		,cast(NULL as int) as [Rank]
		,[SpecialtyKey]
		,[Priority]
		,[IsActive]
	into #test_ps
	from [ProviderNetwork].[dbo].[ProviderSpecialty] ps with (nolock)
	join [ProviderNetwork].[dbo].[Provider] p with (nolock) on p.[ProviderKey] = ps.[ProviderKey]
	where p.[NPI] like '99999%'

	;with [orderRecord] as (select [NPI]
								,[ProviderSpecialtyKey]
								,[Rank]
								,rank() over (partition by [NPI] 
											  order by [ProviderSpecialtyKey]
											 ) as Rank_number 
							from #test_ps)
	update [orderRecord] set [Rank] = Rank_number

	create table #ProviderSpecialty
		([NPI] varchar(10)
		,[Diff_flag] bit
		,[SpecialtyKey] int	,[test_SpecialtyKey] int
		,[Priority] tinyint	,[test_Priority] tinyint
		,[IsActive] bit		,[test_IsActive] bit
		)

	insert into #ProviderSpecialty
		([NPI]
		,[SpecialtyKey]			,[test_SpecialtyKey]
		,[Priority]				,[test_Priority]
		,[IsActive]				,[test_IsActive]
		)
		select t.[NPI]
			,e.[SpecialtyKey]	,t.[SpecialtyKey]
			,e.[Priority]		,t.[Priority]
			,e.[IsActive]		,t.[IsActive]
		from #ps e
		full join #test_ps t on e.[NPI] = replace(t.[NPI],'99999','99998')
						   and e.[Rank] = t.[Rank]

	--select * from #ProviderSpecialty
	
	create table #ps_names (order_num int, exist_col_name varchar(100), test_col_name varchar(100))

	insert into #ps_names values
		 (1,'SpecialtyKey','test_SpecialtyKey')
		,(2,'Priority','test_Priority')
		,(3,'IsActive','test_IsActive')

	set @loop_counter = 1
	while (@loop_counter <= 3)
		begin
			select @exist_col_name = exist_col_name from #ps_names where order_num = @loop_counter
			select @test_col_name = test_col_name from #ps_names where order_num = @loop_counter
			
			set @sqlText1 = N'update #ProviderSpecialty set '+@test_col_name+'=NULL,'+@exist_col_name+'=NULL where '+@test_col_name+'='+@exist_col_name
			set @sqlText2 = N'update #ProviderSpecialty set [Diff_flag] = 1 where isnull('+@test_col_name+','''') <> isnull('+@exist_col_name+','''')'
			set @sqlText3 = N'if (select sum(case when '+@test_col_name+' is NULL then 0 else 1 end) from #ProviderSpecialty) = 0 alter table #ProviderSpecialty drop column '+@test_col_name
			set @sqlText4 = N'if (select sum(case when '+@exist_col_name+' is NULL then 0 else 1 end) from #ProviderSpecialty) = 0 alter table #ProviderSpecialty drop column '+@exist_col_name

			exec (@sqlText1)
			exec (@sqlText2)
			exec (@sqlText3)
			exec (@sqlText4)

			set @loop_counter += 1
		end

	select 'OLTP Provider Specialty'
	select * from #ProviderSpecialty where Diff_flag = 1

end

