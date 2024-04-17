// Created by Jospin MAMBOU on 15/12/2022, 10:13
// Email websafe21@gmail.com
// Copyright (c) 2022. All rights reserved.
// Last modified 15/12/2022, 10:10

/// Helper to do format
class RegexFormat {
  static const String regexEmail = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

  /// Format money
  ///
  /// To String [price]
  static String moneyFormat(String price) {
    if (price.length > 2) {
      var value = price;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ' ');
      return value;
    }
    return price;
  }

  static String moneyFormatPackage(String price, String language) {
    if (price.length > 2) {
      var value = price;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(
        RegExp(r'\B(?=(\d{3})+(?!\d))'),
        language == 'en' ? ',' : '.',
      );
      return value;
    }
    return price;
  }

  /// Double de
  ///
  /// To String [price]
  static String contentDoubleMoneyFormat(String price, String language) {
    final list = price.split('.');

    final secondEn = (int.parse(list[1]) > 0) ? '.${list[1]}' : '';
    final secondFr = (int.parse(list[1]) > 0) ? ',${list[1]}' : '';
    if (language == 'en') {
      return list.length > 1
          ? '${moneyFormat(list[0])}$secondEn'
          : moneyFormat(list[0]);
    }
    return list.length > 1
        ? '${moneyFormat(list[0])}$secondFr'
        : moneyFormat(list[0]);
  }

  static String contentDoubleMoneyPackage(String price, String language) {
    final list = price.split('.');

    final secondEn = (int.parse(list[1]) > 0) ? '.${list[1]}' : '';
    final secondFr = (int.parse(list[1]) > 0) ? ',${list[1]}' : '';
    if (language == 'en') {
      return list.length > 1
          ? '${moneyFormatPackage(list[0], language)}$secondEn'
          : moneyFormatPackage(list[0], language);
    }
    return list.length > 1
        ? '${moneyFormatPackage(list[0], language)}$secondFr'
        : moneyFormatPackage(list[0], language);
  }

  /// Format phone number in Cameroon number
  ///
  /// To String [phone]
  static String formatPhone(String phone) {
    var value = phone;
    value = value.replaceAll(RegExp(r'\D'), '');
    if (value.length == 12) {
      value = value.substring(4);
    }
    value = value.replaceAll(RegExp(r'\B(?=(\d{2})+(?!\d))'), ' ');
    if (value.length == 11) {
      value = '6$value';
    }
    return value;
  }

  /// Encode number
  /// Ex: 237696870887 -> 696 8 . . . 87
  ///
  /// To String [phone]
  static String encodePhoneNumber(String phone) {
    var value = phone;
    value = value.replaceAll(RegExp(r'\D'), '');
    if (value.length == 12) {
      value = value.substring(4);
    }
    value = value.replaceAll(RegExp(r'\B(?=(\d{2})+(?!\d))'), ' ');
    if (value.length == 11) {
      value = '6$value';
    } else {
      value = value[0] + value.substring(2);
    }
    return '${value.substring(0, 3)} ${value[4]} . . . ${value.substring(10)}';
  }
}
