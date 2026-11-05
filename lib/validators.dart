class RegexValidators {
  // Name: 2–30 characters, letters, spaces, hyphens, or apostrophes
  static final RegExp _nameRegExp = RegExp(r"^[a-zA-Z\s'\-]{2,30}$");

  // Email: Standard email format
  static final RegExp _emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  // Password: 8+ chars, at least 1 uppercase, 1 lowercase, 1 number, 1 special char
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&.#^()_\-+])[A-Za-z\d@$!%*?&.#^()_\-+]{8,}$',
  );

  // --- Field Validators ---

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Full name is required';
    }
    if (!_nameRegExp.hasMatch(value.trim())) {
      return 'Enter a valid name (2–30 letters only)';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email address is required';
    }
    if (!_emailRegExp.hasMatch(value.trim())) {
      return 'Enter a valid email (e.g. mj@physique.com)';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (!_passwordRegExp.hasMatch(value)) {
      return 'Meet all 4 password requirements below';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String originalPassword) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != originalPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  // --- Live Regex Checkers for UI Pills ---
  static bool hasMinLength(String pw) => RegExp(r'^.{8,}$').hasMatch(pw);
  static bool hasUppercase(String pw) => RegExp(r'[A-Z]').hasMatch(pw);
  static bool hasDigit(String pw) => RegExp(r'\d').hasMatch(pw);
  static bool hasSpecial(String pw) => RegExp(r'[@$!%*?&.#^()_\-+]').hasMatch(pw);
}