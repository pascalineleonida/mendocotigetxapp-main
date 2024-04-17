import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Boutoncustom extends StatelessWidget {

  final Color color;
  final Color bordercolor;

  final double size;
  final double padding;
  final double? paddingv;
  final Widget ?text;
  final double height;
  final FontStyle? fontStyle;
  final VoidCallback ?onPressed;


  const Boutoncustom({super.key,

    required this.color,
    this.size = 10,
    this.height = 1.2,
    this.fontStyle,
    required this.onPressed, this.text, this.bordercolor = Colors.transparent,  this.padding = 8,  this.paddingv ,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      statesController: MaterialStatesController(),
      child: text,
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(horizontal: padding,vertical:paddingv??padding ),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),side: BorderSide(color: bordercolor))),
    );
  }
}
