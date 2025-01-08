
Instance: ppcPatientMrK
InstanceOf: USCorePatientProfile
Title: "Patient Mr. K" 
Description: "Patient for PPC examples"
Usage: #example
* identifier[0].use = #official
* identifier[0].system = "http://example.org"
* identifier[0].value = "ee8d4ac0-545c-4501-8d7e-646bfbda1dz4"
* name.family = "K"
* name.given[0] = "Mr."
* gender = #male
* birthDate = "1948-10-07"

Instance: ppcWhatMattersTakingCareOfFamily
InstanceOf: WhatMattersPriority
Title: "PPC What Matters: Taking care of family"
Description: "Patient Priorities Care what matters: Taking care of family and friends"
Usage: #example
* status = #final 
* category[what-matters] = WellBeingConcepts#what-matters "What Matters"
* code = PPCWhatMattersConcepts#ppc-wm-4 "Taking care of family and friends and/or pets in my life"
* subject = Reference(ppcPatientMrK)
* performer = Reference(ppcPatientMrK)
* effectiveDateTime = "2025-01-02T15:05:00Z"
* valueBoolean = true

Instance: ppcWhatMattersActivitiesWithFamily
InstanceOf: WhatMattersPriority
Title: "PPC What Matters: Activities with family"
Description: "Patient Priorities Care what matters: Doing activities with family"
Usage: #example
* status = #final 
* category[what-matters] = WellBeingConcepts#what-matters "What Matters"
* code = PPCWhatMattersConcepts#ppc-wm-2 "Doing activities with family and friends"
* subject = Reference(ppcPatientMrK)
* performer = Reference(ppcPatientMrK)
* effectiveDateTime = "2025-01-02T15:05:00Z"
* valueBoolean = true

Instance: ppcGoalGrillForFamily
InstanceOf: PCOGoalAttainmentScaleProfile
Title: "PPC Goal: Grill for family"
Description: "Patient Priorities Care goal: Grill for my family every Sunday"
Usage: #example
* lifecycleStatus = #active
* achievementStatus = $GoalAchievement#in-progress
* category[what-matters] = WellBeingConcepts#what-matters "What Matters"
* category[goal-domain] = PCOGoalDomains#social-functioning "Social Functioning"
* subject = Reference(ppcPatientMrK)
* expressedBy = Reference(ppcPatientMrK)
* startDate = "2025-01-02"
* target.dueDate = "2025-06-30"
* addresses[0] = Reference(ppcWhatMattersActivitiesWithFamily) "PPC What Matters: Activities with Family"
* description.text = "Grill for my family every Sunday when the weather is nice."

Instance: ppcBarrierUrinaryIncontinence
InstanceOf: PCOGoalBarrier
Title: "PPC Bothersome Symptom: urinary incontinence"
Description: "PPC Bothersome symptom or health problem"
Usage: #example
* status = #final 
* code = $SCT#452341000124107 "Assessment of barriers to meet care plan goals performed"
* focus = Reference(ppcGoalGrillForFamily)
* subject = Reference(ppcPatientMrK)
* performer = Reference(ppcPatientMrK)
* effectiveDateTime = "2025-01-02T15:05:00Z"
* valueCodeableConcept = PPCBothersomeHealthConcernConcepts#urinary-incontinence "Having urinary incontinence"

Instance: ppcBarrierFeelingTired
InstanceOf: PCOGoalBarrier
Title: "PPC Bothersome Health Concern: Low energy"
Description: "PPC Bothersome symptom or health problem"
Usage: #example
* status = #final 
* code = $SCT#452341000124107 "Assessment of barriers to meet care plan goals performed"
* focus = Reference(ppcGoalGrillForFamily)
* subject = Reference(ppcPatientMrK)
* performer = Reference(ppcPatientMrK)
* effectiveDateTime = "2025-01-02T15:05:00Z"
* valueCodeableConcept = PPCBothersomeHealthConcernConcepts#tired-lacking-energy "Feeling tired/lacking energy"

Instance: ppcBarrierDiabeticDiet
InstanceOf: PCOGoalBarrier
Title: "PPC Bothersome Health Concern: Diabetic diet (other)"
Description: "PPC Bothersome health problem, other with free-text description"
Usage: #example
* status = #final 
* code = $SCT#452341000124107 "Assessment of barriers to meet care plan goals performed"
* focus = Reference(ppcGoalGrillForFamily)
* subject = Reference(ppcPatientMrK)
* performer = Reference(ppcPatientMrK)
* effectiveDateTime = "2025-01-02T15:05:00Z"
* valueString = "Diabetic diet restrictions"

Instance: ppcCareTradeOffBurdensomeSpecialDiet
InstanceOf: PCOCareTradeOff
Title: "PPC Care Trade-Off: Following a special diet"
Description: "PPC Care Trade-off that is burdensome"
Usage: #example
* status = #final 
* code = CareTradeOffChoiceCodes#burdensome-care "Burdensome"
* focus = Reference(ppcGoalGrillForFamily)
* subject = Reference(ppcPatientMrK)
* performer = Reference(ppcPatientMrK)
* effectiveDateTime = "2025-01-02T15:05:00Z"
* valueCodeableConcept = PPCCareTradeOffConcepts#diet "Following a special diet"
* note.text = "Can't eat what I like"

