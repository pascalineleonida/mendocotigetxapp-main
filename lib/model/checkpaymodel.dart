class CheckPayModel {
  num? commission;
  num? commissionCash;
  String? payTokenProvider;
  String? provider;
  String? paymentCode;
  String? number;
  num? sendToBank;
  Null? dateSendToBank;
  String? status;
  int? gold;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  num? amount;
  Member? member;
  Null? externPay;
  Tontine? tontine;

  CheckPayModel(
      {this.commission,
        this.commissionCash,
        this.payTokenProvider,
        this.provider,
        this.paymentCode,
        this.number,
        this.sendToBank,
        this.dateSendToBank,
        this.status,
        this.gold,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.amount,
        this.member,
        this.externPay,
        this.tontine});

  CheckPayModel.fromJson(Map<String, dynamic> json) {
    commission = json['commission'];
    commissionCash = json['commissionCash'];
    payTokenProvider = json['payTokenProvider'];
    provider = json['provider'];
    paymentCode = json['paymentCode'];
    number = json['number'];
    sendToBank = json['sendToBank'];
    dateSendToBank = json['dateSendToBank'];
    status = json['status'];
    gold = json['gold'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    amount = json['amount'];
    member =
    json['member'] != null ? new Member.fromJson(json['member']) : null;
    externPay = json['externPay'];
    tontine =
    json['tontine'] != null ? new Tontine.fromJson(json['tontine']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commission'] = this.commission;
    data['commissionCash'] = this.commissionCash;
    data['payTokenProvider'] = this.payTokenProvider;
    data['provider'] = this.provider;
    data['paymentCode'] = this.paymentCode;
    data['number'] = this.number;
    data['sendToBank'] = this.sendToBank;
    data['dateSendToBank'] = this.dateSendToBank;
    data['status'] = this.status;
    data['gold'] = this.gold;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    data['amount'] = this.amount;
    if (this.member != null) {
      data['member'] = this.member!.toJson();
    }
    data['externPay'] = this.externPay;
    if (this.tontine != null) {
      data['tontine'] = this.tontine!.toJson();
    }
    return data;
  }
}

class Member {
  int? id;
  String? name;

  Member({this.id, this.name});

  Member.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Tontine {
  int? id;
  int? categoryId;
  String? linkCodeCash;
  String? name;
  Null? code;
  String? description;
  String? dateValidation;
  Null? dateClose;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
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
  bool? visibilityMontantGlobal;
  VisibilityAmount? visibilityAmount;
  int? allPeopleSee;

  Tontine(
      {this.id,
        this.categoryId,
        this.linkCodeCash,
        this.name,
        this.code,
        this.description,
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
        this.visibilityMontantGlobal,
        this.visibilityAmount,
        this.allPeopleSee});

  Tontine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['categoryId'];
    linkCodeCash = json['linkCodeCash'];
    name = json['name'];
    code = json['code'];
    description = json['description'];
    dateValidation = json['dateValidation'];
    dateClose = json['dateClose'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    totalAmount = json['totalAmount'];
    totalTarget = json['totalTarget'];
    categorie = json['categorie'] != null
        ? new Categorie.fromJson(json['categorie'])
        : null;
    association = json['association'] != null
        ? new Member.fromJson(json['association'])
        : null;
    countTransaction = json['count_transaction'];
    countMember = json['count_member'];
    montantTotal = json['montant_total'];
    montantTotalMomo = json['montant_total_momo'];
    montantTotalOm = json['montant_total_om'];
    status = json['status'];
    visibilityMontantGlobal = json['visibility_montant_global'];
    visibilityAmount = json['visibility_amount'] != null
        ? new VisibilityAmount.fromJson(json['visibility_amount'])
        : null;
    allPeopleSee = json['allPeopleSee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryId'] = this.categoryId;
    data['linkCodeCash'] = this.linkCodeCash;
    data['name'] = this.name;
    data['code'] = this.code;
    data['description'] = this.description;
    data['dateValidation'] = this.dateValidation;
    data['dateClose'] = this.dateClose;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    data['totalAmount'] = this.totalAmount;
    data['totalTarget'] = this.totalTarget;
    if (this.categorie != null) {
      data['categorie'] = this.categorie!.toJson();
    }
    if (this.association != null) {
      data['association'] = this.association!.toJson();
    }
    data['count_transaction'] = this.countTransaction;
    data['count_member'] = this.countMember;
    data['montant_total'] = this.montantTotal;
    data['montant_total_momo'] = this.montantTotalMomo;
    data['montant_total_om'] = this.montantTotalOm;
    data['status'] = this.status;
    data['visibility_montant_global'] = this.visibilityMontantGlobal;
    if (this.visibilityAmount != null) {
      data['visibility_amount'] = this.visibilityAmount!.toJson();
    }
    data['allPeopleSee'] = this.allPeopleSee;
    return data;
  }
}

class Categorie {
  int? id;
  int? associationId;
  String? name;
  String? code;
  String? description;
  String? createdAt;
  String? updatedAt;

  Categorie(
      {this.id,
        this.associationId,
        this.name,
        this.code,
        this.description,
        this.createdAt,
        this.updatedAt});

  Categorie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    associationId = json['associationId'];
    name = json['name'];
    code = json['code'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['associationId'] = this.associationId;
    data['name'] = this.name;
    data['code'] = this.code;
    data['description'] = this.description;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class VisibilityAmount {
  bool? status;
  Null? amount;

  VisibilityAmount({this.status, this.amount});

  VisibilityAmount.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['amount'] = this.amount;
    return data;
  }
}
