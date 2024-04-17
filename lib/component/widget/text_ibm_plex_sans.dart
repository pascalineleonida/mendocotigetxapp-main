import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IBMPlexSans extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign textAlign;
  final double size;
  final FontWeight fontWeight;
  final FontStyle? fontStyle;
  final int maxLines;
  final bool softWrap;

  const IBMPlexSans({
    super.key,
    required this.text,
    this.color,
    this.fontStyle,
    this.maxLines = 3,
    this.size = 18,
    this.fontWeight = FontWeight.w300,
    this.textAlign = TextAlign.center,
    this.softWrap = true,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap,
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
