
import 'dart:convert';

import 'package:Loan360Cloud/apiHelper/service.dart';
import 'package:Loan360Cloud/authManager/authManager.dart';
import 'package:Loan360Cloud/model/assetSearchModel.dart';
import 'package:Loan360Cloud/model/assetsKycModel.dart';
import 'package:Loan360Cloud/model/kycModel.dart';
import 'package:Loan360Cloud/model/statementModel.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:get/get.dart';

class StatementController extends GetxController {
  AuthenticationManager authenticationManager = Get.put(AuthenticationManager());
  Service _companyService =  Get.put(Service());
  StatementModel statementModel = new StatementModel();
  AssetsKycModel? selectAssetsKycModel;
  AssetsKycModel? selectPatternModel;
  StatementLoanSearch statementLoanSearch = new StatementLoanSearch();
  KycModel kycModel = new KycModel();
  bool Visible = false;
  RxBool loading = false.obs;
  RxBool kycValueLoading = false.obs;
  RxBool assetValueLoading = false.obs;
  List<AssetsKycModel> assetsKycList=[];
  List<AssetsKycModel> assetsPatternList=[];
  AssetSearchModel searchModel = new AssetSearchModel();
  //List<AssetSearchList> assetList;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //loading(true);
    assetsKycList!.add(AssetsKycModel(code: 'Select', patterns: 'Select'));
    assetsPatternList!.add(AssetsKycModel(code: 'Select', patterns: 'Select'));
    statementKyc();

  }
  void setSelected(AssetsKycModel? value){
    safePrint("name");
    safePrint(value!.name);
    assetsPatternList.add(value);
    selectAssetsKycModel = value;
    selectPatternModel = value;
    update();
  }


  statementKyc()async{

    assetsKycList!.add(AssetsKycModel(code: 'Select', patterns: 'Select'));

    assetsPatternList.clear();
    loading(true);

    final response = await _companyService.statementKycFunction();
    if (response != null) {
      for (var value in response.body) {
        assetsKycList.add(AssetsKycModel.fromJson(value));
      }
      loading(false);
      update();

    } else {
      // isLoading(false);
      loading(false);
    }


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
     // statementModel = StatementModel.fromJson(response.body);
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




  kycSearchData({String? kyc,String? value}) async{
    kycValueLoading(true);
    final response = await _companyService.kycSearchFunction(kycValue: kyc,valueText: value);

    if (response != null) {

      safePrint("kycSearchData");
      kycValueLoading(false);
      safePrint(jsonEncode(response.body));
      kycModel = KycModel.fromJson(response.body);
      update();

    } else {
      //loading(true);
      kycValueLoading(false);

    }

  }


  assetsSearchData({String? registerNo,String? engineNo,String? chassisNo}) async{
    assetValueLoading(true);
    final response = await _companyService.assetsSearchFunction(regnNo:registerNo.toString(),engNo: engineNo.toString(),chassisNo: chassisNo.toString());

    if (response != null) {
      safePrint("kycSearchData");
      assetValueLoading(false);
      safePrint(jsonEncode(response.body));
      searchModel = AssetSearchModel.fromJson(response.body);
      update();

    } else {
      //loading(true);
      assetValueLoading(false);

    }

  }







}