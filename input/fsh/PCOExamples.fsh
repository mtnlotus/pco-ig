Alias: $GoalAchievement = http://terminology.hl7.org/CodeSystem/goal-achievement

Instance: pcoPatientJones
InstanceOf: USCorePatientProfile
Title: "Example Patient Dorothy" 
Description: "Dorothy Jones"
Usage: #example
* identifier[0].use = #official
* identifier[0].system = "http://example.org"
* identifier[0].value = "ee8d4ac0-545c-4501-8d7e-646bfbda1db5"
* name.family = "Jones"
* name.given[0] = "Dorothy"
* gender = #female
* birthDate = "1947-11-25"

Instance: pcoPractitionerGonzalez
InstanceOf: USCorePractitionerProfile
Title: "Health & Wellness Coach" 
Description: "Maria Gonzalez, NBC-HWC"
Usage: #example
* identifier[0].use = #official
* identifier[0].system = "http://example.org"
* identifier[0].value = "ee8d4ac0-545c-4501-8d7e-646bfbda6cd7"
* name.family = "Gonzalez"
* name.given[0] = "Maria"
* name.suffix = "NBC-HWC"
* name.text = "Maria Gonzalez, NBC-HWC"
* gender = #female

Instance: pcoPractitionerAnderson
InstanceOf: USCorePractitionerProfile
Title: "Primary Care Physician" 
Description: "John Anderson, MD"
Usage: #example
* identifier[0].use = #official
* identifier[0].system = "http://example.org"
* identifier[0].value = "ee8d4ac0-545c-4501-8d7e-646bfbda6de8"
* name.family = "Anderson"
* name.given[0] = "John"
* name.suffix = "MD"
* name.text = "John Anderson, MD"
* gender = #male

Instance: pcoGoalPainLevelExample
InstanceOf: PCOGoalProfile
Title: "Goal without GAS or PROM"
Description: "Person-centered goal without attainment scaling or PROM"
Usage: #example
* lifecycleStatus = #active
* achievementStatus = $GoalAchievement#in-progress
* category = NCQAGoalDomains#physical-function "Physical Function"
* subject = Reference(pcoPatientJones)
* expressedBy = Reference(pcoPatientJones)
* startDate = "2024-02-15"
* target.dueDate = "2024-06-30"
* description.text = "Maintain pain level below 5 while walking"

Instance: pcoGoalWalkDogExample
InstanceOf: PCOGoalAttainmentScaleProfile
Title: "Goal with GAS"
Description: "Person-centered goal with attainment scaling extensions"
Usage: #example
* lifecycleStatus = #active
* achievementStatus = $GoalAchievement#in-progress
* category = NCQAGoalDomains#physical-function "Physical Function"
* subject = Reference(pcoPatientJones)
* expressedBy = Reference(pcoPatientJones)
* startDate = "2024-04-03"
* target.dueDate = "2024-09-30"
* addresses[0] = Reference(pcoWhatMattersBodyExample) "What Matters: Moving the Body"
* addresses[1] = Reference(pcoWhatMattersRelationshipsExample) "What Matters: Family & Friends"
* description.text = "Walk dog outside once a week"
* extension[gas-scaling][0].extension[level].valueCoding = PCOGASCodesTemporary#patient-gas-much-better-than-expected "Much better than expected"
* extension[gas-scaling][0].extension[text].valueString = "Walk dog outside three times a week"
* extension[gas-scaling][1].extension[level].valueCoding = PCOGASCodesTemporary#patient-gas-better-than-expected "Better than expected"
* extension[gas-scaling][1].extension[text].valueString = "Walk dog outside twice a week"
* extension[gas-scaling][2].extension[level].valueCoding = PCOGASCodesTemporary#patient-gas-expected-outcome "Expected outcome"
* extension[gas-scaling][2].extension[text].valueString = "Walk dog outside once a week"
* extension[gas-scaling][3].extension[level].valueCoding = PCOGASCodesTemporary#patient-gas-less-than-expected "Less than expected"
* extension[gas-scaling][3].extension[text].valueString = "Does not walk dog but goes outside with dog"
* extension[gas-scaling][4].extension[level].valueCoding = PCOGASCodesTemporary#patient-gas-much-less-than-expected "Much less than expected"
* extension[gas-scaling][4].extension[text].valueString = "Unable to go outside with dog"

Instance: pcoGASScorePatientBaselineExample
InstanceOf: PCOPatientGASScore
Title: "Patient GAS Baseline Score"
Description: "Baseline GAS score observation recorded by a Patient at start of goal."
Usage: #example
* status = #final 
* subject = Reference(pcoPatientJones)
* performer = Reference(pcoPatientJones)
* effectiveDateTime = "2024-04-03T10:15:00Z"
* focus = Reference(pcoGoalWalkDogExample)
* valueCodeableConcept = PCOGASCodesTemporary#patient-gas-less-than-expected "Less than expected"

Instance: pcoGASScorePatientFollowupExample
InstanceOf: PCOPatientGASScore
Title: "Patient GAS Follow-up Score"
Description: "Follow-up GAS score observation recorded by a Patient showing goal progress."
Usage: #example
* status = #final 
* subject = Reference(pcoPatientJones)
* performer = Reference(pcoPatientJones)
* effectiveDateTime = "2024-05-10T10:15:00Z"
* focus = Reference(pcoGoalWalkDogExample)
* valueCodeableConcept = PCOGASCodesTemporary#patient-gas-better-than-expected "Better than expected"

Instance: pcoGASScorePractitionerFollowupExample
InstanceOf: PCOPractitionerGASScore
Title: "Practitioner GAS Follow-up Score"
Description: "Follow-up GAS score observation recorded by a Practitioner showing goal progress."
Usage: #example
* status = #final 
* subject = Reference(pcoPatientJones)
* performer = Reference(pcoPractitionerGonzalez)
* effectiveDateTime = "2024-05-22T10:15:00Z"
* focus = Reference(pcoGoalWalkDogExample)
* valueCodeableConcept = PCOGASCodesTemporary#practitioner-gas-expected-outcome "Expected outcome"
