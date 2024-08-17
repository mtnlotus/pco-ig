library GoalAttainmentLogic version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.4.000' called FHIRHelpers

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

define "PCO Goal Domain Observations":
  [Observation: "PCO Categories"]

define fluent function isGoalDomain(obs Observation):
  "PCO Goal Domain Observations" contains obs

// All observations containing a Goal Attainment Scaling (GAS) score.
define "GAS Observations":
  [Observation: "Goal attainment scaling score"]

// All FHIR Goals for this patient. Useful for verifying subset matched by "PCO Goals".
define "All Goals":
  [Goal] goal

// A "PCO Goal" is any FHIR Goal that has a category in "PCO Categories"
define "PCO Goals":
  [Goal] goal
    where goal.category in "PCO Categories"

// A "GAS Goal" is any FHIR Goal that includes GAS extensions
define "GAS Goals":
  [Goal] goal
    where goal.hasGAS()

// All FHIR CarePlan resources for this patient. Useful for verifying subset matched by "PCO Care Plans".
define "All Care Plans":
  [CarePlan] carePlan

// A "PCO CarePlan" is any FHIR CarePlan that includes a PCO Goal
define "PCO Care Plans":
  [CarePlan] carePlan
    where exists carePlan.pcoGoals()

// Returns a collection of Observations with a person's baseline GAS score.
// define "GAS Baseline Scores":
//   [Observation: "GAS Baseline score"]

// Returns a collection of Observations with a patient's follow-up GAS score.
define "GAS Patient Follow-Up Scores":
  [Observation: "Goal attainment scaling score"]
  // TODO and recorded by a Patient

// Returns a collection of Observations with a practitioner's follow-up GAS score.
define "GAS Provider Follow-Up Scores":
  [Observation: "Goal attainment scaling score"]

// Returns a collection of Observations with a caregiver's follow-up GAS score.
define "GAS Caregiver Follow-Up Scores":
  [Observation: "Goal attainment scaling score"]

define fluent function hasGAS(goal Goal):
  exists goal.extensions('http://mtnlotus.com/uv/pco/StructureDefinition/pco-goal-attainment-scaling')

// Returns a list of CarePlan that support this Goal.
define fluent function carePlans(goal Goal):
  [CarePlan] carePlan
    where exists ( carePlan.goal goalRef
        where goal.id = goalRef.reference.getId()
    )

// Returns a list of goal domain Observations that this Goal addresses.
define fluent function goalDomainObservations(goal Goal):
  flatten( goal.addresses GA
      return [Observation] obs
        where obs.id = GA.reference.getId()
          and obs.isGoalDomain()
  )

// Returns a list of Observations that this Goal addresses.
define fluent function addressesObservations(goal Goal):
  flatten( goal.addresses GA
      return [Observation] obs
        where obs.id = GA.reference.getId()
  )

// Returns Date from the first Goal target that has a due date.
define fluent function dueDate(goal Goal):
  First(goal.target target
    // TODO if due is Duration, add that quantity to startDate
      let due:(target.due as FHIR.date).value
      where due is not null
      return due
  )

// Returns a list of PCO Goals that are included in this CarePlan.
define fluent function pcoGoals(carePlan CarePlan):
  flatten( carePlan.goal goalRef
      return [Goal] goal
        where goal.id = goalRef.reference.getId()
          and "PCO Goals" contains goal
  )

// Returns a list of Goals that address this Observation
define fluent function addressedByGoals(obs Observation):
  [Goal] goal
    where exists ( goal.addresses GA
        where obs.id = GA.reference.getId()
    )

/*
 * General FHIR data helpers.
 */

define fluent function getId(uri String):
  Last(Split(uri, '/'))


// Note: the external versions of the following functions in FHIRHelpers do not execute in VS Code.

/*
@description: Returns any extensions defined on the given resource with the specified url.
@comment: NOTE: Extensions are not the preferred approach, but are used as a way to access
content that is defined by extensions but not yet surfaced in the
CQL model info.
*/
define fluent function extensions(domainResource DomainResource, url String):
  domainResource.extension E
	  where E.url = url
		return E

/*
@description: Returns the single extension (if present) on the given resource with the specified url.
@comment: This function uses singleton from to ensure that a run-time exception is thrown if there
is more than one extension on the given resource with the specified url.
*/
define fluent function extension(domainResource DomainResource, url String):
  singleton from domainResource.extensions(url)
