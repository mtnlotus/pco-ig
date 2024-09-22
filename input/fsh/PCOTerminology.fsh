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

ValueSet: PROMTargetMeasures
Id: prom-target-measures
Title: "PROM Target Measures"
Description: "Target measure codes used to track progress on patient-reported outcome measures (PROMs)."
* ^experimental = false
* $LNC#70274-6 "Generalized anxiety disorder 7 item (GAD-7) total score"
* $LNC#44261-6 "Patient health questionnaire 9 item (PHQ-9) total score"
* $LNC#91614-8 "PROMIS mobility - version 2.0 T-score"
* $LNC#89676-1 "PROMIS cancer fatigue - version 1.0 T-score"
* $LNC#71969-0 "PROMIS-10 Global Health, GMH, T score"
* $LNC#71971-6 "PROMIS-10 Global Health, GPH, T score"
* $LNC#71955-9 "PROMIS-29 Sleep Disturbance, T score"
* $LNC#71957-5 "PROMIS-29 Satisfaction with Participation in Social Roles, T score"
* $LNC#71959-1 "PROMIS-29 Physical Function, T score"
* $LNC#71961-7 "PROMIS-29 Pain Interference, T score"
* $LNC#71963-3 "PROMIS-29 Fatigue, T score"
* $LNC#71965-8 "PROMIS-29 Depression, T score"