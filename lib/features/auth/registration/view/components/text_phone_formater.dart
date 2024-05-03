import 'package:flutter/services.dart';

class MyPhoneTextFieldFormater extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String phone = newValue.text ;
    return phone.length > 11 ? oldValue : newValue;
  }
}
