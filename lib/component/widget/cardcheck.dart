import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mendocoti_appmobile_flutter/component/widget/text_ibm_plex_sans.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:qr_flutter/qr_flutter.dart';


import '../style/color.dart';
import 'clippart.dart';
import 'footerpage.dart';

class CardCheck extends StatelessWidget {
  final String? paymentCode;
  final String? associationName;
  final String? dataProjetName;
  final String? Infouser;
  final String? transactionamount;
  final String? transactionnumber;
  final String? transactionpaymentCode;
  final String? transactionprovider;
  final String? transactioncreatedAt;
  final String? transactionstatus;
  final String? userInfo;
  final String? targetAmount;
  final String? isGold;

  const CardCheck(
      {super.key,
        this.paymentCode,
        this.associationName,
        this.dataProjetName,
        this.Infouser,
        this.transactionamount,
        this.transactionnumber,
        this.transactionpaymentCode,
        this.transactionprovider,
        this.transactionstatus,
        this.isGold,
        this.targetAmount,
        this.transactioncreatedAt,
        this.userInfo});

  @override
  Widget build(BuildContext context) {
    const goldGradient = LinearGradient(
      begin: Alignment(0.00, -1.00),
      end: Alignment(0, 1),
      colors: [
        Color(0xFFE3B553),
        Color(0xFFF8F29A),
        Color(0xFFDEA742),
        Color(0xFFFBF69B),
        Color(0xFFB78A46)
      ],
    );
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 1.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipPath(
            clipper: MyCustomClipper2(),
            child: Container(
              height: 85.h.px,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                gradient: isGold == "1" ? goldGradient : null,
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            IBMPlexSans(
                              text: "QR Code de la transaction",
                              color: ColorApp.onBackground,
                              fontWeight: FontWeight.w600,
                              size: 16.sp.px,
                            ),
                            transactionstatus.toString() == "SUCCESSFULL"
                                ? const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: Color(0xff02AF25),
                                child: Icon(
                                  Icons.check,
                                  size: 15,
                                  color: ColorApp.onPrimary,
                                ),
                              ),
                            )
                                : const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: ColorApp.textColor2,
                                child: Icon(
                                  Icons.access_time,
                                  size: 15,
                                  color: ColorApp.onPrimary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: ColorApp.onPrimary,
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(1, 2),
                                  blurRadius: 4,
                                  color: ColorApp.textColor2.withOpacity(0.3))
                            ],
                            borderRadius: BorderRadius.circular(8)),
                        height: 25.h,
                        child: QrImageView(
                          padding: const EdgeInsets.all(10),
                          eyeStyle: const QrEyeStyle(
                            eyeShape: QrEyeShape.square,
                            color: ColorApp.textColor2,
                          ),
                          dataModuleStyle: const QrDataModuleStyle(
                            dataModuleShape: QrDataModuleShape.square,
                            color: ColorApp.textColor2,
                          ),
                          data: paymentCode.toString(),
                          version: QrVersions.auto,
                          size: 25.h,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      // isGold == true
                      //     ? Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           Padding(
                      //             padding: EdgeInsets.all(1.w),
                      //             child: Icon(
                      //               Icons.photo_camera_outlined,
                      //               color: ColorApp.primary,
                      //               size: 8.w,
                      //             ),
                      //           ),
                      //           Padding(
                      //             padding: EdgeInsets.all(1.w),
                      //             child: Icon(
                      //               Icons.error_outline,
                      //               color: ColorApp.primary,
                      //               size: 8.w,
                      //             ),
                      //           ),
                      //         ],
                      //       )
                      //     : Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           Card(
                      //             elevation: 1.5,
                      //             shape: const CircleBorder(),
                      //             child: Padding(
                      //               padding: EdgeInsets.all(1.w),
                      //               child: Icon(
                      //                 Icons.photo_camera_outlined,
                      //                 color: ColorApp.primary,
                      //                 size: 9.w,
                      //               ),
                      //             ),
                      //           ),
                      //           Card(
                      //             elevation: 1.5,
                      //             shape: const CircleBorder(),
                      //             child: Padding(
                      //               padding: EdgeInsets.all(1.w),
                      //               child: Icon(
                      //                 Icons.error_outline,
                      //                 color: ColorApp.primary,
                      //                 size: 9.w,
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       )
                    ],
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Divider(
                        height: 1,
                        thickness: 1,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Column(
                          children: [
                            IBMPlexSans(
                              text: "infotransact".tr,
                              color: ColorApp.BlueColorhelp,
                              fontWeight: FontWeight.w600,
                              size: 16.sp.px,
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IBMPlexSans(
                                  text: "structurlink".tr,
                                  color: const Color(0xff676767),
                                  size: 15.sp.px,
                                  fontWeight: FontWeight.w500,
                                ),
                                IBMPlexSans(
                                  text: associationName.toString(),
                                  color: ColorApp.textColor2.withOpacity(0.8),
                                  size: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 0.8.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IBMPlexSans(
                                  text: "projetlink".tr,
                                  color: const Color(0xff676767),
                                  size: 15.sp.px,
                                  fontWeight: FontWeight.w500,
                                ),
                                IBMPlexSans(
                                  text: dataProjetName.toString(),
                                  color: ColorApp.primary,
                                  size: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 0.8.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IBMPlexSans(
                                  text: "inittransaction".tr,
                                  color: const Color(0xff676767),
                                  size: 15.sp.px,
                                  fontWeight: FontWeight.w500,
                                ),
                                IBMPlexSans(
                                  text: userInfo.toString(),
                                  color: ColorApp.textColor2.withOpacity(0.8),
                                  size: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 0.8.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IBMPlexSans(
                                  text: "targetAmount".tr,
                                  color: const Color(0xff676767),
                                  size: 15.sp.px,
                                  fontWeight: FontWeight.w500,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IBMPlexSans(
                                      text: targetAmount.toString(),
                                      color:
                                      const Color(0xff374957),
                                      size: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SizedBox(
                                      width: 0.5.w,
                                    ),
                                    IBMPlexSans(
                                      text: "fcfa",
                                      textAlign: TextAlign.end,
                                      color: const Color(0xffCECECE),
                                      size: 12.sp.px,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 0.8.h,
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            SizedBox(
                              height: 0.8.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IBMPlexSans(
                                  text: "montransaction".tr,
                                  color: const Color(0xff676767),
                                  size: 15.sp.px,
                                  fontWeight: FontWeight.w500,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IBMPlexSans(
                                      text: transactionamount.toString(),
                                      color: const Color(0xff374957),
                                      size: 15.sp.px,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SizedBox(
                                      width: 0.5.w,
                                    ),
                                    IBMPlexSans(
                                      text: "fcfa",
                                      textAlign: TextAlign.end,
                                      color: const Color(0xffCECECE),
                                      size: 12.sp.px,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 0.8.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IBMPlexSans(
                                  text: "numberlink".tr,
                                  color: const Color(0xff676767),
                                  size: 15.sp.px,
                                  fontWeight: FontWeight.w500,
                                ),
                                IBMPlexSans(
                                  text: transactionnumber.toString(),
                                  color: const Color(0xff676767),
                                  size: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 0.8.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IBMPlexSans(
                                  text: "buycode".tr,
                                  color: const Color(0xff676767),
                                  size: 15.sp.px,
                                  fontWeight: FontWeight.w500,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: IBMPlexSans(
                                    text: transactionpaymentCode.toString(),
                                    color:
                                    ColorApp.textColor2.withOpacity(0.8),
                                    size: 11.sp.px,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 0.8.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IBMPlexSans(
                                  text: "operateurlink".tr,
                                  color: const Color(0xff676767),
                                  size: 15.sp.px,
                                  fontWeight: FontWeight.w500,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      transactionprovider!.toUpperCase() == "OM"
                                          ? "assets/images/Orange Money Logo.png"
                                          : "assets/images/logo-mtn-momo.png",
                                      fit: BoxFit.fitHeight,
                                      width: 24,
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 0.8.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IBMPlexSans(
                                  text: "date".tr,
                                  color: const Color(0xff676767),
                                  size: 15.sp.px,
                                  fontWeight: FontWeight.w500,
                                ),
                                IBMPlexSans(
                                  text: transactioncreatedAt.toString(),
                                  color: ColorApp.textColor2.withOpacity(0.8),
                                  size: 13.sp.px,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Footer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
