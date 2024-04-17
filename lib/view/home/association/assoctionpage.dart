import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mendocoti_appmobile_flutter/component/widget/text_ibm_plex_sans.dart';
import 'package:mendocoti_appmobile_flutter/view/home/association/pagetransaction/transactionView.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../component/animation/animationwidget.dart';
import '../../../component/style/color.dart';
import '../../../component/widget/bouton_custom.dart';
import '../../../component/widget/cardshimer.dart';
import '../../../component/widget/lasttransactiowidget.dart';
import '../../../component/widget/structurecard.dart';
import '../../../model/associationmodel.dart';
import '../../../model/lasttransactionmodel.dart';
import '../../../model/projetmodel.dart';
import '../../../model/structuremodel.dart';
import '../../../service/callapi/structure/structureapicall.dart';
import '../../../service/controller/controller.dart';
import '../../../util/helpers/app_date.dart';
import '../homepage.dart';

class Associationpage extends StatefulWidget {
  const Associationpage({super.key});

  @override
  State<Associationpage> createState() => _AssociationpageState();
}

class _AssociationpageState extends State<Associationpage> {
  Controller c = Get.find();

  TextEditingController structure = TextEditingController();
  final FocusNode _structure = FocusNode();
  final GlobalKey<FormState> _formKeys = GlobalKey<FormState>();

  _loseFocus() {
    _structure.hasFocus ? _structure.unfocus() : null;
  }

  Future<void> scanQR() async {
    String barcodeScanRes = "";
    String _scanBarcode = "";
// Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes =
      await FlutterBarcodeScanner
          .scanBarcode(
          '#ff6666',
          'Cancel',
          true,
          ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes =
      'Failed to get platform version.';
    }

// If the widget was removed from the tree while the asynchronous platform
// message was in flight, we want to discard the reply rather than calling
// setState to update our non-existent appearance.
    if (!mounted) return;
    setState(() {
      _scanBarcode = barcodeScanRes;
      structure.text = _scanBarcode;
      if (structure.text == "-1") {
        Get.back();
        structure.clear();
      } else if (structure.text != "-1") {
        print("win");
        Get.back();
        EasyLoading.show(status: 'loading...');
        checkmodal();
      }
    });
  }

