class TFirebaseException implements Exception {
  final String code;
  TFirebaseException(this.code);



  String get message {
    switch (code) {
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credentials. Please double-check your information.';
      case 'too-many-requests':
        return 'Too many requests. Please try later.';
      case 'invalid-argument':
        return 'Invalid argument provided to the authentication method.';
      default:
        return 'Exception occurred.';
    }
  }
}