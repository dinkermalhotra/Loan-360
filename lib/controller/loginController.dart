

import 'dart:convert';

import 'package:Loan360Cloud/apiHelper/service.dart';
import 'package:Loan360Cloud/authManager/authManager.dart';
import 'package:Loan360Cloud/model/financialYear.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../model/branchByLogin.dart';
import '../model/getCompanyByLogin.dart';

class LoginController extends GetxController {
  AuthenticationManager authenticationManager = Get.put(AuthenticationManager());
  Service _companyService = Get.put(Service());


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();

  }

  mobilePingFunction()async {

    final response = await _companyService.mobileLastPingResponse(userName: authenticationManager.checkLoginUserNameData());
    if (response != null) {

      for (var value in response.body) {
        //branchList.add(statememtModel.fromJson(value));
      }
      //isLoading(true);
      ///dashboard = response;
      update();

    } else {
      // isLoading(false);

    }
  }



}