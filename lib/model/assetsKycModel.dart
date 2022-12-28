class AssetsKycModel {
  String? code;
  String? name;
  bool? individual;
  bool? corporate;
  String? createdOn;
  String? updatedOn;
  bool? inactive;
  String? inactiveOn;
  String? kycType;
  String? documentCode;
  String? documentChildCode;
  String? patterns;

  AssetsKycModel(
      {this.code,
        this.name,
        this.individual,
        this.corporate,
        this.createdOn,
        this.updatedOn,
        this.inactive,
        this.inactiveOn,
        this.kycType,
        this.documentCode,
        this.documentChildCode,
        this.patterns});

  AssetsKycModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    individual = json['individual'];
    corporate = json['corporate'];
    createdOn = json['createdOn'];
    updatedOn = json['updatedOn'];
    inactive = json['inactive'];
    inactiveOn = json['inactiveOn'];
    kycType = json['kycType'];
    documentCode = json['documentCode'];
    documentChildCode = json['documentChildCode'];
    patterns = json['patterns'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['individual'] = this.individual;
    data['corporate'] = this.corporate;
    data['createdOn'] = this.createdOn;
    data['updatedOn'] = this.updatedOn;
    data['inactive'] = this.inactive;
    data['inactiveOn'] = this.inactiveOn;
    data['kycType'] = this.kycType;
    data['documentCode'] = this.documentCode;
    data['documentChildCode'] = this.documentChildCode;
    data['patterns'] = this.patterns;
    return data;
  }
}