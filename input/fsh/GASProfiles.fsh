Extension:  PCOGoalAttainmentScaling
Id: pco-goal-attainment-scaling
Title: "Goal Attainment Scaling"
Description: "Goal Attainment Scaling (GAS) is an extension used to specify five levels of attainment for a person-centered goal."
* ^context.type = #element
* ^context.expression = "Goal"
* extension contains 
  level 0..1 MS and 
  text 1..1 MS
* extension[level] ^short = "Code indicating GAS level"
* extension[level].value[x] only Coding
* extension[level].valueCoding 1..1
* extension[level].valueCoding from PatientGASFollowup (required)
* extension[text] ^short = "GAS text"
* extension[text].value[x] only string
* extension[text].valueString 1..1

RuleSet: GASScoreObservationBase
* code = PCOGASCodesTemporary#goal-attainment-scaling
  * ^short = "Code for Goal Attainment Scaling (GAS) score observation"
* focus only Reference(PCOGoalAttainmentScaleProfile)
* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS

Profile: PCOGoalAttainmentScaleProfile
Parent: PCOGoalProfile
Id: pco-gas-goal-profile
Title: "Person-Centered Goal Attainment"
Description: "Person-centered goal with goal attainment scaling."
* extension contains
    PCOGoalAttainmentScaling named gas-scaling 5..5 MS
* target 0..1 MS
  * measure = PCOGASCodesTemporary#goal-attainment-scaling

Profile: PCOPatientGASScore
Parent: PCOProgressScoreObservation
Id: pco-patient-gas-score
Title: "Patient Goal Attainment Scaling (GAS) score"
Description: "The patient follow-up score indicates how the patient rated their own progress on goal attainment scaling."
* insert GASScoreObservationBase
* performer only Reference(USCorePatientProfile)
* valueCodeableConcept from PatientGASFollowup 

Profile: PCOPractitionerGASScore
Parent: PCOProgressScoreObservation
Id: pco-practitioner-gas-score
Title: "Practitioner Goal Attainment Scaling (GAS) score"
Description: "The practitioner follow-up score indicates how the practitioner rated the patient's progress on goal attainment scaling."
* insert GASScoreObservationBase
* performer only Reference(USCorePractitionerProfile)
* valueCodeableConcept from PractitionerGASFollowup 

// TODO: How to represent that a caregiver reported their own progress?  Cannot have subject=RelatedPerson
Profile: PCOCaregiverGASScore
Parent: PCOProgressScoreObservation
Id: pco-caregiver-gas-score
Title: "Caregiver Goal Attainment Scaling (GAS) score"
Description: "The caregiver follow-up score indicates how the caregiver rated either the patient's progress or their own progress on goal attainment scaling."
* insert GASScoreObservationBase
* performer only Reference(USCoreRelatedPersonProfile)
* valueCodeableConcept from CaregiverGASFollowup 
