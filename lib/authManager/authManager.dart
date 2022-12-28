
import 'dart:convert';

import 'package:Loan360Cloud/authManager/cacheManager.dart';
import 'package:get/get.dart';

class AuthenticationManager extends GetxController with CacheManager {
  final isLogged = false.obs;

  void logOut() {
    isLogged.value = false;
    removeUserId();
  }

  void loginId(String? userId) async {
    isLogged.value = true;
    //Token is cached
    await saveUserId(userId);
  }

  checkLoginIdStatus() {
    final userId = getUserId();
    print("getUserId");
    print(getUserId());
    if (userId != null) {
      isLogged.value = true;
      return true;
    }else{
      return false;
    }
  }

  checkSaveHomeScreenData() {
    final branchlogin = getBranchByLoginData();
    Map<String,dynamic> decodedMap  =  json.decode(branchlogin.toString());
    print("getUserId");
    print(decodedMap['name']);
    if (decodedMap != null) {
      isLogged.value = true;
      return true;
    }else{
      return false;
    }
  }


  void loginUserNameData(String? userName) async {
    isLogged.value = true;
    //Token is cached
    await saveUserName(userName);
  }

  /// financial Year
  void financialData(String? userName) async {
    isLogged.value = true;
    //Token is cached
    await saveUserName(userName);
  }

  /// branch by Login
  void branchData(String? userName) async {
    isLogged.value = true;
    //Token is cached
    await saveUserName(userName);
  }

  /// company by Login
  void companyData(String? userName) async {
    isLogged.value = true;
    //Token is cached
    await saveUserName(userName);
  }


  checkLoginUserNameData() {
    final userName = getUserName();
    print("userName");
    print(getUserName());
    if (userName != null) {
      isLogged.value = true;
      return userName;
    }else{
      return "";
    }
  }


  void removeUserNameData() {
    isLogged.value = false;
    removeUserName();
  }

  void loginUserToken(String? token) async {
    await saveToken(token);
  }

  checkLoginToken() {
    final userToken = getToken();
    print("token");
    print(getToken());
    if (userToken != null) {
      return true;
    }else{
      return false;
    }
  }



  void removeUserToken() {
    isLogged.value = false;
    removeToken();
  }











}
