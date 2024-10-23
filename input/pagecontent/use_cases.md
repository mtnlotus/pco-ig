
### Identifying What Matters Most

Coming soon!

### Goal Attainment Scaling (GAS)

Coming soon!

### Goals using Patient-Reported Outcome Measures (PROM)

Based in psychometric science, [Patient-Reported Outcome Measures (PROMs)](https://mmshub.cms.gov/sites/default/files/Patient-Reported-Outcome-Measures.pdf) are standardized questionnaires that contain multiple questions, or items, patients answer on their own to generate numerical scores measuring symptoms, function, perceived health status. Two examples of commonly used PROMs are [PHQ-9 quick depression assessment panel](Questionnaire-44249-1.html) and [Generalized Anxiety Disorder (GAD-7)](Questionnaire-69737-5.html).

### PCO Digital Quality Measures (dQM)


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
