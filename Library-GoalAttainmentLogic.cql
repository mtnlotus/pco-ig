library GoalAttainmentLogic version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.4.000' called FHIRHelpers
include PCOCommon version '0.1.0' called PC

codesystem "LOINC": 'http://loinc.org'
codesystem "PCO Category": 'http://mtnlotus.com/uv/pco/CodeSystem/pco-category-codes-example'
codesystem "PCO GAS Codes": 'http://mtnlotus.com/uv/pco/CodeSystem/pco-gas-codes-temporary'

valueset "PCO Categories": 'http://mtnlotus.com/uv/pco/ValueSet/pco-category-valueset'
valueset "Patient Follow-Up GAS Score": 'http://mtnlotus.com/uv/pco/ValueSet/patient-gas-followup-vs'

code "Goal attainment scaling score": 'goal-attainment-scaling' from "PCO GAS Codes" display 'Goal Attainment Scaling (GAS)'

parameter "Measurement Period" Interval<DateTime>

context Patient

// For debugging
define GoalSummary: 
  [Goal] goal
    return {
      id: goal.id.value,
      dueDate: goal.dueDate(),
      pcoGoalDomains: goal.category in "PCO Categories",
      carePlans: goal.carePlans()
    }

// For debugging
define CarPlanSummary: 
  [CarePlan] carePlan
    return {
      id: carePlan.id.value,
      pcoGoals: carePlan.pcoGoals()
    }

// All FHIR Goals for this patient. Useful for verifying subset matched by "PCO Goals".
define "All Goals":
  [Goal] goal

/* 
  A "PCO Goal" is any FHIR Goal that has a category in "PCO Categories"
  and has a start date.
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

// All observations containing a Goal Attainment Scaling (GAS) score.
define "All GAS Score Observations":
  [Observation: "Goal attainment scaling score"]

/* 
@description: Returns a list of Observations with a person's baseline GAS scores. 
A baseline score is recorded less than 2 weeks after its Goal was started.
*/
define "GAS Baseline Scores":
  "GAS Scores" scoreObs
    let goal: First(scoreObs.focus.resolveGoals()),
      startDate: ToDateTime(goal.start as FHIR.date),
      baselineInterval: Interval(startDate, startDate + 13 day]
    where (scoreObs.effective as FHIR.dateTime) during baselineInterval

/* 
@description: Returns a list of Observations with a person's follow-up GAS scores. 
A follow-up score is recorded 2 or more weeks after its Goal was started.
*/
define "GAS Follow-Up Scores":
  "GAS Scores"
    except "GAS Baseline Scores"

define "GAS Scores":
  PC.SortAscending("GAS Patient Scores"
    union "GAS Practitioner Scores"
    union "GAS Caregiver Scores"
  )

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

// Returns a list of PCO Goals that are included in this CarePlan.
define fluent function pcoGoals(carePlan CarePlan):
  flatten( carePlan.goal goalRef
      return [Goal] goal
        where goal.id = goalRef.reference.getId()
          and "PCO Goals" contains goal
  )
