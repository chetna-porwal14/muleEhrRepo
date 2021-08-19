%dw 2.0
output application/java
import dw::hl7::helper
var ID = payload.Id
var PV=payload.Data[ID].PV1
---
{
	(HealthCloudGA__Account__c: "@{Account.id}") if vars.existingPersonAccountId == null,
	(HealthCloudGA__Account__c: vars.existingPersonAccountId) if vars.existingPersonAccountId != null,
	HealthCloudGA__Class__c: helper::getPatientClass(PV."PV1-02") default "",
	HealthCloudGA__TypeCode__c : helper::getAdmissionType(PV."PV1-04") default "" ,	
	(HealthCloudGA__Location1Name__c: PV."PV1-03"."PL-01") if (PV."PV1-03"."PL-01" != null),
	(HealthCloudGA__Location1Type__c : PV."PV1-03"."PL-06") if (PV."PV1-03"."PL-06" != null),
	(HealthCloudGA__Location1Description__c : PV."PV1-03"."PL-05") if (PV."PV1-03"."PL-05" != null),
	(HealthCloudGA__ReasonLabel__c: helper::getAdmissionType(PV."PV1-04")) if (PV."PV1-04" != null),
	(HealthCloudGA__HospitalizationPreAdmissionId__c: PV."PV1-05"."CX-01") if (PV."PV1-05"."CX-01" != null),
	(HealthCloudGA__HospitalizationOrigin__c: PV."PV1-06"."PL-01") if (PV."PV1-06"."PL-01" != null),
    (HealthCloudGA__HospitalizeAdmitSourceCode__c: (PV."PV1-08"."XCN-01")[0]) if ((PV."PV1-08"."XCN-01")[0] != null),
	(HealthCloudGA__HospitalAdmitSourceLabel__c: (PV."PV1-08"."XCN-02")[0]) if ((PV."PV1-08"."XCN-02")[0] != null),
    (HealthCloudGA__Location1TypeLabel__c: PV."PV1-10") if (PV."PV1-10" != null),
	(HealthCloudGA__Indication__c: PV."PV1-12") if (PV."PV1-12" != null),
	(HealthCloudGA__HospitalizeReadmission__c: helper::getReAdmissionInd(PV."PV1-13")) if (PV."PV1-13" != null),
	(HealthCloudGA__HospitalizeAdmitSourceCode__c:  PV."PV1-14") if (PV."PV1-14" != null),
	(HealthCloudGA__TypeLabel__c: PV."PV1-18") if (PV."PV1-18" != null),
    (HealthCloudGA__HospitalizeDischargeDispositionCode__c: PV."PV1-36") if (PV."PV1-36" != null),
	(HealthCloudGA__HospitalizeDestination__c: PV."PV1-37"."CM_DLD-01") if (PV."PV1-37"."CM_DLD-01" != null),
	(HealthCloudGA__HospitalizeDietLabel__c: PV."PV1-38"."CE-02") if (PV."PV1-38"."CE-02" != null),
	(HealthCloudGA__Status__c : PV."PV1-40") if (PV."PV1-40" != null),
	(HealthCloudGA__Location2Name__c: PV."PV1-42"."PL-01") if (PV."PV1-42"."PL-01" != null),
	(HealthCloudGA__Location2Type__c : PV."PV1-42"."PL-06") if (PV."PV1-42"."PL-06" != null),
	(HealthCloudGA__Location2Description__c : PV."PV1-42"."PL-05") if (PV."PV1-42"."PL-05" != null),
	(HealthCloudGA__Location1Name__c: PV."PV1-43"."PL-01") if (PV."PV1-43"."PL-01" != null),
	(HealthCloudGA__Location1Type__c : PV."PV1-43"."PL-06") if (PV."PV1-43"."PL-06" != null),
	(HealthCloudGA__Location1Description__c : PV."PV1-43"."PL-05") if (PV."PV1-43"."PL-05" != null),
	HealthCloudGA__HospitalizePeriodStart__c: PV."PV1-44"."TS-01" as LocalDateTime {format: "yyyyMMddHHmmss"} as DateTime {format: "yyyy-MM-dd'T'HH:mm:ss.SSS"} default null,
	HealthCloudGA__HospitalizePeriodEnd__c: PV."PV1-45"."TS-01" as LocalDateTime {format: "yyyyMMddHHmmss"} as DateTime {format: "yyyy-MM-dd'T'HH:mm:ss.SSS"} default null
		 
}