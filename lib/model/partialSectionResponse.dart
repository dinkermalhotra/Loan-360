class PartialSectionResponseData {
  int? emi;
  String? companyCode;
  String? loanNo;
  String? regnNos;
  Null? dmaId;
  String? mobile;
  String? appNo;
  int? loanAmount;
  String? branchCode;
  int? locationId;
  String? name;
  int? customerId;
  String? loanDate;
  String? accountingCategoryCode;
  int? id;
  String? asset;

  PartialSectionResponseData(
      {this.emi,
        this.companyCode,
        this.loanNo,
        this.regnNos,
        this.dmaId,
        this.mobile,
        this.appNo,
        this.loanAmount,
        this.branchCode,
        this.locationId,
        this.name,
        this.customerId,
        this.loanDate,
        this.accountingCategoryCode,
        this.id,
        this.asset});

  PartialSectionResponseData.fromJson(Map<String, dynamic> json) {
    emi = json['emi'];
    companyCode = json['companyCode'];
    loanNo = json['loanNo'];
    regnNos = json['regnNos'];
    dmaId = json['dmaId'];
    mobile = json['mobile'];
    appNo = json['appNo'];
    loanAmount = json['loanAmount'];
    branchCode = json['branchCode'];
    locationId = json['locationId'];
    name = json['name'];
    customerId = json['customerId'];
    loanDate = json['loanDate'];
    accountingCategoryCode = json['accountingCategoryCode'];
    id = json['id'];
    asset = json['asset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emi'] = this.emi;
    data['companyCode'] = this.companyCode;
    data['loanNo'] = this.loanNo;
    data['regnNos'] = this.regnNos;
    data['dmaId'] = this.dmaId;
    data['mobile'] = this.mobile;
    data['appNo'] = this.appNo;
    data['loanAmount'] = this.loanAmount;
    data['branchCode'] = this.branchCode;
    data['locationId'] = this.locationId;
    data['name'] = this.name;
    data['customerId'] = this.customerId;
    data['loanDate'] = this.loanDate;
    data['accountingCategoryCode'] = this.accountingCategoryCode;
    data['id'] = this.id;
    data['asset'] = this.asset;
    return data;
  }
}