class FormValidator {
  // Validate Email
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }
    const emailRegex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    if (!RegExp(emailRegex).hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Validate Signin Password
  static String? validateSigninPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  // Validate Signup Password
  static String? validateSignupPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your password';
    }
    if (value.trim().length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one digit';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  // Validate Confirm Password
  static String? validateConfirmPassword(
      String? value, String? originalPassword) {
    if (value == null || value.trim().isEmpty) {
      return 'Please confirm your password';
    }
    if (value != originalPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  // Validate Name
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your name';
    }
    if (value.trim().length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  // Validate PIN
  static String? validatePin(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a PIN';
    }
    return null;
  }

  // Validate Phone Number with Country Code
  static String? validatePhoneNumber(String? value, String? countryCode) {
    // Ensure country code is selected
    if (countryCode == null || countryCode.isEmpty) {
      return 'Please select a country code';
    }
    // Ensure phone number is provided
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your phone number';
    }

    // Combine the country code and phone number
    final combinedPhoneNumber = '$countryCode$value';

    // Define a regex to validate the phone number format
    const phoneRegex =
        r'^\+?(\d{1,4})?[\s.-]?\(?\d{1,4}?\)?[\s.-]?\d{1,4}[\s.-]?\d{1,4}[\s.-]?\d{1,4}$';
    if (!RegExp(phoneRegex).hasMatch(combinedPhoneNumber)) {
      return 'Please enter a valid phone number';
    }

    return null;
  }
}
