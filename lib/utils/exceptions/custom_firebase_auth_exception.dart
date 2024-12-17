class TFirebaseAuthException implements Exception {
  final String code;

  ///Firebase Auth Exception custom class to give user idea on the exception
  ///that occurred during the authentication process
  ///Parameters:
  ///- `String code`: The error code of the exception. The code from the exception of Firebase
  ///return type: `TFirebaseAuthException`
  ///Example:
  ///TFirebaseAuthException(code: 'email-already-in-use');
  ///`title` = Email Already In Use,`message` = This email address is already registered. Please use a different email.
  TFirebaseAuthException({required this.code});

  String get title {
    switch (code) {
      case 'email-already-in-use':
        return 'Email Already In Use';
      case 'invalid-email':
        return 'Invalid Email';
      case 'operation-not-allowed':
        return 'Operation Not Allowed';
      case 'weak-password':
        return 'Weak Password';
      case 'user-not-found':
        return 'User Not Found';
      case 'wrong-password':
        return 'Wrong Password';
      case 'user-disabled':
        return 'User Disabled';
      case 'too-many-requests':
        return 'Too Many Requests';
      case 'network-request-failed':
        return 'Network Request Failed';
      case 'invalid-credential':
        return 'Invalid Credential';
      case 'auth/invalid-email':
        return 'Invalid Email';
      case 'auth/user-not-found':
        return 'User Not Found';
      default:
        return 'Unexpected Error';
    }
  }

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'This email address is already registered. Please use a different email.';
      case 'invalid-email':
        return 'The email address you entered is not valid. Please check and try again.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Please contact support for assistance.';
      case 'weak-password':
        return 'The password you entered is too weak. Please choose a stronger password.';
      case 'user-not-found':
        return 'No user found with this email address. Please check and try again.';
      case 'wrong-password':
        return 'The password you entered is incorrect. Please try again.';
      case 'user-disabled':
        return 'This user account has been disabled. Please contact support for assistance.';
      case 'network-request-failed':
        return 'Network error. Please check your internet connection and try again.';
      case 'invalid-credential':
        return 'Wrong email or password. Please check and try again.';
      case 'auth/invalid-email':
        return 'The email address you entered is not valid. Please check and try again.';
      case 'auth/user-not-found':
        return 'No user found with this email address. Please check and try again.';
      default:
        return 'An unexpected error occurred. Please try again.';
    }
  }
}
