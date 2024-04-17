import 'package:flutter/material.dart';
import 'package:mendocoti_appmobile_flutter/component/widget/text_ibm_plex_sans.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../style/color.dart';

class DisplayProvider extends StatelessWidget {
  const DisplayProvider({
    super.key,
    required this.color,
    required this.image,
    required this.text,
  });

  final Color color;
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: ColorApp.background.withOpacity(0.4),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(2), bottomRight: Radius.circular(2)),
        ),
        child: Row(children: [
          Container(
            width: 2.5.w,
            height: 7.h,
            color: color,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(1.w),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      image,
                      fit: BoxFit.contain,
                      scale: 1.w,
                    ),
                    Column(
                      // mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        IBMPlexSans(
                            text: "${text} XAF",
                            textAlign: TextAlign.center,
                            size: 1.1.h,
                            fontWeight: FontWeight.w700,
                            color: color),
                      ],
                    ),
                  ]),
            ),
          )
        ]),
      ),
    );
  }
}