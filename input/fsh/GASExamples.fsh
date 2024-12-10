
Instance: pcoGoalWalkDogExample
InstanceOf: PCOGoalAttainmentScaleProfile
Title: "Goal with GAS"
Description: "Person-centered goal with attainment scaling extensions"
Usage: #example
* lifecycleStatus = #active
* achievementStatus = $GoalAchievement#in-progress
* category[pcoCategory] = PCOCodes#person-centered-goal "Person-Centered Goal"
* category[domainCategory] = PCOGoalDomains#physical-function "Physical Function"
* subject = Reference(pcoPatientJones)
* expressedBy = Reference(pcoPatientJones)
* startDate = "2024-04-03"
* target.dueDate = "2024-09-30"
* addresses[0] = Reference(pcoWhatMattersBodyExample) "What Matters: Moving the Body"
* addresses[1] = Reference(pcoWhatMattersRelationshipsExample) "What Matters: Family & Friends"
* description.text = "Walk dog outside once a week"
* extension[gas-scaling][0].extension[level].valueCoding = $LNC#LA6113-0 "Much better than expected"
* extension[gas-scaling][0].extension[text].valueString = "Walk dog outside three times a week"
* extension[gas-scaling][1].extension[level].valueCoding = $LNC#LA6112-2 "Better than expected"
* extension[gas-scaling][1].extension[text].valueString = "Walk dog outside twice a week"
* extension[gas-scaling][2].extension[level].valueCoding = $LNC#LA6111-4 "Expected outcome"
* extension[gas-scaling][2].extension[text].valueString = "Walk dog outside once a week"
* extension[gas-scaling][3].extension[level].valueCoding = $LNC#gas-less-than-expected "Less than expected"
* extension[gas-scaling][3].extension[text].valueString = "Does not walk dog but goes outside with dog"
* extension[gas-scaling][4].extension[level].valueCoding = $LNC#gas-much-less-than-expected "Much less than expected"
* extension[gas-scaling][4].extension[text].valueString = "Unable to go outside with dog"

Instance: pcoGASScoretBaselineExample
InstanceOf: PCOGoalAttainmentScoreObservation
Title: "GAS Baseline Score"
Description: "Baseline GAS score observation at start of goal."
Usage: #example
* status = #final 
* category[survey] = OBSCAT#survey "Survey"
* subject = Reference(pcoPatientJones)
* performer = Reference(pcoPractitionerGonzalez)
* effectiveDateTime = "2024-04-03T10:15:00Z"
* code = $LNC#68489 "Goal attainment scale"
* focus = Reference(pcoGoalWalkDogExample)
* valueCodeableConcept = $LNC#gas-less-than-expected "Less than expected"

Instance: pcoGASScorePatientFollowupExample
InstanceOf: PCOGoalAttainmentScoreObservation
Title: "Patient GAS Follow-up Score"
Description: "Follow-up GAS score observation recorded by a Patient showing goal progress."
Usage: #example
* status = #final 
* category[survey] = OBSCAT#survey "Survey"
* subject = Reference(pcoPatientJones)
* performer = Reference(pcoPatientJones)
* effectiveDateTime = "2024-05-10T10:15:00Z"
* code = $LNC#68491 "Patient follow-up goal attainment scaling score"
* focus = Reference(pcoGoalWalkDogExample)
* valueCodeableConcept = $LNC#LA6112-2 "Better than expected"

Instance: pcoGASScorePractitionerFollowupExample
InstanceOf: PCOGoalAttainmentScoreObservation
Title: "Practitioner GAS Follow-up Score"
Description: "Follow-up GAS score observation recorded by a Practitioner showing goal progress."
Usage: #example
* status = #final 
* category[survey] = OBSCAT#survey "Survey"
* subject = Reference(pcoPatientJones)
* performer = Reference(pcoPractitionerGonzalez)
* effectiveDateTime = "2024-05-22T10:15:00Z"
* code = $LNC#68490 "Practitioner follow-up goal attainment scaling score"
* focus = Reference(pcoGoalWalkDogExample)
* valueCodeableConcept = $LNC#LA6111-4 "Expected outcome"
