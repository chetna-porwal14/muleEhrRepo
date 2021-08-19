%dw 2.0
output application/java
import dw::hl7::helper
var ID = payload.Id
var PID=payload.Data[ID].PID
---
{
	(HealthCloudGA__Account__c: "@{Account.id}") if vars.existingPersonAccountId == null,
	(HealthCloudGA__SourceSystemId__c: (PID."PID-03"."CX-01")[0]),
	HealthCloudGA__GivenName1__c: (PID."PID-05"."XPN-02")[0] default "",
	HealthCloudGA__FamilyName1__c: (PID."PID-05"."XPN-01")[0] default "",
	(HealthCloudGA__Address1Line1__c: (PID."PID-11"."XAD-01")[0]) if ((PID."PID-11"."XAD-01")[0] !=null),
	(HealthCloudGA__Address1Line2__c: (PID."PID-11"."XAD-02")[0]) if ((PID."PID-11"."XAD-02")[0] !=null),
	(HealthCloudGA__Address1City__c: (PID."PID-11"."XAD-03")[0]) if ((PID."PID-11"."XAD-03")[0]  !=null),
	(HealthCloudGA__Address1PostalCode__c: (PID."PID-11"."XAD-05")[0]) if ((PID."PID-11"."XAD-05")[0] !=null),
	(HealthCloudGA__Address1Country__c: (PID."PID-11"."XAD-06")[0]) if ((PID."PID-11"."XAD-06")[0] !=null),
	(HealthCloudGA__Communication1Code__c: helper::getCommLang(PID."PID-15"."CE_0296-01")) if (PID."PID-15"."CE_0296-01" !=null),
	(HealthCloudGA__GenderLabel__c: helper::getHCGender(PID."PID-08")) if (PID."PID-08" !=null),
	(HealthCloudGA__MaritalStatusLabel__c: helper::getMaritalStatus(PID."PID-16")) if (PID."PID-16" !=null),
	HealthCloudGA__Deceased__c: if(PID."PID-30" == 'Y') true else false,
	HealthCloudGA__BirthDate__c: PID."PID-07"."TS-01" as Date {format: "yyyyMMddHHmmss"} as String {format: "yyyy-MM-dd"} default null
}