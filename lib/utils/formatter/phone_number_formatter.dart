class TPhoneNumberFormatter {
  static String formatPhoneNumber(String phoneNumber) {
    phoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6, 10)}';
    } else if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(1, 4)}) ${phoneNumber.substring(4, 7)}-${phoneNumber.substring(7, 11)}';
    } else {
      return phoneNumber;
    }
  }

  static String unformatPhoneNumber(String phoneNumber) {
    return phoneNumber.replaceAll(RegExp(r'\D'), '');
  }

  static bool isValidPhoneNumber(String phoneNumber) {
    return phoneNumber.replaceAll(RegExp(r'\D'), '').length == 10;
  }

  static String addCountryCode(String phoneNumber) {
    if (phoneNumber.length == 10) {
      return '+91 ${phoneNumber.substring(0, 5)} ${phoneNumber.substring(5, 10)}';
    } else if (phoneNumber.length == 11) {
      return '+91 ${phoneNumber.substring(1, 4)} ${phoneNumber.substring(4, 7)}-${phoneNumber.substring(7, 11)}';
    } else {
      return phoneNumber;
    }
  }

  static String formatPhoneNumberWithCountryCode(String phoneNumber) {
    phoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

    if (phoneNumber.length == 10) {
      return '+91 (${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6, 10)}';
    } else if (phoneNumber.length == 11) {
      return '+91 (${phoneNumber.substring(1, 4)}) ${phoneNumber.substring(4, 7)}-${phoneNumber.substring(7, 11)}';
    } else {
      return phoneNumber;
    }
  }
}
