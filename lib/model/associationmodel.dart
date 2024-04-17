class Associationmodel {
  List<Items>? items;
  Links? links;
  Meta? meta;

  Associationmodel({this.items, this.links, this.meta});

  Associationmodel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Items {
  int? id;
  Null? parentStructureId;
  String? name;
  String? description;
  String? objectif;
  String? code;
  String? codeCash;
  String? phone1;
  Null? phone2;
  Null? logo;
  int? status;
  int? visibility;
  int? validateMember;
  String? dateValidation;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? mail;
  String? type;
  TypeStructure? typeStructure;
  List<Categories>? categories;
  Localisation? localisation;
  int? countTontine;
  int? countMember;
  StatPayment? statPayment;
  Null? dataBank;
  int? countNoteActivity;
  ImageLogo? imageLogo;
  ImageLogo? imageBanner;
  Url? url;

  Items(
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
        this.categories,
        this.localisation,
        this.countTontine,
        this.countMember,
        this.statPayment,
        this.dataBank,
        this.countNoteActivity,
        this.imageLogo,
        this.imageBanner,
        this.url});

  Items.fromJson(Map<String, dynamic> json) {
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
    typeStructure = json['type_structure'] != null
        ? new TypeStructure.fromJson(json['type_structure'])
        : null;
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
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
    imageBanner = json['image_banner'] != null
        ? new ImageLogo.fromJson(json['image_banner'])
        : null;
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
    if (this.typeStructure != null) {
      data['type_structure'] = this.typeStructure!.toJson();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
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
    if (this.imageBanner != null) {
      data['image_banner'] = this.imageBanner!.toJson();
    }
    if (this.url != null) {
      data['Url'] = this.url!.toJson();
    }
    return data;
  }
}

class TypeStructure {
  int? id;
  String? name;
  String? code;
  String? type;
  String? createdAt;
  String? updatedAt;

  TypeStructure(
      {this.id,
        this.name,
        this.code,
        this.type,
        this.createdAt,
        this.updatedAt});

  TypeStructure.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['type'] = this.type;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Categories {
  int? id;
  int? associationId;
  String? name;
  String? code;
  String? description;
  String? createdAt;
  String? updatedAt;

  Categories(
      {this.id,
        this.associationId,
        this.name,
        this.code,
        this.description,
        this.createdAt,
        this.updatedAt});

  Categories.fromJson(Map<String, dynamic> json) {
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

class Links {
  Self? self;
  Self? first;
  Self? last;

  Links({this.self, this.first, this.last});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'] != null ? new Self.fromJson(json['self']) : null;
    first = json['first'] != null ? new Self.fromJson(json['first']) : null;
    last = json['last'] != null ? new Self.fromJson(json['last']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.self != null) {
      data['self'] = this.self!.toJson();
    }
    if (this.first != null) {
      data['first'] = this.first!.toJson();
    }
    if (this.last != null) {
      data['last'] = this.last!.toJson();
    }
    return data;
  }
}

class Self {
  String? href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class Meta {
  int? totalCount;
  int? pageCount;
  int? currentPage;
  int? perPage;

  Meta({this.totalCount, this.pageCount, this.currentPage, this.perPage});

  Meta.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    pageCount = json['pageCount'];
    currentPage = json['currentPage'];
    perPage = json['perPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    data['pageCount'] = this.pageCount;
    data['currentPage'] = this.currentPage;
    data['perPage'] = this.perPage;
    return data;
  }
}
