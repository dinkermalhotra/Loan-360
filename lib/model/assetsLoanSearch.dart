class AssetsLoanSearchModel {
  String? responseStatus;
  String? id;
  String? childId;
  String? code;
  String? codes;
  String? displayMessage;
  String? responseCode;
  List<AssetsObject>? object;
  String? inactiveOnBy;
  String? updatedOnBy;
  String? createdOnBy;

  AssetsLoanSearchModel(
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

  AssetsLoanSearchModel.fromJson(Map<String, dynamic> json) {
    responseStatus = json['responseStatus'];
    id = json['id'];
    childId = json['childId'];
    code = json['code'];
    codes = json['codes'];
    displayMessage = json['displayMessage'];
    responseCode = json['responseCode'];
    if (json['object'] != null) {
      object = <AssetsObject>[];
      json['object'].forEach((v) {
        object!.add(new AssetsObject.fromJson(v));
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

class AssetsObject {
  String? loanNo;
  String? regnNos;
  String? appNo;
  String? appDate;
  String? appStatus;
  double? loanAmount;
  String? productCode;
  bool? isBorrowing;
  int? customerId;
  String? name;
  String? loanStatus;
  String? loanDate;
  String? accountingCategoryCode;
  int? id;

  AssetsObject(
      {this.loanNo,
        this.regnNos,
        this.appNo,
        this.appDate,
        this.appStatus,
        this.loanAmount,
        this.productCode,
        this.isBorrowing,
        this.customerId,
        this.name,
        this.loanStatus,
        this.loanDate,
        this.accountingCategoryCode,
        this.id});

  AssetsObject.fromJson(Map<String, dynamic> json) {
    loanNo = json['loanNo'];
    regnNos = json['regnNos'];
    appNo = json['appNo'];
    appDate = json['appDate'];
    appStatus = json['appStatus'];
    loanAmount = json['loanAmount'];
    productCode = json['productCode'];
    isBorrowing = json['isBorrowing'];
    customerId = json['customerId'];
    name = json['name'];
    loanStatus = json['loanStatus'];
    loanDate = json['loanDate'];
    accountingCategoryCode = json['accountingCategoryCode'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loanNo'] = this.loanNo;
    data['regnNos'] = this.regnNos;
    data['appNo'] = this.appNo;
    data['appDate'] = this.appDate;
    data['appStatus'] = this.appStatus;
    data['loanAmount'] = this.loanAmount;
    data['productCode'] = this.productCode;
    data['isBorrowing'] = this.isBorrowing;
    data['customerId'] = this.customerId;
    data['name'] = this.name;
    data['loanStatus'] = this.loanStatus;
    data['loanDate'] = this.loanDate;
    data['accountingCategoryCode'] = this.accountingCategoryCode;
    data['id'] = this.id;
    return data;
  }
}


