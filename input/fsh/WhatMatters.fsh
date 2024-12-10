Profile: WhatMattersPriority
Parent: USCoreSimpleObservationProfile
Id: pco-what-matters-priority
Title: "What Matters Priority Flag"
Description: "Assessment observation for one aspect of What Matters Most to a person, with a boolean value indicating whether this is a current priority."
* insert PCOSurveyCategory
// Must have preferred binding because parent profile has a preferred binding.
* code from WhatMattersFocusAreas (preferred)
  * ^short = "Focus area for What Matters assessment"
* value[x] 1..1 MS
* value[x] only boolean
  * ^short = "Indicates if focus area is a current priority"

Profile: WhatMattersStatement
Parent: USCoreSimpleObservationProfile
Id: pco-what-matters-statement
Title: "What Matters Statement"
Description: "Assessment observation for one aspect of What Matters Most to a person, with a text statement about a focus area."
* insert PCOSurveyCategory
* code from WhatMattersFocusAreas (preferred)
  * ^short = "Focus area for What Matters assessment"
* value[x] 1..1 MS
* value[x] only string
  * ^short = "Description of what matters for this focus area"

Profile: WhatMattersAssessment
Parent: USCoreSimpleObservationProfile
Id: pco-what-matters-assessment
Title: "What Matters Assessment"
Description: "Assessment observation for one aspect of What Matters Most to a person, with component values rating where a person is now and where they would like to be in the future."
* insert PCOSurveyCategory
* code from WhatMattersFocusAreas (preferred)
  * ^short = "Focus area for What Matters assessment"
* component
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "code"
  * ^slicing.rules = #open
* component contains
    nowRating 0..1 MS and
    nowReasons 0..1 MS and
    futureRating 0..1 MS and
    futureChanges 0..1 MS
  * ^short = "Components representing What Matters rating"
* component[nowRating]
  * code = WhatMattersRating#now-rating
    * ^short = "Where are you now?"
  * insert RatingValueInteger
* component[nowReasons]
  * code = WhatMattersRating#now-reasons
    * ^short = "What are the reasons you chose this number?"
  * insert RatingValueString
* component[futureRating]
  * code = WhatMattersRating#future-rating
    * ^short = "Where would you like to be?"
  * insert RatingValueInteger
* component[futureChanges]
  * code = WhatMattersRating#future-changes
    * ^short = "What changes could you make to help you get there?"
  * insert RatingValueString

RuleSet: RatingValueInteger
* value[x] 1..1 MS
* value[x] only integer
  * ^short = "Rating on scale from low to high"

RuleSet: RatingValueString
* value[x] 1..1 MS
* value[x] only string
  * ^short = "Reasons for your rating"

CodeSystem: WhatMattersRating
Id: what-matters-rating
Title: "What Matters Rating Concepts"
Description: "Code system to identify \"What Matters\" rating concepts."
* ^caseSensitive = true
* ^experimental = false
* ^status = #active
* #now-rating "Now Rating"
    "Where are you now?"
* #now-reasons "Now Reasons"
    "What are the reasons you chose this number?"
* #future-rating "Future Rating"
    "Where would you like to be?"
* #future-changes "Future Changes"
    "What changes could you make to help you get there?"

CodeSystem: VAWholeHealth
Id: va-whole-health
Title: "VA Whole Health Concepts"
Description: "Code system to identify \"What Matters\" concepts from the VA Whole Health appraoch and Circle of Health."
* ^caseSensitive = true
* ^experimental = false
* ^status = #active
* #body "Moving the Body"
    "Our physical, mental, and emotional health are impacted by the amount and kind of movement we do. Moving the body can take many forms such as dancing, walking, gardening, yoga, and exercise."
* #mind "Power of the Mind"
    "Our thoughts are powerful and can affect our physical, mental, and emotional health. Changing our mindset can aid in healing and coping. Breathing techniques, guided imagery, Tai Chi, yoga, or gratitude can buffer the impact of stress and other emotions."
* #nourishment "Food & Drink"
    "What we eat and drink can have a huge effect on how we experience life, both physically and mentally. Energy, mood, weight, how long we live, and overall health are all impacted by what and how we choose to eat and drink."
* #recharge "Recharge"
    "Our bodies and minds must rest and recharge in order to optimize our health. Getting a good night's rest, as well as recharging our mental and physical energy throughout the day, are vital to well-being. Taking short breaks or doing something you enjoy or feels good for moments throughout the day are examples of ways to refresh."
* #surroundings "Surroundings"
    "Our surroundings, both at work and where we live, indoors and out, can affect our health and outlook on life. Changes within our control such as organizing, decluttering, adding a plant or artwork can improve mood and health."
* #personal-development "Personal Development"
    "Our health is impacted by how we choose to spend our time. Aligning our work and personal activities with what really matters to us, or what brings us joy, can have a big effect on our health and outlook on life."
* #spirit-and-soul "Spirit & Soul"
    "Connecting with something greater than ourselves may provide a sense of meaning and purpose, peace, or comfort. Connecting and aligning spiritually is very individual and may take the form of religious affiliation, connection to nature, or engaging in things like music or art."
* #relationships "Family, Friends & Co-Workers"
    "Our relationships, including those with pets, have as significant an effect on our physical and emotional health as any other factor associated with well-being. Spending more time in relationships that \"fuel\" us and less in relationships that \"drain\" us is one potential option. Improving our relationship skills or creating new relationships through community activities are other options to consider."
* #professional-care "Professional Care"
    "Staying up to date on prevention and understanding your health concerns, care options, treatment plan, and their role in your health."

/*
 * TODO: ConceptMap between VAWholeHealth amd PCOGoalDomains.
*/

ValueSet: WhatMattersFocusAreas
Id: what-matters-focus-areas
Title: "What Matters Focus Areas"
Description: "Example value set to identify focus areas from the VA Circle of Health. Whole Health is VA's approach to care that supports your health and well-being. Whole Health centers around What Matters to you, not what is the matter with you. This means your health team will get to know you as a person, before working with you to develop a personalized health plan based on your values, needs, and goals."
* ^experimental = false
// Cannot use "include codes" because cqframework -EnsureExecutableValueSet does not support this expansion
// * include codes from system VAWholeHealth
* VAWholeHealth#body "Moving the Body"
* VAWholeHealth#mind "Power of the Mind"
* VAWholeHealth#nourishment "Food & Drink"
* VAWholeHealth#recharge "Recharge"
* VAWholeHealth#surroundings "Surroundings"
* VAWholeHealth#personal-development "Personal Development"
* VAWholeHealth#spirit-and-soul "Spirit & Soul"
* VAWholeHealth#relationships "Family, Friends & Co-Workers"
* VAWholeHealth#professional-care "Professional Care"
