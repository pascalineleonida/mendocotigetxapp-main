// Created by Jospin MAMBOU on 29/04/2023, 14:46
// Email websafe21@gmail.com
// Copyright (c) 2023, All rights reserved
// Last modified 29/04/2023, 14:46

import 'dart:ui';

/// Extension of Color
extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc"
  /// with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  ///  Check if color is light or dark
  bool isDark() {
    if ((red * 0.299 + green * 0.587 + blue * 0.114) > 186) {
      return false;
    } else {
      return true;
    }
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
          // '${alpha.toRadixString(16).padLeft(2, '0')}'
          '${red.toRadixString(16).padLeft(2, '0')}'
          '${green.toRadixString(16).padLeft(2, '0')}'
          '${blue.toRadixString(16).padLeft(2, '0')}'
      .toUpperCase();
}
