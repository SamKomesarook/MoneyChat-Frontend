class paypal_container {
  String _firstName;
  String _lastName;

  String _email;
  String _address;
  String _suburb;
  String _state;

  String _postcode;
  String _country;

  // add address, postcode, suburb, state, country

  paypal_container(
      firstName, lastName, email, address, suburb, state, postcode, country) {
    this._firstName = firstName;
    this._lastName = lastName;
    this._email = email;

    this._address = address;
    this._suburb = suburb;
    this._state = state;
    this._postcode = postcode;
    this._country = country;
  }

  List<String> fetchData() {
    return [
      _firstName,
      _lastName,
      _email,
      _address,
      _suburb,
      _state,
      _postcode,
      _country
    ];
  }

  List<String> getAddress() {
    return [_address, _suburb, _state, _postcode, _country];
  }


  set country(String value) {
    _country = value;
  }

  set postcode(String value) {
    _postcode = value;
  }

  set state(String value) {
    _state = value;
  }

  set suburb(String value) {
    _suburb = value;
  }

  set address(String value) {
    _address = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get lastName => _lastName;

  set lastName(String value) {
    _lastName = value;
  }

  String get firstName => _firstName;

  set firstName(String value) {
    _firstName = value;
  }
}
