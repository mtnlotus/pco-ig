
Profile: BothersomeHealthConcern
Parent: USCoreSimpleObservationProfile
Id: pco-bothersome-health-concern
Title: "Bothersome Health Concern"
Description: "Assessment observation about a bothersome symptom or health concern."
* extension contains
      PertainsToGoalExtension named pertainsToGoal 0..1 MS
* extension[pertainsToGoal] ^short = "The goal that has this bothersome concern"
// Satisfies US Core required binding for category
* category[us-core] 1..1 MS
* category[us-core] = OBSCAT#survey

// Cannot override preferred binding with example binding; LOINC is preferred.
// If #other, then use text element for free-text
* code from BothersomeHealthConcernValueSet (preferred)
  * ^short = "Type of bothersome concern"
* focus 0..* MS
* focus only Reference(Condition)
  * ^short = "Bothersome symptom or health concern"
* value[x] 1..1 MS
* value[x] only boolean
  * ^short = "Indicates if the focus condition is currently bothersome"


CodeSystem: BothersomeHealthConcernConcepts
Id: pco-bothersome-health-concern-concepts
Title: "Bothersome Health Concern Concepts"
Description: "Code system to identify bothersome symptoms or health concerns.."
* ^caseSensitive = true
* ^experimental = false
* ^status = #active
* #other "Other"
* #muscle-weakness "Feeling muscle weakness"
* #pain "Feeling pain"
* #medications "Feeling unsteady; trouble balancing/walking"
* #worried-nervous-anxious "Feeling worried, nervous, anxious"
* #sad "Feeling sad"
* #irritable "Feeling irritable"
* #adverse-effects "Feeling adverse effects from treatment(s)"
* #dizzy "Feeling dizzy"
* #tired-lacking-energy "Feeling tired/lacking energy"
* #touble-sleeping "Having trouble sleeping"
* #poor-eyesight "Having poor eyesight"
* #poor-hearing "Having poor hearing"
* #leg-swelling "Having leg swelling"
* #trouble-breathing "Having trouble breathing (short of breath)"
* #healthcare-tasks-take-too-much-time "Having health care tasks take too much time"
* #urinary-incontinence "Having urinary incontinence"
* #bathroom-often "Having to go to the bathroom often"
* #diarrhea "Having diarrhea"
* #constipation "Having constipation"
* #upset-stomach-nausea "Having upset stomach, nausea"
* #memory-problems "Having confusing or memory problems"
* #problem-list-item "Problem List Item"

ValueSet: BothersomeHealthConcernValueSet
Id: pco-bothersome-health-concern-valueset
Title: "Bothersome Health Concern Example ValueSet"
Description: "Example value set containing types of bothersome symptoms or health concerns."
* ^experimental = false
// Cannot use "include codes" because cqframework -EnsureExecutableValueSet does not support this expansion
* include codes from system BothersomeHealthConcernConcepts

// TODO: add a ConceptMap to LOINC