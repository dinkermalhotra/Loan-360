

import 'dart:convert';
import 'package:Loan360Cloud/apiHelper/service.dart';
import 'package:Loan360Cloud/authManager/authManager.dart';
import 'package:Loan360Cloud/model/loanCustomerModel.dart';
import 'package:Loan360Cloud/model/partialSectionResponse.dart';
import 'package:get/get.dart';

class DueList extends GetxController{
  AuthenticationManager authenticationManager = Get.find();
  Service _companyService =  Get.put(Service());
  RxBool loading = false.obs;
  LoanCustomerModel loanCustomerModel = new LoanCustomerModel();
  PartialSectionResponseData partialSectionResponseData = new PartialSectionResponseData();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loanCustomerSearchResponse();
    partialSelectResponse();
  }

  loanCustomerSearchResponse() async{

    final response = await await _companyService.CustomerSearchFunction(loanId: "");
    if (response != null) {
      print("cashDeposit Response");
      print(jsonEncode(response.body));
      final Map<String, dynamic> responseData = json.decode(response.body);
      loanCustomerModel = LoanCustomerModel.fromJson(responseData);
      if(loanCustomerModel.object == null){
        loading(false);
      }else {
        loading(false);
        print('cashDeposit');
        update();

      }
    } else {

      loading(false);
    }

  }




  partialSelectResponse() async{

    final response = await await _companyService.partialSelectFunction();

    if (response != null) {
      print("cashDeposit Response");
      print(jsonEncode(response.body));
      final Map<String, dynamic> responseData = json.decode(response.body);
      partialSectionResponseData = PartialSectionResponseData.fromJson(responseData);
      if(loanCustomerModel.object == null){
        loading(false);
      }else {
        loading(false);
        print('cashDeposit');
        update();

      }
    } else {

      loading(false);
    }

  }

}




