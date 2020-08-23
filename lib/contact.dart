class Contact {
  String firstName;
  String lastName;
  String imagePath = "";
  String googleAccount;

  Contact(firstName, lastName, googleAccount) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.googleAccount = googleAccount;
  }

  List<String> fetchContact() {
    if (imagePath != "") {
      return [imagePath, firstName, lastName, googleAccount];
    }
    return [firstName, lastName, googleAccount];
  }

  void setImagePath(String imgPath) {
    this.imagePath = imgPath;
  }

  void setFirstName(String newFirstName) {
    this.firstName = newFirstName;
  }

  void setLastName(String newLastName) {
    this.lastName = newLastName;
  }

  String getImagePath() {
    return imagePath;
  }

  String getFirstName() {
    return firstName;
  }

  String getLastName() {
    return lastName;
  }
}
