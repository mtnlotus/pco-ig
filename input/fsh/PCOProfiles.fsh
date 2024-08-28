
RuleSet: PCOCategory
* category
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* category contains
    pcoCategory 0..* MS
* category[pcoCategory] from PCOCategoryValueSet (preferred)
  * ^short = "Person-Centered Outcome category"

Profile: PCOGoalProfile
Parent: USCoreGoalProfile
Id: pco-goal-profile
Title: "Person-Centered Goal"
Description: "Person-centered goal focused on what matters most to an individual. A Person-centered goal SHALL include either a Person-Centered Outcome category, or address a What Matters assessment."
* insert PCOCategory
* expressedBy 0..1 MS
* expressedBy only Reference(USCorePatientProfile or USCorePractitionerProfile or USCoreRelatedPersonProfile)
* startDate 1..1 MS
* addresses 0..* MS
  * ^short = "What Matters Assessment or Condition"
* addresses only Reference(WhatMattersAssessment or USCoreConditionProblemsHealthConcernsProfile)
// TODO: add a constraint that either category from PCOCategory or addresses WhatMattersAssessment SHALL be present

Profile: PCOGoalOutcomeMeasureProfile
Parent: PCOGoalProfile
Id: pco-goal-prom-profile
Title: "Person-Centered Goal for PROMs"
Description: "Person-centered goal with a Patient-Reported Outcome Measure (PROM) score target."
* target 1..1
  * measure 1..1 MS
    * ^short = "Target score for evaluating PCO Goal using PROMs"
  * measure from PROMTargetMeasures (extensible)
  * detailQuantity 1..1 MS
    * ^short = "Target value for the PROM score"

Profile: PCOCarePlan
Parent: USCoreCarePlanProfile
Id: pco-care-plan
Title: "Person-Centered Care Plan"
Description: "A person-centered care plan SHALL reference a person-centered goal and SHALL include action steps that support progress toward achievement of the plan's goals and desired outcomes. A plan SHOULD address the person's stated priorities for what matters most to them. Action steps may include both treatment procedures and self-care steps identified by the person."
* insert PCOCategory
* goal 1..* MS
* goal only Reference(PCOGoalProfile)
  * ^short = "Person-centered goals supported by this plan"
* activity.detail 0..0
  * ^short = "Removed in FHIR R5"
* activity 1..*
* activity.reference 1..1 MS
  * ^short = "Action steps for person-centered goals"

Profile: PCOProgressScoreObservation
Parent: USCoreObservationScreeningAssessmentProfile
Id: pco-progress-score-observation
Title: "Person-Centered Progress Score"
Description: "A progress score observation for a person-centered goal."
* effectiveDateTime 1..1 MS
  * ^short = "When the score was assessed"
* focus 1..1 MS
* focus only Reference(PCOGoalProfile)
  * ^short = "The goal whose progress was scored"
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

Profile: PCOPatientReportedOutcomeScore
Parent: PCOProgressScoreObservation
Id: pco-prom-score
Title: "Patient-Reported Outcome Measure (PROM) score"
Description: "This observation records how a patient rated their own progress score using a PROM assessment."
* code from PROMTargetMeasures (extensible)
  * ^short = "Code for PROM score observation"
* focus only Reference(PCOGoalOutcomeMeasureProfile)
* value[x] only Quantity
* valueQuantity 1..1 MS
