



/*
import 'dart:convert';
import 'package:Loan360Cloud/apiHelper/service.dart';
import 'package:Loan360Cloud/authManager/authManager.dart';
import 'package:Loan360Cloud/model/receiptMaxResponse.dart';
import 'package:Loan360Cloud/model/receiptSaveModel.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:get/get.dart';

import '../model/statementModel.dart';

class ReceiptLoadController extends GetxController{
  AuthenticationManager authenticationManager = Get.put(AuthenticationManager());
  Service _companyService =  Get.put(Service());
  StatementModel statementModel = new StatementModel();
  StatementLoanSearch statementLoanSearch = new StatementLoanSearch();
  ReceiptMaxResponse receiptMaxResponse = new ReceiptMaxResponse();
  ReceiptSaveModel receiptSaveModel = new ReceiptSaveModel();
  bool Visible = false;
  RxBool loading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }
  statmentSearch({String? searchLoanNo})async{
    loading(true);
    final response = await _companyService.statementFunction(loanNo: searchLoanNo);
    if (response != null) {


      safePrint("Statement Search");
      safePrint(jsonEncode(response.body));
      final Map<String, dynamic> responseData = json.decode(response.body);
      statementModel =  StatementModel.fromJson(responseData);
      //statementModel =  StatementModel.fromJson(response.body);
      //statementModel = StatementModel.fromJson(response.body);
      if(statementModel.loanNo == null){
        loading(false);
      }else {
        safePrint('loan StatementModel');
        safePrint(statementModel!.loanNo);
        loanSearchData(searchLoanNo: statementModel!.loanNo);
        update();
      }
    } else {

      loading(false);
    }

  }

  receiptSaveList({String? searchLoanNo})async{
    loading(true);
    final response = await _companyService.saveReceiptFunction();
    if (response != null) {
      safePrint(jsonEncode(response.body));
      final Map<String, dynamic> responseData = json.decode(response.body);
      receiptSaveModel =  ReceiptSaveModel.fromJson(responseData);
      if(receiptSaveModel.displayMessage == null){
        loading(false);
      }else {
        safePrint('loan StatementModel');
        safePrint(statementModel!.loanNo);
        loanSearchData(searchLoanNo: statementModel!.loanNo);
        update();
      }
    } else {

      loading(false);
    }

  }

  getMaxRno() async {
    loading(true);
    final response = await _companyService.getMaxRno_Response(userName: authenticationManager.getUserName());
    if (response != null) {
      safePrint("getMaxRno Response");
      safePrint(jsonEncode(response.body));
      final Map<String, dynamic> responseData = json.decode(response.body);
      receiptMaxResponse = ReceiptMaxResponse.fromJson(responseData);
      if(receiptMaxResponse.code == null){
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

  loanSearchData({String? searchLoanNo}) async{
    loading(true);
    final response = await _companyService.loanSearchFunction(loanNo: searchLoanNo);
    if (response != null) {
      safePrint("loanSearchData");
      safePrint(jsonEncode(response.body));
      statementLoanSearch = StatementLoanSearch.fromJson(response.body);
      update();

    } else {
      //loading(true);


    }
    loading(false);

  }











}*/
