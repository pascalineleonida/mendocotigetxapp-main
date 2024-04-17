import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class G {
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  static Future<void> launchWhatsApp({
    required int phone,
    required String message,
  }) async {
    Uri url() {
      if (Platform.isAndroid) {
        return Uri.parse(
          'https://wa.me/$phone/?text=${Uri.encodeFull(message)}',
        ); // new line
      } else {
        return Uri.parse(
          'https://api.whatsapp.com/send?phone=$phone&text=${Uri.encodeFull(message)}',
        ); // new line
      }
    }

    if (await canLaunchUrl(url())) {
      await launchUrl(url(), mode: LaunchMode.externalApplication);
    } else {
      final Error error = ArgumentError('Could not launch ${url()}');
      throw error;
    }
  }

  static Future<void> launchBroswer({
    required String uri,
  }) async {
    Uri url() {
      return Uri.parse(
        uri,
      ); // new line
    }

    //if (await canLaunchUrl(url())) {
    await launchUrl(url(), mode: LaunchMode.externalApplication);
    //} else {
    //final Error error = ArgumentError('Could not launch ${url()}');
    // throw error;
    //}
  }
}
