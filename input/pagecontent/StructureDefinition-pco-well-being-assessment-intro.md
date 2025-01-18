**Example Usage Scenarios:**

The following are example usage scenarios for this Profile:
* Query for an observation representing a patient's assessment for one domain of Well-Being.
* Record or update observations related to a patient's assessment for one domain of Well-Being.

### Mandatory and Must Support Data Elements

The following data elements must always be present or must be supported if the data is present in the sending system ([Must Support](formal_specification.html#must-support) definition). They are presented below with a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition](#profile) below provides the formal summary, definitions, and terminology requirements.

**Each Well-Being Assessment Observation must have:**

1. a status
1. a category code of "survey"
1. a code identifying the well-being domain
1. a patient
1. the point in time or period when the observation was made
1. who made the observation

**Each Well-Being Assessment Observation must support:**

1. an additional well-being category code
1. either a valueString, valueCodeableConcept, or 1..* components
   1. a value string containing a free-text description of this well-being domain
   1. or a codeable concept containing a code for assessment this well-being domain
   1. or at least one component containing an assessment rating for this well-being domain
