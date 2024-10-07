import 'package:intl/intl.dart';

class TFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyy').format(date);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_us', symbol: '\$').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    if(phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3,6)}, ${phoneNumber.substring(6)}';
    } else if(phoneNumber.length==11) {
      return '(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}';
    }
    return phoneNumber;
  }

  static String internationalFormatPhoneNumber(String phoneNumber) {
    // remove any non digit characters from the phone number

    var digitOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // extract the country code from the digitsOnly
    String countryCode = '+${digitOnly.substring(0, 2)}';
    digitOnly = digitOnly.substring(2);

    // add the remaining digit with proper formatting
    final formattedNumber = StringBuffer();
    formattedNumber.write('($countryCode)');

    int i = 0;

    while(i<digitOnly.length) {
      int groupLength = 2;
      if(i==0 && countryCode == '+1') {
        groupLength = 3;
      }

      int end = i + groupLength;

      formattedNumber.write(digitOnly.substring(i, end));

      if(end < digitOnly.length) {
        formattedNumber.write('');
      }
      i = end;
    }

    return formattedNumber.toString();
  }
}