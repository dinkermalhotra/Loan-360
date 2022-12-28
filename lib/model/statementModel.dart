class StatementModel {
  String? id;
  String? customerId;
  String? appNo;
  String? loanNo;
  String? loanAmount;
  String? appDate;
  String? loanDate;
  String? name;
  String? regnNos;
  String? asset;
  String? attachedAs;
  String? accountingCategoryCode;
  String? branchCode;
  String? companyCode;
  String? holdPayment;
  String? holdPaymentReason;
  String? paymentReleasedOn;
  String? paymentReleasedBy;
  String? productCode;
  String? loanType;
  String? moratoriumUpto;
  String? drawnOn;
  String? dealer;
  String? paymentOn;
  String? mobile;
  String? email;
  String? stateId;
  String? taxNo;
  String? chargesDueVoucher;
  String? appStatus;
  String? loanStatus;
  String? locked;
  String? locationId;
  String? productId;
  String? dealerId;
  String? firstEmiAmount;
  String? bankId;
  String? bankBranchId;
  String? isBorrowing;
  String? drawnOnSub;
  String? repossessionDate;
  String? releaseDate;

  StatementModel(
      {this.id,
        this.customerId,
        this.appNo,
        this.loanNo,
        this.loanAmount,
        this.appDate,
        this.loanDate,
        this.name,
        this.regnNos,
        this.asset,
        this.attachedAs,
        this.accountingCategoryCode,
        this.branchCode,
        this.companyCode,
        this.holdPayment,
        this.holdPaymentReason,
        this.paymentReleasedOn,
        this.paymentReleasedBy,
        this.productCode,
        this.loanType,
        this.moratoriumUpto,
        this.drawnOn,
        this.dealer,
        this.paymentOn,
        this.mobile,
        this.email,
        this.stateId,
        this.taxNo,
        this.chargesDueVoucher,
        this.appStatus,
        this.loanStatus,
        this.locked,
        this.locationId,
        this.productId,
        this.dealerId,
        this.firstEmiAmount,
        this.bankId,
        this.bankBranchId,
        this.isBorrowing,
        this.drawnOnSub,
        this.repossessionDate,
        this.releaseDate});

  StatementModel.fromJson(Map<String, dynamic> json) {
    id = json['id']!= null?json['id']:'';
    customerId = json['customerId']!= null?json['customerId']:'';
    appNo = json['appNo']!= null?json['appNo']:'';
    loanNo = json['loanNo']!= null?json['loanNo']:'';
    loanAmount = json['loanAmount']!= null?json['loanAmount']:'';
    appDate = json['appDate']!= null?json['appDate']:'';
    loanDate = json['loanDate']!= null?json['loanDate']:'';
    name = json['name']!= null?json['name']:'';
    regnNos = json['regnNos']!= null?json['regnNos']:'';
    asset = json['asset']!= null?json['asset']:'';
    attachedAs = json['attachedAs']!= null?json['attachedAs']:'';
    accountingCategoryCode = json['accountingCategoryCode']!= null?json['accountingCategoryCode']:'';
    branchCode = json['branchCode']!= null?json['branchCode']:'';
    companyCode = json['companyCode']!= null?json['companyCode']:'';
    holdPayment = json['holdPayment']!= null?json['holdPayment']:'';
    holdPaymentReason = json['holdPaymentReason']!= null?json['holdPaymentReason']:'';
    paymentReleasedOn = json['paymentReleasedOn']!= null?json['paymentReleasedOn']:'';
    paymentReleasedBy = json['paymentReleasedBy']!= null?json['paymentReleasedBy']:'';
    productCode = json['productCode']!= null?json['productCode']:'';
    loanType = json['loanType']!= null?json['loanType']:'';
    moratoriumUpto = json['moratoriumUpto']!= null?json['moratoriumUpto']:'';
    drawnOn = json['drawnOn']!= null?json['drawnOn']:'';
    dealer = json['dealer']!= null?json['dealer']:'';
    paymentOn = json['paymentOn']!= null?json['paymentOn']:'';
    mobile = json['mobile']!= null?json['mobile']:'';
    email = json['email']!= null?json['email']:'';
    stateId = json['stateId']!= null?json['stateId']:'';
    taxNo = json['taxNo']!= null?json['taxNo']:'';
    chargesDueVoucher = json['chargesDueVoucher']!= null?json['chargesDueVoucher']:'';
    appStatus = json['appStatus']!= null?json['appStatus']:'';
    loanStatus = json['loanStatus']!= null?json['loanStatus']:'';
    locked = json['locked']!= null?json['locked']:'';
    locationId = json['locationId']!= null?json['locationId']:'';
    productId = json['productId']!= null?json['productId']:'';
    dealerId = json['dealerId']!= null?json['dealerId']:'';
    firstEmiAmount = json['firstEmiAmount']!= null?json['firstEmiAmount']:'';
    bankId = json['bankId']!= null?json['bankId']:'';
    bankBranchId = json['bankBranchId']!= null?json['bankBranchId']:'';
    isBorrowing = json['isBorrowing']!= null?json['isBorrowing']:'';
    drawnOnSub = json['drawnOnSub']!= null?json['drawnOnSub']:'';
    repossessionDate = json['repossessionDate']!= null?json['repossessionDate']:'';
    releaseDate = json['releaseDate']!= null?json['releaseDate']:'';
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customerId'] = this.customerId;
    data['appNo'] = this.appNo;
    data['loanNo'] = this.loanNo;
    data['loanAmount'] = this.loanAmount;
    data['appDate'] = this.appDate;
    data['loanDate'] = this.loanDate;
    data['name'] = this.name;
    data['regnNos'] = this.regnNos;
    data['asset'] = this.asset;
    data['attachedAs'] = this.attachedAs;
    data['accountingCategoryCode'] = this.accountingCategoryCode;
    data['branchCode'] = this.branchCode;
    data['companyCode'] = this.companyCode;
    data['holdPayment'] = this.holdPayment;
    data['holdPaymentReason'] = this.holdPaymentReason;
    data['paymentReleasedOn'] = this.paymentReleasedOn;
    data['paymentReleasedBy'] = this.paymentReleasedBy;
    data['productCode'] = this.productCode;
    data['loanType'] = this.loanType;
    data['moratoriumUpto'] = this.moratoriumUpto;
    data['drawnOn'] = this.drawnOn;
    data['dealer'] = this.dealer;
    data['paymentOn'] = this.paymentOn;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['stateId'] = this.stateId;
    data['taxNo'] = this.taxNo;
    data['chargesDueVoucher'] = this.chargesDueVoucher;
    data['appStatus'] = this.appStatus;
    data['loanStatus'] = this.loanStatus;
    data['locked'] = this.locked;
    data['locationId'] = this.locationId;
    data['productId'] = this.productId;
    data['dealerId'] = this.dealerId;
    data['firstEmiAmount'] = this.firstEmiAmount;
    data['bankId'] = this.bankId;
    data['bankBranchId'] = this.bankBranchId;
    data['isBorrowing'] = this.isBorrowing;
    data['drawnOnSub'] = this.drawnOnSub;
    data['repossessionDate'] = this.repossessionDate;
    data['releaseDate'] = this.releaseDate;
    return data;
  }
}




