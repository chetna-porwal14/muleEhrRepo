%dw 2.0
output application/java
import dw::hl7::helper
var ID = payload.Id
var PID=payload.Data[ID].PID 

---
{
	//RecordTypeId: vars.RecordType,
	FirstName: (PID."PID-05"."XPN-02")[0] default "",
	LastName: (PID."PID-05"."XPN-01")[0] default "",
	(HealthCloudGA__MedicalRecordNumber__c: PID."PID-02"."CX-01") if (PID."PID-02"."CX-01" != null),
	(HealthCloudGA__MedicalRecordNumber__pc: (PID."PID-03"."CX-01")[0]),
	(HealthCloudGA__SourceSystemId__c: (PID."PID-03"."CX-01")[0]),
	//(dkom__Language__c: helper::getCommLang(PID."PID-15"."CE_0296-01")) if (PID."PID-15"."CE_0296-01" !=null),
	(PersonMailingStreet: (PID."PID-11"."XAD-01")[0]) if ((PID."PID-11"."XAD-01")[0] !=null),
	(PersonMailingCity: (PID."PID-11"."XAD-03")[0]) if ((PID."PID-11"."XAD-03")[0] !=null),
	(PersonMailingState: (PID."PID-11"."XAD-04")[0]) if ((PID."PID-11"."XAD-04")[0] !=null),
	(PersonMailingPostalCode: (PID."PID-11"."XAD-05")[0]) if ((PID."PID-11"."XAD-05")[0] !=null),
	(PersonMailingCountry: (PID."PID-11"."XAD-06")[0]) if ((PID."PID-11"."XAD-06")[0] !=null),
	(Phone: (PID."PID-13"."XTN-01")[0]) if ((PID."PID-13"."XTN-01")[0] !=null),
	(PersonHomePhone: (PID."PID-13"."XTN-01")[0]) if ((PID."PID-13"."XTN-01")[0] !=null),
	(PersonMobilePhone: (PID."PID-14"."XTN-01")[0]) if ((PID."PID-14"."XTN-01")[0] !=null),
	(PersonOtherPhone: (PID."PID-14"."XTN-01")[0]) if ((PID."PID-14"."XTN-01")[0] !=null),
	PersonBirthdate: PID."PID-07"."TS-01" as Date {format: "yyyyMMddHHmmss"} as String {format: "yyyy-MM-dd"} default null,
	//(Last_4_digits_of_SSN__pc: PID."PID-19"[-4 to -1]) if (PID."PID-19" != null),
	(AccountNumber: PID."PID-18"."CX-01") if (PID."PID-18"."CX-01" != null),
	(BillingStreet: (PID."PID-11"."XAD-01")[0]) if ((PID."PID-11"."XAD-01")[0] !=null),
	(BillingCity: (PID."PID-11"."XAD-03")[0]) if ((PID."PID-11"."XAD-03")[0] !=null),
	(BillingState: (PID."PID-11"."XAD-04")[0]) if ((PID."PID-11"."XAD-04")[0] !=null),
	(BillingPostalCode: (PID."PID-11"."XAD-05")[0]) if ((PID."PID-11"."XAD-05")[0] !=null),
	(BillingCountry: (PID."PID-11"."XAD-06")[0]) if ((PID."PID-11"."XAD-06")[0] !=null),
	(ShippingStreet: (PID."PID-11"."XAD-01")[0]) if ((PID."PID-11"."XAD-01")[0] !=null),
	(ShippingCity: (PID."PID-11"."XAD-03")[0]) if ((PID."PID-11"."XAD-03")[0] !=null),
	(ShippingState: (PID."PID-11"."XAD-04")[0]) if ((PID."PID-11"."XAD-04")[0] !=null),
	(ShippingPostalCode: (PID."PID-11"."XAD-05")[0]) if ((PID."PID-11"."XAD-05")[0] !=null),
	(ShippingCountry: (PID."PID-11"."XAD-06")[0]) if ((PID."PID-11"."XAD-06")[0] !=null),
	(HealthCloudGA__Gender__pc: helper::getHCGender(PID."PID-08")) if (PID."PID-08" !=null),
	(HealthCloudGA__CountryOfBirth__pc: (PID."PID-23"."ST-01")) if ((PID."PID-23"."ST-01") !=null),
	(PersonEmail: (PID."PID-13"."XTN-04")[0]) if ((PID."PID-13"."XTN-04")[0] !=null),
	(HealthCloudGA__PrimaryLanguage__pc: PID."PID-15"."CE-01") if (PID."PID-15"."CE-01" != null)


}