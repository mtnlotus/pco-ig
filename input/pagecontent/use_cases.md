
### Identifying What Matters Most

More detail coming soon!

Many alternative tools have been developed and are in use that enable individuals to reflect on What Matters Most for their health & well-being. One example is the U.S. Department of Veterns Affairs [Whole Health appoach to care](https://va.gov/wholehealth) that includes a [Circle of Health](https://www.va.gov/WHOLEHEALTH/circle-of-health/index.asp) and [Personal Health Inventory](https://www.va.gov/WHOLEHEALTH/docs/PHI_Jan2022_Final_508.pdf). The examples in this FHIR IG are based on VA's approach, but can be adapted to other asseessments used by different organizations.

### Goal Attainment Scaling (GAS)

More detail coming soon!

Goal Attainment Scaling (GAS) in healthcare, measures the extent to which individuals achieve specific goals or objectives. It allows for the quantification and evaluation of progress toward individualized goals, particularly in areas where traditional outcome measures may be insufficient. GAS involves collaboratively setting goals with the individual and assigning numerical scales to each goal to represent different levels of achievement. This approach provides a more nuanced and tailored way to assess progress and outcomes, taking into account the unique circumstances and aspirations of the individual.

#### Goals with GAS from real-world NCQA pilot testing

{% include gas-examples.md %}

### Goals using Patient-Reported Outcome Measures (PROM)

More detail coming soon!

Based in psychometric science, [Patient-Reported Outcome Measures (PROMs)](https://mmshub.cms.gov/sites/default/files/Patient-Reported-Outcome-Measures.pdf) are standardized questionnaires that contain multiple questions, or items, patients answer on their own to generate numerical scores measuring symptoms, function, perceived health status. Two examples of commonly used PROMs are [PHQ-9 quick depression assessment panel](Questionnaire-44249-1.html) and [Generalized Anxiety Disorder (GAD-7)](Questionnaire-69737-5.html).

### PCO Digital Quality Measures (dQM)

More detail coming soon!

Examples of PCO dQMs:

#### Measure 1: Goal Identification
% of individuals 18 years of age and older with a complex care need 
who had a PCO goal identified 
resulting in completion of goal attainment scaling (GAS) or a Patient-Reported Outcome Measure (PROM) 
and development of an action plan.

#### Measure 2: Goal Follow-up
% of individuals 18 years of age or older with a complex care need 
who received follow-up on their PCO goal within two weeks to six months of when the PCO goal and GAS or PROM were identified.

#### Measure 3: Goal Achievement
% of individuals 18 years of age or older with a complex care need 
who achieved their PCO goal within two weeks to six months of when the PCO goal and GAS or PROM were identified.


### PCO Data Submission: Bundles

*Profile Specification and examples are still under development.*

This section is inspired by a similar data submission bundle in the draft [Argo CCM Write](https://build.fhir.org/ig/HL7/cgm/index.html#cgm-data-submission-bundles) FHIR IG.

**Technical Details**

* PCO Submitters and Receivers SHALL support bundle-based submission, and MAY support individual resource submission
* PCO Receivers MAY choose to store only a subset of resources in a submitted bundle
  * Each entry in the `batch-response` bundle SHALL provide a status code indicating whether the submission was accepted 
  * Accepted entries SHOULD be available for read/search immediately after submission, but MAY be subjected to additional ingestion workflow steps


### Actors

#### PCO Data Submitter

The data submitter is a software system that collects and manages PCO data. It typically incorporates a patient-facing app, and may also incorporate a clinician-facing EHR-integrated app and a cloud service.

This IG also refers to Data Submitters as "**apps**".

#### PCO Data Receiver

The data receiver is a software system that receives and stores the PCO data submitted by the data submitter.

This IG also refers to Data Receivers as "**EHRs**" or "**PCO management platforms**".

#### PCO Measure Performer

The measure performer is a software system that receives the PCO data and computes digital quality measures for a population of individuals.
