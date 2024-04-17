import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/Authentification/loginpage.dart';

class UserModel {
  User? user;
  Profil? profil;

  UserModel({this.user, this.profil});
  static UserModel? sessionusers;

  UserModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    profil =
    json['profil'] != null ? new Profil.fromJson(json['profil']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.profil != null) {
      data['profil'] = this.profil!.toJson();
    }
    return data;
  }

  static void saveusers(UserModel users) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var data = jsonEncode(users.toJson());
    pref.setString('userinfo', data);
    pref.commit();
  }

  static void getusers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('userinfo');
    var decode = jsonDecode(data!);
    var users = UserModel.fromJson(decode);
    sessionusers = users;
    print(sessionusers!.user!.id.toString());


  }

  static void logout() async {
    SharedPreferences p = await SharedPreferences.getInstance();
    p.setString("userinfo", "");
    sessionusers = null;
    Get.off(Login());
    p.commit();


  }
}

class User {
  String? email;
  String? role;
  int? fiol;
  String? authKey;
  String? accessToken;
  String? expiresAt;
  String? createdAt;
  int? id;

  User(
      {this.email,
        this.role,
        this.fiol,
        this.authKey,
        this.accessToken,
        this.expiresAt,
        this.createdAt,
        this.id});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    role = json['role'];
    fiol = json['fiol'];
    authKey = json['auth_key'];
    accessToken = json['access_token'];
    expiresAt = json['expires_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['role'] = this.role;
    data['fiol'] = this.fiol;
    data['auth_key'] = this.authKey;
    data['access_token'] = this.accessToken;
    data['expires_at'] = this.expiresAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

class Profil {
  String? name;
  String? firstName;
  String? birthDay;
  String? gender;
  String? phone1;
  int? id;
  String? createdAt;
  int? code;
  String? mail;
  Null? associations;
  Null? isFiol;
  int? countTransaction;
  int? montantTotal;
  int? montantTotalMomo;
  int? montantTotalOm;
  Epargne? epargne;
  Null? imageLogo;
  Null? imageBanner;
  Url? url;

  Profil(
      {this.name,
        this.firstName,
        this.birthDay,
        this.gender,
        this.phone1,
        this.id,
        this.createdAt,
        this.code,
        this.mail,
        this.associations,
        this.isFiol,
        this.countTransaction,
        this.montantTotal,
        this.montantTotalMomo,
        this.montantTotalOm,
        this.epargne,
        this.imageLogo,
        this.imageBanner,
        this.url});

  Profil.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    firstName = json['first_name'];
    birthDay = json['birth_day'];
    gender = json['gender'];
    phone1 = json['phone1'];
    id = json['id'];
    createdAt = json['createdAt'];
    code = json['code'];
    mail = json['mail'];
    associations = json['associations'];
    isFiol = json['is_fiol'];
    countTransaction = json['count_transaction'];
    montantTotal = json['montant_total'];
    montantTotalMomo = json['montant_total_momo'];
    montantTotalOm = json['montant_total_om'];
    epargne =
    json['epargne'] != null ? new Epargne.fromJson(json['epargne']) : null;
    imageLogo = json['image_logo'];
    imageBanner = json['image_banner'];
    url = json['Url'] != null ? new Url.fromJson(json['Url']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['birth_day'] = this.birthDay;
    data['gender'] = this.gender;
    data['phone1'] = this.phone1;
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['code'] = this.code;
    data['mail'] = this.mail;
    data['associations'] = this.associations;
    data['is_fiol'] = this.isFiol;
    data['count_transaction'] = this.countTransaction;
    data['montant_total'] = this.montantTotal;
    data['montant_total_momo'] = this.montantTotalMomo;
    data['montant_total_om'] = this.montantTotalOm;
    if (this.epargne != null) {
      data['epargne'] = this.epargne!.toJson();
    }
    data['image_logo'] = this.imageLogo;
    data['image_banner'] = this.imageBanner;
    if (this.url != null) {
      data['Url'] = this.url!.toJson();
    }
    return data;
  }
}

class Epargne {
  int? countTransaction;
  int? montantTotal;
  int? montantTotalMomo;
  int? montantTotalOm;
  int? montantTotalSendToBank;
  int? soldeDisponible;

  Epargne(
      {this.countTransaction,
        this.montantTotal,
        this.montantTotalMomo,
        this.montantTotalOm,
        this.montantTotalSendToBank,
        this.soldeDisponible});

  Epargne.fromJson(Map<String, dynamic> json) {
    countTransaction = json['count_transaction'];
    montantTotal = json['montant_total'];
    montantTotalMomo = json['montant_total_momo'];
    montantTotalOm = json['montant_total_om'];
    montantTotalSendToBank = json['montant_total_send_to_bank'];
    soldeDisponible = json['solde_disponible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count_transaction'] = this.countTransaction;
    data['montant_total'] = this.montantTotal;
    data['montant_total_momo'] = this.montantTotalMomo;
    data['montant_total_om'] = this.montantTotalOm;
    data['montant_total_send_to_bank'] = this.montantTotalSendToBank;
    data['solde_disponible'] = this.soldeDisponible;
    return data;
  }
}

class Url {
  String? base;
  String? partialLogo;

  Url({this.base, this.partialLogo});

  Url.fromJson(Map<String, dynamic> json) {
    base = json['Base'];
    partialLogo = json['PartialLogo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Base'] = this.base;
    data['PartialLogo'] = this.partialLogo;
    return data;
  }
}
