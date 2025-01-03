
Instance: ppcPatientKay
InstanceOf: USCorePatientProfile
Title: "Patient John Kay" 
Description: "John Kay for PPC examples"
Usage: #example
* identifier[0].use = #official
* identifier[0].system = "http://example.org"
* identifier[0].value = "ee8d4ac0-545c-4501-8d7e-646bfbda1dz4"
* name.family = "Kay"
* name.given[0] = "John"
* gender = #male
* birthDate = "1948-10-07"

Instance: ppcWhatMattersMovingTheBody
InstanceOf: WhatMattersPriority
Title: "PPC What Matters: Walking or moving"
Description: "Patient Priorities Care what matters: Walking or moving"
Usage: #example
* status = #final 
* category[what-matters] = WellBeingConcepts#what-matters "What Matters Most"
* code = PPCWhatMattersConcepts#ppc-wm-3 "Walking or moving inside and outside of my home"
* subject = Reference(ppcPatientKay)
* performer = Reference(ppcPatientKay)
* effectiveDateTime = "2025-01-02T15:05:00Z"
* valueBoolean = true

Instance: ppcWhatMattersActivitiesWithFamily
InstanceOf: WhatMattersPriority
Title: "PPC What Matters: Activities with Family"
Description: "Patient Priorities Care what matters: doing activities with family"
Usage: #example
* status = #final 
* category[what-matters] = WellBeingConcepts#what-matters "What Matters Most"
* code = PPCWhatMattersConcepts#ppc-wm-2 "Doing activities with family and friends"
* subject = Reference(ppcPatientKay)
* performer = Reference(ppcPatientKay)
* effectiveDateTime = "2025-01-02T15:05:00Z"
* valueBoolean = true

Instance: ppcGoalCookingDinner
InstanceOf: PCOGoalAttainmentScaleProfile
Title: "PPC Goal: Cooking Dinner"
Description: "Patient Priorities Care goal: cooking dinner"
Usage: #example
* lifecycleStatus = #active
* achievementStatus = $GoalAchievement#in-progress
* category[what-matters] = WellBeingConcepts#what-matters "What Matters Most"
* category[goal-domain] = PCOGoalDomains#social-functioning "Social Functioning"
* subject = Reference(ppcPatientKay)
* expressedBy = Reference(ppcPatientKay)
* startDate = "2025-01-02"
* target.dueDate = "2025-06-30"
* addresses[0] = Reference(ppcWhatMattersActivitiesWithFamily) "PPC What Matters: Activities with Family"
* description.text = "I want to cook dinner for my family every Sunday."

Instance: ppcBarrierUnsteady
InstanceOf: PCOGoalBarrier
Title: "PPC Bothersome Symptom: Feeling Unsteady"
Description: "PPC Bothersome symptom or health problem"
Usage: #example
* status = #final 
* code = $SCT#452341000124107 "Assessment of barriers to meet care plan goals performed"
* focus = Reference(ppcGoalCookingDinner)
* subject = Reference(ppcPatientKay)
* performer = Reference(ppcPatientKay)
* effectiveDateTime = "2025-01-02T15:05:00Z"
* valueCodeableConcept = PPCBothersomeHealthConcernConcepts#unsteady "Feeling unsteady; trouble balancing/walking"

Instance: ppcBarrierDiabetes
InstanceOf: PCOGoalBarrier
Title: "PPC Bothersome Health Concern: Diabeted diet (other)"
Description: "PPC Bothersome health problem, other with free-text description"
Usage: #example
* status = #final 
* code = $SCT#452341000124107 "Assessment of barriers to meet care plan goals performed"
* focus = Reference(ppcGoalCookingDinner)
* subject = Reference(ppcPatientKay)
* performer = Reference(ppcPatientKay)
* effectiveDateTime = "2025-01-02T15:05:00Z"
* valueString = "Diabetic diet restrictions"

