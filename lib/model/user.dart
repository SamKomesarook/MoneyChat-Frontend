import 'contact.dart';
import 'wallet.dart';

class User {
  String _firstName;
  String _lastName;
  String _imgPath;
  Wallet _wallet;
  List<Contact> _contacts;

  User(String firstName, String lastName, String imgPath, Wallet wallet) {
    this._firstName = firstName;
    this._lastName = lastName;
    this._imgPath = imgPath;
    this._wallet = wallet;
    _contacts = new List<Contact>();
    createContacts();
  }

  void createContacts() {
    // Mock Contact List
    _contacts.add(new Contact('Anna', 'Adams', '0123456789',
        'assets/images/profile_pictures/anna_adams.jpeg'));
    _contacts.add(new Contact('Rebecca', 'Ang', '0123456789',
        'assets/images/profile_pictures/rebecca_ang.jpeg'));
    _contacts.add(new Contact('Chris', 'Braden', '0123456789',
        'assets/images/profile_pictures/chris_braden.jpeg'));
    _contacts.add(new Contact('Steph', 'Foster', '0123456789',
        'assets/images/profile_pictures/steph_foster.jpeg'));
    _contacts.add(new Contact('Sarah', 'Fredricks', '0123456789',
        'assets/images/profile_pictures/sarah_fredricks.jpeg'));
    _contacts.add(new Contact('Jessica', 'Harris', '0123456789',
        'assets/images/profile_pictures/jessica_harris.jpeg'));
    _contacts.add(new Contact('Paul', 'Lee', '0123456789',
        'assets/images/profile_pictures/paul_lee.jpeg'));
    _contacts.add(new Contact('Vivian', 'Morrison', '0123456789',
        'assets/images/profile_pictures/vivian_morrison.jpeg'));
    _contacts.add(new Contact('Jordan', 'Rogers', '0123456789',
        'assets/images/profile_pictures/jordan_rogers.jpeg'));
    _contacts.add(new Contact('Brett', 'Stevens', '0123456789',
        'assets/images/profile_pictures/brett_stevens.jpeg'));
  }

  String get imgPath => _imgPath;

  set imgPath(String value) {
    _imgPath = value;
  }

  String get lastName => _lastName;

  set lastName(String value) {
    _lastName = value;
  }

  String get firstName => _firstName;

  set firstName(String value) {
    _firstName = value;
  }

  Wallet get wallet => _wallet;

  set wallet(Wallet value) {
    _wallet = value;
  }

  List<Contact> get contacts => _contacts;

  set contacts(List<Contact> value) {
    _contacts = value;
  }
}
