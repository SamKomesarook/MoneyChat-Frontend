class Contact {
  String _firstName;
  String _lastName;
  String _imagePath;
  String _phoneNumber;

  Contact(firstName, lastName, phoneNumber, imagePath) {
    this._firstName = firstName;
    this._lastName = lastName;
    this._phoneNumber = phoneNumber;
    this._imagePath = imagePath;
  }

  List<String> fetchContact() {
    if (_imagePath != "") {
      return [_imagePath, _firstName, _lastName];
    }
    return [_firstName, _lastName];
  }

  String getName() {
    return firstName + ' ' + lastName;
  }

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  String get imagePath => _imagePath;

  set imagePath(String value) {
    _imagePath = value;
  }

  String get lastName => _lastName;

  set lastName(String value) {
    _lastName = value;
  }

  String get firstName => _firstName;

  set firstName(String value) {
    _firstName = value;
  }

//  void setImagePath(String imgPath) {
//    this._imagePath = imgPath;
//  }
//
//  void setFirstName(String newFirstName) {
//    this._firstName = newFirstName;
//  }
//
//  void setLastName(String newLastName) {
//    this._lastName = newLastName;
//  }
//
//  String getImagePath() {
//    return _imagePath;
//  }
//
//  String getFirstName() {
//    return _firstName;
//  }
//
//  String getLastName() {
//    return _lastName;
//  }
}
