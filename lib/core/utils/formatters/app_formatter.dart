import 'package:intl/intl.dart';

class TFormatters {
  static String formatDate(DateTime? data) {
    return DateFormat('dd-MM-yyyy').format(data!);
  }

  // TODO: formatDate
  static String formatCurrency(double amout) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amout);
  }

  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    } else {
      return '(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}';
    }
  }

//TODO
  static void internationalFormatPhoneNumber(String phoneNumber) {
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');
    String countryCode = '+${digitsOnly.substring(0, 2)}';
    digitsOnly = digitsOnly.substring(2);

    final formattedNumber = StringBuffer();
    formattedNumber.write('($countryCode)');
    int i = 0;
    while (i < digitsOnly.length) {
      int groupLenght = 2;
      if (i == 0 && countryCode == '+1') {
        groupLenght = 3;
      }
      int end = i + groupLenght;
      formattedNumber.write(digitsOnly.substring(i, end));

      if (end != digitsOnly.length) formattedNumber.write(' ');
      i = end;
    }
  }
}
