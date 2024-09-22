
ValueSet: GoalAttainmentScalingScore
Id: goal-attainment-scaling-score
Title: "Goal Attainment Scaling (GAS) Score"
Description: "The score indicates how a patient, caregiver, or practitioner rated progress on goal attainment scaling."
* ^experimental = false
* $LNC#68489 "Goal attainment scale"
* $LNC#68490 "Practitioner follow-up goal attainment scaling score"
* $LNC#68491 "Patient follow-up goal attainment scaling score"
* $LNC#68492 "Caregiver follow-up goal attainment scaling score"

ValueSet: GASScoreAnswers
Id: gas-score-answers
Title: "Follow-Up GAS Score Answers"
Description: "The progress rating on goal attainment scaling."
* ^experimental = false
* $LNC#LA6113-0 "Much better than expected"
* $LNC#LA6112-2 "Better than expected"
* $LNC#LA6111-4 "Expected outcome"
* $LNC#gas-less-than-expected "Less than expected"
* $LNC#gas-much-less-than-expected "Much less than expected"
