class FinancialYearModel {
  int? id;
  String? companyCode;
  String? name;
  String? fromDate;
  String? toDate;
  String? createdOn;
  String? updatedOn;
  bool? inactive;
  String? inactiveOn;

  FinancialYearModel(
      {this.id,
        this.companyCode,
        this.name,
        this.fromDate,
        this.toDate,
        this.createdOn,
        this.updatedOn,
        this.inactive,
        this.inactiveOn});

  FinancialYearModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyCode = json['companyCode'];
    name = json['name'];
    fromDate = json['fromDate'];
    toDate = json['toDate'];
    createdOn = json['createdOn'];
    updatedOn = json['updatedOn'];
    inactive = json['inactive']!=null ? json['inactive']: false;
    inactiveOn = json['inactiveOn']!=null ? json['inactiveOn']: "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['companyCode'] = this.companyCode;
    data['name'] = this.name;
    data['fromDate'] = this.fromDate;
    data['toDate'] = this.toDate;
    data['createdOn'] = this.createdOn;
    data['updatedOn'] = this.updatedOn;
    data['inactive'] = this.inactive;
    data['inactiveOn'] = this.inactiveOn;
    return data;
  }
}