import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mendocoti_appmobile_flutter/component/style/color.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../component/widget/bouton_custom.dart';
import '../../../../component/widget/text_ibm_plex_sans.dart';


class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  bool? check ;
  bool? value ;

  setcheck()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool("langue", check!);

  }

  getcheck()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    value = prefs.getBool('langue');
    setState(() {
      check = value;
    });
    print(value);
    print(check);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcheck();


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: IBMPlexSans(
            text: 'selectlanguage'.tr,
            size: 20,
            fontWeight: FontWeight.bold,
          )),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              onTap: () {},
              leading: IBMPlexSans(
                text: "Langues".tr,
                fontWeight: FontWeight.w700,
                size: 16.sp,
              ),

            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              onTap: () {
                setState(() {
                  check = true;
                  var locale = Locale('fr', 'FR');
                  print(locale);
                  Get.updateLocale(locale);

                });
                setcheck();
                print(check);
              },
              leading: IBMPlexSans(
                text: "francais".tr,
                fontWeight: FontWeight.w700,
                size: 16.sp,
              ),
              trailing: CircleAvatar(
                radius: 10,
                backgroundColor: ColorApp.primary,
                child: check==true
                    ? Icon(
                  Icons.check,
                  size: 12,
                  color: Colors.white,
                )
                    : SizedBox(),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              onTap: () {
                setState(() {

                  check = false;
                  var locale = Locale('en', 'EN');
                  Get.updateLocale(locale);

                });
                setcheck();
                print(check);
              },
              leading: IBMPlexSans(
                text: "anglais".tr,
                fontWeight: FontWeight.w700,
                size: 16.sp,
              ),
              trailing: CircleAvatar(
                radius: 10,
                backgroundColor: ColorApp.primary,
                child: check==true
                    ? SizedBox()
                    : Icon(
                  Icons.check,
                  size: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}