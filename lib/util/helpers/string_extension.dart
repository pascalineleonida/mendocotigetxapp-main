// Created by Jospin MAMBOU on 15/12/2022, 10:13
// Email websafe21@gmail.com
// Copyright (c) 2022. All rights reserved.
// Last modified 15/12/2022, 10:10

/// Extension of String
extension StringExtension on String {
  /// Make a string's first character uppercase
  String ucfirst() {
    if (length == 1) {
      return this[0].toUpperCase();
    }
    return this[0].toUpperCase() + substring(1);
  }

  String ucfirst2() {
    if (length == 1) {
      return this[0].toUpperCase();
    }
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }
}
