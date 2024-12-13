/*
 * Terminology used for example bindings in this specification.
*/

CodeSystem: PCOGoalDomains
Id: pco-goal-domains
Title: "PCO Goal Domains"
Description: "Goal domain codes used to identify the category for PCO resources."
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

ValueSet: PCODomainCategoryValueSet
Id: pco-domain-category-valueset
Title: "PCO Domain Categories"
Description: "Example value set to identify the domains category for PCO resources."
* ^experimental = false
// Cannot use "include codes" because cqframework -EnsureExecutableValueSet does not support this expansion
// * include codes from system PCOGoalDomains
* PCOGoalDomains#housing "Housing"
* PCOGoalDomains#access-to-services "Access To Services"
* PCOGoalDomains#caregiver-needs "Caregiver Needs"
* PCOGoalDomains#end-of-life "End Of Life"
* PCOGoalDomains#independence "Independence"
* PCOGoalDomains#legal "Legal"
* PCOGoalDomains#managing-conditions "Managing Conditions"
* PCOGoalDomains#medication-management "Medication Management"
* PCOGoalDomains#improving-health-and-wellness "Improving Health And Wellness"
* PCOGoalDomains#physical-function "Physical Function"
* PCOGoalDomains#social-functioning "Social Functioning"
* PCOGoalDomains#emotional-and-mental-health "Emotional And Mental Health"
