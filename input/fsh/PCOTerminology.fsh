Alias: $UCUM = http://unitsofmeasure.org
Alias: $LNC = http://loinc.org
Alias: $SNOMED = http://snomed.info/sct

CodeSystem: PCOCodes
Id: pco
Title: "Codes for PCO"
Description: "Codes to identify content associated with this IG"
* ^caseSensitive = true
* ^experimental = false
* ^status = #active
* #person-centered "Person-Centered"
* #pco-data-submission-bundle "PCO Bundle"
* #pco-data-submission-standing-order "PCO Submission Standing Order"

CodeSystem: PCOGASCodesTemporary
Id: pco-gas-codes-temporary
Title: "Goal Attainment Scaling (GAS) Codes"
Description: "Temporary code system for GAS codes until publication by LOINC. All of these codes have been submitted to LOINC."
* ^caseSensitive = true
* ^experimental = false
* ^status = #active
* #goal-attainment-scaling "Goal Attainment Scaling (GAS)"
* #patient-gas-much-better-than-expected "Much better than expected"
* #patient-gas-better-than-expected "Better than expected"
* #patient-gas-expected-outcome "Expected outcome"
* #patient-gas-less-than-expected "Less than expected"
* #patient-gas-much-less-than-expected "Much less than expected"
* #caregiver-gas-much-better-than-expected "Much better than expected"
* #caregiver-gas-better-than-expected "Better than expected"
* #caregiver-gas-expected-outcome "Expected outcome"
* #caregiver-gas-less-than-expected "Less than expected"
* #caregiver-gas-much-less-than-expected "Much less than expected"
* #practitioner-gas-much-better-than-expected "Much better than expected"
* #practitioner-gas-better-than-expected "Better than expected"
* #practitioner-gas-expected-outcome "Expected outcome"
* #practitioner-gas-less-than-expected "Less than expected"
* #practitioner-gas-much-less-than-expected "Much less than expected"

ValueSet: PatientGASFollowup
Id: patient-gas-followup
Title: "Patient Follow-Up GAS Score"
Description: "The patient follow-up score indicates how the patient rated their own progress on goal attainment scaling."
* ^experimental = false
* PCOGASCodesTemporary#patient-gas-much-better-than-expected "Much better than expected"
* PCOGASCodesTemporary#patient-gas-better-than-expected "Better than expected"
* PCOGASCodesTemporary#patient-gas-expected-outcome "Expected outcome"
* PCOGASCodesTemporary#patient-gas-less-than-expected "Less than expected"
* PCOGASCodesTemporary#patient-gas-much-less-than-expected "Much less than expected"

ValueSet: CaregiverGASFollowup
Id: caregiver-gas-followup
Title: "Caregiver Follow-Up GAS Score"
Description: "The caregiver follow-up score indicates how the caregiver rated either the patient's progress or their own progress on goal attainment scaling."
* ^experimental = false
* PCOGASCodesTemporary#caregiver-gas-much-better-than-expected "Much better than expected"
* PCOGASCodesTemporary#caregiver-gas-better-than-expected "Better than expected"
* PCOGASCodesTemporary#caregiver-gas-expected-outcome "Expected outcome"
* PCOGASCodesTemporary#caregiver-gas-less-than-expected "Less than expected"
* PCOGASCodesTemporary#caregiver-gas-much-less-than-expected "Much less than expected"

ValueSet: PractitionerGASFollowup
Id: practitioner-gas-followup
Title: "Practitioner Follow-Up GAS Score"
Description: "The practitioner follow-up score indicates how the practitioner rated the patient's progress on goal attainment scaling."
* ^experimental = false
* PCOGASCodesTemporary#practitioner-gas-much-better-than-expected "Much better than expected"
* PCOGASCodesTemporary#practitioner-gas-better-than-expected "Better than expected"
* PCOGASCodesTemporary#practitioner-gas-expected-outcome "Expected outcome"
* PCOGASCodesTemporary#practitioner-gas-less-than-expected "Less than expected"
* PCOGASCodesTemporary#practitioner-gas-much-less-than-expected "Much less than expected"

ValueSet: PROMTargetMeasures
Id: prom-target-measures
Title: "PROM Target Measures"
Description: "Target measure codes used to track progress on patient-reported outcome measures (PROMs)."
* ^experimental = false
* $LNC#70274-6 "Generalized anxiety disorder 7 item (GAD-7) total score"
* $LNC#44261-6 "Patient health questionnaire 9 item (PHQ-9) total score"