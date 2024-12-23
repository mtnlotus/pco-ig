
Profile: CareTradeOff
Parent: USCoreSimpleObservationProfile
Id: pco-care-tradeoff
Title: "Care Trade-off Assessment"
Description: "Assessment observation about a care trade-off that is helpful or burdensome (difficult, uncomfortable, or unhelpful)."
* extension contains
      PertainsToGoalExtension named pertainsToGoal 0..1 MS
* extension[pertainsToGoal] ^short = "The goal that has this trade-off"
// Satisfies US Core required binding for category
* category[us-core] 1..1 MS
* category[us-core] = OBSCAT#survey

// Cannot override preferred binding with example binding; LOINC is preferred.
// If #other, then use text element for free-text
* code from CareTradeOffValueSet (preferred)
  * ^short = "Type of care trade-off"
* focus 0..* MS
* focus only Reference(MedicationRequest or Procedure)
  * ^short = "The medication or procedure that has this trade-off"

// TODO: how to specify text-entered medication name?

* value[x] 1..1 MS
* value[x] only CodeableConcept
* valueCodeableConcept from CareTradeOffChoicesValueSet (required)
  * ^short = "Indicates whether this care is helpful or bothersome"


CodeSystem: CareTradeOffConcepts
Id: pco-care-tradeoff-concepts
Title: "Care Trade-off Concepts"
Description: "Code system to identify care trade-off concepts."
* ^caseSensitive = true
* ^experimental = false
* ^status = #active
* #medications "Medications"
* #self-care-tasks "Self-care tasks"
  * #diet "Following a special diet"
  * #exercise "Exercising"
  * #checking-vitals "Checking health signs (e.g., weight, blood pressure)"
  * #checking-blood-sugar "Checking blood sugar"
  * #wearing-cpap-mask "Wearing CPAP mask"
  * #wearing-oxygen "Wearing oxygen"
  * #using-cane-or-walker "Using a cane or walker"
  * #other "Other"
* #tests-and-procedures "Tests, treatments, and procedures"
* #health-care-visits "Health Care visits"
* #community-services "Community programs, services and supports"

ValueSet: CareTradeOffValueSet
Id: pco-care-tradeoff-valueset
Title: "Care Trade-off Example ValueSet"
Description: "Example value set containing types of care trade-off."
* ^experimental = false
// Cannot use "include codes" because cqframework -EnsureExecutableValueSet does not support this expansion
* include codes from system CareTradeOffConcepts

CodeSystem: CareTradeOffChoices
Id: pco-care-tradeoff-choices
Title: "Care Trade-off Choices"
Description: "Code system to identify care trade-off choices."
* ^caseSensitive = true
* ^experimental = false
* ^status = #active
* #helpful "Helpful"
* #bothersome "Bothersome"

ValueSet: CareTradeOffChoicesValueSet
Id: pco-care-tradeoff-choices-valueset
Title: "Care Trade-off Choices ValueSet"
Description: "Example value set containing options for a care trade-off."
* ^experimental = false
// Cannot use "include codes" because cqframework -EnsureExecutableValueSet does not support this expansion
* include codes from system CareTradeOffChoices