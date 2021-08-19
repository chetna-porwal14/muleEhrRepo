%dw 2.0
output application/json
---
{
	allOrNone: true,
	compositeRequest:
	( [
		({
			method: "POST",
			referenceId: "Account",
			url: "/services/data/v38.0/sobjects/Account",
			body: vars.account
		}) if vars.existingPersonAccountId == null,	
		
		({
			method: "PATCH",
			referenceId: "Account",
			url: "/services/data/v38.0/sobjects/Account/" ++ (vars.existingPersonAccountId default ""),
			body: vars.account
		}) if vars.existingPersonAccountId != null,	

		({
			method: "POST",
			referenceId: "EHR",
			url: "/services/data/v38.0/sobjects/HealthCloudGA__EhrPatient__c",
			body: vars.ehrPatient

		}) if vars.existingEHRPatientId == null,
		
		({
			method: "PATCH",
			referenceId: "EHR",
			url: "/services/data/v38.0/sobjects/HealthCloudGA__EhrPatient__c/" ++ (vars.existingEHRPatientId default ""),
			body: vars.ehrPatient

		}) if vars.existingEHRPatientId != null,
		
		
		{
			method: "POST",
			referenceId: "Visit",
			url: "/services/data/v38.0/sobjects/HealthCloudGA__EhrEncounter__c",
			body: vars.ehrPatientVisit
		},
		({
			method: "POST",
			referenceId: "Condition",
			url: "/services/data/v38.0/sobjects/HealthCloudGA__EhrCondition__c",
			body: vars.EHRPatientCondition
		}) if vars.EHRPatientCondition != null,
	]) ++ (
	vars.ehrPatientAllergy default [] map (item,index) -> ({

			method: "POST",
			referenceId: "Allergy" ++ index,
			url: "/services/data/v38.0/sobjects/HealthCloudGA__EhrAllergyIntolerance__c",
			body: item
		})
	)
	++
	(
		vars.ehrObservation default [] map (obs,obsindex) -> ({
			method: "POST",
			referenceId: "Observation" ++ obsindex,
			url: "/services/data/v38.0/sobjects/HealthCloudGA__EhrObservation__c",
			body: obs
		})
	)
	
	
}