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
* extension[level].valueCoding from PatientGASFollowupVS (required)
* extension[text] ^short = "GAS text"
* extension[text].value[x] only string
* extension[text].valueString 1..1

RuleSet: GASScoreObservationBase
* insert PCOCategory
* code = PCOGASCodesTemporary#goal-attainment-scaling
  * ^short = "Code for Goal Attainment Scaling (GAS) score observation"
* effectiveDateTime 1..1 MS
  * ^short = "Time the score was assessed"
* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
  // TODO: slice focus to allow other references
* focus 1..1 MS
* focus only Reference(PCOGoal)
/*
This slicing does not work. Always adds this to example instances:
    {
      "reference": "StructureDefinition/pco-goal"
    }
*/
// * focus
//   * ^slicing.discriminator.type = #value
//   * ^slicing.discriminator.path = "$this"
//   * ^slicing.rules = #open
// * focus contains
//     pcoGoal 1..1 MS
// * focus[pcoGoal] = only Reference(PCOGoal)
//   * ^short = "Person-centered goal"

Profile: PCOGoal
Parent: USCoreGoalProfile
Id: pco-goal
Title: "Person-Centered Goal"
Description: "Person-centered goal with goal attainment scaling."
* insert PCOCategory
* expressedBy 1..1 MS
* expressedBy only Reference(USCorePatientProfile or USCorePractitionerProfile or USCoreRelatedPersonProfile)
* startDate 1..1 MS
* addresses 0..* MS
  * ^short = "What Matters Assessment or Condition"
* addresses only Reference(WhatMattersAssessment or USCoreConditionProblemsHealthConcernsProfile)
* extension contains
    PCOGoalAttainmentScaling named gas-scaling 0..5 MS

Profile: PCOPatientGASScore
Parent: USCoreObservationScreeningAssessmentProfile
Id: pco-patient-gas-score
Title: "Patient Goal Attainment Scaling (GAS) score"
Description: "The patient follow-up score indicates how the patient rated their own progress on goal attainment scaling."
* insert GASScoreObservationBase
* performer only Reference(USCorePatientProfile)
* valueCodeableConcept from PatientGASFollowupVS 

Profile: PCOPractitionerGASScore
Parent: USCoreObservationScreeningAssessmentProfile
Id: pco-practitioner-gas-score
Title: "Practitioner Goal Attainment Scaling (GAS) score"
Description: "The practitioner follow-up score indicates how the practitioner rated the patient's progress on goal attainment scaling."
* insert GASScoreObservationBase
* performer only Reference(USCorePractitionerProfile)
* valueCodeableConcept from PractitionerGASFollowupVS 

// TODO: How to represent that a caregiver reported their own progress?  Cannot have subject=RelatedPerson
Profile: PCOCaregiverGASScore
Parent: USCoreObservationScreeningAssessmentProfile
Id: pco-caregiver-gas-score
Title: "Caregiver Goal Attainment Scaling (GAS) score"
Description: "The caregiver follow-up score indicates how the caregiver rated either the patient's progress or their own progress on goal attainment scaling."
* insert GASScoreObservationBase
* performer only Reference(USCoreRelatedPersonProfile)
* valueCodeableConcept from CaregiverGASFollowupVS 
