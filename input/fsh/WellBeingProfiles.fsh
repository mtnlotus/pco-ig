
RuleSet: WellBeingCategory
* category MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* category contains
    well-being 0..1 MS
* category[well-being] from WellBeingCategories (required)
  * ^short = "Well-Being resource category"

Profile: WellBeingPriority
Parent: USCoreObservationScreeningAssessmentProfile
Id: pco-well-being-priority
Title: "Well-Being Priority"
Description: "Assessment observation for one aspect of a person's well-being, with a boolean value indicating whether this is a current priority."
* insert WellBeingCategory
* code from WellBeingDomainValueSet (preferred)
* value[x] 1..1 MS
* value[x] only boolean
  * ^short = "Indicates if this well-being domain is a current priority"

// TODO: Add WellBeingAssessment constraint that either valueString or component SHALL be present.

Profile: WellBeingAssessment
Parent: USCoreObservationScreeningAssessmentProfile
Id: pco-well-being-assessment
Title: "Well-Being Assessment"
Description: "Assessment observation for one aspect of a person's well-being, with either free-text description or component values rating where a person is now and where they would like to be in the future."
* insert WellBeingCategory
* code from WellBeingDomainValueSet (preferred)
* value[x] 0..1 MS
* value[x] only string or CodeableConcept
  * ^short = "Free-text or coded assessment of this well-being domain"
* component
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "code"
  * ^slicing.rules = #open
* component contains
    nowRating 0..1 MS and
    nowReasons 0..1 MS and
    futureRating 0..1 MS and
    futureChanges 0..1 MS
  * ^short = "Components representing Well-Being rating"
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
