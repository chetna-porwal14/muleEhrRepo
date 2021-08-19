%dw 2.0
output application/java
import dw::hl7::helper
var ID = payload.Id
var OBX = (payload.Data[ID].OBX)
---
OBX map (item) -> ({
	(HealthCloudGA__Account__c: "@{Account.id}") if vars.existingPersonAccountId == null,
	(HealthCloudGA__Account__c: vars.existingPersonAccountId) if vars.existingPersonAccountId != null,
	HealthCloudGA__MethodLabel__c: item."OBX-03"."CE-01",
	HealthCloudGA__ValueQuantity__c: item."OBX-05"[0]."OBX-05",
	HealthCloudGA__ValueQuantityUnit__c: item."OBX-06"."CE-01",
	HealthCloudGA__Status__c: helper::getOBXResultStatus(item."OBX-11"),
	HealthCloudGA__AppliesDateTime__c: item."OBX-14"."TS-01" as LocalDateTime {format:"yyyyMMddHHmmss"} default null
})