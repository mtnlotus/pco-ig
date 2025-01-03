
Profile: PCOCareTradeOff
Parent: USCoreSimpleObservationProfile
Id: pco-care-tradeoff
Title: "Care Trade-off Assessment"
Description: "Assessment observation about a care trade-off that is helpful or burdensome (difficult, uncomfortable, or unhelpful)."
// Satisfies US Core required binding for category
* category[us-core] 1..1 MS
* category[us-core] = OBSCAT#survey

// Cannot override preferred binding with example binding; LOINC is preferred.
// If #other, then use text element for free-text
* code from PPCCareTradeOffValueSet (preferred)
  * ^short = "Type of care trade-off"
* focus 0..* MS
* focus only Reference(Goal or MedicationRequest or ServiceRequest or Procedure)
  * ^short = "The goal, medication and/or procedure that has this trade-off"
* note 0..* MS

// TODO: how to specify text-entered medication name?

* value[x] 1..1 MS
* value[x] only CodeableConcept
* valueCodeableConcept from CareTradeOffChoicesValueSet (required)
  * ^short = "Indicates whether this care is helpful or bothersome"

CodeSystem: CareTradeOffChoices
Id: pco-care-tradeoff-choices
Title: "Care Trade-off Choices"
Description: "Code system to identify care trade-off choices."
* ^caseSensitive = true
* ^experimental = false
* ^status = #active
* insert PCOCodeSystemPublisher
* #helpful "Helpful"
* #bothersome "Bothersome"
* #unspecified "Unspecified"

ValueSet: CareTradeOffChoicesValueSet
Id: pco-care-tradeoff-choices-valueset
Title: "Care Trade-off Choices ValueSet"
Description: "Example value set containing options for a care trade-off."
* ^experimental = false
// Cannot use "include codes" because cqframework -EnsureExecutableValueSet does not support this expansion
* include codes from system CareTradeOffChoices