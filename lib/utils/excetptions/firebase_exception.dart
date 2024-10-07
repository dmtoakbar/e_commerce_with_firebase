class TFirebaseException implements Exception {
  // the error code association with the exception
  final String code;
  // the constructor that takes an error code
TFirebaseException(this.code);

// get the corresponding error message based on the error code

String get message {
  switch (code) {
    case 'unknown':
      return 'An unknown Firebase error occurred. Please try again';
    case 'invalid-custom-token':
      return 'The custom token format is incorrect. Please check your custom token';
    case 'custom-token-mismatch':
      return 'The custom token corresponds to different audience.';
    case 'user-disabled':
      return 'The user account has been disabled';
    case 'user-not-found':
      return 'No user account for the given email or ID.';
    case 'invalid-email':
      return 'The email entered is not valid.';
    case 'email-already-in-use':
      return 'Entered email is already registered.';
    case 'wrong-password':
      return 'Incorrect password';
    case 'weak-password':
      return 'Weak password.';
    case 'provider-already-linked':
      return 'The account is already linked with another account.';
    case 'operation-not-allowed':
      return 'This operation is not allowed for you.';
      default:
        return 'Firebase error.';
  }
}
}