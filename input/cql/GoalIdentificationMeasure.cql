library GoalIdentificationMeasure version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.4.000' called FHIRHelpers
include PCOCommon version '0.1.0' called PC
include GoalAttainmentLogic version '0.1.0' called GAS

parameter "Measurement Period" Interval<DateTime>
    default Interval[@2024-01-01T00:00:00.000Z, @2024-12-31T23:59:59.999Z]

context Patient

/*
Goal Identification: % of individuals 18 years of age and older with a complex care need 
who had a PCO goal identified resulting in completion of goal attainment scaling (GAS) 
or a Patient-Reported Outcome Measure (PROM) and development of an action plan.
*/

/// individuals 18 years of age and older
define "Initial Population": {
  Patient person
    where AgeInYearsAt(start of "Measurement Period") >= 18
}

/// TODO: with a complex care need 
define "Denominator":
  "Initial Population"

define "Denominator Exclusions":
  null

define "Denominator Exceptions":
  null

/// has a PCO goal identified resulting in completion of goal attainment scaling (GAS)
/// ... and development of an action plan.
define "Numerator":
  "Denominator" person where (
    exists "Identified PCO Goals" pcoGoal
      where pcoGoal.hasGAS()
        and exists pcoGoal.carePlans()
  )

define "Identified PCO Goals":
  GAS."PCO Goals" pcoGoal
    where ToDateTime(pcoGoal.start as FHIR.date) during "Measurement Period"
