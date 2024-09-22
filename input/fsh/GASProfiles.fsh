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
* extension[level].valueCoding from GASScoreAnswers (required)
* extension[text] ^short = "GAS text"
* extension[text].value[x] only string
* extension[text].valueString 1..1

Profile: PCOGoalAttainmentScaleProfile
Parent: PCOGoalProfile
Id: pco-gas-goal-profile
Title: "Person-Centered GAS Goal"
Description: "Person-centered goal with goal attainment scaling."
* extension contains
    PCOGoalAttainmentScaling named gas-scaling 0..5 MS
* target 0..1 MS
  * measure = $LNC#68489 "Goal attainment scale"

Profile: PCOGoalAttainmentScoreObservation
Parent: PCOProgressScoreObservation
Id: pco-gas-score-observation
Title: "PCO Goal Attainment Scaling (GAS) score"
Description: "The follow-up score indicates how a patient, caregiver, or practitioner rated progress on goal attainment scaling."
* code from GoalAttainmentScalingScore (extensible)
  * ^short = "Code for Goal Attainment Scaling (GAS) score observation"
* focus only Reference(PCOGoalAttainmentScaleProfile)
* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
* valueCodeableConcept from GASScoreAnswers (required)
