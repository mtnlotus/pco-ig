/*
 * Terminology used for example bindings in this specification.
*/

CodeSystem: NCQAGoalDomains
Id: ncqa-goal-domains
Title: "NCQA Goal Domains"
Description: "NCQA goal domain codes used to identify the category for PCO resources."
* ^caseSensitive = true
* ^experimental = false
* ^status = #active
* #housing "Housing"
    "Having acceptable housing that is appropriate for a person's needs."
* #access-to-services "Access To Services"
    "Ability to access, afford, and utilize appropriate health and community resources. Includes access to transportation, stable food resources, and assistance with financial concerns."
* #caregiver-needs "Caregiver Needs"
    ""
* #end-of-life "End Of Life"
    "Planning for end-of-life care and desires to reduce burden on family or others."
* #independence "Independence"
    "Ability to live independently without help or assistance from others."
* #legal "Legal"
    "Having adequate support for legal issues such as child custody, medical power of attorney, etc."
* #managing-conditions "Managing Conditions"
    "Satisfaction with health care received or desired, and experiences with providers and the health care system."
* #medication-management "Medication Management"
    "Satisfaction with ability to manage medications."
* #improving-health-and-wellness "Improving Health And Wellness"
    "Ability to develop, improve and maintain positive health and wellness habits."
* #physical-function "Physical Function"
    "Ability to manage physical functioning, physical symptoms or conditions, and improve or maintain ability to participate in physical activities."
* #social-functioning "Social Functioning"
    ""
* #emotional-and-mental-health "Emotional And Mental Health"
    ""

ValueSet: PCOCategoryValueSet
Id: pco-category-valueset
Title: "PCO Categories"
Description: "Example value set to identify the category for PCO resources."
* ^experimental = false
// Cannot use "include codes" because cqframework -EnsureExecutableValueSet does not support this expansion
// * include codes from system NCQAGoalDomains
* NCQAGoalDomains#housing "Housing"
* NCQAGoalDomains#access-to-services "Access To Services"
* NCQAGoalDomains#caregiver-needs "Caregiver Needs"
* NCQAGoalDomains#end-of-life "End Of Life"
* NCQAGoalDomains#independence "Independence"
* NCQAGoalDomains#legal "Legal"
* NCQAGoalDomains#managing-conditions "Managing Conditions"
* NCQAGoalDomains#medication-management "Medication Management"
* NCQAGoalDomains#improving-health-and-wellness "Improving Health And Wellness"
* NCQAGoalDomains#physical-function "Physical Function"
* NCQAGoalDomains#social-functioning "Social Functioning"
* NCQAGoalDomains#emotional-and-mental-health "Emotional And Mental Health"
* VAWholeHealth#body "Moving the Body"
* VAWholeHealth#mind "Power of the Mind"
* VAWholeHealth#nourishment "Food & Drink"
* VAWholeHealth#recharge "Recharge"
* VAWholeHealth#surroundings "Surroundings"
* VAWholeHealth#personal-development "Personal Development"
* VAWholeHealth#spirit-and-soul "Spirit & Soul"
* VAWholeHealth#relationships "Family, Friends & Co-Workers"
* VAWholeHealth#professional-care "Professional Care"