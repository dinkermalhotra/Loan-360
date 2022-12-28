class ReceiptSaveModel {
  bool? responseStatus;
  int? id;
  int? childId;
  int? code;
  int? codes;
  String? displayMessage;
  int? responseCode;
  //Null? object;
  String? inactiveOnBy;
  String? updatedOnBy;
  String? createdOnBy;


  ReceiptSaveModel(
      {this.responseStatus,
        this.id,
        this.childId,
        this.code,
        this.codes,
        this.displayMessage,
        this.responseCode,
        //this.object,
        this.inactiveOnBy,
        this.updatedOnBy,
        this.createdOnBy});

  ReceiptSaveModel.fromJson(Map<String, dynamic> json) {
    responseStatus = json['responseStatus'] !=null ? json['responseStatus']:json['responseStatus'];
    id = json['id'] !=null ? json['id']:json['id'];
    childId = json['childId']!= null ? json['childId']: json['childId'];
    code = json['code']!=null ? json['code']:json['code'];
    codes = json['codes']!=null ? json['codes'] :json['codes'];
    displayMessage = json['displayMessage']!=null ? json['displayMessage']: json['displayMessage'];
    responseCode = json['responseCode']!=null ? json['responseCode']:json['responseCode'];
    //object = json['object'];
    inactiveOnBy = json['inactiveOnBy']!=null ? json['inactiveOnBy']: json['inactiveOnBy'];
    updatedOnBy = json['updatedOnBy']!=null ? json['updatedOnBy']: json['updatedOnBy'];
    createdOnBy = json['createdOnBy']!=null ? json['createdOnBy']: json['createdOnBy'];
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
  //  data['object'] = this.object;
    data['inactiveOnBy'] = this.inactiveOnBy;
    data['updatedOnBy'] = this.updatedOnBy;
    data['createdOnBy'] = this.createdOnBy;
    return data;
  }
}