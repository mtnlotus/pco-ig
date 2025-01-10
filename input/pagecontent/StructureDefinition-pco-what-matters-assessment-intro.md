**Example Usage Scenarios:**

The following are example usage scenarios for this Profile:
* Query for an observation representing a clinical test related to a patient's functioning and engagement.
* Record or update observations related to a clinical test for a Patient.

### Mandatory and Must Support Data Elements

The following data elements must always be present or must be supported if the data is present in the sending system ([Must Support](formal_specification.html#must-support) definition). They are presented below with a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition](#profile) below provides the formal summary, definitions, and terminology requirements.

**Each Personal Functioning and Engagement Observation must have:**

1. a status
1. a category code of "clinical-test" and "functioning"
1. a code identifying the clinical test
1. a patient
1. the point in time or period when the observation was made
1. who made the observation

**Each Personal Functioning and Engagement Observation must support:**

1. the location the observation was made
1. any devices the patient used
1. an additional [category value or values](ValueSet-pfe-category-vs.html) specifying the specific [well-being domain](wellbeing-domains.html) that this observation is related to\*\*
1. the result or a reason why the data is absent\*

\* \*\* see guidance below

**Profile specific implementation guidance:**

* \*An Observation without a value, **SHALL** include a reason why the data is absent unless there are component observations. Systems that never provide an observation without a value are not required to support Observation.dataAbsentReason.
* \*\*When a health or health-related domain is specified as an additional [category value](ValueSet-pfe-category-vs.html), Observation.code **SHOULD** be drawn from the corresponding domain-based value set as discussed [below](#domain-specific-value-set-bindings) and on the [domains](domains.html) page.
