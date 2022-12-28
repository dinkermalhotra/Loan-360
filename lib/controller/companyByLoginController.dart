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

class CompanyByLoginController extends GetxController{
  AuthenticationManager authenticationManager = Get.put(AuthenticationManager());
  Service _companyService =  Get.put(Service());
  bool servicestatus = false;
  bool haspermission = false;

  final isLoading = false.obs;
  var data;
  late LocationPermission permission;
  late Position position;
  String long = "", lat = "";

  CompanyByLoginModel? selectedCompanyValue ;
  BranchByLoginModel? selectedBranchValue;
  FinancialYearModel? selectedFinancialValue;
  List<CompanyByLoginModel> companyLoginList =[];
  List<BranchByLoginModel> branchList=[];
  List<FinancialYearModel> financialList =[];


  void setSelected(CompanyByLoginModel? value){
    safePrint("name");
    safePrint(value!.name);
    selectedCompanyValue = value;
    selectedFinancialValue = null;
    update();
  }


  void setSelectedBranch(BranchByLoginModel? value){
    safePrint("name");
    safePrint(value!.name);
    selectedBranchValue = value;
    update();
  }


  void setSelectedFinance(FinancialYearModel? value){
    safePrint("name");
    safePrint(value!.name);
    selectedFinancialValue = value;
    update();
  }




  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    companyByLogin();
    branchByLoginFunction();
    userRights();
    ///mobilePingFunction();
  }


  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if(servicestatus){
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        }else if(permission == LocationPermission.deniedForever){
          print("'Location permissions are permanently denied");
        }else{
          haspermission = true;
        }
      }else{
        haspermission = true;
      }
      if(haspermission){
        getLocation();
      }
    }else{
      print("GPS Service is not enabled, turn on GPS location");
    }

  }

  getLocation() async {
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print("longitude");
    print(position.longitude);
    safePrint("Latitude");
    print(position.latitude);
    userLatLong(Latitude:position.latitude.toString(),Longitude:position.longitude.toString());

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



  branchByLoginFunction()async {
    final response = await _companyService.branchByLoginResponse(userName: authenticationManager.checkLoginUserNameData());
    if (response != null) {

      for (var value in response.body) {
        if(authenticationManager.getBranchByLoginData()!=null){
          if(value['code'].toString().contains(json.decode(authenticationManager.getBranchByLoginData().toString())['code'])){
            print('getBranchByLoginData');
            print(value['code'].toString());

            branchList.add(BranchByLoginModel.fromJson(value));
            selectedBranchValue = branchList.elementAt(0);
          }else{
            branchList.add(BranchByLoginModel.fromJson(value));
          }

        }else{
          branchList.add(BranchByLoginModel.fromJson(value));
        }
        /*if(selectedBranchValue!=null){
          for(int i=0;i<branchList.length;i++){
            if(branchList.elementAt(i).code!.contains(value['code'])){
            }else{
              branchList.add(BranchByLoginModel.fromJson(value));
            }
          }

        }else{
          branchList.add(BranchByLoginModel.fromJson(value));
        }*/

      }

      ///dashboard = response;
      update();

    } else {
    // isLoading(false);

    }
  }


  financialYearFunction(String value)async {

    //financialList.clear();
    final response = await _companyService.financialYearResponse(companyCode: value,token: authenticationManager.getUserName());
    if (response != null) {
      for (var value in response.body) {

          financialList.add(FinancialYearModel.fromJson(value));

      }
      // isLoading(true);
      ///dashboard = response;

      update();
    } else {
      //isLoading(false);

    }

  }


  companyByLogin()async{
    print("company by login");
    final response = await _companyService.companyByLoginFunction(userName:authenticationManager.checkLoginUserNameData());
    if (response != null) {
    for (var value in response.body) {
      if(authenticationManager.getCompanyByLoginData()!=null){
        if(value['code'].toString().contains(json.decode(authenticationManager.getCompanyByLoginData().toString())['code'])){
          print('selectedCompanyValue');
          print(value['code'].toString());
          //selectedCompanyValue = value;
          //companyLoginList.add(CompanyByLoginModel(code: "select",name: "select"));
          companyLoginList.add(CompanyByLoginModel.fromJson(value));
          selectedCompanyValue = companyLoginList.elementAt(0);

          String data = authenticationManager.getFinanceByLoginData().toString();
          financialList.add(FinancialYearModel.fromJson(json.decode(data)));
          selectedFinancialValue = financialList.elementAt(0);
        }else{
          companyLoginList.add(CompanyByLoginModel.fromJson(value));
        }

      }else{
        companyLoginList.add(CompanyByLoginModel.fromJson(value));
      }

     }

      //isLoading(true);
    } //else {
     // isLoading(false);

    //}
    update();
  }

  userRights()async{
    final response = await _companyService.companyRightFunction(userName:authenticationManager.checkLoginUserNameData());
    if (response != null) {

      /*for (var value in response.body) {
        companyLoginList.add(CompanyByLoginModel.fromJson(value));
      }*/
      update();

    } else {


    }


  }


  userLatLong({String? Latitude,String? Longitude})async{
    final response = await _companyService.companyLatLongFunction(Lat: Latitude,Long:Longitude,userName: authenticationManager.checkLoginUserNameData());
    if (response != null) {

      /*for (var value in response.body) {
        companyLoginList.add(CompanyByLoginModel.fromJson(value));
      }*/
      update();

    } else {


    }


  }



}