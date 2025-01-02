
RuleSet: WhatMattersCategory
* category MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* category contains
    what-matters 0..1 MS
* category[what-matters] from WhatMattersValueSet (required)
  * ^short = "What Matters observation category"

Profile: WhatMattersPriority
Parent: USCoreSimpleObservationProfile
Id: pco-what-matters-priority
Title: "What Matters Priority"
Description: "Assessment observation for one aspect of What Matters Most to a person, with a boolean value indicating whether this is a current priority."
// Satisfies US Core required binding for category
* category[us-core] 1..1 MS
* category[us-core] = OBSCAT#survey
* insert WhatMattersCategory
* code from WellBeingDomainValueSet (preferred)
* value[x] 1..1 MS
* value[x] only boolean
  * ^short = "Indicates if this well-being domain is a current priority"

// TODO: Add WhatMattersAssessment constraint that either valueString or component SHALL be present.

Profile: WhatMattersAssessment
Parent: USCoreSimpleObservationProfile
Id: pco-what-matters-assessment
Title: "What Matters Assessment"
Description: "Assessment observation for one aspect of What Matters Most to a person, with either free-text description or component values rating where a person is now and where they would like to be in the future."
* category[us-core] 1..1 MS
* category[us-core] = OBSCAT#survey
* insert WhatMattersCategory
* code from WellBeingDomainValueSet (preferred)
* value[x] 0..1 MS
* value[x] only string
  * ^short = "Description of what matters for this well-being domain"
* component
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "code"
  * ^slicing.rules = #open
* component contains
    nowRating 0..1 MS and
    nowReasons 0..1 MS and
    futureRating 0..1 MS and
    futureChanges 0..1 MS
  * ^short = "Components representing What Matters rating"
* component[nowRating]
  * code = WellBeingConcepts#now-rating
    * ^short = "Where are you now?"
  * insert RatingValueInteger
* component[nowReasons]
  * code = WellBeingConcepts#now-reasons
    * ^short = "What are the reasons you chose this number?"
  * insert RatingValueString
* component[futureRating]
  * code = WellBeingConcepts#future-rating
    * ^short = "Where would you like to be?"
  * insert RatingValueInteger
* component[futureChanges]
  * code = WellBeingConcepts#future-changes
    * ^short = "What changes could you make to help you get there?"
  * insert RatingValueString

RuleSet: RatingValueInteger
* value[x] 1..1 MS
* value[x] only integer
  * ^short = "Rating on scale from low to high"

RuleSet: RatingValueString
* value[x] 1..1 MS
* value[x] only string
  * ^short = "Reasons for your rating"

// Profile: WhatMattersStatement
// Parent: USCoreSimpleObservationProfile
// Id: pco-what-matters-statement
// Title: "What Matters Statement"
// Description: "Assessment observation for one aspect of What Matters Most to a person, with a text statement about this well-being domain."
// * category[us-core] 1..1 MS
// * category[us-core] = OBSCAT#survey
// * insert WhatMattersCategory
// * code from WellBeingDomainValueSet (preferred)
// * value[x] 1..1 MS
// * value[x] only string
//   * ^short = "Description of what matters for this well-being domain"
