/*
 * Terminology examples for Patient Priorities Care (PPC).
*/

CodeSystem: PPCWhatMattersConcepts
Id: ppc-what-matters-concepts
Title: "PPC What Matters Concepts"
Description: "Code system to identify What Matters concepts from Patient Priories Care (PPC)"
* ^caseSensitive = true
* ^experimental = false
* ^status = #active
* insert PCOCodeSystemPublisher
* #ppc-wm-1 "Other"
* #ppc-wm-2 "Doing activities with family and friends"
* #ppc-wm-3 "Walking or moving inside and outside of my home"
* #ppc-wm-4 "Taking care of family and friends and/or pets in my life"
* #ppc-wm-5 "Comfort and function are more important than living longer"
* #ppc-wm-6 "Activities that support my religious or spiritual life"
* #ppc-wm-7 "Living as long as possible even if I am unable to do the things that are most important to me"
* #ppc-wm-8 "Doing productive work (e.g. a job or volunteering)"
* #ppc-wm-9 "Living as long as possible, even if that means more treatments, pain, or discomfort"
* #ppc-wm-10 "Eating food I enjoy"
* #ppc-wm-11 "Reducing the amount of time I devote to health care"
* #ppc-wm-12 "Taking care of myself"
* #ppc-wm-13 "Avoiding spending time in the hospital"
* #ppc-wm-14 "Living at home"
* #ppc-wm-15 "Taking care of my home"

ValueSet: PPCWhatMattersExample
Id: ppc-what-matters-example-vs
Title: "PPC What Matters Example ValueSet"
Description: "Example value set containing types of What Matters."
* ^experimental = false
* include codes from system PPCWhatMattersConcepts

CodeSystem: BothersomeHealthConcernConcepts
Id: pco-bothersome-health-concern-concepts
Title: "Bothersome Health Concern Concepts"
Description: "Code system to identify bothersome symptoms or health concerns.."
* ^caseSensitive = true
* ^experimental = false
* ^status = #active
* insert PCOCodeSystemPublisher
* #other "Other"
* #muscle-weakness "Feeling muscle weakness"
* #pain "Feeling pain"
* #unsteady "Feeling unsteady; trouble balancing/walking"
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