### Introduction

Person-Centered Outcomes (PCO) focus on setting and achieving specific, personalized goals that prioritize an individual's well-being and "What Matters Most" to each person. Rather than just treating symptoms, this approach involves close collaboration between patients, caregivers, and healthcare providers to identify individual goals related to health outcomes, functional improvement, or symptom management. After goals are established, tailored care plans are developed, incorporating various treatments, therapies, and lifestyle adjustments to meet the individual's needs and preferences. Continual monitoring and adjustment ensure alignment with evolving priorities, fostering patient engagement and satisfaction while enhancing overall healthcare effectiveness.

Goal Attainment Scaling (GAS) in healthcare measures the extent to which individuals achieve specific goals or objectives. It allows for the quantification and evaluation of progress toward individualized goals, particularly in areas where traditional outcome measures may be insufficient. GAS involves collaboratively setting goals with the individual and assigning numerical scales to each goal to represent different levels of achievement. This approach provides a more nuanced and tailored way to assess progress and outcomes, taking into account the unique circumstances and aspirations of the individual.

### User Stories

### Person works with health coach to create goals and action steps

Dorothy is working with her health & wellbeing coach to identify priorities for what matters most to her and to create achievable goals and action steps. Her coach guides Dorothy to define a goal for walking her dog that includes five levels of achievement that can be used to evaluate her progress over time. The quantified attainment score observations record outcomes and support digital quality measures by her healthcare provider. The health coach role also may be performed by Dorothy's primary care physician.

This example illustrates use of goal attainment scaling for the goal of walking a dog. The definition of success for each point of the scale is defined beforehand and stored as interoperable extensions in a FHIR Goal resource.

🎯 Goal: *Walk Dog Outside Once a Week*

| Much Less Than <br>Expected (-2)  | Less Than Expected <br>(-1)   | Expected Outcome <br>(0)  | Better Than <br>Expected (+1) | Much Better Than <br>Expected (+2) |
| :--------:                    | :--------:                | :--------:            | :--------:                | :--------:                    |
| Unable to go outside <br>with dog | Does not walk dog <br>but goes outside <br>with dog | Walk dog outside <br>once a week | Walk dog outside <br>twice a week | Walk dog outside <br>three times a week |

**☛ See [Person-Centered Goal Profile](StructureDefinition-pco-goal.html#profile)**

**☛ See [Example Goal](Goal-pcoGoalWalkDogExample.html#root)**

### Person or member of care team records goal attainment progress

Dorothy uses a dedicated mobile app that helps her to set priorities, define goals and record goal attainment scores at monthly check-in intervals. Dorothy's health coach, Maria Gonzalez, uses a specialized person-centered care management platform that allows her to share care plan information with Dorothy. Maria used her application to enter goal attainment level details for Dorothy's goals during their shared decision-making session, and both Dorothy and Maria can use their applications to score goal attainment progress from their own perspectives.

If the health coaching role is performed by Dorothy's primary care physician or other member of that provider's organization, they also can use a dedicated SMART on FHIR app launched from within their EHR system to record and view Dorothy's priorities, goals, and progress on outcomes that matter most to her.

**☛ See [Goal Attainment Scaling (GAS) score by patient](StructureDefinition-pco-patient-gas-score.html#profile)**

**☛ See [Goal Attainment Scaling (GAS) score by practitioner](StructureDefinition-pco-practitioner-gas-score.html#profile)**

### Person or member of care team shares a PCO Data Bundle

If the applications used by Dorothy and her health coach are separate from her provider organization's EHR system, either Dorothy or Maria can export and submit a complete bundle of standardized data to share with her extended care team in whatever way that the EHR system is able to import those records, including a PDF summary to be added to a clinical note.

This same bundle of person-centered care goals and outcome scores can be submitted to an independent organization that uses these data to compute digital quality measures over a large population of individuals.

### Actors

#### PCO Data Submitter

The data submitter is a software system that collects and manages PCO data. It typically incorporates a patient-facing app, and may also incorporate a clinician-facing EHR-integrated app and a cloud service.

This IG also refers to Data Submitters as "**apps**".

#### PCO Data Receiver

The data receiver is a software system that receives and stores the PCO data submitted by the data submitter.

This IG also refers to Data Receivers as "**EHRs**" or "**PCO management platforms**".

#### PCO Measure Performer

The measure performer is a software system that receives the PCO data and computes digital quality measures for a population of individuals.

### Nominal Workflow

Under development.

### PCO Data Submission: Bundles

*Profile Specification and examples are still under development.*

This section is inspired by a similar data submission bundle in the draft [Argo CCM Write](https://build.fhir.org/ig/HL7/cgm/index.html#cgm-data-submission-bundles) FHIR IG.

**Technical Details**

* PCO Submitters and Receivers SHALL support bundle-based submission, and MAY support individual resource submission
* PCO Receivers MAY choose to store only a subset of resources in a submitted bundle
  * Each entry in the `batch-response` bundle SHALL provide a status code indicating whether the submission was accepted 
  * Accepted entries SHOULD be available for read/search immediately after submission, but MAY be subjected to additional ingestion workflow steps

### Normative vs Informative Content

* Profile and extension definitions in this IG are proposed as **normative** content.
* CQL, Measure, and Questionnaire resources are **informative** resources that support illustrative use cases.

### Package Downloads

{% include cross-version-analysis.xhtml %}
