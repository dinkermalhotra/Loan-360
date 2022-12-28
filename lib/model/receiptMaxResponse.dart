
class ReceiptMaxResponse {
  String? responseStatus;
  String? id;
  String? childId;
  String? code;
  String? codes;
  String? displayMessage;
  String? responseCode;
  String? object;
  String? inactiveOnBy;
  String? updatedOnBy;
  String? createdOnBy;

  ReceiptMaxResponse(
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

  ReceiptMaxResponse.fromJson(Map<String, dynamic> json) {
    responseStatus = json['responseStatus']!=null?json['responseStatus']:'';
    id = json['id']!=null?json['id']:'';
    childId = json['childId']!=null?json['childId']:'';
    code = json['code']!=null?json['code']:'';
    codes = json['codes']!=null?json['codes']:'';
    displayMessage = json['displayMessage']!=null?json['displayMessage']:'';
    responseCode = json['responseCode']!=null?json['responseCode']:'';
    object = json['object']!=null?json['object']:'';
    inactiveOnBy = json['inactiveOnBy']!=null?json['inactiveOnBy']:'';
    updatedOnBy = json['updatedOnBy']!=null?json['updatedOnBy']:'';
    createdOnBy = json['createdOnBy']!=null?json['createdOnBy']:'';
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
    data['object'] = this.object;
    data['inactiveOnBy'] = this.inactiveOnBy;
    data['updatedOnBy'] = this.updatedOnBy;
    data['createdOnBy'] = this.createdOnBy;
    return data;
  }
}