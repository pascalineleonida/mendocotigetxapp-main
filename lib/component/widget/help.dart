import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mendocoti_appmobile_flutter/component/widget/text_ibm_plex_sans.dart';

import '../../util/helpers/g.dart';
import '../style/color.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: RotatedBox(
        quarterTurns: 1,
        child: InkWell(
          onTap: () {
            G.launchBroswer(uri: 'https://coti.mendo.cm/faq');
          },
          child: Container(
            alignment: Alignment.center,
            color: ColorApp.greenColor,
            width: 100,
            height: 20,
            child:  IBMPlexSans(
              text: "help".tr,
              color: ColorApp.onPrimary,
              fontWeight: FontWeight.w500,
              size: 12,
            ),
          ),
        ),
      ),
    );
  }
}