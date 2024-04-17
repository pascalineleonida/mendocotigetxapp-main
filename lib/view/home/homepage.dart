import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mendocoti_appmobile_flutter/component/style/color.dart';
import 'package:mendocoti_appmobile_flutter/model/usermodel.dart';
import 'package:mendocoti_appmobile_flutter/view/home/setting/setting_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../component/animation/animationwidget.dart';
import '../../component/widget/cardshimer.dart';
import '../../component/widget/text_ibm_plex_sans.dart';
import '../../model/associationmodel.dart';
import '../../model/lasttransactionmodel.dart';
import '../../model/profilusermodel.dart';
import '../../model/usermodeldata.dart';
import '../../service/callapi/authentification/authentifaction.dart';
import '../../service/callapi/structure/structureapicall.dart';
import '../../service/controller/controller.dart';
import 'Dashbord/dashbordview.dart';
import 'association/assoctionpage.dart';


class HomepageView extends StatefulWidget {
  final VoidCallback login;

  const HomepageView({super.key, required this.login});

  @override
  State<HomepageView> createState() => _HomepageViewState();
}

class _HomepageViewState extends State<HomepageView> {
  int index = 0;
  bool isDeviceConnected = false;
  bool isAlertSet = false;
  late StreamSubscription subscription;
  showDialogBox() => showCupertinoDialog<String>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title:  Text('NoConnection'.tr),
      content:  Text('checkconnexion'.tr),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            Navigator.pop(context, 'Cancel');
            setState(() => isAlertSet = false);
            isDeviceConnected =
            await InternetConnectionChecker().hasConnection;
            if (!isDeviceConnected && isAlertSet == false) {
              showDialogBox();
              setState(() => isAlertSet = true);
            }else{
              c.checfirstpage();
            }
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
            (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox();
            setState(() => isAlertSet = true);
          }else{
            c.checfirstpage();
          }
        },
      );

  Controller c = Get.find();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getConnectivity();
    c.indexed=0;
    UserModeldata.getusers();
    Profiluser.getusers();
    c.checfirstpage();


    c.getfirst();
  }

  @override
  Widget build(BuildContext context) {
    Controller c = Get.find();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
          title:
              // c.profiluser.isNotEmpty? Obx(()=>IBMPlexSans(
              //   text: "${profiluser.first.firstName.toString()} ${profiluser.first.name.toString()}",
              //   // text: "index!=2?c.fullname:'parameters'.tr",
              //   fontWeight: FontWeight.w600,
              //   size: 20.sp,
              // )):SizedBox(
              //   width: 50.w,
              //
              //     child: CardShimmer()),
              GetBuilder<Controller>(
        builder: (c) => c.profiluser.isNotEmpty
            ? Delatanimationwidget(
              delay: 3,
              child: IBMPlexSans(
                        text:c.indexed!=2?"${c.profiluser.first.firstName.toString()} ${c.profiluser.first.name.toString()}":"parameters".tr,
                        // text: "index!=2?c.fullname:'parameters'.tr",
                        fontWeight: FontWeight.w600,
                        size: 20.sp,
                      ),
            )
            :Profiluser.sessionusers==null? IBMPlexSans(
          text:c.indexed!=2?"${Profiluser.sessionusers!.firstName} ${Profiluser.sessionusers!.name}":"parameters".tr,
          // text: "index!=2?c.fullname:'parameters'.tr",
          fontWeight: FontWeight.w600,
          size: 20.sp,
        ):SizedBox(
          width: 50.w,

          child: CardShimmer(),),
              ),
      ),
      body: IndexedStack(
        index:  c.indexed,
        sizing: StackFit.expand,

        children: [
          Container(
            child: Dashbordview(),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Associationpage(),
            ),
          ),
          Container(

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Settingview(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        // color: ColorApp.primary.withOpacity(0.1),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  c.indexed = 0;
                  // c.increments(index);
                  // print(c.indexed);
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: double.infinity,
                // color:  c.indexed == 0 ?Colors.white:ColorApp.primary.withOpacity(0.1),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 5.0,  color:  c.indexed == 0 ?ColorApp.primary:Colors.white,),
                  )
                ),
                width: 34.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home,
                        color:
                            c.indexed == 0 ? ColorApp.primary : Colors.black),
                    IBMPlexSans(
                      text: 'home'.tr,
                      color: c.indexed == 0 ? ColorApp.primary : Colors.black,
                      fontWeight:
                          c.indexed == 0 ? FontWeight.w700 : FontWeight.w400,
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  c.indexed = 1;

                  print(c.indexed);
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),

                height: double.infinity,
                // color:  c.indexed == 1 ?Colors.white:ColorApp.primary.withOpacity(0.1),
                width: 33.w,
                decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 5.0,  color:  c.indexed == 1 ?ColorApp.primary:Colors.white,),
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.groups_outlined,
                        color:
                            c.indexed == 1 ? ColorApp.primary : Colors.black),
                    IBMPlexSans(
                        fontWeight:
                            c.indexed == 1 ? FontWeight.w700 : FontWeight.w400,
                        text: 'associations'.tr,
                        color: c.indexed == 1 ? ColorApp.primary : Colors.black)
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  c.indexed = 2;

                  // UserModeldata.logout();
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: double.infinity,
                width: 33.w,
                decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 5.0,  color:  c.indexed == 2 ?ColorApp.primary:Colors.white,),
                    )
                ),
                // color:  c.indexed == 2 ?Colors.white:ColorApp.primary.withOpacity(0.1),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.settings_outlined,
                        color:
                            c.indexed == 2 ? ColorApp.primary : Colors.black),
                    IBMPlexSans(
                        text: 'parameters'.tr,
                        fontWeight:
                            c.indexed == 2 ? FontWeight.w700 : FontWeight.w400,
                        color: c.indexed == 2 ? ColorApp.primary : Colors.black)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
