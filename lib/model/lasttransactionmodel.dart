// To parse this JSON data, do
//
//     final lasttransactionmodel = lasttransactionmodelFromJson(jsonString);

import 'dart:convert';

import 'package:mendocoti_appmobile_flutter/model/projetmodel.dart';

Lasttransactionmodel lasttransactionmodelFromJson(String str) => Lasttransactionmodel.fromJson(json.decode(str));

String lasttransactionmodelToJson(Lasttransactionmodel data) => json.encode(data.toJson());

class Lasttransactionmodel {
  List<Item>? items;
  Links? links;
  Meta? meta;

  Lasttransactionmodel({
    this.items,
    this.links,
    this.meta,
  });

  factory Lasttransactionmodel.fromJson(Map<String, dynamic> json) => Lasttransactionmodel(
    items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    "links": links?.toJson(),
    "meta": meta?.toJson(),
  };
}

class Item {
  int? tontineId;
  double? commission;
  double? commissionCash;
  String? payTokenProvider;
  String? provider;
  String? paymentCode;
  int? sendToBank;
  dynamic dateSendToBank;
  String? number;
  String? status;
  dynamic reference;
  dynamic goldToken;
  dynamic baseStructureId;
  dynamic memberValidatorId;
  int? gold;
  dynamic token;
  dynamic dateValidate;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  int? amount;
  Member? member;
  Tontine? tontine;
  List<dynamic>? dataGold;
  String? statusProduct;
  TontineData? tontineData;
  dynamic externPay;

