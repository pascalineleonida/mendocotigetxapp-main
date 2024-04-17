import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mendocoti_appmobile_flutter/component/widget/text_ibm_plex_sans.dart';
import 'package:mendocoti_appmobile_flutter/view/Authentification/loginpage.dart';

import '../../../appconfig/constant.dart';
import 'package:http/http.dart' as http;

import '../../../component/style/color.dart';
import '../../../model/profilusermodel.dart';
import '../../../model/usermodel.dart';
import '../../../model/usermodeldata.dart';
import '../../../view/home/homepage.dart';
import '../../controller/controller.dart';
import 'package:http_parser/http_parser.dart';

class Authentification {
  static var urlregisteruser = "${Constants.baseUrl}/account/member/signup";
  static var urlrlogin = "${Constants.baseUrl}/account/login";
  static var urlchangepassword = "${Constants.baseUrl}/account/reset/password";
  Controller c = Get.find();

  static login(context, email, password) async {
    Controller c = Get.find();
    try {
      var response = await http.post(Uri.parse(urlrlogin), body: {
        'username': email,
        'password': password,
      }).timeout(Duration(seconds: 30));
      var data = jsonDecode(response.body);
      print(data);
      if (response.statusCode == 200) {
        UserModeldata.saveusers(UserModeldata.fromJson(data));
        UserModeldata.getusers();
        EasyLoading.dismiss();
        Get.snackbar(
            "${Constants.appname}", // title
            "welcomebar".tr,
            snackStyle: SnackStyle.GROUNDED,

            //  message
            icon: Icon(Icons.login),
            shouldIconPulse: true,
            overlayBlur: 5,
            snackPosition: SnackPosition.TOP,
            isDismissible: true,
            duration: Duration(milliseconds: 400));
        Get.off(
            HomepageView(
              login: () {},
            ),
            transition: Transition.zoom,
            duration: Duration(milliseconds: 400));
      } else if (response.statusCode == 422) {
        EasyLoading.dismiss();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(data["details"]["password"].toString()),
          backgroundColor: Colors.red,
        ));
      }
    } on TimeoutException catch (e) {
      // Gérer l'exception de délai d'attente ici
      print('La requête a dépassé le délai d\'attente');
      EasyLoading.dismiss();
      c.showDialogBoxerror(context);
    } catch (e) {
      // Gérer les autres exceptions ici
      print('Une autre erreur s\'est produite: $e');
      EasyLoading.dismiss();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("adresse ip de l'operateur non reconnu par le systeme"),
        backgroundColor: Colors.red,
      ));
    }
  }

  static checkpin(BuildContext context, pin) async {
    print("params");
    print(pin);
    var url =
        "${Constants.baseUrl}/account/check/pin/password/forgot?token=$pin";
    var response = await http.get(
      Uri.parse(url),
    );

    var data = jsonDecode(response.body);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      EasyLoading.dismiss();
      print(data);
      print(data);
      return data;
    } else {
      EasyLoading.dismiss();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Code Pin inseré Invalide")));
    }
    // print(data);
  }

  static resetpassword(BuildContext context, password, token) async {
    print(password);
    print(token);
    var url = "${Constants.baseUrl}/account/reset/password/forgot?token=$token";
    var response = await http.post(Uri.parse(url), headers: {}, body: {
      "password": password.toString(),
    });
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      EasyLoading.dismiss();
      Get.off(Login());
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("mots de passe ont ete modifie avec succes"),
        backgroundColor: ColorApp.greenColor,
      ));

      return data;
    } else {
      EasyLoading.dismiss();
      print(data);
    }
    // print(data);
  }

  static changepassword(context, password, new_password) async {
    print("user");

    var response = await http.post(Uri.parse(urlchangepassword), headers: {
      "X-Api-Key": UserModeldata.sessionusers!.accessToken.toString(),
    }, body: {
      'password': password,
      'new_password': new_password,
    });

    var data = jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      EasyLoading.dismiss();
      Get.snackbar(
          "${Constants.appname}", // title
          "msgPasswordSuccess".tr,
          snackStyle: SnackStyle.GROUNDED,

          //  message
          icon: Icon(Icons.login),
          shouldIconPulse: true,
          overlayBlur: 5,
          snackPosition: SnackPosition.TOP,
          isDismissible: true,
          duration: Duration(milliseconds: 400));
    } else if (response.statusCode == 422) {
      EasyLoading.dismiss();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(data["details"].toString()),
        backgroundColor: Colors.red,
      ));
    }
  }

  static getinfouser() async {
    final url = "${Constants.baseUrl}/member/${UserModeldata.sessionusers!.id}";
    final responses = await http.get(
      Uri.parse(url),
      headers: {
        "X-Api-Key": UserModeldata.sessionusers!.accessToken.toString(),
      },
    );
    print(responses.body);
    var data = json.decode(responses.body);
    print(data);
    if (responses.statusCode == 200) {
      Profiluser.saveusers(Profiluser.fromJson(data));
      Profiluser.getusers();
      return data;
      // profiluser.add(Userinfomodels.fromJson(data));
      // Userinfomodels.saveusers(Userinfomodels.fromJson(data));
    } else if (responses.statusCode == 401) {
      UserModeldata.logout();
    }
  }

  static getuser(code) async {
    final url = "${Constants.baseUrl}/member/${code}";
    final responses = await http.get(
      Uri.parse(url),
      headers: {
        "X-Api-Key": UserModeldata.sessionusers!.accessToken.toString(),
      },
    );
    print(responses.body);
    var data = json.decode(responses.body);
    print(data);
    if (responses.statusCode == 200) {
      EasyLoading.dismiss();
      // Profiluser.saveusers(Profiluser.fromJson(data));
      // Profiluser.getusers();
      return data;
      // profiluser.add(Userinfomodels.fromJson(data));
      // Userinfomodels.saveusers(Userinfomodels.fromJson(data));
    } else if (responses.statusCode == 401) {
      UserModeldata.logout();
    } else if (responses.statusCode == 404) {
      EasyLoading.dismiss();

      Get.snackbar(
        
        // backgroundColor: Colors.red.withOpacity(0.8),
        duration: Duration(seconds: 5),
        "",
        '',
        titleText: IBMPlexSans(
          text: data["message"],
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
        overlayBlur: 5.0,
        snackPosition: SnackPosition.BOTTOM,
        forwardAnimationCurve: Curves.elasticInOut,
        reverseAnimationCurve: Curves.easeOut,
      );
    }
  }

  static Future updateinfouser(
      BuildContext context, name, residence, phone1, firstName, phone2) async {
    //final urls = Constants.baseUrl+'/member/21/associations';
    Controller c = Get.find();
    final url = "${Constants.baseUrl}/member/${UserModeldata.sessionusers!.id}";
    final responses = await http.put(Uri.parse(url), headers: {
      "X-Api-Key": UserModeldata.sessionusers!.accessToken.toString(),
    }, body: {
      'name': name.toString(),
      'residence': residence.toString(),
      'phone1': phone1.toString() == "" ? "00000000" : phone1.toString(),
      'first_name': firstName.toString(),
      'phone2': phone2.toString(),
    });
    var data = jsonDecode(responses.body);
    print(data);
    if (responses.statusCode == 200) {
      EasyLoading.dismiss();
      c.checfirstpage();
      print(responses.body);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("vos informations ont ete modifie avec succes"),
        backgroundColor: ColorApp.greenColor,
      ));
    } else {
      EasyLoading.dismiss();
    }
  }

  static updatepicture() async {
    Controller c = Get.find();
    var headers = {
      "X-Api-Key": UserModeldata.sessionusers!.accessToken.toString(),
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${Constants.baseUrl}/account/update/image'));
    request.fields.addAll({
      'profile': "user",
      'type': "logo",
    });
    c.allimage.map((item) async {
      return request.files.add(
        await http.MultipartFile.fromPath('name[]', item.path,
            filename: item.path.split("/").last,
            contentType: MediaType('image', 'jpeg')),
      );
    }).toList();

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      var responseJson = jsonDecode(responseBody);
      if (responseJson != null) {
        Get.snackbar(
            "Information", // title
            "photoupdate".tr,
            snackStyle: SnackStyle.GROUNDED,
            //  message
            icon: Icon(Icons.check_circle_outline),
            shouldIconPulse: true,
            overlayBlur: 5,
            snackPosition: SnackPosition.TOP,
            isDismissible: true,
            duration: Duration(milliseconds: 400));

        print(responseJson);
      } else {
        Get.snackbar(
            "Information", // title
            "photoupdate".tr,
            snackStyle: SnackStyle.GROUNDED,
            //  message
            icon: Icon(Icons.error_outline),
            shouldIconPulse: true,
            snackPosition: SnackPosition.BOTTOM,
            overlayColor: Colors.red,
            isDismissible: true,
            duration: Duration(milliseconds: 400));
      }
    } else {
      print(response.reasonPhrase);
    }
  }

  static insertuser(email, password, firstName, lastName, birthday, gender,
      phoneNumber, context) async {
    print("user");

    var response = await http.post(Uri.parse(urlregisteruser), body: {
      'email': email,
      'password': password,
      'first_name': firstName,
      'name': lastName,
      'birth_day': birthday,
      'gender': gender,
      'phone1': phoneNumber,
    });

    var data = jsonDecode(response.body);
    print(data);
    print(response.statusCode);

    if (response.statusCode == 200) {
      EasyLoading.dismiss();

      Get.to(Login());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("userregistersuccefull".tr),
        backgroundColor: ColorApp.primary,
      ));
    } else if (response.statusCode == 422) {
      EasyLoading.dismiss();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("emailuse".tr),
        backgroundColor: Colors.red,
      ));
    }
  }

  static sendemail(email) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${Constants.baseUrl}/account/forgot/password'));
    request.fields.addAll({'email': email.toString()});

    http.StreamedResponse response = await request.send();
    print(response);

    var data = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      EasyLoading.dismiss();

      return data;
    } else {
      print(response.reasonPhrase);
      EasyLoading.dismiss();
    }
  }
}
