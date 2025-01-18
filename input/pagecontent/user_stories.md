
### Person completes assessment of What Matters Most

Dorothy uses a dedicated mobile app that presents a list of several areas for health & well-being where she can think about What Matters Most to her. She can assign two ratings to each area: 1) Where am I now? and 2) Where would I like to be?  Dorothy rates each question on a scale of 1 to 10, where 1 is "low" and 10 is "high". She can then select one or two areas as her current focus for creating person-centered goals and action steps, and for tracking progress toward her desired outcomes. Dorothy also works with her health & wellness coach and her primary care physician to create a care plan that helps mitigate barriers and achieve her goals.

Many alternative tools have been developed and are in use that enable individuals to reflect on What Matters Most for their health & well-being. One example is the U.S. Department of Veterns Affairs [Whole Health appoach to care](https://va.gov/wholehealth) that includes a [Circle of Health](https://www.va.gov/WHOLEHEALTH/circle-of-health/index.asp) and [Personal Health Inventory](https://www.va.gov/WHOLEHEALTH/docs/PHI_Jan2022_Final_508.pdf). The examples in this FHIR IG are based on VA's approach, but can be adapted to other asseessments used by different organizations.

**☛ See [Profile: Well-Being Assessment](StructureDefinition-pco-well-being-assessment.html#profile)**

**☛ See [Example: Assessment Observation](Observation-pcoWhatMattersRelationshipsExample.html#root)**

### Person works with health coach to create goals and action steps

Dorothy is working with her health & wellness coach to identify priorities for what matters most to her and to create achievable goals and action steps. Her coach reviews Dorothy's responses to the What Matters Most assessment and guides her to define a goal for one of her focus areas to improve her physical health and social relationships by walking her dog. The health coach role also may be performed by Dorothy's primary care physician or others on her care team.

#### Goals using Goal Attainment Scaling (GAS)
This goal includes five levels of achievement that can be used to evaluate Dorothy's progress over time. The quantified attainment score observations record outcomes and support digital quality measures by her healthcare providers. This example illustrates use of goal attainment scaling for the goal of walking a dog. The definition of success for each point of the scale is defined beforehand and stored as interoperable extensions in a FHIR Goal resource.

🎯 Goal: *Walk Dog Outside Once a Week*

| Much Less Than <br>Expected (-2)  | Less Than Expected <br>(-1)   | Expected Outcome <br>(0)  | Better Than <br>Expected (+1) | Much Better Than <br>Expected (+2) |
| :--------:                    | :--------:                | :--------:            | :--------:                | :--------:                    |
| Unable to go outside <br>with dog | Does not walk dog <br>but goes outside <br>with dog | Walk dog outside <br>once a week | Walk dog outside <br>twice a week | Walk dog outside <br>three times a week |

**☛ See [Profile: Person-Centered Goal using GAS](StructureDefinition-pco-gas-goal-profile.html#profile)**

**☛ See [Example: GAS Goal](Goal-pcoGoalWalkDogExample.html#root)**

#### Goals using Patient-Reported Outcome Measures (PROMs)
Dorothy is working with her primary care provider to manage anxiety related to her complex care needs and Dr. Anderson recommends creating a goal measured by the Generalized Anxiety Disorder (GAS-7) assessment questionnaire. Dr. Anderson sets the goal target to be a GAD-7 score < 6, which indicates mild anxiety.

**☛ See [Profile: Person-Centered Goal using PROM](StructureDefinition-pco-prom-goal-profile.html#profile)**

**☛ See [Example: PROM Goal for Anxiety](Goal-pcoGoalAnxietyExample.html#root)**

### Person or member of care team records goal attainment progress
Dorothy uses a dedicated mobile app that helps her to set priorities, define goals and record goal attainment scores at monthly check-in intervals. Dorothy's health coach, Maria Gonzalez, uses a specialized person-centered care management platform that allows her to share care plan information with Dorothy. Maria used her application to enter goal attainment level details for Dorothy's goals during their shared decision-making session, and both Dorothy and Maria can use their applications to score goal attainment progress from their own perspectives.

If the health coaching role is performed by Dorothy's primary care physician or other member of that provider's organization, they also can use a dedicated SMART on FHIR app launched from within their EHR system to record and view Dorothy's priorities, goals, and progress on outcomes that matter most to her.

#### Track progress using using Goal Attainment Scaling (GAS)
Dorothy's mobile app prompts her once each month to record progress on attainment of her goals. For goals using Goal Attainment Scaling (GAS), the app displays a slider where Dorothy can rate herself using the five pre-defined goal attainment levels. Similarly, Dorothy's health & wellness coach or her primary care doctor can use their PCO apps to rate Dorothy's progress from their perspectives.

**☛ See [Profile: Goal Attainment Scaling (GAS) score by patient](StructureDefinition-pco-gas-score-observation.html#profile)**

**☛ See [Example: GAS score by patient](Observation-pcoGASScorePatientFollowupExample.html#root)**

**☛ See [Example: GAS score by a practitioner](Observation-pcoGASScorePractitionerFollowupExample.html#root)**

#### Track progress using using PROMs
Dorothy's mobile app prompts her to complete the GAD-7 anxiety assessment once each month and shares that Observation with the rest of her care team, where they all can track progress on attainment of Dorothy's PROM goal to achieve a GAD-7 score of less than 6.

**☛ See [Profile: PROM progress score](StructureDefinition-pco-prom-score-observation.html#profile)**

**☛ See [Example: PROM score by patient](Observation-pcoPROMScoreAnxietyExample.html#root)**

### Person or member of care team shares a PCO Data Bundle

If the applications used by Dorothy and her health coach are separate from her provider organization's EHR system, either Dorothy or her health & wellness coach can export and submit a complete bundle of standardized data to share with Dorothy's extended care team in whatever way that the EHR system is able to import those records, including a PDF summary to be added to a clinical note.

This same bundle of person-centered goals, care plans and outcome scores can be submitted to an independent organization that uses these data to compute digital quality measures over a large population of individuals.
