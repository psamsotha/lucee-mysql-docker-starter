component accessors=true persistent=true table="Person" {
  property name="id" ormtype="integer" generator="increment";
  property name="firstName" type="string";
  property name="lastName" type="string";


  public string function toString() {
    return 'id=' & getId() & ', firstName=' & getFirstName() & ', lastName=' & getLastName();
  }
}
