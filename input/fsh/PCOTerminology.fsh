Alias: $UCUM = http://unitsofmeasure.org
Alias: $LNC = http://loinc.org

CodeSystem: PCOCodes
Id: pco
Title: "Codes for PCO"
Description: "Codes to identify content associated with this IG"
* ^caseSensitive = true
* ^experimental = false
* ^status = #active
* #person-centered "Person-Centered Outcomes"
* #pco-data-submission-bundle "PCO Bundle"
* #pco-data-submission-standing-order "PCO Submission Standing Order"

ValueSet: PatientGASFollowupVS
Id: patient-gas-followup-vs
Title: "Patient Follow-Up GAS Score"
Description: "The patient follow-up score indicates how the patient rated their own progress on goal attainment scaling."
* ^experimental = false
* $LNC#patient-gas-much-better-than-expected "Much better than expected"
* $LNC#patient-gas-better-than-expected "Better than expected"
* $LNC#patient-gas-expected-outcome "Expected outcome"
* $LNC#patient-gas-less-than-expected "Less than expected"
* $LNC#patient-gas-much-less-than-expected "Much less than expected"

ValueSet: CaregiverGASFollowupVS
Id: caregiver-gas-followup-vs
Title: "Caregiver Follow-Up GAS Score"
Description: "The caregiver follow-up score indicates how the caregiver rated either the patient's progress or their own progress on goal attainment scaling."
* ^experimental = false
* $LNC#caregiver-gas-much-better-than-expected "Much better than expected"
* $LNC#caregiver-gas-better-than-expected "Better than expected"
* $LNC#caregiver-gas-expected-outcome "Expected outcome"
* $LNC#caregiver-gas-less-than-expected "Less than expected"
* $LNC#caregiver-gas-much-less-than-expected "Much less than expected"

ValueSet: PractitionerGASFollowupVS
Id: practitioner-gas-followup-vs
Title: "Practitioner Follow-Up GAS Score"
Description: "The practitioner follow-up score indicates how the practitioner rated the patient's progress on goal attainment scaling."
* ^experimental = false
* $LNC#practitioner-gas-much-better-than-expected "Much better than expected"
* $LNC#practitioner-gas-better-than-expected "Better than expected"
* $LNC#practitioner-gas-expected-outcome "Expected outcome"
* $LNC#practitioner-gas-less-than-expected "Less than expected"
* $LNC#practitioner-gas-much-less-than-expected "Much less than expected"
