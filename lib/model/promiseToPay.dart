class PromiseToPayResponse {
  String? responseStatus;
  String? id;
  String? childId;
  String? code;
  String? codes;
  String? displayMessage;
  String? responseCode;
 // List<String>? object;
  String? inactiveOnBy;
  String? updatedOnBy;
  String? createdOnBy;

  PromiseToPayResponse(
      {this.responseStatus,
        this.id,
        this.childId,
        this.code,
        this.codes,
        this.displayMessage,
        this.responseCode,
      //  this.object,
        this.inactiveOnBy,
        this.updatedOnBy,
        this.createdOnBy});

  PromiseToPayResponse.fromJson(Map<String, dynamic> json) {
    responseStatus = json['responseStatus'];
    id = json['id'];
    childId = json['childId'];
    code = json['code'];
    codes = json['codes'];
    displayMessage = json['displayMessage'];
    responseCode = json['responseCode'];
    //if (json['object'] != null) {
      //object = <String>[];
      ///json['object'].forEach((v) {
        //// Data is not parsing in model
      //  object!.add(new String.fromJson(v));
      //});
   // }
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
   // if (this.object != null) {
      //data['object'] = this.object!.map((v) => v.toJson()).toList();
   // }
    data['inactiveOnBy'] = this.inactiveOnBy;
    data['updatedOnBy'] = this.updatedOnBy;
    data['createdOnBy'] = this.createdOnBy;
    return data;
  }
}