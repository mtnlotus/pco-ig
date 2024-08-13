
RuleSet: PCOCategory
* category
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* category contains
    pcoCategory 0..* MS
* category[pcoCategory] from PCOCategoryValueSet (preferred)
  * ^short = "Person-Centered Outcome category"

Profile: PCOCarePlan
Parent: USCoreCarePlanProfile
Id: pco-care-plan
Title: "Person-Centered Care Plan"
Description: "A person-centered care plan SHALL reference a person-centered goal and SHALL include action steps that support progress toward achievement of the plan’s goals and desired outcomes. A plan SHOULD address the person’s stated priorities for what matters most to them. Action steps may include both treatment procedures and self-care steps identified by the person."
* insert PCOCategory
* goal 1..* MS
* goal only Reference(PCOGoal)
  * ^short = "Person-centered goals supported by this plan"
* activity.detail 0..0
  * ^short = "Removed in FHIR R5"
* activity 1..*
* activity.reference 1..1 MS
  * ^short = "Action steps for person-centered goals"
