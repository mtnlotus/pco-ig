
Instance: pcoPatientJones
InstanceOf: USCorePatientProfile
Title: "Patient Dorothy Jones" 
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
* category[what-matters] = WellBeingConcepts#what-matters "What Matters Most"
* category[goal-domain] = PCOGoalDomains#physical-function "Physical Function"
* subject = Reference(pcoPatientJones)
* expressedBy = Reference(pcoPatientJones)
* startDate = "2024-02-15"
* target.dueDate = "2024-06-30"
* description.text = "Maintain pain level below 5 while walking"
