extension Validator on String? {
  String? validateAsEmail() {
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (this != null && !emailRegex.hasMatch(this!)) {
      return "Not a valid email";
    }
    return null;
  }

  String? validateAsPassword() {
    if (this != null) {
      if (this!.length < 8) {
        return 'Password must be of atleast 8 characters';
      }
    }
    return null;
  }

  String? validateSameAsPassword(String? valueTwo) {
    if (this != null && valueTwo != null) {
      if (this != valueTwo) {
        return 'Password must be same';
      }
    }
    return null;
  }

  String? validateAsName() {
    final nameRegex = RegExp(r"^[a-zA-z]+|\s");
    if (this != null && !nameRegex.hasMatch(this!)) {
      return "Please check your name!";
    }
    return null;
  }
}

class Validators {
  static String? validateEmail(String? value) {
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value != null && !emailRegex.hasMatch(value)) {
      return "Not a valid email";
    }
    return null;
  }
}
