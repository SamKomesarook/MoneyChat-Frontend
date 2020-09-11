class paypal_container {
  String firstName;
  String lastName;

  //remove imgpath
  String imagePath = "";
  String email;

  // remove
  double balance = 0.00;

  // add address, postcode, suburb, state, country

  paypal_container(firstName, lastName, email, imagePath) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.email = email;
    this.imagePath = imagePath;
  }

  List<String> fetchData() {
    if (imagePath != "") {
      return [imagePath, firstName, lastName, email];
    }
    return [firstName, lastName, email];
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

  bool sendMoney(double amount) {
    if (this.balance - amount >= 0.00) {
      this.balance -= amount;
      return true;
    } else {
      return false;
    }
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
