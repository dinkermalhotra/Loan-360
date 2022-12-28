class BankIdModel {
  int? id;
  String? branchCode;
  String? accountGroupCode;
  String? accountType;
  String? companyCode;
  String? addressId;
  String? subLedgerCode;
  bool? automatic;
  String? name;
  String? alias;
  String? creditDays;
  String? rateInt;
  String? sharePercent;
  String? lockedOn;
  String? panNo;
  String? costCenter;
  String? refrenceAdjust;
  String? createdOn;
  String? updatedOn;
  bool? inactive;
  String? inactiveOn;
  String? code;
  String? chequeFormatFile;
  String? accountNo;
  String? createdOnBy;
  String? updatedOnBy;
  String? inactiveOnBy;
  String? nachUniqueId;
  String? nachBankCode;
  String? reverseAccountGroupCode;
  String? ecsUserCode;
  String? micrCode;
  String? bankFormatCode;
  bool? showInAllBranches;
  String? taxClassId;
  int? stateId;
  String? taxNo;
  String? hsnCode;
  String? attachments;
  String? kyc;
  String? taxCategory;
  String? lockedUpdatedOn;
  String? tdsClassId;
  String? tdsType;
  bool? tdsEditable;
  bool? tds;
  String? ndsi500ItemCode;
  String? nbs7ItemCode;
  bool? tax;
  String? roleCode;
  var drFromAmount;
  var drToAmount;
  var crFromAmount;
  var crToAmount;

  BankIdModel(
      {this.id,
        this.branchCode,
        this.accountGroupCode,
        this.accountType,
        this.companyCode,
        this.addressId,
        this.subLedgerCode,
        this.automatic,
        this.name,
        this.alias,
        this.creditDays,
        this.rateInt,
        this.sharePercent,
        this.lockedOn,
        this.panNo,
        this.costCenter,
        this.refrenceAdjust,
        this.createdOn,
        this.updatedOn,
        this.inactive,
        this.inactiveOn,
        this.code,
        this.chequeFormatFile,
        this.accountNo,
        this.createdOnBy,
        this.updatedOnBy,
        this.inactiveOnBy,
        this.nachUniqueId,
        this.nachBankCode,
        this.reverseAccountGroupCode,
        this.ecsUserCode,
        this.micrCode,
        this.bankFormatCode,
        this.showInAllBranches,
        this.taxClassId,
        this.stateId,
        this.taxNo,
        this.hsnCode,
        this.attachments,
        this.kyc,
        this.taxCategory,
        this.lockedUpdatedOn,
        this.tdsClassId,
        this.tdsType,
        this.tdsEditable,
        this.tds,
        this.ndsi500ItemCode,
        this.nbs7ItemCode,
        this.tax,
        this.roleCode,
        this.drFromAmount,
        this.drToAmount,
        this.crFromAmount,
        this.crToAmount});

  BankIdModel.fromJson(Map<String, dynamic> json) {
    id = json['id']!=null?json['id']:0;
    branchCode = json['branchCode']!=null?json['branchCode']:"";
    accountGroupCode = json['accountGroupCode']!=null?json['accountGroupCode']:"";
    accountType = json['accountType']!=null?json['accountType']:"";
    companyCode = json['companyCode']!=null?json['companyCode']:"";
    //addressId = json['addressId']!=null?json['addressId']:"";
    //subLedgerCode = json['subLedgerCode']!=null?json['subLedgerCode']:"";
    //automatic = json['automatic']!=null?json['automatic']:"";
    name = json['name']!=null?json['name']:"";

    creditDays = json['creditDays']!=null?json['creditDays']:"";
    rateInt = json['rateInt']!=null?json['rateInt']:"";
    sharePercent = json['sharePercent']!=null?json['sharePercent']:"";

    panNo = json['panNo']!=null?json['panNo']:"";
    costCenter = json['costCenter']!=null?json['costCenter']:"";
    //refrenceAdjust = json['refrenceAdjust']!=null?json['refrenceAdjust']:"";
    code = json['code']!=null?json['code']:"";
    chequeFormatFile = json['chequeFormatFile']!=null?json['chequeFormatFile']:"";
    accountNo = json['accountNo']!=null?json['accountNo']:"";

    nachUniqueId = json['nachUniqueId']!=null?json['nachUniqueId']:"";
    nachBankCode = json['nachBankCode']!=null?json['nachBankCode']:"";
    reverseAccountGroupCode = json['reverseAccountGroupCode']!=null?json['reverseAccountGroupCode']:"";
    ecsUserCode = json['ecsUserCode']!=null?json['ecsUserCode']:"";
    micrCode = json['micrCode']!=null?json['micrCode']:"";
    bankFormatCode = json['bankFormatCode']!=null?json['bankFormatCode']:"";
    showInAllBranches = json['showInAllBranches']!=null?json['showInAllBranches']:false;
    taxClassId = json['taxClassId']!=null?json['taxClassId']:"";
    stateId = json['stateId']!=null?json['stateId']:"";
    taxNo = json['taxNo']!=null?json['taxNo']:"";
    hsnCode = json['hsnCode']!=null?json['hsnCode']:"";
    attachments = json['attachments']!=null?json['attachments']:"";
    kyc = json['kyc']!=null?json['kyc']:"";
    taxCategory = json['taxCategory']!=null?json['taxCategory']:"";
    lockedUpdatedOn = json['lockedUpdatedOn']!=null?json['lockedUpdatedOn']:"";

   // drFromAmount = json['drFromAmount'] !=null? json['drFromAmount'] is int ? int.parse(json['drFromAmount']) :json['drFromAmount'] is double ? double.parse(json['drFromAmount']): json['drFromAmount']:'' ;
   // drToAmount = json['drToAmount'] !=null? json['drToAmount'] is int ? int.parse(json['drToAmount']) :json['drToAmount'] is double ? double.parse(json['drToAmount']): json['drToAmount']:'' ;
    //drToAmount = json['drToAmount']!=null?json['drToAmount']:"";
   // crFromAmount = json['crFromAmount']!=null?json['crFromAmount']:"";
   // crToAmount = json['crToAmount']!=null?json['crToAmount']:"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['branchCode'] = this.branchCode;
    data['accountGroupCode'] = this.accountGroupCode;
    data['accountType'] = this.accountType;
    data['companyCode'] = this.companyCode;
    data['addressId'] = this.addressId;
    data['subLedgerCode'] = this.subLedgerCode;
    data['automatic'] = this.automatic;
    data['name'] = this.name;
    data['alias'] = this.alias;
    data['creditDays'] = this.creditDays;
    data['rateInt'] = this.rateInt;
    data['sharePercent'] = this.sharePercent;
    data['lockedOn'] = this.lockedOn;
    data['panNo'] = this.panNo;
    data['costCenter'] = this.costCenter;
    data['refrenceAdjust'] = this.refrenceAdjust;
    data['createdOn'] = this.createdOn;
    data['updatedOn'] = this.updatedOn;
    data['inactive'] = this.inactive;
    data['inactiveOn'] = this.inactiveOn;
    data['code'] = this.code;
    data['chequeFormatFile'] = this.chequeFormatFile;
    data['accountNo'] = this.accountNo;
    data['createdOnBy'] = this.createdOnBy;
    data['updatedOnBy'] = this.updatedOnBy;
    data['inactiveOnBy'] = this.inactiveOnBy;
    data['nachUniqueId'] = this.nachUniqueId;
    data['nachBankCode'] = this.nachBankCode;
    data['reverseAccountGroupCode'] = this.reverseAccountGroupCode;
    data['ecsUserCode'] = this.ecsUserCode;
    data['micrCode'] = this.micrCode;
    data['bankFormatCode'] = this.bankFormatCode;
    data['showInAllBranches'] = this.showInAllBranches;
    data['taxClassId'] = this.taxClassId;
    data['stateId'] = this.stateId;
    data['taxNo'] = this.taxNo;
    data['hsnCode'] = this.hsnCode;
    data['attachments'] = this.attachments;
    data['kyc'] = this.kyc;
    data['taxCategory'] = this.taxCategory;
    data['lockedUpdatedOn'] = this.lockedUpdatedOn;
    data['tdsClassId'] = this.tdsClassId;
    data['tdsType'] = this.tdsType;
    data['tdsEditable'] = this.tdsEditable;
    data['tds'] = this.tds;
    data['ndsi500ItemCode'] = this.ndsi500ItemCode;
    data['nbs7ItemCode'] = this.nbs7ItemCode;
    data['tax'] = this.tax;
    data['roleCode'] = this.roleCode;
    data['drFromAmount'] = this.drFromAmount;
    data['drToAmount'] = this.drToAmount;
    data['crFromAmount'] = this.crFromAmount;
    data['crToAmount'] = this.crToAmount;
    return data;
  }
}


