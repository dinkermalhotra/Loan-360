class CompanyDetail {
  String? code;
  int? addressId;
  String? name;
  String? shortName;
  String? address;
  String? phones;
  String? email;
  String? registrationNo;
  String? servicetaxNo;
  String? panNo;
  String? website;
  String? cibilCode;
  Null? cibilShortCode;
  Null? cibilPassword;
  Null? cibilOldCode;
  Null? cibilOldName;
  String? gstinUin;
  String? cin;
  String? createdOn;
  String? updatedOn;
  bool? inactive;
  Null? inactiveOn;
  Null? ckycCode;
  Null? corporationDate;
  int? districtId;
  int? stateId;
  Null? ratingAssigned;
  Null? ratingDate;
  Null? ratingValidUpto;
  Null? ratingAgency;
  Null? ratingProduct;
  Null? tanNo;

  CompanyDetail(
      {this.code,
        this.addressId,
        this.name,
        this.shortName,
        this.address,
        this.phones,
        this.email,
        this.registrationNo,
        this.servicetaxNo,
        this.panNo,
        this.website,
        this.cibilCode,
        this.cibilShortCode,
        this.cibilPassword,
        this.cibilOldCode,
        this.cibilOldName,
        this.gstinUin,
        this.cin,
        this.createdOn,
        this.updatedOn,
        this.inactive,
        this.inactiveOn,
        this.ckycCode,
        this.corporationDate,
        this.districtId,
        this.stateId,
        this.ratingAssigned,
        this.ratingDate,
        this.ratingValidUpto,
        this.ratingAgency,
        this.ratingProduct,
        this.tanNo});

  CompanyDetail.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    addressId = json['addressId'];
    name = json['name'];
    shortName = json['shortName'];
    address = json['address'];
    phones = json['phones'];
    email = json['email'];
    registrationNo = json['registrationNo'];
    servicetaxNo = json['servicetaxNo'];
    panNo = json['panNo'];
    website = json['website'];
    cibilCode = json['cibilCode'];
    cibilShortCode = json['cibilShortCode'];
    cibilPassword = json['cibilPassword'];
    cibilOldCode = json['cibilOldCode'];
    cibilOldName = json['cibilOldName'];
    gstinUin = json['gstinUin'];
    cin = json['cin'];
    createdOn = json['createdOn'];
    updatedOn = json['updatedOn'];
    inactive = json['inactive'];
    inactiveOn = json['inactiveOn'];
    ckycCode = json['ckycCode'];
    corporationDate = json['corporationDate'];
    districtId = json['districtId'];
    stateId = json['stateId'];
    ratingAssigned = json['ratingAssigned'];
    ratingDate = json['ratingDate'];
    ratingValidUpto = json['ratingValidUpto'];
    ratingAgency = json['ratingAgency'];
    ratingProduct = json['ratingProduct'];
    tanNo = json['tanNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['addressId'] = this.addressId;
    data['name'] = this.name;
    data['shortName'] = this.shortName;
    data['address'] = this.address;
    data['phones'] = this.phones;
    data['email'] = this.email;
    data['registrationNo'] = this.registrationNo;
    data['servicetaxNo'] = this.servicetaxNo;
    data['panNo'] = this.panNo;
    data['website'] = this.website;
    data['cibilCode'] = this.cibilCode;
    data['cibilShortCode'] = this.cibilShortCode;
    data['cibilPassword'] = this.cibilPassword;
    data['cibilOldCode'] = this.cibilOldCode;
    data['cibilOldName'] = this.cibilOldName;
    data['gstinUin'] = this.gstinUin;
    data['cin'] = this.cin;
    data['createdOn'] = this.createdOn;
    data['updatedOn'] = this.updatedOn;
    data['inactive'] = this.inactive;
    data['inactiveOn'] = this.inactiveOn;
    data['ckycCode'] = this.ckycCode;
    data['corporationDate'] = this.corporationDate;
    data['districtId'] = this.districtId;
    data['stateId'] = this.stateId;
    data['ratingAssigned'] = this.ratingAssigned;
    data['ratingDate'] = this.ratingDate;
    data['ratingValidUpto'] = this.ratingValidUpto;
    data['ratingAgency'] = this.ratingAgency;
    data['ratingProduct'] = this.ratingProduct;
    data['tanNo'] = this.tanNo;
    return data;
  }
}