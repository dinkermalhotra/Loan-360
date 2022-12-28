class CashBackModel {
  int? id;
  String? branchCode;
  String? accountGroupCode;
  String? accountType;
//  Null? companyCode;
//  Null? addressId;
//  Null? subLedgerCode;
  bool? automatic;
  String? name;
// Null? alias;
//  Null? creditDays;
// Null? rateInt;
//  Null? sharePercent;
  String? lockedOn;
//  Null? panNo;
//  Null? costCenter;
//  Null? refrenceAdjust;
  String? createdOn;
  String? updatedOn;
  bool? inactive;
  String? inactiveOn;
  String? code;
 // Null? chequeFormatFile;
  String? accountNo;
 // Null? createdOnBy;
  String? updatedOnBy;
//  Null? inactiveOnBy;
//  Null? nachUniqueId;
//  Null? nachBankCode;
//  Null? reverseAccountGroupCode;
//  Null? ecsUserCode;
//  Null? micrCode;
//  Null? bankFormatCode;
  bool? showInAllBranches;
//  Null? taxClassId;
  int? stateId;
//  Null? taxNo;
//  Null? hsnCode;
  String? attachments;
  String? kyc;
 // Null? taxCategory;
 // Null? lockedUpdatedOn;
//  Null? tdsClassId;
//  Null? tdsType;
  bool? tdsEditable;
  bool? tds;
//  Null? ndsi500ItemCode;
//  Null? nbs7ItemCode;
  bool? tax;
  String? roleCode;
  double? drFromAmount;
  double? drToAmount;
  double? crFromAmount;
  double? crToAmount;

  CashBackModel({
        this.id,
        this.branchCode,
        this.accountGroupCode,
        this.accountType,
  //      this.companyCode,
  //      this.addressId,
  //      this.subLedgerCode,
        this.automatic,
        this.name,
  //      this.alias,
  //      this.creditDays,
  //      this.rateInt,
  //      this.sharePercent,
        this.lockedOn,
 //       this.panNo,
 //       this.costCenter,
 //       this.refrenceAdjust,
        this.createdOn,
        this.updatedOn,
        this.inactive,
        this.inactiveOn,
        this.code,
 //       this.chequeFormatFile,
        this.accountNo,
 //       this.createdOnBy,
        this.updatedOnBy,
 //       this.inactiveOnBy,
 //       this.nachUniqueId,
 //       this.nachBankCode,
 //       this.reverseAccountGroupCode,
 //       this.ecsUserCode,
 //       this.micrCode,
 //       this.bankFormatCode,
        this.showInAllBranches,
 //       this.taxClassId,
        this.stateId,
 //       this.taxNo,
 //       this.hsnCode,
        this.attachments,
        this.kyc,
 //       this.taxCategory,
 //       this.lockedUpdatedOn,
 //       this.tdsClassId,
 //       this.tdsType,
        this.tdsEditable,
        this.tds,
  //      this.ndsi500ItemCode,
  //      this.nbs7ItemCode,
        this.tax,
        this.roleCode,
        this.drFromAmount,
        this.drToAmount,
        this.crFromAmount,
        this.crToAmount});

  CashBackModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branchCode = json['branchCode'];
    accountGroupCode = json['accountGroupCode'];
    accountType = json['accountType'];
 //   companyCode = json['companyCode'];
  //  addressId = json['addressId'];
 //   subLedgerCode = json['subLedgerCode'];
    automatic = json['automatic'];
    name = json['name'];
//    alias = json['alias'];
//   creditDays = json['creditDays'];
//    rateInt = json['rateInt'];
//    sharePercent = json['sharePercent'];
    lockedOn = json['lockedOn'];
//    panNo = json['panNo'];
//    costCenter = json['costCenter'];
//    refrenceAdjust = json['refrenceAdjust'];
    createdOn = json['createdOn'];
    updatedOn = json['updatedOn'];
    inactive = json['inactive'];
    inactiveOn = json['inactiveOn'];
    code = json['code'];
//    chequeFormatFile = json['chequeFormatFile'];
    accountNo = json['accountNo'];
//    createdOnBy = json['createdOnBy'];
    updatedOnBy = json['updatedOnBy'];
//    inactiveOnBy = json['inactiveOnBy'];
//  nachUniqueId = json['nachUniqueId'];
//    nachBankCode = json['nachBankCode'];
//    reverseAccountGroupCode = json['reverseAccountGroupCode'];
//    ecsUserCode = json['ecsUserCode'];
//    micrCode = json['micrCode'];
//    bankFormatCode = json['bankFormatCode'];
    showInAllBranches = json['showInAllBranches'];
//    taxClassId = json['taxClassId'];
    stateId = json['stateId'];
//    taxNo = json['taxNo'];
//    hsnCode = json['hsnCode'];
    attachments = json['attachments'];
    kyc = json['kyc'];
//    taxCategory = json['taxCategory'];
//    lockedUpdatedOn = json['lockedUpdatedOn'];
//    tdsClassId = json['tdsClassId'];
//    tdsType = json['tdsType'];
    tdsEditable = json['tdsEditable'];
    tds = json['tds'];
//    ndsi500ItemCode = json['ndsi500ItemCode'];
//    nbs7ItemCode = json['nbs7ItemCode'];
    tax = json['tax'];
    roleCode = json['roleCode'];
    drFromAmount = json['drFromAmount'];
    drToAmount = json['drToAmount'];
    crFromAmount = json['crFromAmount'];
    crToAmount = json['crToAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['branchCode'] = this.branchCode;
    data['accountGroupCode'] = this.accountGroupCode;
    data['accountType'] = this.accountType;
//  data['companyCode'] = this.companyCode;
//  data['addressId'] = this.addressId;
//  data['subLedgerCode'] = this.subLedgerCode;
    data['automatic'] = this.automatic;
    data['name'] = this.name;
//  data['alias'] = this.alias;
//  data['creditDays'] = this.creditDays;
//  data['rateInt'] = this.rateInt;
//    data['sharePercent'] = this.sharePercent;
    data['lockedOn'] = this.lockedOn;
//  data['panNo'] = this.panNo;
//  data['costCenter'] = this.costCenter;
//  data['refrenceAdjust'] = this.refrenceAdjust;
    data['createdOn'] = this.createdOn;
    data['updatedOn'] = this.updatedOn;
    data['inactive'] = this.inactive;
    data['inactiveOn'] = this.inactiveOn;
    data['code'] = this.code;
//  data['chequeFormatFile'] = this.chequeFormatFile;
    data['accountNo'] = this.accountNo;
//  data['createdOnBy'] = this.createdOnBy;
    data['updatedOnBy'] = this.updatedOnBy;
//  data['inactiveOnBy'] = this.inactiveOnBy;
//  data['nachUniqueId'] = this.nachUniqueId;
//  data['nachBankCode'] = this.nachBankCode;
//  data['reverseAccountGroupCode'] = this.reverseAccountGroupCode;
//  data['ecsUserCode'] = this.ecsUserCode;
//  data['micrCode'] = this.micrCode;
//  data['bankFormatCode'] = this.bankFormatCode;
    data['showInAllBranches'] = this.showInAllBranches;
//  data['taxClassId'] = this.taxClassId;
    data['stateId'] = this.stateId;
//  data['taxNo'] = this.taxNo;
//  data['hsnCode'] = this.hsnCode;
    data['attachments'] = this.attachments;
    data['kyc'] = this.kyc;
//  data['taxCategory'] = this.taxCategory;
//  data['lockedUpdatedOn'] = this.lockedUpdatedOn;
//  data['tdsClassId'] = this.tdsClassId;
//  data['tdsType'] = this.tdsType;
    data['tdsEditable'] = this.tdsEditable;
    data['tds'] = this.tds;
//  data['ndsi500ItemCode'] = this.ndsi500ItemCode;
//  data['nbs7ItemCode'] = this.nbs7ItemCode;
    data['tax'] = this.tax;
    data['roleCode'] = this.roleCode;
    data['drFromAmount'] = this.drFromAmount;
    data['drToAmount'] = this.drToAmount;
    data['crFromAmount'] = this.crFromAmount;
    data['crToAmount'] = this.crToAmount;
    return data;
  }
}