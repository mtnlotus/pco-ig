
ValueSet: GASFFollowupScore
Id: gas-followup-score
Title: "Follow-Up GAS Score"
Description: "The follow-up score indicates how a patient, caregiver, or practitioner rated progress on goal attainment scaling."
* ^experimental = false
* $LNC#68490 "Practitioner follow-up goal attainment scaling score"
* $LNC#68491 "Patient follow-up goal attainment scaling score"
* $LNC#68492 "Caregiver follow-up goal attainment scaling score"

ValueSet: GASScoreAnswers
Id: gas-score-answers
Title: "Follow-Up GAS Score Answers"
Description: "The progress rating on goal attainment scaling."
* ^experimental = false
* $LNC#gas-much-better-than-expected "Much better than expected"
* $LNC#gas-better-than-expected "Better than expected"
* $LNC#gas-expected-outcome "Expected outcome"
* $LNC#gas-less-than-expected "Less than expected"
* $LNC#gas-much-less-than-expected "Much less than expected"
