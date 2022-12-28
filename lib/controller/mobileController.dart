import 'dart:convert';

import 'package:Loan360Cloud/apiHelper/service.dart';
import 'package:Loan360Cloud/authManager/authManager.dart';
import 'package:Loan360Cloud/model/mobileUpdateResponse.dart';
import 'package:Loan360Cloud/model/pdfStatementModel.dart';
import 'package:Loan360Cloud/model/statementModel.dart';
import 'package:Loan360Cloud/ui/chart.dart';
import 'package:Loan360Cloud/ui/homeScreen.dart';
import 'package:Loan360Cloud/ui/statementOfAccount.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileController extends GetxController {
  AuthenticationManager authenticationManager = Get.put(AuthenticationManager());
  Service _companyService =  Get.put(Service());
  StatementModel statementModel = new StatementModel();
  StatementLoanSearch statementLoanSearch = new StatementLoanSearch();
  MobileUpdateResponseModel mobileResponse = new MobileUpdateResponseModel();
  bool Visible = false;
  RxBool loading = false.obs;
  String? dropdownValue;
  List<String> dropdownData= [];
  //List<loadData> dropdownAddress = [];
  String SearchLoanNo='';
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //loading(true);
    dropdownData!.add('Select');
    dropdownValue = dropdownData![0];
  }


  statmentSearch({String? searchLoanNo})async{
    loading(true);
    final response = await _companyService.statementFunction(loanNo: searchLoanNo);
    if (response != null) {
      print("Statement Search");
      print(jsonEncode(response.body));
      final Map<String, dynamic> responseData = json.decode(response.body);
      statementModel =  StatementModel.fromJson(responseData);
     // statementModel = StatementModel.fromJson(response.body);
      if(statementModel.loanNo == null){
        loading(false);
      }else {
        safePrint('loan StatementModel');
        safePrint(statementModel!.loanNo);
        SearchLoanNo = statementModel!.loanNo.toString();

        update();
      }
    } else {

      loading(false);
    }

  }

  /*loanSearchData({String? searchLoanNo}) async{
    loading(true);
    final response = await _companyService.loanSearchFunction(loanNo: searchLoanNo);
    if (response != null) {
      safePrint("loanSearchData");
      safePrint(jsonEncode(response.body));
      statementLoanSearch = StatementLoanSearch.fromJson(response.body);

      //dropdownAddress!.addAll(statementLoanSearch!.loanSearchData!);

      loading(false);
      update();

    } else {
      loading(false);
      //loading(true);

    }

  }*/


  mobileUpdateResponseData({String? MobileNo1,String?  MobileNo2,String? LoanId,String? CustomerId}) async{
    loading(true);
    final response = await _companyService.mobileUpdateFunction(mobileNo1: MobileNo1,mobileNo2:MobileNo2,userName: authenticationManager.checkLoginUserNameData(),loanId:LoanId,customerId: CustomerId);
    if (response != null) {
      safePrint("loanSearchData");
      safePrint(jsonEncode(response.body));
      mobileResponse = MobileUpdateResponseModel.fromJson(response.body);
      if(mobileResponse.displayMessage != null){
        Get.snackbar('',
            mobileResponse.displayMessage.toString(),
            snackPosition: SnackPosition.BOTTOM,backgroundColor:
            Colors.blue);

        Future.delayed(Duration(seconds: 2), () async {
          Get.off(Chart());
        });
      }
      loading(false);
      update();

    } else {
      loading(false);
      //loading(true);

    }

  }


}
