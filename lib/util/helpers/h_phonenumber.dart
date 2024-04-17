// Created by Jospin MAMBOU on 15/12/2022, 10:13
// Email websafe21@gmail.com
// Copyright (c) 2022. All rights reserved.
// Last modified 15/12/2022, 10:10

/// Allows you to perform operations on telephone numbers
class HPhoneNumber {
  /// regex phone number cameroon
  static const regexNumber = r'^(237)?6(2[0]\d{6}|[5-9]\d{7})$';

  /// regex phone number cameroon
  static const regexNumberCam = r'^(\+237|237)?6(2[0]\d{6}|[5-9]\d{7})$';

  /// regex phone number MTN cameroon
  static const regexNumberMTN = r'^6(5[0-4]|7[0-9]|8[0-4])\d{6}$';

  /// regex phone number Orange cameroon
  static const regexNumberOrange = r'^6(5[5-9]|9[0-9])\d{6}$';

  /// regex phone number Camtel cameroon
  static const regexNumberCamtelMobile = r'^620\d{6}$';

  /// Determine if number is a Cameroonian number
  static bool isCameroonNumber(String phoneNumber) {
    if (RegExp(regexNumber).hasMatch(phoneNumber)) return true;
    return false;
  }

  /// Determine if number is a MTN number
  static bool isMTNNumber(String phoneNumber) {
    if (!HPhoneNumber.isCameroonNumber(phoneNumber)) return false;
    if (RegExp(regexNumberMTN).hasMatch(phoneNumber)) return true;
    return false;
  }

  /// Determine if number is a Orange number
  static bool isOrangeNumber(String phoneNumber) {
    if (!HPhoneNumber.isCameroonNumber(phoneNumber)) return false;
    if (RegExp(regexNumberOrange).hasMatch(phoneNumber)) return true;
    return false;
  }

  /// Determine if number is a Camtel number
  static bool isCamtelNumber(String phoneNumber) {
    if (!HPhoneNumber.isCameroonNumber(phoneNumber)) return false;
    if (RegExp(regexNumberCamtelMobile).hasMatch(phoneNumber)) return true;
    return false;
  }

  static bool isNumeric(String s) {
    return int.tryParse(s) != null;
  }
}
