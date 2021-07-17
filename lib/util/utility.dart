class Utility {
  static bool isValidEmail(String email) {
    bool isEmailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    return isEmailValid;
  }

  static bool isValidPassword(String password) {
    return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$').hasMatch(password);
  }

  static bool isValidName(String name) {
    return RegExp(r'^[a-zA-z]+([\s][a-zA-Z]+)+$').hasMatch(name);
  }
}
