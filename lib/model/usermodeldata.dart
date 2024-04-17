import 'dart:convert';

import 'package:get/get.dart';
import 'package:mendocoti_appmobile_flutter/model/profilusermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/controller/controller.dart';
import '../view/Authentification/loginpage.dart';
import '../view/home/homepage.dart';

class UserModeldata {
  int? id;
  String? email;
  String? authKey;
  String? passwordResetTokenNumber;
  String? createdAt;
  String? lastConnect;
  String? role;
  String? accessToken;
  String? token;
  String? expiresAt;
  int? fiol;

  UserModeldata(
      {this.id,
        this.email,
        this.authKey,
        this.passwordResetTokenNumber,
        this.createdAt,
        this.lastConnect,
        this.role,
        this.accessToken,
        this.token,
        this.expiresAt,
        this.fiol});

  static UserModeldata? sessionusers;

  UserModeldata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    authKey = json['auth_key'];
    passwordResetTokenNumber = json['password_reset_token_number'];
    createdAt = json['created_at'];
    lastConnect = json['last_connect'];
    role = json['role'];
    accessToken = json['access_token'];
    token = json['token'];
    expiresAt = json['expires_at'];
    fiol = json['fiol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['auth_key'] = this.authKey;
    data['password_reset_token_number'] = this.passwordResetTokenNumber;
    data['created_at'] = this.createdAt;
    data['last_connect'] = this.lastConnect;
    data['role'] = this.role;
    data['access_token'] = this.accessToken;
    data['token'] = this.token;
    data['expires_at'] = this.expiresAt;
    data['fiol'] = this.fiol;
    return data;
  }
  static void saveusers(UserModeldata users) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var data = jsonEncode(users.toJson());
    pref.setString('user', data);
    pref.commit();
  }

  static void getusers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('user');
    var decode = jsonDecode(data!);
    var users = UserModeldata.fromJson(decode);
    sessionusers = users;
    print(sessionusers!.id);


  }

  static void logout() async {
    SharedPreferences p = await SharedPreferences.getInstance();
    p.setString("user", "");
    sessionusers = null;
    Profiluser.logout();
    Get.off(Login());
    Controller c = Get.find();
     c.profiluser.clear;
   c.associationdata.clear;
    c.lasttransaction.clear;
    p.commit();


  }
}
