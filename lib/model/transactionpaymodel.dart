// To parse this JSON data, do
//
//     final transactionpaymodel = transactionpaymodelFromJson(jsonString);

import 'dart:convert';

Transactionpaymodel transactionpaymodelFromJson(String str) => Transactionpaymodel.fromJson(json.decode(str));

String transactionpaymodelToJson(Transactionpaymodel data) => json.encode(data.toJson());

class Transactionpaymodel {
  List<Item>? items;
  Links? links;
  Meta? meta;

  Transactionpaymodel({
    this.items,
    this.links,
    this.meta,
  });

  factory Transactionpaymodel.fromJson(Map<String, dynamic> json) => Transactionpaymodel(
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
  String? token;
  dynamic dateValidate;
  DateTime? createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  int? amount;
  // Member? member;
  Tontine? tontine;
  dynamic dataGold;
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
    // this.member,
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
    updatedAt: json["updatedAt"],
    deletedAt: json["deletedAt"],
    amount: json["amount"],
    // member: json["member"] == null ? null : Member.fromJson(json["member"]),
    tontine: json["tontine"] == null ? null : Tontine.fromJson(json["tontine"]),
    dataGold: json["dataGold"],
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
    "updatedAt": updatedAt,
    "deletedAt": deletedAt,
    "amount": amount,
    // "member": member?.toJson(),
    "tontine": tontine?.toJson(),
    "dataGold": dataGold,
    "statusProduct": statusProduct,
    "tontine_data": tontineData?.toJson(),
    "externPay": externPay,
  };
}

// class Member {
//   int? id;
//   Name? name;
//
//   Member({
//     this.id,
//     this.name,
//   });
//
//   factory Member.fromJson(Map<String, dynamic> json) => Member(
//     id: json["id"],
//     name: nameValues.map[json["name"]]!,
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": nameValues.reverse[name],
//   };
// }

enum Name {
  BOMBA_FAC,
  TESTEUR_TESTEUR
}

final nameValues = EnumValues({
  "BOMBA FAC": Name.BOMBA_FAC,
  "testeur testeur": Name.TESTEUR_TESTEUR
});

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
  DateTime? dateClose;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  int? totalAmount;
  int? totalTarget;
  Categorie? categorie;
  // Member? association;
  int? countTransaction;
  int? countMember;
  int? montantTotal;
  int? montantTotalMomo;
  int? montantTotalOm;
  int? status;
  // int? visibilityMontantGlobal;
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
    // this.association,
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
    dateClose: json["dateClose"] == null ? null : DateTime.parse(json["dateClose"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
    totalAmount: json["totalAmount"],
    totalTarget: json["totalTarget"],
    categorie: json["categorie"] == null ? null : Categorie.fromJson(json["categorie"]),
    // association: json["association"] == null ? null : Member.fromJson(json["association"]),
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
    "dateClose": dateClose?.toIso8601String(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "deletedAt": deletedAt,
    "totalAmount": totalAmount,
    "totalTarget": totalTarget,
    "categorie": categorie?.toJson(),
    // "association": association?.toJson(),
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

class TontineData {
  String? tontine;
  // Member? association;

  TontineData({
    this.tontine,
    // this.association,
  });

  factory TontineData.fromJson(Map<String, dynamic> json) => TontineData(
    tontine: json["tontine"],
    // association: json["association"] == null ? null : Member.fromJson(json["association"]),
  );

  Map<String, dynamic> toJson() => {
    "tontine": tontine,
    // "association": association?.toJson(),
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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
