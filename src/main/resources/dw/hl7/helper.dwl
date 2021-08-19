%dw 2.0

fun getHCGender(hl7Gender) = (hl7Gender match {
	case "M" -> "Male"
	case "F" -> "Female"
	case "O" -> "Other"
	else -> "Unknown"
})

fun getHCAllergyType(hl7AllergyType) = (hl7AllergyType match {
	case "DA" -> "Drug allergy"
	case "FA" -> "Food allergy"
	case "MA" -> "Miscellaneous allergy"
	case "MC" -> "Miscellaneous contraindication"
	else -> hl7AllergyType
})

fun getHCAllergySev(hl7AllergySev) = (hl7AllergySev match {
	case "MI" -> "Mild"
	case "MO" -> "Moderate"
	case "SV" -> "Severe"
	else -> hl7AllergySev
})

fun getMaritalStatus(hl7MaritalStatus) = (hl7MaritalStatus match {
	case "A" -> "Separated"
	case "D" -> "Divorced"
	case "M" -> "Married"
	case "S" -> "Single"
	case "W" -> "Widowed"
	case "G" -> "Living Together"
	case "P" -> "Domestic Partner"
	else -> "Unknown"	
})

fun getPatientClass(hl7PatientClass) = (hl7PatientClass match {
	case "B" -> "Obstetrics"
	case "E" -> "Emergency"
	case "I" -> "Inpatient"
	case "O" -> "Outpatient"
	case "P" -> "Preadmit"
	case "R" -> "Recurring patient"
	else -> hl7PatientClass
})

fun getAdmissionType(hl7AdmissionType) = (hl7AdmissionType match {
	case "A" -> "Accident"
	case "E" -> "Emergency"
	case "L" -> "Labor and Delivery"
	case "R" -> "Routine"
	else -> "Unknown"
})

fun getReAdmissionInd(hl7ReAdmissionInd) = (hl7ReAdmissionInd match {
	case "R" -> "Readmission"
	else -> "Unknown"
})

fun getOBXResultStatus(hl7OBXResultStatus) = (hl7OBXResultStatus match {
	case "C" -> "Record coming over is a correction and thus replaces a final result"
	case "D" -> "Deletes the OBX record"
	case "F" -> "Final results; Can only be changed with a corrected result"
	case "I" -> "Specimen in lab; results pending"
	case "P" -> "Preliminary results"
	case "R" -> "Results entered -- not verified"
	case "S" -> "Partial results"
	case "U" -> "Results status change to final without retransmitting results already sent as preliminary"
	case "W" -> "Post original as wrong"
	case "X" -> "Results cannot be obtained for this observation"
	else -> hl7OBXResultStatus	
})

fun getCommLang (hl7PrimaryLang) = (hl7PrimaryLang match {
	case "EN" -> "English"
	case "ES" -> "Spanish"
	case "ZH" -> "Chinese"
	case "PT" -> "Portuguese"
	case "HI" -> "Hindi"
	case "DE" -> "German"
	case "FR" -> "French"
	case "BG" -> "Bulgarian"
	case "AR" -> "Arabic"
	case "NL" -> "Dutch"
	case "JA" -> "Japanese"
	case "GA" -> "Irish"
	case "IT" -> "Italian"
	case "KO" -> "Korean"
	case "NO" -> "Norwegian"
	case "PO" -> "Polish"
	case "RU" -> "Russian"
	case "UR" -> "Urdu"
	case "VI" -> "Vietnamese"
	case "UZ" -> "Uzbek"
	case "UK" -> "Ukrainian"
	else -> "Unknown"	
}	
)

