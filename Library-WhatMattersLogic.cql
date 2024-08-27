library WhatMattersLogic version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.4.000' called FHIRHelpers
include PCOCommon version '0.1.0' called PC

valueset "What Matters Focus Areas": 'http://mtnlotus.com/uv/pco/ValueSet/what-matters-focus-areas'

parameter "Measurement Period" Interval<DateTime>
    default Interval[@2024-01-01T00:00:00.000Z, @2024-12-31T23:59:59.999Z]

parameter "Follow-Up Interval" Interval<System.Quantity>
  default Interval[2 weeks, 26 weeks]

context Patient

define "What Matters Observations":
  [Observation: "What Matters Focus Areas"]

// Returns a list of what matters Observations this Goal addresses.
define fluent function whatMattersObservations(goal Goal):
  flatten( goal.addresses GA
      return [Observation] obs
        where obs.id = GA.reference.getId()
          and obs.isWhatMatters()
  )

define fluent function isWhatMatters(obs Observation):
  "What Matters Observations" contains obs

// Returns a list of Goals that address this Observation
define fluent function addressedByGoals(obs Observation):
  [Goal] goal
    where exists ( goal.addresses GA
        where obs.id = GA.reference.getId()
    )

// Returns a list of Conditions that this Goal addresses.
define fluent function addressesConditions(goal Goal):
  flatten( goal.addresses GA
      return [Condition] obs
        where obs.id = GA.reference.getId()
  )
