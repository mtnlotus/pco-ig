CodeSystem: PCOCodes
Id: pco-codes
Title: "Codes for PCO"
Description: "Codes to identify content associated with this IG"
* ^caseSensitive = true
* ^experimental = false
* ^status = #active
* #person-centered "Person-Centered"
* #person-centered-goal "Person-Centered Goal"
* #pco-data-submission-bundle "PCO Bundle"
* #pco-data-submission-standing-order "PCO Submission Standing Order"

// Not used at this time
/*
ValueSet: PCOCategoryValueSet
Title: "Person-Centered Goal Category Value Set"
Id: pco-category-vs
Description: "Used to categorize resources as being a Person-Centered Goal"
* ^experimental = false
* PCOCodes#person-centered-goal "Person-Centered Goal"

ValueSet: PCOSurveyCategoryVS
Title: "Person-Centered Outcomes Survey Value Set"
Id: pco-survey-category-vs
Description: "Used to indicate that PCO observations of of type Survey, as defined by US-Core."
* ^experimental = false
* OBSCAT#survey "Survey"

*/