RuleSet: PCOCodeSystemPublisher
* ^publisher = "HL7 International / Patient Care"
* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-wg].valueCode = #pc

RuleSet: LOINCCopyrightNotice
* ^copyright = "This material contains content from LOINC (http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc"

RuleSet: SNOMEDCopyrightNotice
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement. The SNOMED International IPS Terminology is distributed by International Health Terminology Standards Development Organisation, trading as SNOMED International, and is subject the terms of the Creative Commons Attribution 4.0 International Public License. For more information, see SNOMED IPS Terminology. The HL7 International IPS implementation guides incorporate SNOMED CT®, used by permission of the International Health Terminology Standards Development Organisation, trading as SNOMED International. SNOMED CT was originally created by the College of American Pathologists. SNOMED CT is a registered trademark of the International Health Terminology Standards Development Organisation, all rights reserved. Implementers of SNOMED CT should review usage terms or directly contact SNOMED International: info@snomed.org"

CodeSystem: PCOCodes
Id: pco-codes
Title: "Codes for PCO"
Description: "Codes to identify content associated with this IG"
* ^caseSensitive = true
* ^experimental = false
* ^status = #active
* insert PCOCodeSystemPublisher
* #person-centered "Person-Centered"
* #bothersome-health-concern "Bothersome Health Concern"
* #care-trade-off "Care Trade-Off"

ValueSet: PCOSurveyCategoryVS
Title: "Person-Centered Outcomes Survey Value Set"
Id: pco-survey-category-vs
Description: "Used to indicate that PCO observations of of type Survey, as defined by US-Core."
* ^experimental = false
* OBSCAT#survey "Survey"