Instance: ppcCareTradeOffBurdensomeWaterPill
InstanceOf: PCOCareTradeOff
Title: "PPC Care Trade-Off: Water pill"
Description: "PPC Care Trade-off that is burdensome"
Usage: #example
* status = #final 
* code = CareTradeOffChoiceCodes#burdensome-care "Burdensome"
* focus = Reference(ppcGoalGrillForFamily)
* subject = Reference(ppcPatientMrK)
* performer = Reference(ppcPatientMrK)
* effectiveDateTime = "2025-01-02T15:05:00Z"
* valueCodeableConcept = PPCCareTradeOffConcepts#medications "Medications"
* valueCodeableConcept.text = "Water pill"
* note.text = "Have to go to the bathroom too often"

Instance: ppcCareTradeOffHelpfulExercising
InstanceOf: PCOCareTradeOff
Title: "PPC Care Trade-Off: Exercising"
Description: "PPC Care Trade-off that is helpful"
Usage: #example
* status = #final 
* code = CareTradeOffChoiceCodes#helpful-care "Helpful"
* focus = Reference(ppcGoalGrillForFamily)
* subject = Reference(ppcPatientMrK)
* performer = Reference(ppcPatientMrK)
* effectiveDateTime = "2025-01-02T15:05:00Z"
* valueCodeableConcept = PPCCareTradeOffConcepts#exercise "Exercising"

Instance: ppcCareTradeOffHelpfulArthritisCream
InstanceOf: PCOCareTradeOff
Title: "PPC Care Trade-Off: Arthritis cream"
Description: "PPC Care Trade-off that is helpful"
Usage: #example
* status = #final 
* code = CareTradeOffChoiceCodes#helpful-care "Helpful"
* focus = Reference(ppcGoalGrillForFamily)
* subject = Reference(ppcPatientMrK)
* performer = Reference(ppcPatientMrK)
* effectiveDateTime = "2025-01-02T15:05:00Z"
* valueCodeableConcept = PPCCareTradeOffConcepts#medications "Medications"
* valueCodeableConcept.text = "Arthritis cream"

// The most important item from What Matters
//      - Use a List to rank order the What Matters observations
//      - The list only needs to contain the one, not all WhatMatters rank-ordered, although all could be included.

// One most bothersome symptom or health concern
//      - Use a List to rank order the barriers
//      - The list only needs to contain the one most bothersome, not all barriers rank-ordered, although all could be included.

Instance: ppcPrioritiesList
InstanceOf: PCOPersonalPrioritiesOrganizer
Title: "PPC Priorities List"
Description: "PPC what matters most, and the most bothersome Care Trade-off"
Usage: #example
* status = #current 
* mode = #working
* subject = Reference(ppcPatientMrK)
* date = "2025-01-02T15:05:00Z"
* entry[0].item = Reference(ppcWhatMattersActivitiesWithFamily)
* entry[1].item = Reference(ppcBarrierFeelingTired)
* entry[2].item = Reference(ppcCareTradeOffBurdensomeSpecialDiet)

/*
 * Expand PPC to include outcome measures using GAS
*/

Instance: ppcCookingDinnerCarePlanExample
InstanceOf: PCOCarePlan
Title: "PPC Care Plan for person-centered goal"
Description: "Care Plan for a person-centered goal with action steps for achieving what matters most to that person."
Usage: #example
* status = #active
* intent = #plan
* subject = Reference(ppcPatientMrK)
* goal = Reference(ppcGoalGrillForFamily)
* activity[0].reference = Reference(ppcPhysicalTherapyReferral)
* period.start = "2025-01-05"
* period.end = "2025-06-30"

Instance: ppcPhysicalTherapyReferral
InstanceOf: USCoreServiceRequestProfile
Title: "PPC Care Plan: Clinical action step for PT"
Description: "Care Plan activity: Physical therapy to improve stamina and energy"
Usage: #example
* status = #active
* intent = #plan
* subject = Reference(ppcPatientMrK)
* requester = Reference(pcoPractitionerAnderson)
* code.coding = $SCT#91251008 "Physical therapy procedure (regime/therapy)"
* extension[pertainsToGoal].valueReference = Reference(ppcGoalGrillForFamily)
* authoredOn = "2025-01-05"
* occurrenceTiming.repeat.boundsPeriod.start = "2025-01-05"
* occurrenceTiming.repeat.boundsPeriod.end = "2025-03-05"
* occurrenceTiming.repeat.frequency = 1
* occurrenceTiming.repeat.periodUnit = #wk
* note.text = "Trial of physical therapy focused on improving stamina and energy"

Instance: ppcGASScoreBaselineExample
InstanceOf: PCOGoalAttainmentScoreObservation
Title: "PPC GAS Baseline Score"
Description: "Baseline GAS score observation at start of goal."
Usage: #example
* status = #final 
* subject = Reference(ppcPatientMrK)
* performer = Reference(pcoPractitionerGonzalez)
* effectiveDateTime = "2025-01-05T10:15:00Z"
* code = $LNC#68489 "Goal attainment scale"
* focus = Reference(ppcGoalGrillForFamily)
* valueCodeableConcept = $LNC#gas-less-than-expected "Less than expected"

Instance: ppcGASScorePractitionerFollowupExample
InstanceOf: PCOGoalAttainmentScoreObservation
Title: "PPC Practitioner GAS Follow-up Score"
Description: "Follow-up GAS score observation recorded by a Practitioner showing goal progress."
Usage: #example
* status = #final 
* category = USCORECAT#functional-status "Functional Status"
* subject = Reference(ppcPatientMrK)
* performer = Reference(pcoPractitionerGonzalez)
* effectiveDateTime = "2025-02-16T14:33:00Z"
* code = $LNC#68490 "Practitioner follow-up goal attainment scaling score"
* focus = Reference(ppcGoalGrillForFamily)
* valueCodeableConcept = $LNC#LA6111-4 "0"
* valueCodeableConcept.text = "Expected outcome"
