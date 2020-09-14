class Contact {
  int _ID;
  String _firstName;
  String _lastName;
  String _imagePath;
  String _phoneNumber;

  Contact(int ID, String firstName, String lastName, String phoneNumber,
      String imagePath) {
    _ID = ID;
    this._firstName = firstName;
    this._lastName = lastName;
    this._phoneNumber = phoneNumber;
    this._imagePath = imagePath;
  }

  int get ID => _ID;

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
}
