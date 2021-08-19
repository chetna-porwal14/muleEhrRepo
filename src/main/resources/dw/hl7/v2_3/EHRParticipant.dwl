%dw 2.0
output application/java
var ID = payload.Id
var PV=payload.Data[ID].PV1
---
{
	HealthCloudGA__Encounter__c: "@{Visit.id}" default "",
//	HealthCloudGA__TypeLabel__c: (payload.Data.ADT_A04.PV1."PV1-07"."XCN-03")[0] ++ " " ++ (payload.Data.ADT_A04.PV1."PV1-07"."XCN-02")[0] default "",
	(HealthCloudGA__Practitioner__c: (PV."PV1-07"."XCN-01")[0]) if ((PV."PV1-07"."XCN-01")[0] != null),
	(HealthCloudGA__TypeCode__c: (PV."PV1-07"."XCN-06")[0]) if ((PV."PV1-07"."XCN-06")[0] != null)
//	HealthCloudGA__Practitioner__c: (payload.Data.ADT_A04.PV1."PV1-09"."XCN-03")[0] ++ " " ++ (payload.Data.ADT_A04.PV1."PV1-09"."XCN-02")[0] default "",
//	(HealthCloudGA__TypeCode__c: (PV."PV1-09"."XCN-01")[0]) if ((PV."PV1-09"."XCN-01")[0] != null),
//	(HealthCloudGA__TypeLabel__c: (PV."PV1-09"."XCN-06")[0]) if ((PV."PV1-09"."XCN-06")[0] != null),
//	HealthCloudGA__Practitioner__c: (payload.Data.ADT_A04.PV1."PV1-17"."XCN-03")[0] ++ " " ++ (payload.Data.ADT_A04.PV1."PV1-17"."XCN-02")[0] default "",
//	(HealthCloudGA__TypeCode__c: (PV."PV1-17"."XCN-01")[0]) if ((PV."PV1-17"."XCN-01")[0] != null),
//	(HealthCloudGA__TypeLabel__c: (PV."PV1-17"."XCN-06")[0]) if ((PV."PV1-17"."XCN-06")[0] != null)
	
}