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
* $LNC#77854-8 "PROMIS Ability to Participate in Social Roles and Activities - Short Form v2.0 - 8a"
* $LNC#77848-0 "PROMIS Alcohol Use - Short Form v1.0 - 7a"
* $LNC#89921-1 "PROMIS Anger - Short Form v1.1 -  (5a)"
* $LNC#77862-1 "PROMIS Anxiety Short Form 7a"
* $LNC#81531-6 "PROMIS Cognitive Function - Short Form v2.0 - 8a"
* $LNC#71965-8 "PROMIS Depression"
* $LNC#92149-4 "PROMIS Dyspnea Severity - Short Form v1.0 - 10a"
* $LNC#77864-7 "PROMIS Fatigue - Short Form v1.0 - 7a"
* $LNC#77851-4 "PROMIS Informational Support - Short Form v2.0 - 8a"
* $LNC#77850-6 "PROMIS Instrumental Support- Short Form v2.0 - 8a"
* $LNC#91614-8 "PROMIS Mobility Item Bank v2.1"
* $LNC#77856-3 "PROMIS Pain behavior – v1.0 - 7a"
* $LNC#77865-4 "PROMIS - Pain Interference - Short Form v1.0 - 6a"
* $LNC#91721-1 "PROMIS Physical Function - Short Form v2.0 - 10a"
* $LNC#77855-5 "PROMIS Satisfaction with Participation in Social Roles - Short Form v1.0 - 8a"
* $LNC#92391-2 "PROMIS Self-Efficacy for Managing Daily Activities - Short Form v1.0 - 8a"
* $LNC#92329-2 "PROMIS Self-Efficacy for Managing Emotions - Short Form v1.0 - 8a"
* $LNC#92418-3 "PROMIS Self-Efficacy for Managing Medications and Treatments - Short Form v1.0 - 8a"
* $LNC#92448-0 "PROMIS Self-Efficacy for Managing Symptoms - Short Form v1.0 - 8a"
* $LNC#77859-7 "PROMIS Sleep-Related Impairment - Short Form v1.0 - 8a"
* $LNC#92266-6 "PROMIS Smoking: Negative Health Expectancies for All Smokers – Short Form v1.0 - 6a"
* $LNC#92305-2 "PROMIS Smoking: Nicotine Dependence for All Smokers – Short Form v1.0 - 8a"
* $LNC#77849-8 "PROMIS Social Isolation - Short Form v2.0 - 8a"
* $LNC#92213-8 "PROMIS_ Smoking: Coping Expectancies for All Smokers – Short Form v1.0 - 4a"
* $LNC#89676-1 "PROMIS cancer fatigue - version 1.0 T-score"
* $LNC#71969-0 "PROMIS-10 Global Health, GMH, T score"
* $LNC#71971-6 "PROMIS-10 Global Health, GPH, T score"
* $LNC#71955-9 "PROMIS-29 Sleep Disturbance, T score"
* $LNC#71957-5 "PROMIS-29 Satisfaction with Participation in Social Roles, T score"
* $LNC#71959-1 "PROMIS-29 Physical Function, T score"
* $LNC#71961-7 "PROMIS-29 Pain Interference, T score"
* $LNC#71963-3 "PROMIS-29 Fatigue, T score"
* $LNC#71965-8 "PROMIS-29 Depression, T score"