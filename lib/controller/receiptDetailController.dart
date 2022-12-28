import 'dart:convert';

import 'package:Loan360Cloud/apiHelper/service.dart';
import 'package:Loan360Cloud/authManager/authManager.dart';
import 'package:Loan360Cloud/model/accountCodeBySectionResponse.dart';
import 'package:Loan360Cloud/model/assetsLoanSearch.dart';
import 'package:Loan360Cloud/model/bankIdModel.dart';
import 'package:Loan360Cloud/model/cashBackModel.dart';
import 'package:Loan360Cloud/model/collectionExecutiveResponse.dart';
import 'package:Loan360Cloud/model/companyDetail.dart';
import 'package:Loan360Cloud/model/companyInfoModel.dart';
import 'package:Loan360Cloud/model/mobileReceipt.dart';
import 'package:Loan360Cloud/model/mobileReceiptLimitResponse.dart';
import 'package:Loan360Cloud/model/mobileUpdateResponse.dart';
import 'package:Loan360Cloud/model/partialSectionResponse.dart';
import 'package:Loan360Cloud/model/pdfStatementModel.dart';
import 'package:Loan360Cloud/model/receiptAutoData.dart';
import 'package:Loan360Cloud/model/receiptMaxResponse.dart';
import 'package:Loan360Cloud/model/receiptSaveModel.dart';
import 'package:Loan360Cloud/model/receivedAmount.dart';
import 'package:Loan360Cloud/model/statementModel.dart';
import 'package:Loan360Cloud/ui/receiptLoadDetail.dart';
import 'package:Loan360Cloud/ui/statementOfAccount.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Receipt_DetailController extends GetxController {
  double totalOsBalance = 0.0;
  AuthenticationManager authenticationManager = Get.put(AuthenticationManager());
  Service _companyService =  Get.put(Service());
  RxBool loading = false.obs;
  RxBool receiptLoading = false.obs;
  RxBool dataShow = false.obs;
  ReceiptAutoData receiptAutoData = new ReceiptAutoData();
  MobileReceiptLimitResponse mobileReceiptLimitResponse = new MobileReceiptLimitResponse();
  CollectionExecutiveResponse collectionExecutiveResponse = new CollectionExecutiveResponse();
  ReceiptMaxResponse receiptMaxResponse = new ReceiptMaxResponse();
  AccountCodeBySectionResponse accountCodeBySectionResponse = new AccountCodeBySectionResponse();
  PartialSectionResponseData partialSectionResponseData = new PartialSectionResponseData();
  AssetsLoanSearchModel assetsObjectModel = new AssetsLoanSearchModel();
  MobileReceiptModel mobileReceiptModel = new MobileReceiptModel();
  CashBackModel cashBackModel = new CashBackModel();
  CompanyDetail companyDetail = new CompanyDetail();
  CompanyInfoModel companyInfoModel = new CompanyInfoModel();
  List<AccountCodeBySectionResponse> accountCodeByList = [];
  List<AccountCodeBySectionResponse> accountCodeListData = [];
  List<MobileReceiptLimitResponse> mobileReceiptList = [];
  List<CashBackModel> cashBackList = [];
  ReceivedAmountModel receivedAmountModel = new ReceivedAmountModel();
  StatementModel statementModel = new StatementModel();
  StatementLoanSearch statementLoanSearch = new StatementLoanSearch();
  List<ReceivedAmountModel> ListReceivedAmount =[];
  List<BankIdModel> bankListId =[];
  ReceiptSaveModel receiptSaveModel = new ReceiptSaveModel();
  String? overdue='';
  String? installment='';
  String? loan='';
  String? insRen='';
  String? insRensme='';
  String? chkBounce='';
  String? drBounce='';
  String? chargesDue='';
  String? unMatPen='';
  String? legal='';
  List<creditData> listData =  [];
  List<RemainingJson> remainingBalance = [];
  double totalAmount= 0.0;
  List<String> autoSplit = [];
  var installmentData;

  double totalAccountBalance=0.0;

  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMaxRno();
    mainFunction();
    /*accountCodeBySection();
    mainFunction();*/

    //loading(true);
    //partialSectionResponse();
    // assetsLoanResponse();
  }

  mainFunction(){
    accountCodeBySection();
    loanAutoReceipt();
    companyDetailFunction();
    //mobileReceiptLimits();
    getMaxRno();
    bankIdResponse();
   // mobileReceiptResponse();
    collectionExecutiveData();
    cashBankResponse();
    companyInfoResponse();
  }


  statmentSearch({String? searchLoanNo})async{
    receiptLoading(true);
    dataShow(true);
    final response = await _companyService.statementFunction(loanNo: searchLoanNo);
    if (response != null) {

      print("Statement Search");
      print(jsonEncode(response.body));
      final Map<String, dynamic> responseData = json.decode(response.body);

      statementModel =  StatementModel.fromJson(responseData);
      if(statementModel.loanNo == null || statementModel.loanNo ==''){
        receiptLoading(false);
      } else {
        print('loan StatementModel');
        print(statementModel!.loanNo);
        loanSearchData(searchLoanNo: statementModel!.loanNo);
        update();
      }
    } else {

      receiptLoading(false);
    }

  }

  loanSearchData({String? searchLoanNo}) async{
    receiptLoading(true);

    final response = await _companyService.loanSearchFunction(loanNo: searchLoanNo);
    if (response != null) {
      print("loanSearchData");
      print(jsonEncode(response.body));
      statementLoanSearch = StatementLoanSearch.fromJson(response.body);
      update();

      receiptLoading(false);
    } else {
      //loading(true);
      // dataShow(false);
    }
    receiptLoading(false);

  }



  collectionExecutiveData()async {
    loading(true);
    final response = await _companyService.collectionExecutiveBalanceFunction(userName:authenticationManager.getUserName(),finId: authenticationManager.getFinanceYearId());
    if (response != null) {
      safePrint("CollectionExecutiveResponse");
      safePrint(jsonEncode(response.body));

      if(collectionExecutiveResponse == null){
        loading(false);
        collectionExecutiveResponse = CollectionExecutiveResponse.fromJson(response.body);
      }else {
        loading(false);
        safePrint('CollectionExecutiveResponse');
        update();

      }
    } else {

      loading(false);
    }
  }


  mobileReceiptLimits()async {
    loading(true);
    final response = await _companyService.mobileReceiptLimitFunction(userName:authenticationManager.getUserName());
    if (response != null) {
      safePrint("mobileReceiptLimits");
      safePrint(jsonEncode(response.body));
      //mobileReceiptLimitResponse = MobileReceiptLimitResponse.fromJson(response.body);
      List<dynamic>? body = response.body;

      if(response.body == null){
        loading(false);
        mobileReceiptList.elementAt(0).limitAmount = 0;
        safePrint(mobileReceiptList.elementAt(0).limitAmount);
      }else {
        loading(false);
        mobileReceiptList = body?.map((dynamic item) => MobileReceiptLimitResponse.fromJson(item)).toList() ?? [];
        safePrint('mobileReceiptLimits');
        update();
      }
    } else {
      loading(false);
    }
  }

  loanAutoReceipt()async{
    loading(true);
    final response = await _companyService.loanAutoReceitFunction();
    if (response != null) {
      safePrint("loanAutoReceipt");
      safePrint(jsonEncode(response.body));
      final Map<String, dynamic> responseData = json.decode(response.body);
      receiptAutoData = ReceiptAutoData.fromJson(responseData);
      if(receiptAutoData.value == null){
        loading(false);
      }else {
        loading(false);
        safePrint('receiptAutoData');
        autoSplit = receiptAutoData.value!.split(',');
        print("autoSplit");
        print(autoSplit.toList());
        update();


      }
    } else {

      loading(false);
    }
  }

  getMaxRno() async {
    final response = await _companyService.getMaxRno_Response(userName: authenticationManager.getUserName());
    if (response != null) {
      safePrint("getMaxRno Response");
      safePrint(jsonEncode(response.body));
      receiptMaxResponse = ReceiptMaxResponse.fromJson(response.body);
      print(receiptMaxResponse.code);
      if(receiptMaxResponse.code == null){
      }else {

        update();
      }
    } else {

    }
  }


  accountCodeBySection() async {
    loading(true);
    final response = await _companyService.accountCodeSectionFunction();
    if (response != null) {
      safePrint("accountCodeBySection body");
      safePrint(jsonEncode(response.body));
      List<dynamic>? body = response.body;


      if(response.body == null){
        loading(false);
      }else {
        loading(false);
        accountCodeByList = body?.map((dynamic item) => AccountCodeBySectionResponse.fromJson(item)).toList() ?? [];
        update();
      }
      /*List<dynamic>streetsList = response.body;
      print("streets");
      print(streetsList.length);*/

      // AccountCodeBySectionResponse.fromJson(jsonDecode(response.body));
      // accountCodeByList.addAll(List<AccountCodeBySectionResponse>.from(json.decode(response.body).map((x) => AccountCodeBySectionResponse.fromJson(x))));
      // accountCodeByList.add(AccountCodeBySectionResponse.fromJson(response.body));
      // accountCodeBySectionResponse = AccountCodeBySectionResponse.fromJson(response.body);

    } else {
      loading(false);
    }
  }


  partialSectionResponse() async{
    loading(true);
    final response = await _companyService.partialSelectFunction();
    if (response != null) {
      safePrint("partialSectionResponse Response");
      safePrint(jsonEncode(response.body));
      partialSectionResponseData = PartialSectionResponseData.fromJson(response.body);
      if(partialSectionResponseData.emi == null){
        loading(false);
      }else {
        loading(false);
        safePrint('receiptAutoData');
        update();
      }
    } else {
      loading(false);
    }
  }



  assetsLoanResponse()async{

    loading(true);
    final response = await _companyService.assetsLoanSearchFunction();
    if (response != null) {
      safePrint("AssetsLoanSearch Response");
      safePrint(jsonEncode(response.body));
      assetsObjectModel = AssetsLoanSearchModel.fromJson(response.body);
      if(assetsObjectModel.responseStatus == null){
        loading(false);
      }else {
        loading(false);
        safePrint('receiptAutoData');
        update();

      }
    } else {
      loading(false);
    }
  }

  mobileReceiptResponse()async {
    loading(true);
    final response = await _companyService.mobileReceiptFunction();
    if (response != null) {
      safePrint("mobileReceiptModel Response");
      safePrint(jsonEncode(response.body));
      mobileReceiptModel = MobileReceiptModel.fromJson(response.body);
      if(mobileReceiptModel.key == null){
        loading(false);
      }else {
        loading(false);
        safePrint('receiptAutoData');
        update();
      }
    } else {
      loading(false);
    }
  }


  cashBankResponse()async {
    loading(true);
    safePrint("getBranchByLoginData");
    safePrint(json.decode(authenticationManager.getBranchByLoginData().toString())['code']);
    safePrint("getCompanyByLoginData");
    safePrint(json.decode(authenticationManager.getCompanyByLoginData().toString())['code']);

    final response = await _companyService.cashBankFunction(companyCode:json.decode(authenticationManager.getCompanyByLoginData().toString())['code'],branchCode:json.decode(authenticationManager.getBranchByLoginData().toString())['code']);
    if (response != null) {
      safePrint("cashBankResponse Response");
      safePrint(jsonEncode(response.body));
      List<dynamic>? body = response.body;


      if(response.body == null){
        loading(false);
      }else {
        loading(false);
        cashBackList = body?.map((dynamic item) => CashBackModel.fromJson(item)).toList() ?? [];
        update();
      }

    } else {

      loading(false);
    }
  }



  companyInfoResponse()async {

    loading(true);
    safePrint("getCompanyByLoginData");
    safePrint(json.decode(authenticationManager.getCompanyByLoginData().toString())['code']);

    final response = await _companyService.companyInfoFunction(companyCode:json.decode(authenticationManager.getCompanyByLoginData().toString())['code']);
    if (response != null) {
      safePrint("CompanyInfoModel Response");
      safePrint(jsonEncode(response.body));
      final Map<String, dynamic> responseData = json.decode(response.body);
      companyInfoModel = CompanyInfoModel.fromJson(responseData);
      if(companyInfoModel.code == null){
        loading(false);
      }else {
        loading(false);
        safePrint('receiptAutoData');
        update();

      }
    } else {
      loading(false);
    }

  }



  receivedAmountResponse({String? loanID})async {
    loading(true);

    final response = await _companyService.receivedAmountFunction(loanId: loanID);
    if (response != null) {
      loading(false);
      ListReceivedAmount.clear();
      accountCodeListData.clear();
      totalAccountBalance =0.0;
      for (var value in response.body) {
        ListReceivedAmount.add(ReceivedAmountModel.fromJson(value));
        print("response.body");
        print(value['accountCode'].toString());
        for(var balanceValue in accountCodeByList){

          print("balanceValue.code");
          if(value['accountCode'].toString().contains(balanceValue.code.toString())) {

            print(value['accountCode'].toString());
            accountCodeListData.add(balanceValue);
          }

          if(value['accountCode'].toString().contains("INSTALMENT")) {
            installmentData = value['accountCode'];
          }
        }

      }

      for(var value in ListReceivedAmount){
      //  remainingBalance.add(RemainingJson(accountCode:value.accountCode,balance: value.balance,accountHead: '',displayName:''));
          if (value.accountCode.toString().contains("LOAN")) {
          remainingBalance.add(RemainingJson(accountCode:value.accountCode,balance: value.balance,accountHead: '',displayName:'Stock'));
        } else if (value.accountCode.toString().contains("INSTALMENT")) {
            remainingBalance.add(RemainingJson(accountCode:value.accountCode,balance: value.balance,accountHead: '',displayName:'Instalment'));
        } else if (value.accountCode.toString().contains("OVERDUE")) {
          remainingBalance.add(RemainingJson(accountCode:value.accountCode,balance: value.balance,accountHead: '',displayName:'Overdue'));
        } else if (value.accountCode.toString().contains("LEDGER")) {
            remainingBalance.add(RemainingJson(accountCode:value.accountCode,balance: value.balance,accountHead: '',displayName:'Ledger'));
        } else {
            remainingBalance.add(RemainingJson(accountCode:value.accountCode,balance: value.balance,accountHead: '',displayName:value.accountCode));
        }

      }

      for(int i=0;i<ListReceivedAmount.length;i++){
        totalAccountBalance = totalAccountBalance + double.parse(ListReceivedAmount.elementAt(i).balance.toString().toString());
      }

      update();

    } else {
      loading(false);

    }

  }

  companyDetailFunction() async{
    loading(true);
    final response = await _companyService.companyInfoGetFunction(companyCode: json.decode(authenticationManager.getCompanyByLoginData().toString())['code'],);
    if (response != null) {
      print('companyInfo');
      print(response['addressId']);
      companyDetail = CompanyDetail.fromJson(response.body);
      print(companyDetail.name);
      update();

    } else {
      loading(false);

    }

  }

  addReceiveAmount({String amount='',String Code=''}){
    var subtractedAmount = amount;
    totalAmount = totalAmount+double.parse(amount.toString());
    var accountCodes = listData.map((e) => e.acCodeName);

    for(int i=0;i<autoSplit.length;i++) {
      for(var codeDataList in ListReceivedAmount) {
        if(!accountCodes.contains(codeDataList.accountCode.toString())) {
          if(autoSplit.elementAt(i).contains(codeDataList.accountCode.toString()) && double.parse(codeDataList.balance.toString()) > 0) {

            if (double.parse(subtractedAmount) > double.parse(codeDataList.balance.toString())) {
              var balance = double.parse(subtractedAmount) - double.parse(codeDataList.balance.toString());
              subtractedAmount = balance.toString();
              listData.add(creditData(isVisible:false,acCodeName: codeDataList.accountCode.toString(), rupees: codeDataList.balance.toString()),);
              break;
            }
            else {
              listData.add(creditData(isVisible:false,acCodeName: codeDataList.accountCode.toString(), rupees: subtractedAmount.toString()),);
              return;
            }
          }
        }
      }
    }
  }



  bankIdResponse()async {

    loading(true);
    final response = await _companyService.bankIdFunction(companyCode: json.decode(authenticationManager.getCompanyByLoginData().toString())['code'],branchCode: json.decode(authenticationManager.getBranchByLoginData().toString())['code'] );
    if (response != null) {
      print('bankIdResponse');
      for (var value in response.body) {
        if(value['accountType']=='B'){
          print(value['name']);
          bankListId.add(BankIdModel.fromJson(value));
        }

      }

      update();

    } else {
      loading(false);

    }

  }


  addCreditAmount({String amount='',String Code=''}){
    totalOsBalance = totalAccountBalance - totalAmount;
    var accountCodes = listData.map((e) => e.acCodeName);
    if(accountCodes.contains(Code.toString())) {
      Get.defaultDialog(
          middleText: "Account code is already added",
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
    else {
      listData.add(creditData(isVisible: true, acCodeName: Code.toString(), rupees: amount.toString()),);
      totalAmount = totalAmount+double.parse(amount.toString());
      remainingBalance.add(RemainingJson(displayName: "Total OS",balance:totalOsBalance.toString(),));
    }
  }




  receiptSaveList({var loanMap,var userData,var balancejsonData,String? AppUserName})async{

   final response = await _companyService.saveReceiptFunction(mapData: loanMap,UserMap:userData,appUserName:AppUserName.toString(),registerNo : receiptMaxResponse.code.toString()??"",balanceJson:balancejsonData,remainingJson: json.encode(remainingBalance.toList()));
    if (response != null) {
      print(response);
      safePrint(jsonEncode(response.body));
      final Map<String, dynamic> responseData = json.decode(response.body);

      receiptSaveModel =  ReceiptSaveModel.fromJson(responseData);
      if(receiptSaveModel.displayMessage == null){

      }else {
        safePrint('receiptSaveModel');
        return receiptSaveModel;
        // update();
      }
    } else {


    }

  }

}


