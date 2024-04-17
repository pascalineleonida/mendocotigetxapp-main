import 'package:flutter/services.dart';

class PhoneNumberFormat extends TextInputFormatter {
  PhoneNumberFormat({required this.mask, required this.separator});
  final String mask;
  final String separator;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newText = StringBuffer();
    if (newValue.text.isNotEmpty) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask.length) return oldValue;
        if (newValue.text.length < mask.length &&
            mask[newValue.text.length - 1] == separator) {
          newText.write(
            '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
          );
          return TextEditingValue(
            text: newText.toString(),
            selection:
                TextSelection.collapsed(offset: newValue.selection.end + 1),
          );
        }
      }
    }
    return newValue;
  }
}

class PhoneTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = StringBuffer();

    if (newTextLength == 1) {
      newText.write(' ');
      if (newValue.selection.end >= 1) {
        selectionIndex++;
      }
    }
    if (newTextLength >= 4) {
      newText.write(' ${newValue.text.substring(0, usedSubstringIndex = 3)} ');
      if (newValue.selection.end >= 3) {
        selectionIndex += 2;
      }
    }
    if (newTextLength >= 6) {
      newText.write('${newValue.text.substring(3, usedSubstringIndex = 5)} ');
      if (newValue.selection.end >= 5) {
        selectionIndex++;
      }
    }
    if (newTextLength >= 8) {
      newText.write('${newValue.text.substring(5, usedSubstringIndex = 7)} ');
      if (newValue.selection.end >= 6) {
        selectionIndex++;
      }
    }
    // Dump the rest.
    if (newTextLength >= usedSubstringIndex) {
      newText.write(newValue.text.substring(usedSubstringIndex));
    }
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
