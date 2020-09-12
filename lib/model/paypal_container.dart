class paypal_container {
  String firstName;
  String lastName;

  String email;
  String address;
  String suburb;
  String state;

  String postcode;
  String country;

  // add address, postcode, suburb, state, country

  paypal_container(
      firstName, lastName, email, address, suburb, state, postcode, country) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.email = email;

    this.address = address;
    this.suburb = suburb;
    this.state = state;
    this.postcode = postcode;
    this.country = country;
  }

  List<String> fetchData() {
    return [
      firstName,
      lastName,
      email,
      address,
      suburb,
      state,
      postcode,
      country
    ];
  }

  List<String> getAddress() {
    return [address, suburb, state, postcode, country];
  }

  void setEmail(String email) {
    this.email = email;
  }

  void setAddress(String address) {
    this.address = address;
  }

  void setSuburb(String suburb) {
    this.suburb = suburb;
  }

  void setState(String state) {
    this.state = state;
  }

  void setPostcode(String postcode) {
    this.postcode = postcode;
  }

  void setCountry(String country) {
    this.country = country;
  }

  void setFirstName(String newFirstName) {
    this.firstName = newFirstName;
  }

  void setLastName(String newLastName) {
    this.lastName = newLastName;
  }

  String getFirstName() {
    return firstName;
  }

  String getLastName() {
    return lastName;
  }
}
