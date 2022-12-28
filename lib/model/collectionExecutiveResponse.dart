class CollectionExecutiveResponse {
  String? responseStatus;
  String? id;
  String? childId;
  String? code;
  String? codes;
  String? displayMessage;
  String? responseCode;
  collectionObject? object;
  String? inactiveOnBy;
  String? updatedOnBy;
  String? createdOnBy;

  CollectionExecutiveResponse(
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

  CollectionExecutiveResponse.fromJson(Map<String, dynamic> json) {
    responseStatus = json['responseStatus'];
    id = json['id'];
    childId = json['childId'];
    code = json['code'];
    codes = json['codes'];
    displayMessage = json['displayMessage'];
    responseCode = json['responseCode'];
    object =
    json['object'] != null ? new collectionObject.fromJson(json['object']) : null;
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
      data['object'] = this.object!.toJson();
    }
    data['inactiveOnBy'] = this.inactiveOnBy;
    data['updatedOnBy'] = this.updatedOnBy;
    data['createdOnBy'] = this.createdOnBy;
    return data;
  }
}

class collectionObject {
  int? count;
  int? limit;

  collectionObject({this.count, this.limit});

  collectionObject.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['limit'] = this.limit;
    return data;
  }
}