Instance: ppcCareTradeOffBothersome
InstanceOf: PCOCareTradeOff
Title: "PPC Care Trade-Off: Following a special diet"
Description: "PPC Care Trade-off that is bothersome"
Usage: #example
* status = #final 
* code = PPCCareTradeOffConcepts#diet "Following a special diet"
* focus = Reference(ppcGoalCookingDinner)
* subject = Reference(ppcPatientKay)
* performer = Reference(ppcPatientKay)
* effectiveDateTime = "2025-01-02T15:05:00Z"
* valueCodeableConcept = CareTradeOffChoices#bothersome "Bothersome"

Instance: ppcCareTradeOffHelpful
InstanceOf: PCOCareTradeOff
Title: "PPC Care Trade-Off: Health care visits"
Description: "PPC Care Trade-off that is helpful"
Usage: #example
* status = #final 
* code = PPCCareTradeOffConcepts#health-care-visits "Health Care visits"
* focus = Reference(ppcGoalCookingDinner)
* subject = Reference(ppcPatientKay)
* performer = Reference(ppcPatientKay)
* effectiveDateTime = "2025-01-02T15:05:00Z"
* valueCodeableConcept = CareTradeOffChoices#helpful "Helpful"

// The most important item from What Matters
//      - Use a List to rank order the What Matters observations
//      - The list only needs to contain the one, not all WhatMatters rank-ordered, although all could be included.

// One most bothersome symptom or health concern
//      - Use a List to rank order the barriers
//      - The list only needs to contain the one most bothersome, not all barriers rank-ordered, although all could be included.

Instance: ppcPrioritiesList
InstanceOf: PCOPersonalPrioritiesOrganizer
Title: "PPC Priorities List"
Description: "PPC what matters MOST, and the MOST bothersome Care Trade-off"
Usage: #example
* status = #current 
* mode = #working
* subject = Reference(ppcPatientKay)
* date = "2025-01-02T15:05:00Z"
* entry[0].item = Reference(ppcWhatMattersActivitiesWithFamily)
* entry[1].item = Reference(ppcBarrierUnsteady)
* entry[2].item = Reference(ppcCareTradeOffBothersome)

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
* subject = Reference(ppcPatientKay)
* goal = Reference(ppcGoalCookingDinner)
* activity[0].reference = Reference(ppcPhysicalTherapyReferral)
* period.start = "2025-01-05"
* period.end = "2025-06-30"

Instance: ppcPhysicalTherapyReferral
InstanceOf: USCoreServiceRequestProfile
Title: "PPC Care Plan: Clinical action step for PT"
Description: "Care Plan activity: Physical therapy to reduce unsteadiness while cooking dinner"
Usage: #example
* status = #active
* intent = #plan
* subject = Reference(ppcPatientKay)
* requester = Reference(pcoPractitionerAnderson)
* code.coding = $SCT#91251008 "Physical therapy procedure (regime/therapy)"
* extension[pertainsToGoal].valueReference = Reference(ppcGoalCookingDinner)
* authoredOn = "2025-01-05"
* occurrenceTiming.repeat.boundsPeriod.start = "2025-01-05"
* occurrenceTiming.repeat.boundsPeriod.end = "2025-03-05"
* occurrenceTiming.repeat.frequency = 1
* occurrenceTiming.repeat.periodUnit = #wk
* note.text = "Trial of physical therapy focused on improving balance while standing and walking"

Instance: ppcGASScoreBaselineExample
InstanceOf: PCOGoalAttainmentScoreObservation
Title: "PPC GAS Baseline Score"
Description: "Baseline GAS score observation at start of goal."
Usage: #example
* status = #final 
* subject = Reference(ppcPatientKay)
* performer = Reference(pcoPractitionerGonzalez)
* effectiveDateTime = "2025-01-05T10:15:00Z"
* code = $LNC#68489 "Goal attainment scale"
* focus = Reference(ppcGoalCookingDinner)
* valueCodeableConcept = $LNC#gas-less-than-expected "Less than expected"
