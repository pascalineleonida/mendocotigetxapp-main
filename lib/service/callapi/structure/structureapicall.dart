import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:mendocoti_appmobile_flutter/component/style/color.dart';
import 'package:mendocoti_appmobile_flutter/component/widget/text_ibm_plex_sans.dart';
import 'package:mendocoti_appmobile_flutter/model/usermodel.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../appconfig/constant.dart';
import 'package:http/http.dart' as http;

import '../../../model/projetmodel.dart';
import '../../../model/usermodeldata.dart';
import '../../../view/home/homepage.dart';

class StructureAPIcall {
  static checkAssociation(code) async {
    print("user");
    String urlcheckstructure = "${Constants.baseUrl}/associations/$code";

    var response = await http.get(Uri.parse(urlcheckstructure));
    var data = jsonDecode(response.body);
    print(data);

    if (response.statusCode == 200) {
      EasyLoading.dismiss();
      return data;
    } else if (response.statusCode == 401) {
      EasyLoading.dismiss();
    }else if (response.statusCode == 404) {
      print("1");
      EasyLoading.dismiss();
      Get.defaultDialog(
          backgroundColor: Colors.white,
          buttonColor: ColorApp.primary,
          onConfirm: () => Get.back(),
          title: "Information",
          actions: [
            Container(
              padding: EdgeInsets.all(8.0),
              child: Text(

                data["message"],textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16.sp),
              ),
            )
          ],
          middleText: "");

    }
  }

  static checkStructure() async {
    print("user");
    String urlcheckstructure =
        "${Constants.baseUrl}/member/${UserModeldata.sessionusers!.id.toString()}/associations";

    var response = await http.get(Uri.parse(urlcheckstructure), headers: {
      "X-Api-Key": UserModeldata.sessionusers!.accessToken.toString(),
    });
    var data = jsonDecode(response.body);
    print(data);

    if (response.statusCode == 200) {
      EasyLoading.dismiss();
      return data;
    } else if (response.statusCode == 401) {
      EasyLoading.dismiss();
    }
  }

  static getprojetbycategories(idcategorie) async {
    var url =
        "${Constants.baseUrl}/associations/categories/projets/$idcategorie";
    var responses = await http.get(Uri.parse(url), headers: {
      "X-Api-Key": UserModeldata.sessionusers!.accessToken.toString(),
    });
    var data = jsonDecode(responses.body);

    if (responses.statusCode == 200) {
      EasyLoading.dismiss();
      return data;
    } else if (responses.statusCode == 401 && data["name"] == "Unauthorized") {
      EasyLoading.dismiss();
    }
  }

  static getprojetbycategorie(idcategorie) async {
    print("user");
    // idcategorie = 6;
    print(idcategorie);
    var url =
        "${Constants.baseUrl}/associations/categories/projets/$idcategorie";
    final response = await http.get(Uri.parse(url), headers: {
      "X-Api-Key": UserModeldata.sessionusers!.accessToken.toString(),
    });
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      EasyLoading.dismiss();
      // EasyLoading.dismiss();
      print(data);
      return data;
    } else if (response.statusCode == 401) {
      EasyLoading.dismiss();
    }
  }

  static payforprojet(
      context, memberId, amount, number, provider, tontineId,reference) async {
    print("tontineId");
    print(tontineId);
    print("tontineId");
    print(memberId);
    print("memberId");
    print(amount);


    var urlpay = "${Constants.baseUrl}/associations/tontine/buy";

    var response = await http.post(Uri.parse(urlpay), headers: {
      "X-Api-Key": UserModeldata.sessionusers!.accessToken.toString(),
    }, body: {
      if (memberId != null) 'memberId': memberId.toString(),
      'amount': amount.toString(),
      'number': number.toString(),
      'provider': provider.toString(),
      'tontineId': tontineId.toString(),
      if (reference != null)'reference': reference.toString(),
    });

    var data = jsonDecode(response.body);
    print(data);
    print(response.reasonPhrase);
    print(response.statusCode);

    if (response.statusCode == 200) {
      EasyLoading.dismiss();
      if(data!=null){
        Get.snackbar(
          // backgroundColor: ColorApp.primary.withOpacity(0.1),
          "infopay".tr,
          "",
          // ),
          titleText: IBMPlexSans(
            text: "inittransaction".tr,
            color: Colors.white,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w600,
            size: 18.sp,
          ),

          overlayBlur: 5,
        );
      }


      //Get.off(HomepageView(login: () {  },),transition:Transition.zoom,duration: Duration(seconds: 3));
    } else if (response.statusCode == 422) {
      EasyLoading.dismiss();
      // ScaffoldMessenger.of(context).showSnackBar( SnackBar(
      //   content: Text(data["details"].toString()),
      //   backgroundColor: Colors.red,
      // ));
    }else if(response.statusCode == 406){
      Get.snackbar(
        // backgroundColor: ColorApp.primary.withOpacity(0.1),
        "infopay".tr,
        "",

        // ),
        titleText: IBMPlexSans(
          text: "inittransaction".tr,
          color: Colors.white,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w600,
          size: 18.sp,
        ),

        overlayBlur: 5,
      );
    }
  }

  static checktransaction(tontineId) async {
    print("up");
    var headers = {
      'X-Api-Key': UserModeldata.sessionusers!.accessToken.toString(),
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            '${Constants.baseUrl}/member/transaction/tontine/$tontineId'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    final data = await response.stream.bytesToString();
    final jsondata = jsonDecode(data);

    if (response.statusCode == 200) {
      EasyLoading.dismiss();
      return jsondata;
    } else {
      EasyLoading.dismiss();
      print(response.reasonPhrase);
    }
  }

  static checklastransaction() async {
    var headers = {
      'X-Api-Key': UserModeldata.sessionusers!.accessToken.toString(),
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            '${Constants.baseUrl}/member/${UserModeldata.sessionusers!.id.toString()}/payer-tontines'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    final data = await response.stream.bytesToString();
    final send = json.decode(data);

    print(data);
    print(send);

    if (response.statusCode == 200) {
      EasyLoading.dismiss();
      return send;
    } else {
      EasyLoading.dismiss();
      print(response.reasonPhrase);
    }
  }

  static checkpayementstatus(paymencode) async {
    var url = Constants.baseUrl +
        "/associations/tontine/check/status/payment?paymentCode=$paymencode";
    var response = await http.post(Uri.parse(url), headers: {
      "X-Api-Key": UserModeldata.sessionusers!.accessToken.toString(),
    });
    var data = json.decode(response.body);

    if (response.statusCode == 200) {
      EasyLoading.dismiss();
      return data;
    } else {
      // Get.snackbar(
      //     "Verification indisponible pour le moment", // title
      //     "", // message
      //     icon: Icon(Icons.alarm),
      //     shouldIconPulse: true,
      //     snackPosition: SnackPosition.TOP,
      //     overlayColor: Colors.red,
      //     barBlur: 20,
      //     isDismissible: true,
      //     duration: Duration(seconds: 3),
      //
      //   );
      Fluttertoast.showToast(
          msg: "transaction en attente",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0
      );
      EasyLoading.dismiss();
    }
    print(data);
  }

  static askAssociation(code) async {
    print("user");

    print(code);
    print(UserModeldata.sessionusers!.accessToken.toString());
    print(UserModeldata.sessionusers!.id.toString());
    String urlaskstructure = "${Constants.baseUrl}/associations/member";

    var response = await http.post(Uri.parse(urlaskstructure), headers: {
      "X-Api-Key": UserModeldata.sessionusers!.accessToken.toString(),
    }, body: {
      // "memberId":UserModeldata.sessionusers!.id.toString(),
      "code": code,
    });
    var data = jsonDecode(response.body);

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
       EasyLoading.dismiss();
       Get.snackbar(
         backgroundColor: ColorApp.primary,
           "${Constants.appname}", // title
           "operationsucceffull".tr,
           snackStyle: SnackStyle.GROUNDED,

           shouldIconPulse: true,
           overlayBlur: 5,

           snackPosition: SnackPosition.TOP,
           isDismissible: true,

           duration: Duration(milliseconds: 400));
      // return data;
    } else if (response.statusCode == 422) {
      EasyLoading.dismiss();
      Get.defaultDialog(
        backgroundColor: Colors.white,
          buttonColor: ColorApp.primary,
          onConfirm: () => Get.back(),
          title: "Information",
          actions: [
            Container(
              padding: EdgeInsets.all(8.0),
              child: Text(

                data["details"]["memberId"],textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16.sp),
              ),
            )
          ],
          middleText: "");

    } else if (response.statusCode == 401) {

      EasyLoading.dismiss();
      UserModel.logout();
    }else if (response.statusCode == 401) {

      EasyLoading.dismiss();
      UserModel.logout();
    }
  }


  static checkpayement(_scanBarcode) async {
    var url =
        "${Constants.baseUrl}/associations/tontine/get/status/payment?paymentCode=$_scanBarcode";
    var response = await http.get(Uri.parse(url), headers: {
      "X-Api-Key": UserModeldata.sessionusers!.accessToken.toString(),
    });
    var data = json.decode(response.body);
    print(data);
    if (response.statusCode == 200) {
      EasyLoading.dismiss();
      if (data != null) {

      }
    } else if(response.statusCode == 500){
      EasyLoading.dismiss();
      // Navigator.pop(context);
      // Timer(Duration(seconds: 2), () {
      //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(showCloseIcon: true,closeIconColor: Colors.white,
      //     content: Text("Erreur interne survenue au niveau du serveur"),
      //     backgroundColor: ColorsApp.errors,
      //   ));
      // });
    }


    else {

    }
  }



}
