import 'package:flutter/cupertino.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.cubicTo(size.width / 6, -1 * (size.height / 8), 3 * (size.width / 4),
        size.height / 0.6, size.width, 0);
    path.lineTo(size.width, 0);

    //  var firstart = Offset(size.width/4, size.height/2);
    //  var firstend = Offset(size.width/2.25, size.height-50.0);
    // path.cubicTo(size.width/4, size.height/2, size.width/2,size.height/2, size.width/3, size.height/2);
    //   path.lineTo(size.width,0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class MyCustomClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.01578947);
    path.cubicTo(0, size.height * 0.007069211, size.width * 0.01255276, 0,
        size.width * 0.02803738, 0);
    path.lineTo(size.width * 0.9719626, 0);
    path.cubicTo(size.width * 0.9874463, 0, size.width,
        size.height * 0.007069184, size.width, size.height * 0.01578947);
    path.lineTo(size.width, size.height * 0.4764789);
    path.cubicTo(
        size.width * 0.9827827,
        size.height * 0.4794447,
        size.width * 0.9702617,
        size.height * 0.4884645,
        size.width * 0.9702617,
        size.height * 0.4991316);
    path.cubicTo(
        size.width * 0.9702617,
        size.height * 0.5097987,
        size.width * 0.9827827,
        size.height * 0.5188184,
        size.width,
        size.height * 0.5217842);
    path.lineTo(size.width, size.height * 0.9991316);
    path.lineTo(0, size.height * 0.9991316);
    path.lineTo(0, size.height * 0.5227803);
    path.cubicTo(
        size.width * 0.02214019,
        size.height * 0.5220974,
        size.width * 0.03971963,
        size.height * 0.5117697,
        size.width * 0.03971963,
        size.height * 0.4991316);
    path.cubicTo(
        size.width * 0.03971963,
        size.height * 0.4864921,
        size.width * 0.02214019,
        size.height * 0.4761658,
        0,
        size.height * 0.4754829);
    path.lineTo(0, size.height * 0.01578947);
    //  var firstart = Offset(size.width/4, size.height/2);
    //  var firstend = Offset(size.width/2.25, size.height-50.0);
    // path.cubicTo(size.width/4, size.height/2, size.width/2,size.height/2, size.width/3, size.height/2);
    //   path.lineTo(size.width,0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
