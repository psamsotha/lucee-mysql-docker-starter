/**
 * Person resources
 */
component rest=true restpath="/persons" {

  /**
   * Get a single person resource
   */
  remote function getPerson(required numeric id restargsource="Path")
      restpath="{id}" httpmethod="GET" produces="application/json" {

    var person = EntityLoad('Person', id, true);
    if (isNull(person)) {
      restSetResponse({
        status: 404,
        content: serializeJSON({ message: 'The resource could not be found.' })
      });
      return;
    }
    return person;
  }

  /**
   * Create a person resource
   */
  remote function createPerson(required struct personData)
      httpmethod="POST" consumes="application/json" produces="application/json" {

    if (!isNull(personData.id)) {
      var response = {
        status: 400,
        content: serializeJSON({ "message": "id must not be specified" })
      };
      restSetResponse(response);
      return;
    }

    var person;
    try {
      person = EntityNew('Person');
      person.setFirstName(personData.firstName);
      person.setLastName(personData.lastName);
      EntitySave(person);
    } catch (any e) {
      writeLog(e.message, 'Error');
      restSetResponse({
        status: 500,
        content: serializeJSON({ message: 'Error occured while saving.' })
      })
      return;
    }
    return person;
  }
}
