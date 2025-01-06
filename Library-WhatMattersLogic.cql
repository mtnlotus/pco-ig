library WhatMattersLogic version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.4.000' called FHIRHelpers
include PCOCommon version '0.1.0' called PC

valueset "What Matters Categories": 'http://hl7.org/fhir/us/pco/ValueSet/what-matters-vs'
valueset "Well-Being Domains": 'http://hl7.org/fhir/us/pco/ValueSet/wellbeing-domains-example-vs'

parameter "Measurement Period" Interval<DateTime>
    default Interval[@2024-01-01T00:00:00.000Z, @2024-12-31T23:59:59.999Z]

parameter "Follow-Up Interval" Interval<System.Quantity>
  default Interval[2 weeks, 26 weeks]

context Patient

define "What Matters Observations":
  [Observation] obs
    where obs.category in "What Matters Categories"
      or obs.code in "Well-Being Domains"

// Returns a list of what matters Observations this Goal addresses.
define fluent function whatMattersObservations(goal Goal):
  flatten( goal.addresses GA
      return [Observation] obs
        where obs.id = GA.reference.getId()
          and obs.isWhatMatters()
  )

define fluent function isWhatMatters(obs Observation):
  "What Matters Observations" contains obs
