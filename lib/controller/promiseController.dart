import 'dart:convert';

import 'package:Loan360Cloud/apiHelper/service.dart';
import 'package:Loan360Cloud/authManager/authManager.dart';
import 'package:Loan360Cloud/model/promiseToPay.dart';
import 'package:Loan360Cloud/model/statementModel.dart';
import 'package:Loan360Cloud/model/subjectPromise.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromiseController extends GetxController{

  AuthenticationManager authenticationManager = Get.put(AuthenticationManager());
  Service _companyService =  Get.put(Service());
  StatementModel statementModel = new StatementModel();
  PromiseToPayResponse promiseToPayResponse = new PromiseToPayResponse();
  List<SubjectPromiseModel> subjectPromiseData= [];
  SubjectPromiseModel? dropdown;
  bool Visible = false;
  RxBool loading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //loading(true);
    subjectData();

  }


  statmentSearch({String? searchLoanNo,String? fromDate,String? toDate})async{
    loading(true);
    final response = await _companyService.statementFunction(loanNo: searchLoanNo);
    if (response != null) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      statementModel =  StatementModel.fromJson(responseData);

      safePrint("Statement Search");
      safePrint(jsonEncode(response.body));

      if(statementModel.loanNo == null){
        loading(false);
      }else {
        safePrint('loan StatementModel');
        safePrint(statementModel!.loanNo);
        promiseToPayData(searchLoanNo: statementModel!.loanNo,FromDate:fromDate,ToDate: toDate );
        update();
      }
    } else {

      loading(false);
    }

  }



  promiseToPayData({String? searchLoanNo,String? FromDate,String? ToDate}) async{
    loading(true);
    final response = await _companyService.promiseToPayFunction(loanNo: searchLoanNo,userName: authenticationManager.checkLoginUserNameData(),fromDate: FromDate,toDate: ToDate );
    if (response != null) {
      safePrint("PromiseToPayResponse");
      safePrint(jsonEncode(response.body));
      promiseToPayResponse = PromiseToPayResponse.fromJson(response.body);
      if(promiseToPayResponse.displayMessage!=null){
        Get.defaultDialog(
            middleText: promiseToPayResponse.displayMessage.toString(),
            textConfirm: ' OK',
            confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }else{
       /* Get.defaultDialog(
            middleText: promiseToPayResponse.displayMessage.toString(),
            textConfirm: ' OK',
            confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });*/
      }
      update();

    } else {
      //loading(true);

    }
    loading(false);

  }



  subjectData() async {
    final response = await _companyService.subjectFunction();
    if (response != null) {
      safePrint("PromiseTo Subject ");
      safePrint(jsonEncode(response.body));

      for (var value in response.body) {
        subjectPromiseData.add(SubjectPromiseModel.fromJson(value));
      }
      print(subjectPromiseData.length);
      // isLoading(true);
      ///dashboard = response;

      update();
    } else {
      //isLoading(false);

    }
  }


}