class StatementLoanSearch {
  String? responseStatus;
  int? id;
  String? childId;
  String? code;
  String? codes;
  String? displayMessage;
  String? responseCode;
  List<loadData>? loanSearchData;
  String? inactiveOnBy;
  String? updatedOnBy;
  String? createdOnBy;

  StatementLoanSearch(
      {this.responseStatus,
        this.id,
        this.childId,
        this.code,
        this.codes,
        this.displayMessage,
        this.responseCode,
        this.loanSearchData,
        this.inactiveOnBy,
        this.updatedOnBy,
        this.createdOnBy});

  StatementLoanSearch.fromJson(Map<String, dynamic> json) {
    responseStatus = json['responseStatus'];
    id = json['id'];
    childId = json['childId'];
    code = json['code'];
    codes = json['codes'];
    displayMessage = json['displayMessage'];
    responseCode = json['responseCode'];
    if (json['object'] != null) {
      loanSearchData = <loadData>[];
      json['object'].forEach((v) {
        loanSearchData!.add(new loadData.fromJson(v));
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
    if (this.loanSearchData != null) {
      data['object'] = this.loanSearchData!.map((v) => v.toJson()).toList();
    }
    data['inactiveOnBy'] = this.inactiveOnBy;
    data['updatedOnBy'] = this.updatedOnBy;
    data['createdOnBy'] = this.createdOnBy;
    return data;
  }
}

class loadData {
  String? companyCode;
  String? loanNo;
  String? regnNos;
  String? mobile;
  String? appNo;
  String? appDate;
  String? appStatus;
  double? loanAmount;
  String? branchCode;
  String? relName;
  String? productCode;
  bool? isBorrowing;
  int? customerId;
  String? name;
  String? loanStatus;
  String? loanDate;
  String? accountingCategoryCode;
  int? id;
  String? asset;
  String? email;

  loadData(
      {this.companyCode,
        this.loanNo,
        this.regnNos,
        this.mobile,
        this.appNo,
        this.appDate,
        this.appStatus,
        this.loanAmount,
        this.branchCode,
        this.relName,
        this.productCode,
        this.isBorrowing,
        this.customerId,
        this.name,
        this.loanStatus,
        this.loanDate,
        this.accountingCategoryCode,
        this.id,
        this.asset,
        this.email});

  loadData.fromJson(Map<String, dynamic> json) {
    companyCode = json['companyCode'];
    loanNo = json['loanNo'];
    regnNos = json['regnNos'];
    mobile = json['mobile'];
    appNo = json['appNo'];
    appDate = json['appDate'];
    appStatus = json['appStatus'];
    loanAmount = json['loanAmount'];
    branchCode = json['branchCode'];
    relName = json['relName'];
    productCode = json['productCode'];
    isBorrowing = json['isBorrowing'];
    customerId = json['customerId'];
    name = json['name'];
    loanStatus = json['loanStatus'];
    loanDate = json['loanDate'];
    accountingCategoryCode = json['accountingCategoryCode'];
    id = json['id'];
    asset = json['asset'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyCode'] = this.companyCode;
    data['loanNo'] = this.loanNo;
    data['regnNos'] = this.regnNos;
    data['mobile'] = this.mobile;
    data['appNo'] = this.appNo;
    data['appDate'] = this.appDate;
    data['appStatus'] = this.appStatus;
    data['loanAmount'] = this.loanAmount;
    data['branchCode'] = this.branchCode;
    data['relName'] = this.relName;
    data['productCode'] = this.productCode;
    data['isBorrowing'] = this.isBorrowing;
    data['customerId'] = this.customerId;
    data['name'] = this.name;
    data['loanStatus'] = this.loanStatus;
    data['loanDate'] = this.loanDate;
    data['accountingCategoryCode'] = this.accountingCategoryCode;
    data['id'] = this.id;
    data['asset'] = this.asset;
    data['email'] = this.email;
    return data;
  }
}