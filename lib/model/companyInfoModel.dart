class CompanyInfoModel {
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
  String? cibilShortCode;
  String? cibilPassword;
  String? cibilOldCode;
  String? cibilOldName;
  String? gstinUin;
  String? cin;
  String? createdOn;
  String? updatedOn;
  bool? inactive;
  String? inactiveOn;
  String? ckycCode;
  String? corporationDate;
  int? districtId;
  int? stateId;
  String? ratingAssigned;
  String? ratingDate;
  String? ratingValidUpto;
  String? ratingAgency;
  String? ratingProduct;
  String? tanNo;

  CompanyInfoModel(
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

  CompanyInfoModel.fromJson(Map<String, dynamic> json) {
    code = json['code']!=null?json['code']:'';
    addressId = json['addressId']!=null?json['addressId']:'';
    name = json['name']!=null?json['name']:'';
    shortName = json['shortName']!=null?json['shortName']:'';
    address = json['address']!=null?json['address']:'';
    phones = json['phones']!=null?json['phones']:'';
    email = json['email']!=null?json['email']:'';
    registrationNo = json['registrationNo']!=null?json['registrationNo']:'';
    servicetaxNo = json['servicetaxNo']!=null?json['servicetaxNo']:'';
    panNo = json['panNo']!=null?json['panNo']:'';
    website = json['website']!=null?json['website']:'';
    cibilCode = json['cibilCode']!=null?json['cibilCode']:'';
    cibilShortCode = json['cibilShortCode']!=null?json['cibilShortCode']:'';
    cibilPassword = json['cibilPassword']!=null?json['cibilPassword']:'';
    cibilOldCode = json['cibilOldCode']!=null?json['cibilOldCode']:'';
    cibilOldName = json['cibilOldName']!=null?json['cibilOldName']:'';
    gstinUin = json['gstinUin']!=null?json['gstinUin']:'';
    cin = json['cin']!=null?json['cin']:'';
    createdOn = json['createdOn']!=null?json['createdOn']:'';
    updatedOn = json['updatedOn']!=null?json['updatedOn']:'';
    inactive = json['inactive']!=null?json['inactive']:'';
    inactiveOn = json['inactiveOn']!=null?json['inactiveOn']:'';
    ckycCode = json['ckycCode']!=null?json['ckycCode']:'';
    corporationDate = json['corporationDate']!=null?json['corporationDate']:'';
    districtId = json['districtId']!=null?json['districtId']:'';
    stateId = json['stateId']!=null?json['stateId']:'';
    ratingAssigned = json['ratingAssigned']!=null?json['ratingAssigned']:'';
    ratingDate = json['ratingDate']!=null?json['ratingDate']:'';
    ratingValidUpto = json['ratingValidUpto']!=null?json['ratingValidUpto']:'';
    ratingAgency = json['ratingAgency']!=null?json['ratingAgency']:'';
    ratingProduct = json['ratingProduct']!=null?json['ratingProduct']:'';
    tanNo = json['tanNo']!=null?json['tanNo']:'';
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