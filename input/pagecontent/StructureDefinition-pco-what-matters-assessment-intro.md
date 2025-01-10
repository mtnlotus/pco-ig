**Example Usage Scenarios:**

The following are example usage scenarios for this Profile:
* Query for an observation representing a patient's assessment for one domain of What Matters.
* Record or update observations related to a patient's assessment for one domain of What Matters.

### Mandatory and Must Support Data Elements

The following data elements must always be present or must be supported if the data is present in the sending system ([Must Support](formal_specification.html#must-support) definition). They are presented below with a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition](#profile) below provides the formal summary, definitions, and terminology requirements.

**Each What Matters Assessment Observation must have:**

1. a status
1. a category code of "survey"
1. a code identifying the well-being domain
1. a patient
1. the point in time or period when the observation was made
1. who made the observation

**Each What Matters Assessment Observation must support:**

1. an additional category code of "what-matters"
1. either a valueString or 1..* components
   1. a value string containing a free-text description of what matters for this well-being domain
   1. or at least one component containing an assessment rating for this well-being domain
