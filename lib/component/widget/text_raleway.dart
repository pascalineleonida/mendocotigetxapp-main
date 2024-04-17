import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Raleway extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign textAlign;
  final double size;
  final FontWeight fontWeight;
  final FontStyle ?fontStyle;

  const Raleway({super.key, 
    required this.text,
    required this.color,
    this.size = 18,  this.fontWeight = FontWeight.w300,  this.fontStyle,  this.textAlign = TextAlign.center,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: 3,
      style: GoogleFonts.ibmPlexSans(
        color: color,
        height: 1.6,
        fontSize: size,
        fontWeight: fontWeight,
        fontStyle: fontStyle,

      ),
    );
  }
}
