import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';

import 'package:mendocoti_appmobile_flutter/component/widget/text_ibm_plex_sans.dart';
import 'package:mendocoti_appmobile_flutter/model/usermodel.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../util/helpers/app_date.dart';
import '../../../util/helpers/regex_format.dart';

import 'package:http/http.dart' as http;

import '../../model/profilusermodel.dart';
import '../../model/transactionpaymodel.dart';
import '../../service/callapi/structure/structureapicall.dart';
import '../style/color.dart';
import 'cardcheck.dart';

class TransactionCard extends StatefulWidget {
   TransactionCard(
      {super.key,
      required this.transaction,
      this.targetamount,
      this.dataProject,
      this.dataProjetName,
      this.structurenameadd,
      this.projetnameadd});

  final Item transaction;

  final List? dataProject;
  final String? structurenameadd;
  final String? projetnameadd;
  final String? dataProjetName;
  final String? targetamount;


  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  modalcardpayement() {
    Get.bottomSheet(
        enableDrag: true,
        isDismissible: true,
        isScrollControlled: true,
        barrierColor: Colors.black.withOpacity(0.3),
        exitBottomSheetDuration: Duration(milliseconds: 400),
        enterBottomSheetDuration: Duration(milliseconds: 400),
        elevation: 25,
        Material(
            color: Colors.transparent,
            animationDuration: Duration(milliseconds: 400),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Container(
                    width: double.infinity,
                    child: CardCheck(
                      associationName: widget.projetnameadd,
                      dataProjetName: widget.dataProjetName,
                      paymentCode: widget.transaction.paymentCode,
                      targetAmount: widget.targetamount,
                      userInfo:Profiluser.sessionusers!.name.toString(),
                      isGold: widget.transaction.gold.toString(),
                      transactionamount: widget.transaction.amount.toString(),
                      transactioncreatedAt:
                          " ${AppDate.dateTimeWithDay(DateTime.parse(widget.transaction.createdAt.toString()),)}",
                      transactionnumber: widget.transaction.number,
                      transactionpaymentCode:
                          widget.transaction.payTokenProvider,
                      transactionprovider: widget.transaction.provider,
                      transactionstatus: widget.transaction.status.toString(),
                    )))));
  }

  checkpayement() async {
    var data = await StructureAPIcall.checkpayementstatus(
        widget.transaction.paymentCode,);
    if(data!=null){
      Fluttertoast.showToast(
           msg: data,
           toastLength: Toast.LENGTH_SHORT,
           gravity: ToastGravity.BOTTOM,
           timeInSecForIosWeb: 2,
           backgroundColor: Colors.white,
           textColor: ColorApp.primary,
           fontSize: 16.0
       );

    }
// print(data);
//     if (data != null) {
//       // print(data["status"].toString());
//       // print("on");
//       // Get.snackbar(
//       //   backgroundColor: Colors.white,
//       //
//       //   "",
//       //   // title
//       //   "",
//       //   titleText: IBMPlexSans(
//       //     text: "${data["status"]}",
//       //     fontWeight: FontWeight.bold,
//       //     size: 15.sp,
//       //     color: data["status"]=="EXPIRED"?Colors.red:ColorApp.primary,
//       //   ),
//       //   // message
//       //   icon: Icon(Icons.error),
//       //   shouldIconPulse: true,
//       //   snackPosition: SnackPosition.BOTTOM,
//       //
//       //   isDismissible: true,
//       //   duration: Duration(seconds: 3),
//       // );
//       Fluttertoast.showToast(
//           msg: "${int.parse(data["status"])}",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 2,
//
//           backgroundColor: Colors.white,
//           textColor: ColorApp.primary,
//           fontSize: 16.0
//       );
//
//
//
//     } else {}
//     print(data);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(widget.transaction.status.toString());
        modalcardpayement();
        // modalcheckpayement();
        checkpayement();
      },
      child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 8),
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
              gradient: widget.transaction.gold.toString() == "0"
                  ? LinearGradient(
                      colors: [ColorApp.background, ColorApp.background])
                  : LinearGradient(
                      begin: Alignment(1.00, -0.05),
                      end: Alignment(-1, 0.05),
                      colors: [
                        Color(0xFFBA8E49),
                        Color(0xFFF1DC7E),
                        Color(0xFFE0AD49),
                        Color(0xFFF1DD81),
                        Color(0xFFE7C162)
                      ],
                    ),
              borderRadius: BorderRadius.circular(4)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IBMPlexSans(
                          text:
                              '${RegexFormat.moneyFormat(widget.transaction.amount.toString())}'
                              ' Fcfa',
                          color: widget.transaction.gold.toString() == "0"
                              ? Color(0xff676767)
                              : Color(0xFFC77C00),
                          fontWeight: FontWeight.bold,
                          size: 26,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        IBMPlexSans(
                          text: widget.transaction.number != null
                              ? RegexFormat.formatPhone(widget
                                  .transaction.number
                                  .toString()
                                  .replaceAll(' ', ''))
                              : '',
                          color: const Color(0xff676767),
                          fontWeight: FontWeight.w300,
                          size: 10,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Container(
                          width: 1,
                          color: ColorApp.textColor2.withOpacity(0.2),
                          height: 12,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        widget.transaction.provider!.toUpperCase() == "OM"
                            ? SizedBox(
                                width: 24,
                                child: Image.asset(
                                  "assets/images/Orange Money Logo.png",
                                  fit: BoxFit.fitHeight,
                                ),
                              )
                            : SizedBox(
                                width: 24,
                                child: Image.asset(
                                  "assets/images/logo-mtn-momo.png",
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                        const SizedBox(
                          width: 4,
                        ),
                        Container(
                          width: 1,
                          color: ColorApp.textColor2.withOpacity(0.2),
                          height: 12,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          // widget.transaction.createdAt != null
                          //     ? AppDate.dateTimeLetter(
                          //     widget.transaction.createdAt!, 'fr')
                          //     :
                          '${widget.transaction.createdAt.toString()}',
                          style: const TextStyle(
                              fontSize: 10,
                              color: ColorApp.textColor2,
                              fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Container(
                          width: 1,
                          color: ColorApp.textColor2.withOpacity(0.2),
                          height: 12,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        widget.transaction.status.toString() == "SUCCESSFULL"
                            ? Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 5,
                                    backgroundColor: Color(0xff02AF25),
                                    child: Icon(
                                      Icons.check,
                                      size: 5,
                                      color: ColorApp.onPrimary,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  IBMPlexSans(
                                    text: "chektransaction".tr,
                                    color: ColorApp.greenColorcheck,
                                    size: 8,
                                    fontStyle: FontStyle.italic,
                                  )
                                ],
                              )
                            : const Row(
                                children: [
                                  CircleAvatar(
                                    radius: 5,
                                    backgroundColor: ColorApp.textColor2,
                                    child: Icon(
                                      Icons.access_time,
                                      size: 5,
                                      color: ColorApp.onPrimary,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  IBMPlexSans(
                                    text: "transaction en attente",
                                    color: ColorApp.textColor2,
                                    size: 8,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ]),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: CircleAvatar(
                    radius: 12,
                    backgroundColor: widget.transaction.gold.toString() == "0"
                        ? Color(0xff676767).withOpacity(0.2)
                        : Color(0xFFC77C00).withOpacity(0.3),
                    child: Icon(
                      Icons.navigate_next,
                      size: 18.px,
                      color: widget.transaction.gold.toString() == "0"
                          ? Color(0xff676767)
                          : Color(0xFFC77C00),
                    )),
              )
            ],
          )),
    );
  }
}
