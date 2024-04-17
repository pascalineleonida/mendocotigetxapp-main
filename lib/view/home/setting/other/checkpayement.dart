import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../../component/style/color.dart';
import '../../../../component/widget/cardcheck.dart';
import '../../../../component/widget/text_ibm_plex_sans.dart';
import '../../../../model/checkpaymodel.dart';
import '../../../../service/callapi/structure/structureapicall.dart';
import '../../../../util/helpers/app_date.dart';

class Checkpayment extends StatefulWidget {
  const Checkpayment({super.key});

  @override
  State<Checkpayment> createState() => _CheckpaymentState();
}

class _CheckpaymentState extends State<Checkpayment> {

  List<CheckPayModel> paychek = [];






  getstatus(_scanBarcode)async{
    EasyLoading.show();
var data =  await StructureAPIcall.checkpayementstatus(_scanBarcode);
if(data!=null){
  paychek.clear();
  setState(() {
    paychek.add(CheckPayModel.fromJson(data));
  });
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
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: paychek.map((item) => CardCheck(
                      associationName: item.tontine!.association!.name,
                      dataProjetName: item.tontine!.name,
                      paymentCode: item.paymentCode,
                      targetAmount: item.tontine!.totalTarget.toString(),
                      userInfo:item.member!.name,
                      isGold: item.gold.toString(),
                      transactionamount: item.amount.toString(),
                      transactioncreatedAt:
                      " ${AppDate.dateTimeWithDay(DateTime.parse(item.createdAt.toString()),)}",
                      transactionnumber: item.number,
                      transactionpaymentCode:
                      item.paymentCode,
                      transactionprovider: item.provider,
                      transactionstatus: item.status,
                    )).toList(),)))));
  }
  modalcardpayement();

}
  }


  String _scanBarcode = "";
  TextEditingController code = TextEditingController();

  Future<void> scanQR() async {
    String barcodeScanRes = "";
// Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

// If the widget was removed from the tree while the asynchronous platform
// message was in flight, we want to discard the reply rather than calling
// setState to update our non-existent appearance.
    if (!mounted) return;
    setState(() {
      _scanBarcode = barcodeScanRes;

      if (_scanBarcode == "-1") {
        _scanBarcode = "";
      } else if (_scanBarcode != "-1") {
        print("win");
        print(_scanBarcode);
      getstatus(_scanBarcode);

      }
    });
  }




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: IBMPlexSans(
          text: "other".tr,
          color: const Color(0xff3E3E3E),
          fontWeight: FontWeight.w600,
          size: 18,
        ),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              scanQR();
              // checkpayement();



            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 10,
                    backgroundColor: ColorApp.textColor2,
                    child: Icon(
                      Icons.check,
                      size: 12,
                      color: ColorApp.onSecondary,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IBMPlexSans(
                        text: "checktransaction".tr,
                        color: ColorApp.oncheckbagroundtext,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w600,
                      ),
                      IBMPlexSans(
                        text: 'describetransaction'.tr,
                        color: ColorApp.textColor2,
                        size: 12,
                        textAlign: TextAlign.start,
                      ),
                      const Divider()
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
