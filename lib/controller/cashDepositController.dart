

import 'dart:convert';

import 'package:Loan360Cloud/apiHelper/service.dart';
import 'package:Loan360Cloud/authManager/authManager.dart';
import 'package:Loan360Cloud/model/cashDeposit.dart';
import 'package:get/get.dart';

class CashDepositController extends GetxController{
  AuthenticationManager authenticationManager = Get.find();
  Service _companyService =  Get.put(Service());
  CashDepositModel cashDepositModel = new CashDepositModel();
  RxBool loading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    cashDeposit();
  }

  cashDeposit()async {
   final response = await _companyService.cashDepositFunction(username: authenticationManager.getUserName());
   if (response != null) {
     print("cashDeposit Response");
     print(jsonEncode(response.body));
     final Map<String, dynamic> responseData = json.decode(response.body);
     cashDepositModel = CashDepositModel.fromJson(responseData);
     if(cashDepositModel.object == null){
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