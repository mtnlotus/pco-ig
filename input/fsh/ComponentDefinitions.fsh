
Alias: $compliesWithProfile = http://hl7.org/fhir/StructureDefinition/structuredefinition-compliesWithProfile

RuleSet: QuantityPercent
* value[x] only Quantity
* valueQuantity 1..1 MS
* valueQuantity = '%' "%"
  * ^short = "Value as a percentage"
