



class CashDepositModel {
  String? responseStatus;
  String? id;
  String? childId;
  String? code;
  String? codes;
  String? displayMessage;
  String? responseCode;
  List<CashDepositObject>? object;
  String? inactiveOnBy;
  String? updatedOnBy;
  String? createdOnBy;

  CashDepositModel(
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

  CashDepositModel.fromJson(Map<String, dynamic> json) {
    responseStatus = json['responseStatus'];
    id = json['id'];
    childId = json['childId'];
    code = json['code'];
    codes = json['codes'];
    displayMessage = json['displayMessage'];
    responseCode = json['responseCode'];
    if (json['object'] != null) {
      object = <CashDepositObject>[];
      json['object'].forEach((v) {
        object!.add(new CashDepositObject.fromJson(v));
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

class CashDepositObject {
  int? id;
  int? vchId;
  String? login;
  String? depositOn;
  double? amount;
  String? remarks;
  String? fileName;
  bool? verified;
  String? verifiedBy;
  String? verifiedOn;

  CashDepositObject(
      {this.id,
        this.vchId,
        this.login,
        this.depositOn,
        this.amount,
        this.remarks,
        this.fileName,
        this.verified,
        this.verifiedBy,
        this.verifiedOn});

  CashDepositObject.fromJson(Map<String, dynamic> json) {
    id = json['id']!=null? json['id']:"";
    vchId = json['vchId']!=null? json['vchId']:0;
    login = json['login']!=null? json['login']:"";
    depositOn = json['depositOn']!=null? json['depositOn']:"";
    amount = json['amount']!=null? json['amount']:"";
    remarks = json['remarks']!=null? json['remarks']:"";
    fileName = json['fileName']!=null? json['fileName']:"";
    verified = json['verified']!=null? json['verified']:"";
    verifiedBy = json['verifiedBy']!=null? json['verifiedBy']:"";
    verifiedOn = json['verifiedOn']!=null? json['verifiedOn']:"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vchId'] = this.vchId;
    data['login'] = this.login;
    data['depositOn'] = this.depositOn;
    data['amount'] = this.amount;
    data['remarks'] = this.remarks;
    data['fileName'] = this.fileName;
    data['verified'] = this.verified;
    data['verifiedBy'] = this.verifiedBy;
    data['verifiedOn'] = this.verifiedOn;
    return data;
  }
}