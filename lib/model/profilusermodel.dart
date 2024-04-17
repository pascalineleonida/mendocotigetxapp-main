import 'dart:convert';

import 'package:mendocoti_appmobile_flutter/model/usermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profiluser {
  int? id;
  String? firstName;
  String? name;
  String? birthDay;
  String? gender;
  String? residence;
  String? phone1;
  String? phone2;
  String? code;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? mail;
  String? associations;
  String? isFiol;
  int? countTransaction;
  int? montantTotal;
  int? montantTotalMomo;
  int? montantTotalOm;
  Epargne? epargne;
  ImageLogo? imageLogo;
  String? imageBanner;
  Url? url;

  Profiluser(
      {this.id,
        this.firstName,
        this.name,
        this.birthDay,
        this.gender,
        this.residence,
        this.phone1,
        this.phone2,
        this.code,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
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
  static Profiluser? sessionusers;

  Profiluser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    name = json['name'];
    birthDay = json['birth_day'];
    gender = json['gender'];
    residence = json['residence'];
    phone1 = json['phone1'];
    phone2 = json['phone2'];
    code = json['code'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    mail = json['mail'];
    associations = json['associations'];
    isFiol = json['is_fiol'];
    countTransaction = json['count_transaction'];
    montantTotal = json['montant_total'];
    montantTotalMomo = json['montant_total_momo'];
    montantTotalOm = json['montant_total_om'];
    epargne =
    json['epargne'] != null ? new Epargne.fromJson(json['epargne']) : null;
    imageLogo = json['image_logo'] != null
        ? new ImageLogo.fromJson(json['image_logo'])
        : null;
    imageBanner = json['image_banner'];
    url = json['Url'] != null ? new Url.fromJson(json['Url']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['name'] = this.name;
    data['birth_day'] = this.birthDay;
    data['gender'] = this.gender;
    data['residence'] = this.residence;
    data['phone1'] = this.phone1;
    data['phone2'] = this.phone2;
    data['code'] = this.code;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
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
    if (this.imageLogo != null) {
      data['image_logo'] = this.imageLogo!.toJson();
    }
    data['image_banner'] = this.imageBanner;
    if (this.url != null) {
      data['Url'] = this.url!.toJson();
    }
    return data;
  }

  static void saveusers(Profiluser users) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var data = jsonEncode(users.toJson());
    pref.setString('profil', data);
    pref.commit();
  }

  static void getusers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('profil');
    var decode = jsonDecode(data==null?"":data);
    var userprofil = Profiluser.fromJson(decode);
    sessionusers = userprofil;



  }

  static void logout() async {
    SharedPreferences p = await SharedPreferences.getInstance();
    p.setString("profil", "");
    sessionusers = null;

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

class ImageLogo {
  int? id;
  List<String>? mobile;
  List<String>? large;
  int? width;
  int? height;

  ImageLogo({this.id, this.mobile, this.large, this.width, this.height});

  ImageLogo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mobile = json['mobile'].cast<String>();
    large = json['large'].cast<String>();
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mobile'] = this.mobile;
    data['large'] = this.large;
    data['width'] = this.width;
    data['height'] = this.height;
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
