
CodeSystem: PCOGoalDomainCodesExample
Id: pco-goal-domain-codes-example
Title: "Goal Domain Code Examples"
Description: "Example code system to identify the domain of a PCO Goal."
* ^caseSensitive = true
* ^experimental = false
* ^status = #active
* #housing "Housing"
* #access-to-services "Access To Services"
* #caregiver-needs "Caregiver Needs"
* #end-of-life "End Of Life"
* #independence "Independence"
* #legal "Legal"
* #managing-conditions "Managing Conditions"
* #medication-management "Medication Management"
* #improving-health-and-wellness "Improving Health And Wellness"
* #physical-function "Physical Function"
* #social-functioning "Social Functioning"
* #emotional-and-mental-health "Emotional And Mental Health"

ValueSet: PCOGoalDomainsExample
Id: pco-goal-domains-example
Title: "Goal Domains"
Description: "Example value set to identify the domain of a PCO Goal."
* include codes from system PCOGoalDomainCodesExample
