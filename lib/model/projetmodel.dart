// To parse this JSON data, do
//
//     final projetmodels = projetmodelsFromJson(jsonString);

import 'dart:convert';

List<Projetmodels> projetmodelsFromJson(String str) => List<Projetmodels>.from(json.decode(str).map((x) => Projetmodels.fromJson(x)));

String projetmodelsToJson(List<Projetmodels> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Projetmodels {
  int? id;
  int? categoryId;
  String? linkCodeCash;
  String? name;
  dynamic code;
  String? description;
  dynamic file;
  dynamic dateExpired;
  DateTime? dateValidation;
  DateTime? dateClose;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  int? totalAmount;
  int? totalTarget;
  Categorie? categorie;
  Association? association;
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

  Projetmodels({
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

  factory Projetmodels.fromJson(Map<String, dynamic> json) => Projetmodels(
    id: json["id"],
    categoryId: json["categoryId"],
    linkCodeCash: json["linkCodeCash"],
    name: json["name"],
    code: json["code"],
    description: json["description"],
    file: json["file"],
    dateExpired: json["dateExpired"],
    dateValidation: json["dateValidation"] == null ? null : DateTime.parse(json["dateValidation"]),
    dateClose: json["dateClose"] == null ? null : DateTime.parse(json["dateClose"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
    totalAmount: json["totalAmount"],
    totalTarget: json["totalTarget"],
    categorie: json["categorie"] == null ? null : Categorie.fromJson(json["categorie"]),
    association: json["association"] == null ? null : Association.fromJson(json["association"]),
    countTransaction: json["count_transaction"],
    countMember: json["count_member"],
    montantTotal: json["montant_total"],
    montantTotalMomo: json["montant_total_momo"],
    montantTotalOm: json["montant_total_om"],
    status: json["status"],
    //visibilityMontantGlobal: json["visibility_montant_global"],
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
    "dateClose": dateClose?.toIso8601String(),
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
    //"visibility_montant_global": visibilityMontantGlobal,
    "visibility_amount": visibilityAmount?.toJson(),
    "count_note_activity": countNoteActivity,
    "count_activity": countActivity,
    "allPeopleSee": allPeopleSee,
    "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
    "Url": url?.toJson(),
  };
}

class Association {
  int? id;
  String? name;

  Association({
    this.id,
    this.name,
  });

  factory Association.fromJson(Map<String, dynamic> json) => Association(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
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

class VisibilityAmount {
  bool? status;
  int? amount;

  VisibilityAmount({
    this.status,
    this.amount,
  });

  factory VisibilityAmount.fromJson(Map<String, dynamic> json) => VisibilityAmount(
    status: json["status"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "amount": amount,
  };
}
