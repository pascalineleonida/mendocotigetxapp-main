class StructureModel {
  int? id;
  int? parentStructureId;
  String? name;
  String? description;
  String? objectif;
  String? code;
  String? codeCash;
  String? phone1;
  String? phone2;
  String? logo;
  int? status;
  int? visibility;
  int? validateMember;
  String? dateValidation;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? mail;
  String? type;
  String? typeStructure;
  Localisation? localisation;
  int? countTontine;
  int? countMember;
  StatPayment? statPayment;
  String? dataBank;
  int? countNoteActivity;
  ImageLogo? imageLogo;
  String? imageBanner;
  Url? url;

  StructureModel(
      {this.id,
        this.parentStructureId,
        this.name,
        this.description,
        this.objectif,
        this.code,
        this.codeCash,
        this.phone1,
        this.phone2,
        this.logo,
        this.status,
        this.visibility,
        this.validateMember,
        this.dateValidation,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.mail,
        this.type,
        this.typeStructure,
        this.localisation,
        this.countTontine,
        this.countMember,
        this.statPayment,
        this.dataBank,
        this.countNoteActivity,
        this.imageLogo,
        this.imageBanner,
        this.url});

  StructureModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentStructureId = json['parentStructureId'];
    name = json['name'];
    description = json['description'];
    objectif = json['objectif'];
    code = json['code'];
    codeCash = json['codeCash'];
    phone1 = json['phone1'];
    phone2 = json['phone2'];
    logo = json['logo'];
    status = json['status'];
    visibility = json['visibility'];
    validateMember = json['validateMember'];
    dateValidation = json['dateValidation'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    mail = json['mail'];
    type = json['type'];
    // typeStructure = json['type_structure'];
    localisation = json['localisation'] != null
        ? new Localisation.fromJson(json['localisation'])
        : null;
    countTontine = json['count_tontine'];
    countMember = json['count_member'];
    statPayment = json['statPayment'] != null
        ? new StatPayment.fromJson(json['statPayment'])
        : null;
    dataBank = json['dataBank'];
    countNoteActivity = json['count_note_activity'];
    imageLogo = json['image_logo'] != null
        ? new ImageLogo.fromJson(json['image_logo'])
        : null;
    imageBanner = json['image_banner'];
    url = json['Url'] != null ? new Url.fromJson(json['Url']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parentStructureId'] = this.parentStructureId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['objectif'] = this.objectif;
    data['code'] = this.code;
    data['codeCash'] = this.codeCash;
    data['phone1'] = this.phone1;
    data['phone2'] = this.phone2;
    data['logo'] = this.logo;
    data['status'] = this.status;
    data['visibility'] = this.visibility;
    data['validateMember'] = this.validateMember;
    data['dateValidation'] = this.dateValidation;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    data['mail'] = this.mail;
    data['type'] = this.type;
    data['type_structure'] = this.typeStructure;
    if (this.localisation != null) {
      data['localisation'] = this.localisation!.toJson();
    }
    data['count_tontine'] = this.countTontine;
    data['count_member'] = this.countMember;
    if (this.statPayment != null) {
      data['statPayment'] = this.statPayment!.toJson();
    }
    data['dataBank'] = this.dataBank;
    data['count_note_activity'] = this.countNoteActivity;
    if (this.imageLogo != null) {
      data['image_logo'] = this.imageLogo!.toJson();
    }
    data['image_banner'] = this.imageBanner;
    if (this.url != null) {
      data['Url'] = this.url!.toJson();
    }
    return data;
  }
}

class Localisation {
  int? id;
  Null? description;
  String? name;

  Localisation({this.id, this.description, this.name});

  Localisation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['name'] = this.name;
    return data;
  }
}

class StatPayment {
  int? globalPayment;
  int? oMPayement;
  int? mOMOPayment;

  StatPayment({this.globalPayment, this.oMPayement, this.mOMOPayment});

  StatPayment.fromJson(Map<String, dynamic> json) {
    globalPayment = json['globalPayment'];
    oMPayement = json['OMPayement'];
    mOMOPayment = json['MOMOPayment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['globalPayment'] = this.globalPayment;
    data['OMPayement'] = this.oMPayement;
    data['MOMOPayment'] = this.mOMOPayment;
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
  String? partialBanner;

  Url({this.base, this.partialLogo, this.partialBanner});

  Url.fromJson(Map<String, dynamic> json) {
    base = json['Base'];
    partialLogo = json['PartialLogo'];
    partialBanner = json['PartialBanner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Base'] = this.base;
    data['PartialLogo'] = this.partialLogo;
    data['PartialBanner'] = this.partialBanner;
    return data;
  }
}
