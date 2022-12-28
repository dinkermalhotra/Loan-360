class KycModel {
  String? responseStatus;
  int? id;
  int? childId;
  String? code;
  String? codes;
  String? displayMessage;
  String? responseCode;
  List<KycList>? kycList;
  String? inactiveOnBy;
  String? updatedOnBy;
  String? createdOnBy;

  KycModel(
      {this.responseStatus,
        this.id,
        this.childId,
        this.code,
        this.codes,
        this.displayMessage,
        this.responseCode,
        this.kycList,
        this.inactiveOnBy,
        this.updatedOnBy,
        this.createdOnBy});

  KycModel.fromJson(Map<String, dynamic> json) {
    responseStatus = json['responseStatus'];
    id = json['id'];
    childId = json['childId'];
    code = json['code'];
    codes = json['codes'];
    displayMessage = json['displayMessage'];
    responseCode = json['responseCode'];
    if (json['object'] != null) {
      kycList = <KycList>[];
      json['object'].forEach((v) {
        kycList!.add(new KycList.fromJson(v));
      });
    }
    inactiveOnBy = json['inactiveOnBy'];
    updatedOnBy = json['updatedOnBy'];
    createdOnBy = json['createdOnBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseStatus'] = this.responseStatus;
    data['id'] = this.id;
    data['childId'] = this.childId;
    data['code'] = this.code;
    data['codes'] = this.codes;
    data['displayMessage'] = this.displayMessage;
    data['responseCode'] = this.responseCode;
    if (this.kycList != null) {
      data['object'] = this.kycList!.map((v) => v.toJson()).toList();
    }
    data['inactiveOnBy'] = this.inactiveOnBy;
    data['updatedOnBy'] = this.updatedOnBy;
    data['createdOnBy'] = this.createdOnBy;
    return data;
  }
}

class KycList {
  String? customerType;
  String? relName;
  String? address;
  String? panNo;
  String? mobiles;
  String? name;
  String? aadhar;
  int? phones;
  int? id;
  String? email;
  String? relation;

  KycList(
      {this.customerType,
        this.relName,
        this.address,
        this.panNo,
        this.mobiles,
        this.name,
        this.aadhar,
        this.phones,
        this.id,
        this.email,
        this.relation});

  KycList.fromJson(Map<String, dynamic> json) {
    customerType = json['customerType'];
    relName = json['relName'];
    address = json['address'];
    panNo = json['panNo'];
    mobiles = json['mobiles'];
    name = json['name'];
    aadhar = json['aadhar'];
    phones = json['phones'];
    id = json['id'];
    email = json['email'];
    relation = json['relation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerType'] = this.customerType;
    data['relName'] = this.relName;
    data['address'] = this.address;
    data['panNo'] = this.panNo;
    data['mobiles'] = this.mobiles;
    data['name'] = this.name;
    data['aadhar'] = this.aadhar;
    data['phones'] = this.phones;
    data['id'] = this.id;
    data['email'] = this.email;
    data['relation'] = this.relation;
    return data;
  }
}