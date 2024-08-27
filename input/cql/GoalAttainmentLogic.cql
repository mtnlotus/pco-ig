library GoalAttainmentLogic version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.4.000' called FHIRHelpers
include PCOCommon version '0.1.0' called PC

codesystem "LOINC": 'http://loinc.org'
codesystem "PCO GAS Codes": 'http://mtnlotus.com/uv/pco/CodeSystem/pco-gas-codes-temporary'

valueset "PCO Categories": 'http://mtnlotus.com/uv/pco/ValueSet/pco-category-valueset'
valueset "Patient Follow-Up GAS Score": 'http://mtnlotus.com/uv/pco/ValueSet/patient-gas-followup'
valueset "PROM Target Measures": 'http://mtnlotus.com/uv/pco/ValueSet/prom-target-measures'

code "Goal attainment scaling score": 'goal-attainment-scaling' from "PCO GAS Codes" display 'Goal Attainment Scaling (GAS)'

parameter "Measurement Period" Interval<DateTime>
    default Interval[@2024-01-01T00:00:00.000Z, @2024-12-31T23:59:59.999Z]

parameter "Follow-Up Interval" Interval<System.Quantity>
  default Interval[2 weeks, 26 weeks]

context Patient

// For debugging
define GoalSummary: 
  [Goal] goal
    return {
      id: goal.id.value,
      dueDate: goal.dueDate(),
      pcoCategories: goal.category in "PCO Categories",
      hasGAS: goal.hasGAS(),
      hasPROM: goal.hasPROM(),
      carePlans: goal.carePlans()
    }

// For debugging
define CarPlanSummary: 
  [CarePlan] carePlan
    return {
      id: carePlan.id.value,
      pcoGoals: carePlan.pcoGoals()
    }

// All FHIR Goals for this patient. Useful while debugging to verify subset matched by "PCO Goals".
define "All Goals":
  [Goal] goal

/* 
  A "PCO Goal" is any FHIR Goal that has a category in "PCO Categories"
  and has a start date.
  TODO: or a Goal that addresses a What Matters observation.
*/
define "PCO Goals":
  [Goal] goal
    where goal.category in "PCO Categories"
      and (goal.start as FHIR.date) is not null

// A "GAS Goal" is any PCO Goal that includes GAS extensions
define "GAS Goals":
  "PCO Goals" goal
    where goal.hasGAS()

// All FHIR CarePlan resources for this patient. Useful for verifying subset matched by "PCO Care Plans".
define "All Care Plans":
  [CarePlan] carePlan

// A "PCO CarePlan" is any FHIR CarePlan that includes a PCO Goal
define "PCO Care Plans":
  [CarePlan] carePlan
    where exists carePlan.pcoGoals()

/*
  @description: Returns a list of Goals with goal attainment scaling (GAS) extensions and an associated CarePlan.
*/
define "PCO Goals with GAS and Action Plan":
    "GAS Goals" goal
      where exists goal.carePlans()

// Observations containing a PROM score.
define "PROM Scores":
  [Observation: "PROM Target Measures"]

// Observations containing a GAS score.
define "GAS Scores":
  PC.SortAscending("GAS Patient Scores"
    union "GAS Practitioner Scores"
    union "GAS Caregiver Scores"
  )

// All observations containing a Goal Attainment Scaling (GAS) score.
define "All GAS Score Observations":
  [Observation: "Goal attainment scaling score"]

// Returns a collection of Observations with a patient's GAS scores.
define "GAS Patient Scores":
  "All GAS Score Observations" obs
    where exists obs.performer.resolvePatients()

// Returns a collection of Observations with a practitioner's GAS scores.
define "GAS Practitioner Scores":
  "All GAS Score Observations" obs
    where exists obs.performer.resolvePractitioners()

// Returns a collection of Observations with a caregiver's GAS scores.
define "GAS Caregiver Scores":
  "All GAS Score Observations" obs
    where exists obs.performer.resolveRelatedPersons()

define fluent function hasGAS(goal Goal):
  exists goal.extensions('http://mtnlotus.com/uv/pco/StructureDefinition/pco-goal-attainment-scaling')

/// Returns true if this Goal has a PROM code in its target.measure
define fluent function hasPROM(goal Goal):
  exists (goal.target target
    where target.measure in "PROM Target Measures"
  )

// Returns a list of Observation including both GAS and PROM scores
define fluent function pcoScores(goal Goal):
  goal.gasScores()
    union goal.promScores()

// Returns a list of Observation including only GAS scores
define fluent function gasScores(goal Goal):
  "GAS Scores" score
    where score.focusGoals() contains goal

// Returns a list of Observation including only PROM scores
define fluent function promScores(goal Goal):
  "PROM Scores" score
    where score.focusGoals() contains goal

// Returns a list of PCO Goals that are included in this CarePlan.
define fluent function pcoGoals(carePlan CarePlan):
  flatten( carePlan.goal goalRef
      return [Goal] goal
        where goal.id = goalRef.reference.getId()
          and "PCO Goals" contains goal
  )

// Returns a list of Goal where focus includes the given Observation.
define fluent function focusGoals(obs Observation):
  obs.focus.resolveGoals()

// PCO Goals whose startDate falls within the Measurement Period
define "PCO Goals During Measurement Period":
  "PCO Goals" goal
    where (ToDateTime(goal.start as FHIR.date) during "Measurement Period")
      and (goal.hasGAS() or goal.hasPROM())
      and exists goal.carePlans()

/* 
Baseline Scares are PCO score observations taken during the Measurement Period,
but before the follow-up period for its Goal. Default follow-up period is 
2 weeks to 6 months following the goal startDate.
*/
define "Baseline Scores Before Follow-Up Period":
  flatten( "PCO Goals During Measurement Period" goal
    let pcoScores: goal.pcoScores()
      return pcoScores score 
        let scoreDate: score.effective as FHIR.dateTime
        where (scoreDate during "Measurement Period")
          and (scoreDate before start of "Follow-Up Interval For"(goal))
  )

/* 
Follow-Up Scares are PCO score observations taken during the Measurement Period,
and during the follow-up period for its Goal. Default follow-up period is 
2 weeks to 6 months following the goal startDate.
*/
define "Follow-Up Scores During Measurement Period":
  flatten( "PCO Goals During Measurement Period" goal
    let pcoScores: goal.pcoScores()
      return pcoScores score 
        let scoreDate: score.effective as FHIR.dateTime
        where scoreDate during "Measurement Period"
          and scoreDate during "Follow-Up Interval For"(goal)
  )

/*
Computes the follow-up interval for a Goal based on this measure's "Follow-Up Interval" parameter.
@return Interval<DateTime>
*/
define function "Follow-Up Interval For" (goal Goal):
  goal goal
    let startDate: ToDateTime(goal.start as FHIR.date)
      return Interval(startDate + start of "Follow-Up Interval", startDate + end of "Follow-Up Interval")
