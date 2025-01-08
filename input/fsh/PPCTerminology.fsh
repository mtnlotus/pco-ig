/*
 * Terminology examples for Patient Priorities Care (PPC).
*/

// 
RuleSet: MyHealthPrioritiesCopyrightNotice
* ^copyright = "© Copyright 2024+ Mary Tinetti and Aanand Naik. All rights reserved. Licensed under CC BY 4.0"

CodeSystem: PPCWhatMattersConcepts
Id: ppc-what-matters-concepts
Title: "PPC What Matters Concepts"
Description: "Code system to identify What Matters concepts from Patient Priories Care (PPC)"
* ^caseSensitive = true
* ^experimental = false
* ^status = #active
* insert PCOCodeSystemPublisher
* insert MyHealthPrioritiesCopyrightNotice
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


CodeSystem: PPCBothersomeHealthConcernConcepts
Id: ppc-bothersome-health-concern-concepts
Title: "Bothersome Health Concern Concepts"
Description: "Code system to identify bothersome symptoms or health concerns.."
* ^caseSensitive = true
* ^experimental = false
* ^status = #active
* insert PCOCodeSystemPublisher
* insert MyHealthPrioritiesCopyrightNotice
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

ValueSet: PPCBothersomeHealthConcernExamples
Id: ppc-bothersome-health-concern-examples-vs
Title: "Bothersome Health Concern Example ValueSet"
Description: "Example value set containing types of bothersome symptoms or health concerns."
* ^experimental = false
* include codes from system PPCBothersomeHealthConcernConcepts

// TODO: add a ConceptMap to LOINC for bothersome health concerns


CodeSystem: PPCCareTradeOffConcepts
Id: ppc-care-tradeoff-concepts
Title: "Care Trade-off Concepts"
Description: "Code system to identify care trade-off concepts."
* ^caseSensitive = true
* ^experimental = false
* ^status = #active
* ^hierarchyMeaning = #is-a
* insert PCOCodeSystemPublisher
* insert MyHealthPrioritiesCopyrightNotice
* #medications "Medications"
* #self-care-tasks "Self-care tasks"
  * #diet "Following a special diet"
  * #exercise "Exercising"
  * #checking-vitals "Checking health signs (e.g., weight, blood pressure)"
  * #checking-blood-sugar "Checking blood sugar"
  * #wearing-cpap-mask "Wearing CPAP mask"
  * #wearing-oxygen "Wearing oxygen"
  * #using-cane-or-walker "Using a cane or walker"
* #treatments-procedures "Tests, treatments, and procedures"
  * #dialysis "Doing Dialysis"
  * #chemotherapy "Doing Chemotherapy"
  * #radiation "Going through Radiation"
  * #blood-tests "Having Blood Tests done"
  * #x-rays "Having X-Rays done"
  * #other-diagnostic-tests "Going through other Diagnostic Tests (e.g. mammography)"
  * #surgeries "Having Surgeries"
  * #other-procedures "Having other procedures done (e.g. colonoscopy)"
* #health-care-visits "Health Care visits"
  * #pcp "Visiting PCP primary clinician"
  * #specialists "Visiting specialists (e.g., cardiologist, pulmonologist, urologist)"
  * #counselor "Visiting counselor (e.g., psychologist, social worker, therapist)"
  * #rehabilitation "Doing rehabilitation (e.g., physical therapy, cardio rehabilitation)"
* #community-services "Community programs, services and supports"
  * #in-home-help "In-home help"
  * #transportation "Transportation"
  * #meal-delivery "Meal delivery"
  * #community-based-program "Community-based program"
* #other "Other"

ValueSet: PPCCareTradeOffExamples
Id: ppc-care-tradeoff-examples-vs
Title: "Care Trade-off Examples"
Description: "Example value set containing types of care trade-off."
* ^experimental = false
* include codes from system PPCCareTradeOffConcepts
