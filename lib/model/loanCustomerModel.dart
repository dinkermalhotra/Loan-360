class LoanCustomerModel {
  String? responseStatus;
  String? id;
  String? childId;
  String? code;
  String? codes;
  String? displayMessage;
  String? responseCode;
  List<LoanCustomerList>? object;
  String? inactiveOnBy;
  String? updatedOnBy;
  String? createdOnBy;

  LoanCustomerModel(
      {this.responseStatus,
        this.id,
        this.childId,
        this.code,
        this.codes,
        this.displayMessage,
        this.responseCode,
        this.object,
        this.inactiveOnBy,
        this.updatedOnBy,
        this.createdOnBy});

  LoanCustomerModel.fromJson(Map<String, dynamic> json) {
    responseStatus = json['responseStatus'];
    id = json['id'];
    childId = json['childId'];
    code = json['code'];
    codes = json['codes'];
    displayMessage = json['displayMessage'];
    responseCode = json['responseCode'];
    if (json['object'] != null) {
      object = <LoanCustomerList>[];
      json['object'].forEach((v) {
        object!.add(new LoanCustomerList.fromJson(v));
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
    if (this.object != null) {
      data['object'] = this.object!.map((v) => v.toJson()).toList();
    }
    data['inactiveOnBy'] = this.inactiveOnBy;
    data['updatedOnBy'] = this.updatedOnBy;
    data['createdOnBy'] = this.createdOnBy;
    return data;
  }
}

class LoanCustomerList {
  String? address;
  String? attachedAs;
  String? panNo;
  String? phones;
  String? latestLoanNo;
  String? relation;
  String? customerType;
  String? relName;
  String? mobiles;
  String? name;
  String? aadhar;
  int? id;
  String? email;

  LoanCustomerList(
      {this.address,
        this.attachedAs,
        this.panNo,
        this.phones,
        this.latestLoanNo,
        this.relation,
        this.customerType,
        this.relName,
        this.mobiles,
        this.name,
        this.aadhar,
        this.id,
        this.email});

  LoanCustomerList.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    attachedAs = json['attachedAs'];
    panNo = json['panNo'];
    phones = json['phones'];
    latestLoanNo = json['latestLoanNo'];
    relation = json['relation'];
    customerType = json['customerType'];
    relName = json['relName'];
    mobiles = json['mobiles'];
    name = json['name'];
    aadhar = json['aadhar'];
    id = json['id'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['attachedAs'] = this.attachedAs;
    data['panNo'] = this.panNo;
    data['phones'] = this.phones;
    data['latestLoanNo'] = this.latestLoanNo;
    data['relation'] = this.relation;
    data['customerType'] = this.customerType;
    data['relName'] = this.relName;
    data['mobiles'] = this.mobiles;
    data['name'] = this.name;
    data['aadhar'] = this.aadhar;
    data['id'] = this.id;
    data['email'] = this.email;
    return data;
  }
}