class TFormatException implements Exception {
  final String message;

  TFormatException(this.message);

  factory TFormatException.fromMessage(String message) {
    return TFormatException(message);
  }

  String get formatMessage => message;

  factory TFormatException.formCode(String code) {
    switch (code) {
      case "invalid-email-format":
        return TFormatException(
            "invalid email format , please enter a vaild email.");
      case "invalid-password-format":
        return TFormatException(
            "invalid password , Please enter a vaild password.");
      case "invalid-phone-number-format":
        return TFormatException(
            "invalid phone number , Please enter a vaild phone number.");
      case "invalid-username-format":
        return TFormatException(
            "invalid username , Please enter a vaild username.");
      case "invalid-first-name-format":
        return TFormatException(
            "invalid first name , Please enter a vaild first name.");
      case "invalid-last-name-format":
        return TFormatException(
            "invalid last name , Please enter a vaild last name.");
      case "invalid-date-format":
        return TFormatException("invalid date , Please enter a vaild date.");
      case "invalid-credit-card-format":
        return TFormatException(
            "invalid credit card , Please enter a vaild credit card.");
      case "invalid-cvv-format":
        return TFormatException("invalid cvv , Please enter a vaild cvv.");
      case "invalid-expiration-date-format":
        return TFormatException(
            "invalid expiration date , Please enter a vaild expiration date.");
      case "invalid-amount-format":
        return TFormatException(
            "invalid amount , Please enter a vaild amount.");
      case "invalid-numeric-format":
        return TFormatException(
            "invalid numeric value , Please enter a vaild numeric value.");

      default:
        return TFormatException("An unknown error occurred");
    }
  }
  @override
  String toString() {
    return message;
  }
}
