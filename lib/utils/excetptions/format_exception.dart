class TFormatException implements Exception {
final String message;

// default constructor with a generic error message
const TFormatException([this.message="An unexpected format error occurred. Please check your input."]);

// create a format exception from a specific error message
factory TFormatException.fromMessage(String message) {
  return TFormatException(message);
}

// Get the corresponding error message

String get formattedMessage => message;

// create a format exception from a specific error code

factory TFormatException.fromCode(String code) {
  switch (code) {
    case 'invalid-email-format':
      return const TFormatException('The email address format is invalid. Please enter a valid email.');
    case 'invalid-phone-number-format':
      return const TFormatException('The provided phone number is not valid.');
    case 'invalid-date-format':
      return const TFormatException('Date format is not valid');
    case 'invalid-url-format':
      return const TFormatException('Url is not valid');
    case 'invalid-credit-card-format':
      return const TFormatException('Credit card format is not valid');
    case 'invalid-numeric-format':
      return const TFormatException('Numeric format is not valid');
    default:
      return const TFormatException();
  }
}
}