  modal() {
    Get.bottomSheet(
        backgroundColor: Colors.transparent,
        enableDrag: true,
        isDismissible: true,
        isScrollControlled: true,
        barrierColor: Colors.black.withOpacity(0.3),
        exitBottomSheetDuration: Duration(milliseconds: 400),
        enterBottomSheetDuration: Duration(milliseconds: 400),
        elevation: 25,
        Material(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              width: double.infinity,
              color: Colors.transparent,
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "membershipAssociation".tr,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.sp),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Form(
                      key: _formKeys,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            focusNode: _structure,
                            textInputAction: TextInputAction.next,
                            autofillHints: const [
                              AutofillHints.email,
                            ],
                            controller: structure,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.groups_outlined),
                              filled: true,
                              fillColor: ColorApp.background,
                              hintStyle: TextStyle(
                                  color:
                                      ColorApp.onBackground.withOpacity(0.3)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(30)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                  BorderSide(color: ColorApp.primary)),
                              hintText: 'associationCode'.tr,
                              labelStyle: const TextStyle(
                                  color: ColorApp.onBackground, fontSize: 14),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "enterCode".tr;
                              }

                              return null;
                            },
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            children: [
                              const Expanded(
                                  child: Divider(
                                height: 1,
                              )),
                              const SizedBox(
                                width: 10,
                              ),
                              Text("or".tr),
                              const SizedBox(
                                width: 10,
                              ),
                              const Expanded(child: Divider())
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: IconButton(
                                onPressed: () {
                                  scanQR();
                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>Qrcodescane()));
                                },
                                icon: const Icon(
                                  Icons.qr_code,
                                  color: ColorApp.primary,
                                  size: 40,
                                )),
                          ),
                          IBMPlexSans(text: "Scancode".tr,fontWeight: FontWeight.bold,),
                          SizedBox(
                            height: 2.h,
                          ),
                          Boutoncustom(
                            color: ColorApp.primary,
                            onPressed: () {
                              if (_formKeys.currentState!.validate()) {
                                _formKeys.currentState!.save();
                                _loseFocus();
                                Get.back();
                                EasyLoading.show(status: 'loading...');
                                checkmodal();
                              }
                            },
                            text: IBMPlexSans(
                              text: 'join'.tr,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ));
  }

  modalsend() {
    Get.bottomSheet(
        backgroundColor: Colors.transparent,
        enableDrag: true,
        isDismissible: true,
        isScrollControlled: true,
        barrierColor: Colors.black.withOpacity(0.3),
        exitBottomSheetDuration: Duration(milliseconds: 400),
        enterBottomSheetDuration: Duration(milliseconds: 400),
        elevation: 25,
        Material(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              width: double.infinity,
              color: Colors.transparent,
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: c.checkstructure
                    .map((e) => Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "membershipAssociation".tr,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: IBMPlexSans(
                                  text: e.name.toString(),
                                  size: 12,
                                  color: ColorApp.primary,
                                  fontWeight: FontWeight.w700,
                                )),
                            Align(
                                alignment: Alignment.topLeft,
                                child: IBMPlexSans(
                                  text:
                                      "${e.countMember.toString()} ${"members".tr} ${e.localisation?.name.toString()}",
                                  size: 12,
                                )),
                            Align(
                                alignment: Alignment.topLeft,
                                child: IBMPlexSans(
                                  text:
                                      "${AppDate.dateTimeWithDay(DateTime.parse(e.createdAt.toString()),)}",
                                  size: 12,
                                )),
                            SizedBox(
                              height: 3.h,
                            ),
                            Boutoncustom(
                              color: ColorApp.primary,
                              onPressed: () {
                                Get.back();
                                EasyLoading.show();
                                StructureAPIcall.askAssociation(e.code);
                              },
                              text: IBMPlexSans(
                                text: 'sentMyRequest'.tr,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ))
                    .toList(),
              ),
            ),
          ),
        ));
  }

  checkmodal() async {
    var data = await StructureAPIcall.checkAssociation(structure.text);
    if (data != null) {
      c.checkstructure.clear();
      setState(() {
        c.checkstructure.add(StructureModel.fromJson(data));
        modalsend();
      });
      print(c.checkstructure.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


                _association(),
              SizedBox(
                height: 2.h,
              ),

              _joinassociation(),
              SizedBox(
                height: 1.h,
              ),

              Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    IBMPlexSans(
                        text: "recentDues".tr,
                        size: 16.px,
                        fontWeight: FontWeight.w400,
                        color: ColorApp.textColor2),
                    SvgPicture.asset(
                        'assets/svg/menu.svg',
                        height: 22,
                        width: 22,
                        color: ColorApp.textColor2),
                  ]),

              SizedBox(
                height: 1.h,
              ),

             Obx(() => c.lasttransaction.isNotEmpty? ListView.builder(
                 shrinkWrap: true,
                 physics: NeverScrollableScrollPhysics(),
                 itemCount: c.lasttransaction.first.items!.length,
                 itemBuilder: (context,i){
                   final post = c.lasttransaction.first.items![i];
                   return Delatanimationwidget(
                     delay: 2,
                     child: Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 0),
                       child: Column(
                         crossAxisAlignment:
                         CrossAxisAlignment.start,
                         children: [
                     
                           InkWell(
                               onTap: () {
                     
                                 Association association = Association(
                                   id: post.tontineId,
                                   name: post.tontineData!.association!.name,
                                 );
                     
                     
                                 Projetmodels item =Projetmodels(
                                   id: post.tontineId!.toInt(),
                                   association: association,
                     
                                   createdAt: post.tontine!.createdAt,
                                   countMember: post.tontine!.countMember!.toInt(),
                                   description: post.tontine!.description.toString(),
                                   visibilityAmount: post.tontine!.visibilityAmount,
                                   name: post.tontine!.name.toString(),
                                   countActivity: 1,
                                   allPeopleSee: 1,
                                   categoryId: 1,
                                   countNoteActivity: 1,
                                   status: 1,
                     
                                   montantTotal: post.tontine!.montantTotal!.toInt(),
                                   montantTotalMomo: post.tontine!.montantTotalMomo!.toInt(),
                                   montantTotalOm: post.tontine!.montantTotalOm!.toInt(),
                                   totalAmount: post.tontine!.totalAmount!.toInt(),
                                   totalTarget: post.tontine!.totalTarget!.toInt(),
                     
                     
                     
                                 );
                     
                     
                                 Get.to(
                                   duration: Duration(milliseconds: 2500),
                     
                                     TransactionView(
                                   dataassociation: item,
                                 ),transition: Transition.cupertino);
                               },
                               child: LastTransaction(
                                 transaction: post,
                               )
                           )
                         ],
                       ),
                     ),
                   );
                 }):Column(
               children: [
                 for (var i = 0; i < 5; i++)
                   const Padding(
                     padding: EdgeInsets.all(8.0),
                     child: CardShimmer(),
                   ),
               ],
             ))
            ],
          ),
        ),
      ),
    ));
  }

  _association() {
    return GetBuilder<Controller>(
        builder: (c) =>
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

              if(  c.associationdata.isNotEmpty)
                IBMPlexSans(
                  text: 'myAssociations'.tr,
                  fontWeight: FontWeight.w600,
                  size: 20.sp,
                ),
                SizedBox(
                  height: 1.h,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: c.associationdata
                        .map((item) => Row(
                      children: item.items!
                          .map((e) => Delatanimationwidget(
                        delay: 2,
                            child: StructureCard(
                                                    data: e,
                            ),
                          ))
                          .toList(),
                    ))
                        .toList(),
                  ),
                )
              ],
            )
    );
  }

  _joinassociation() {
    return DottedBorder(
      dashPattern: const [5, 4],
      color: ColorApp.primary,
      borderType: BorderType.RRect,
      radius: Radius.circular(12),
      padding: EdgeInsets.all(4),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: InkWell(
          onTap: () {
            modal();
          },
          child: SizedBox(
            height: 6.h,
            width: 40.w,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.add,
                    color: ColorApp.secondary,
                  ),
                  Text(
                    'joinAssociation'.tr,
                    textAlign: TextAlign.center,
                    style:
                        const TextStyle(color: Color(0xff374957), fontSize: 12),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  
}
