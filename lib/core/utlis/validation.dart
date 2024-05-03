
class RegistrationValidator {
  // String? validateUserName(String? value) {
  //   if ((value?.toLowerCase().startsWith("a") ?? false) &&
  //       (value?.length ?? 0) > 4) {
  //     return null;
  //   } else {
  //     return "Invalid name";
  //   }

  // }

String? validateUserName(String? value) {
  if (value == null || value.isEmpty) {
    return "Username cannot be null or empty";
  }
  
  if (value.length < 3) {
    return "Username length must be at least 3 characters";
  }

  if (value.runes.any((char) => char >= 48 && char <= 57)) {
    return "Username cannot contain numbers";
  }

  if (value.length > 4) {
    return null;
  } else {
    return "Invalid name";
  }
}


  String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return "Email cannot be null or empty";
  }
  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

  if (!emailRegex.hasMatch(value)) {
    return "Invalid email format";
  }

  return null;
}


String? validatePhone(String? value) {
  if (value == null || value.isEmpty) {
    return "Phone number cannot be null or empty";
  }
  final phoneRegex = RegExp(r'^(010|011|012|015)[0-9]{8}$');
  if (!phoneRegex.hasMatch(value)) {
    return "Invalid Egyptian phone number format";
  }
  return null; 
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return "Password cannot be null or empty";
  }
  if (value.length < 8) {
    return "Password length must be at least 8 characters";
  }
  if (!value.contains(RegExp(r'[A-Z]'))) {
    return "Password must contain at least one uppercase letter";
  }
  if (!value.contains(RegExp(r'[a-z]'))) {
    return "Password must contain at least one lowercase letter";
  }
  if (!value.contains(RegExp(r'[0-9]'))) {
    return "Password must contain at least one digit";
  }
  if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return "Password must contain at least one special character";
  }

  return null; 
}

    String? validateLoginEmail(String? value) {
    if (value == "shimaa123@gmail.com") {
      return null;
    } else {
      return "Invalid email";
    }
  }

    String? validateLoginPassword(String? value) {
    if (value == "Shimaa1234!") {
      return null;
    } else {
      return "Invalid password";
    }
  }

    String? validateResetEmail(String? value) {
    if (value == "shimaa123@gmail.com") {
      return null;
    } else {
      return "Invalid email";
    }
  }


  String? validateAddress(String? value) {
  if (value == null || value.isEmpty) {
    return "Address cannot be null or empty";
  }
  
  if (value.length < 3) {
    return "Address length must be at least 3 characters";
  }
  if (value.length > 4) {
    return null;
  } else {
    return "Invalid Address";
  }
}

}
