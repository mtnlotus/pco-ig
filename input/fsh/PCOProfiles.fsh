
RuleSet: PCOCategory
* category MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* category contains
    pcoCategory 0..1 MS
* category[pcoCategory] from PCOCategoryValueSet (required)
  * ^short = "Person-Centered Goal category"

RuleSet: PCODomainCategory
* category MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* category contains
    domainCategory 0..* MS
* category[domainCategory] from PCODomainCategoryValueSet (preferred)
  * ^short = "Person-Centered Outcome domain category"
// Include same binding description as in US Core profiles.
* category[domainCategory]
  * ^binding.description = "Note that other codes are permitted, see [Required Bindings When Slicing by Value Sets](http://hl7.org/fhir/us/core/general-requirements.html#required-bindings-when-slicing-by-valuesets)"

RuleSet: PCOSurveyCategory
* category MS
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category ^requirements = "To identify that observation is derived from a questionnaire or other assessment instrument."
* category contains
	  survey 1..1 MS
* category[survey] from PCOSurveyCategoryVS (required)
* category[survey] ^requirements = "Indicates the person-centered outcomes observation is of type survey"
* category[survey]
  * ^binding.description = "Include 'survey' category to facilitate searching for this Observation as a kind of Assessment"

Profile: PCOGoalProfile
Parent: USCoreGoalProfile
Id: pco-goal-profile
Title: "Person-Centered Goal"
Description: "Person-centered goal focused on what matters most to an individual. A Person-centered goal SHALL include either a Person-Centered Outcome category, or address a What Matters assessment."
* insert PCOCategory
* insert PCODomainCategory
* expressedBy 0..1 MS
* expressedBy only Reference(USCorePatientProfile or USCorePractitionerProfile or USCoreRelatedPersonProfile)
* start[x] 1..1 MS
* start[x] only date
* addresses only Reference(Condition or Observation or RiskAssessment)
* addresses ^slicing.discriminator.type = #profile
* addresses ^slicing.discriminator.path = "resolve()"
* addresses ^slicing.rules = #open
* addresses contains SupportedAddresses 0..* MS
* addresses[SupportedAddresses] only Reference(WhatMattersAssessment or WhatMattersStatement)
  * ^short = "What Matters Assessment or Statement"
  * ^requirements = "When a goal addresses PCO what matters most observations, Goal.addresses should reference instances that comply with the PCO What Matters Assessment profiles. However, references to other instance types are also possible."

// TODO: add a constraint that either Goal.category from PCOCategory or Goal.addresses WhatMattersAssessment SHALL be present

Profile: PCOCarePlan
Parent: USCoreCarePlanProfile
Id: pco-care-plan
Title: "Person-Centered Care Plan"
Description: "A person-centered care plan SHALL reference a person-centered goal and SHALL include action steps that support progress toward achievement of the plan's goals and desired outcomes. A plan SHOULD address the person's stated priorities for what matters most to them. Action steps may include both treatment procedures and self-care steps identified by the person."
* goal 1..* MS
* goal ^slicing.discriminator.type = #profile
* goal ^slicing.discriminator.path = "resolve()"
* goal ^slicing.rules = #open
* goal contains SupportedGoals 1..* MS
* goal[SupportedGoals] only Reference(PCOGoalProfile)
  * ^short = "Person-centered goals supported by this plan"
* activity.detail 0..0
  * ^short = "Removed in FHIR R5"
* activity 1..*
* activity.reference 1..1 MS
  * ^short = "Action steps for person-centered goals"
