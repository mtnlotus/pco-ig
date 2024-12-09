
Instance: pcoWhatMattersBodyExample
InstanceOf: WhatMattersAssessment
Title: "What Matters: Moving the Body"
Description: "What Matters assessment observation recorded by a Patient as preparation for creating PCO goals and CarePlan action steps."
Usage: #example
* status = #final 
* category[survey] = OBSCAT#survey "Survey"
* subject = Reference(pcoPatientJones)
* performer = Reference(pcoPatientJones)
* effectiveDateTime = "2024-03-27T15:10:00Z"
* code = VAWholeHealth#body "Moving the Body"
* component[nowRating].valueInteger = 2
* component[nowReasons].valueString = "My knee pain prevents me from walking."
* component[futureRating].valueInteger = 7

Instance: pcoWhatMattersRelationshipsExample
InstanceOf: WhatMattersAssessment
Title: "What Matters: Family & Friends"
Description: "What Matters assessment observation recorded by a Patient as preparation for creating PCO goals and CarePlan action steps."
Usage: #example
* category[survey] = OBSCAT#survey "Survey"
* status = #final 
* subject = Reference(pcoPatientJones)
* performer = Reference(pcoPatientJones)
* effectiveDateTime = "2024-03-27T15:20:00Z"
* code = VAWholeHealth#relationships "Family, Friends & Co-Workers"
* component[nowRating].valueInteger = 3
* component[nowReasons].valueString = "I am still recovering from isolation during COVID and now physical difficulty leaving my home."
* component[futureRating].valueInteger = 9
* component[futureChanges].valueString = "I want to walk outside and visit friends in the park."
