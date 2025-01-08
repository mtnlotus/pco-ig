
Profile: PCOCareTradeOff
Parent: USCoreSimpleObservationProfile
Id: pco-care-tradeoff
Title: "Care Trade-off Assessment"
Description: "Assessment observation about a care trade-off that is helpful or burdensome (difficult, uncomfortable, or unhelpful)."
// Satisfies US Core required binding for category
* category[us-core] 1..1 MS
* category[us-core] = OBSCAT#survey

* code from CareTradeOffChoices (extensible)
  * ^short = "Indicates whether this care is helpful or bothersome"
* focus 0..* MS
* focus only Reference(Goal or MedicationRequest or ServiceRequest or Procedure)
  * ^short = "The goal, medication and/or procedure that has this trade-off"

* value[x] 1..1 MS
* value[x] only CodeableConcept or string
* valueCodeableConcept from PPCCareTradeOffExamples (example)
  * ^short = "Type of care selected from a list"
* valueString
  * ^short = "Free-text description of a care trade-off"
* note 0..* MS

CodeSystem: CareTradeOffChoiceCodes
Id: pco-care-tradeoff-choice-codes
Title: "Care Trade-off Choices"
Description: "Code system to identify care trade-off choices."
* ^caseSensitive = true
* ^experimental = false
* ^status = #active
* insert PCOCodeSystemPublisher
* #helpful-care "Helpful"
* #burdensome-care "Burdensome"
* #willing-to-change "Willing to change"
* #unwilling-to-change "Unwilling to change"

ValueSet: CareTradeOffChoices
Id: pco-care-tradeoff-choices-vs
Title: "Care Trade-off Choices"
Description: "Options for a care trade-off."
* ^experimental = false
* include codes from system CareTradeOffChoiceCodes