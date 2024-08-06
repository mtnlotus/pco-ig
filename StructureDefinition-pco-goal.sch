<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile USCoreGoalProfile
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:Goal</sch:title>
    <sch:rule context="f:Goal">
      <sch:assert test="count(f:extension[@url = 'http://mtnlotus.com/uv/pco/StructureDefinition/pco-goal-attainment-scaling']) &lt;= 5">extension with URL = 'http://mtnlotus.com/uv/pco/StructureDefinition/pco-goal-attainment-scaling': maximum cardinality of 'extension' is 5</sch:assert>
      <sch:assert test="count(f:expressedBy) &gt;= 1">expressedBy: minimum cardinality of 'expressedBy' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
