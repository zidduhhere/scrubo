class TPlatformExceptions implements Exception {
  final String code;

  TPlatformExceptions({required this.code});

  @override
  String toString() {
    return 'PlatformException: $code';
  }

  String message() {
    switch (code) {
      case 'invalid-email':
        return 'Please enter a valid email address.';
      case 'email-already-in-use':
        return 'An account already exists with this email.';
      case 'weak-password':
        return 'Password should be at least 6 characters long.';
      case 'user-not-found':
        return 'No account found with this email.';
      case 'password-mismatch':
        return 'Incorrect password. Please try again.';
      case 'too-many-requests':
        return 'Too many failed attempts. Please try again later.';
      case 'network-request-failed':
        return 'Network error. Please check your internet connection.';
      case 'user-disabled':
        return 'This account has been disabled.';
      default:
        return 'An error occurred. Please try again.';
    }
  }
}
