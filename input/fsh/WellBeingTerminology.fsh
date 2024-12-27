
CodeSystem: WellBeingConcepts
Id: wellbeing-concepts
Title: "Well-Being Concepts"
Description: "Code system to identify resource codes and category domains for \"What Matters\"."
* ^caseSensitive = true
* ^experimental = false
* ^status = #active
* insert PCOCodeSystemPublisher
* #wellbeing-vision "Well-Being Vision"
    "A peron's vision for well-being"
* #wellbeing-priority "Well-Being Priority"
    "Priority for one area of well-being"
* #wellbeing-focus-area "Well-Being Focus Area"
    "Priority for one area of well-being"
* #wellbeing-statement "Well-Being Statement"
    "Statement about one area of well-being"
* #wellbeing-assessment "Well-Being Assessment"
    "Assessment rating about one area of well-being"
* #now-rating "Now Rating"
    "Where are you now?"
* #now-reasons "Now Reasons"
    "What are the reasons you chose this number?"
* #future-rating "Future Rating"
    "Where would you like to be?"
* #future-changes "Future Changes"
    "What changes could you make to help you get there?"

ValueSet: WellBeingPriorityOrFocusValueSet
Id: wellbeing-priority-focus-vs
Title: "Well-Being Priority Or Focus"
Description: "Value set containing well-being concepts for priority or focus area."
* ^experimental = false
* WellBeingConcepts#wellbeing-priority "Well-Being Priority"
* WellBeingConcepts#wellbeing-focus-area "Well-Being Focus Area"

CodeSystem: VAWholeHealthExample
Id: va-whole-health-example
Title: "VA Whole Health Concepts"
Description: "Code system to identify \"What Matters\" concepts from the VA Whole Health appraoch and Circle of Health."
* ^caseSensitive = true
* ^experimental = false
* ^status = #active
* insert PCOCodeSystemPublisher
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

ValueSet: WellBeingDomainValueSet
Id: wellbeing-domains-example-vs
Title: "Well-Being Domains Example"
Description: "Example value set containing well-being domains from the VA Circle of Health."
* ^experimental = false
// Cannot use "include codes" because cqframework -EnsureExecutableValueSet does not support this expansion
// * include codes from system VAWholeHealthExample
* VAWholeHealthExample#body "Moving the Body"
* VAWholeHealthExample#mind "Power of the Mind"
* VAWholeHealthExample#nourishment "Food & Drink"
* VAWholeHealthExample#recharge "Recharge"
* VAWholeHealthExample#surroundings "Surroundings"
* VAWholeHealthExample#personal-development "Personal Development"
* VAWholeHealthExample#spirit-and-soul "Spirit & Soul"
* VAWholeHealthExample#relationships "Family, Friends & Co-Workers"
* VAWholeHealthExample#professional-care "Professional Care"
