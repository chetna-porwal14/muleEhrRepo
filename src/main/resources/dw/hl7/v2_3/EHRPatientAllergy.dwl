%dw 2.0
output application/java
import dw::hl7::helper
var ID = payload.Id
var AL = (payload.Data[ID].AL1)
---
AL map (item) -> ({
	(HealthCloudGA__Account__c: "@{Account.id}") if vars.existingPersonAccountId == null,
	(HealthCloudGA__Account__c: vars.existingPersonAccountId) if vars.existingPersonAccountId != null,
	(HealthCloudGA__SensitivityTypeLabel__c: helper::getHCAllergyType(item."AL1-02")) if (item."AL1-02" != null),
	HealthCloudGA__StatusSystem__c: item."AL1-03"."CE-01",
	HealthCloudGA__Substance255__c: item."AL1-03"."CE-02" default "",
	HealthCloudGA__SubstanceCodeSystem__c: item."AL1-03"."CE-03" default "",
	(HealthCloudGA__CriticalityLabel__c: helper::getHCAllergySev(item."AL1-04"))  if (item."AL1-04" != null),
	(HealthCloudGA__Reaction255__c: item."AL1-05") if (item."AL1-05" != null),
	HealthCloudGA__RecordedDate__c: item."AL1-06" as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} default null
})