  Item({
    this.tontineId,
    this.commission,
    this.commissionCash,
    this.payTokenProvider,
    this.provider,
    this.paymentCode,
    this.sendToBank,
    this.dateSendToBank,
    this.number,
    this.status,
    this.reference,
    this.goldToken,
    this.baseStructureId,
    this.memberValidatorId,
    this.gold,
    this.token,
    this.dateValidate,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.amount,
    this.member,
    this.tontine,
    this.dataGold,
    this.statusProduct,
    this.tontineData,
    this.externPay,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    tontineId: json["tontineId"],
    commission: json["commission"]?.toDouble(),
    commissionCash: json["commissionCash"]?.toDouble(),
    payTokenProvider: json["payTokenProvider"],
    provider: json["provider"],
    paymentCode: json["paymentCode"],
    sendToBank: json["sendToBank"],
    dateSendToBank: json["dateSendToBank"],
    number: json["number"],
    status: json["status"],
    reference: json["reference"],
    goldToken: json["goldToken"],
    baseStructureId: json["baseStructureId"],
    memberValidatorId: json["memberValidatorId"],
    gold: json["gold"],
    token: json["token"],
    dateValidate: json["dateValidate"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
    amount: json["amount"],
    member: json["member"] == null ? null : Member.fromJson(json["member"]),
    tontine: json["tontine"] == null ? null : Tontine.fromJson(json["tontine"]),
    dataGold: json["dataGold"] == null ? [] : List<dynamic>.from(json["dataGold"]!.map((x) => x)),
    statusProduct: json["statusProduct"],
    tontineData: json["tontine_data"] == null ? null : TontineData.fromJson(json["tontine_data"]),
    externPay: json["externPay"],
  );

  Map<String, dynamic> toJson() => {
    "tontineId": tontineId,
    "commission": commission,
    "commissionCash": commissionCash,
    "payTokenProvider": payTokenProvider,
    "provider": provider,
    "paymentCode": paymentCode,
    "sendToBank": sendToBank,
    "dateSendToBank": dateSendToBank,
    "number": number,
    "status": status,
    "reference": reference,
    "goldToken": goldToken,
    "baseStructureId": baseStructureId,
    "memberValidatorId": memberValidatorId,
    "gold": gold,
    "token": token,
    "dateValidate": dateValidate,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "deletedAt": deletedAt,
    "amount": amount,
    "member": member?.toJson(),
    "tontine": tontine?.toJson(),
    "dataGold": dataGold == null ? [] : List<dynamic>.from(dataGold!.map((x) => x)),
    "statusProduct": statusProduct,
    "tontine_data": tontineData?.toJson(),
    "externPay": externPay,
  };
}

class Member {
  int? id;
  String? name;

  Member({
    this.id,
    this.name,
  });

  factory Member.fromJson(Map<String, dynamic> json) => Member(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Tontine {
  int? id;
  int? categoryId;
  String? linkCodeCash;
  String? name;
  dynamic code;
  String? description;
  dynamic file;
  dynamic dateExpired;
  DateTime? dateValidation;
  dynamic dateClose;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  int? totalAmount;
  int? totalTarget;
  Categorie? categorie;
  Member? association;
  int? countTransaction;
  int? countMember;
  int? montantTotal;
  int? montantTotalMomo;
  int? montantTotalOm;
  int? status;
  // bool? visibilityMontantGlobal;
  VisibilityAmount? visibilityAmount;
  int? countNoteActivity;
  int? countActivity;
  int? allPeopleSee;
  List<dynamic>? image;
  Url? url;

  Tontine({
    this.id,
    this.categoryId,
    this.linkCodeCash,
    this.name,
    this.code,
    this.description,
    this.file,
    this.dateExpired,
    this.dateValidation,
    this.dateClose,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.totalAmount,
    this.totalTarget,
    this.categorie,
    this.association,
    this.countTransaction,
    this.countMember,
    this.montantTotal,
    this.montantTotalMomo,
    this.montantTotalOm,
    this.status,
    // this.visibilityMontantGlobal,
    this.visibilityAmount,
    this.countNoteActivity,
    this.countActivity,
    this.allPeopleSee,
    this.image,
    this.url,
  });

  factory Tontine.fromJson(Map<String, dynamic> json) => Tontine(
    id: json["id"],
    categoryId: json["categoryId"],
    linkCodeCash: json["linkCodeCash"],
    name: json["name"],
    code: json["code"],
    description: json["description"],
    file: json["file"],
    dateExpired: json["dateExpired"],
    dateValidation: json["dateValidation"] == null ? null : DateTime.parse(json["dateValidation"]),
    dateClose: json["dateClose"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
    totalAmount: json["totalAmount"],
    totalTarget: json["totalTarget"],
    categorie: json["categorie"] == null ? null : Categorie.fromJson(json["categorie"]),
    association: json["association"] == null ? null : Member.fromJson(json["association"]),
    countTransaction: json["count_transaction"],
    countMember: json["count_member"],
    montantTotal: json["montant_total"],
    montantTotalMomo: json["montant_total_momo"],
    montantTotalOm: json["montant_total_om"],
    status: json["status"],
    // visibilityMontantGlobal: json["visibility_montant_global"],
    visibilityAmount: json["visibility_amount"] == null ? null : VisibilityAmount.fromJson(json["visibility_amount"]),
    countNoteActivity: json["count_note_activity"],
    countActivity: json["count_activity"],
    allPeopleSee: json["allPeopleSee"],
    image: json["image"] == null ? [] : List<dynamic>.from(json["image"]!.map((x) => x)),
    url: json["Url"] == null ? null : Url.fromJson(json["Url"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "categoryId": categoryId,
    "linkCodeCash": linkCodeCash,
    "name": name,
    "code": code,
    "description": description,
    "file": file,
    "dateExpired": dateExpired,
    "dateValidation": dateValidation?.toIso8601String(),
    "dateClose": dateClose,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "deletedAt": deletedAt,
    "totalAmount": totalAmount,
    "totalTarget": totalTarget,
    "categorie": categorie?.toJson(),
    "association": association?.toJson(),
    "count_transaction": countTransaction,
    "count_member": countMember,
    "montant_total": montantTotal,
    "montant_total_momo": montantTotalMomo,
    "montant_total_om": montantTotalOm,
    "status": status,
    // "visibility_montant_global": visibilityMontantGlobal,
    "visibility_amount": visibilityAmount?.toJson(),
    "count_note_activity": countNoteActivity,
    "count_activity": countActivity,
    "allPeopleSee": allPeopleSee,
    "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
    "Url": url?.toJson(),
  };
}

class Categorie {
  int? id;
  int? associationId;
  String? name;
  String? code;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;

  Categorie({
    this.id,
    this.associationId,
    this.name,
    this.code,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Categorie.fromJson(Map<String, dynamic> json) => Categorie(
    id: json["id"],
    associationId: json["associationId"],
    name: json["name"],
    code: json["code"],
    description: json["description"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "associationId": associationId,
    "name": name,
    "code": code,
    "description": description,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class Url {
  String? base;
  String? partialPost;

  Url({
    this.base,
    this.partialPost,
  });

  factory Url.fromJson(Map<String, dynamic> json) => Url(
    base: json["Base"],
    partialPost: json["PartialPost"],
  );

  Map<String, dynamic> toJson() => {
    "Base": base,
    "PartialPost": partialPost,
  };
}



class TontineData {
  String? tontine;
  Member? association;

  TontineData({
    this.tontine,
    this.association,
  });

  factory TontineData.fromJson(Map<String, dynamic> json) => TontineData(
    tontine: json["tontine"],
    association: json["association"] == null ? null : Member.fromJson(json["association"]),
  );

  Map<String, dynamic> toJson() => {
    "tontine": tontine,
    "association": association?.toJson(),
  };
}

class Links {
  First? self;
  First? first;
  First? last;

  Links({
    this.self,
    this.first,
    this.last,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: json["self"] == null ? null : First.fromJson(json["self"]),
    first: json["first"] == null ? null : First.fromJson(json["first"]),
    last: json["last"] == null ? null : First.fromJson(json["last"]),
  );

  Map<String, dynamic> toJson() => {
    "self": self?.toJson(),
    "first": first?.toJson(),
    "last": last?.toJson(),
  };
}

class First {
  String? href;

  First({
    this.href,
  });

  factory First.fromJson(Map<String, dynamic> json) => First(
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
  };
}

class Meta {
  int? totalCount;
  int? pageCount;
  int? currentPage;
  int? perPage;

  Meta({
    this.totalCount,
    this.pageCount,
    this.currentPage,
    this.perPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    totalCount: json["totalCount"],
    pageCount: json["pageCount"],
    currentPage: json["currentPage"],
    perPage: json["perPage"],
  );

  Map<String, dynamic> toJson() => {
    "totalCount": totalCount,
    "pageCount": pageCount,
    "currentPage": currentPage,
    "perPage": perPage,
  };
}
