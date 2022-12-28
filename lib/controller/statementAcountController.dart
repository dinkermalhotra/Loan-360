
import 'dart:convert';
import 'package:Loan360Cloud/apiHelper/service.dart';
import 'package:Loan360Cloud/authManager/authManager.dart';
import 'package:Loan360Cloud/model/assetsKycModel.dart';
import 'package:Loan360Cloud/model/pdfStatementModel.dart';
import 'package:Loan360Cloud/model/statementModel.dart';
import 'package:Loan360Cloud/ui/statementOfAccount.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:get/get.dart';

class StatementAccountController extends GetxController {

  AuthenticationManager authenticationManager = Get.put(AuthenticationManager());
  Service _companyService =  Get.put(Service());
  StatementModel statementModel = new StatementModel();
  AssetsKycModel? selectAssetsKycModel;
  AssetsKycModel? selectPatternModel;
  StatementLoanSearch statementLoanSearch = new StatementLoanSearch();
  bool Visible = false;
  RxBool loading = false.obs;
  List<AssetsKycModel> assetsKycList=[];
  List<AssetsKycModel> assetsPatternList=[];

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
    loading(true);
    final response = await _companyService.statementKycFunction();
    if (response != null) {
      for (var value in response.body) {
        assetsKycList.add(AssetsKycModel.fromJson(value));
      }
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



}





  /*AuthenticationManager authenticationManager = Get.put(AuthenticationManager());
  Service _companyService = Get.put(Service());
  PdfStatementModel pdfStatement = new PdfStatementModel();
  bool Visible = false;
  RxBool loading = false.obs;
  dynamic argumentData = Get.arguments;



  loanPdfStatementData({String? companyCode, String? branchCode, String? finYearId, String? pathName, String? toDate, String? FromDate, String? loanUserName, String? loanId, String? loanNo,}) async {
    loading(false);
    final response = await _companyService.loanPdfStatementFunction(BranchCode:branchCode ,LoadUser:loanUserName,FinId: authenticationManager.getFinanceYearId(),LoanId: LoanId,ToDate: toDate,FromDate: AuthenticationManager().getFinanceYearDate(),PathName: pathName,
        LoanNo: loanNo, CompanyCode: companyCode);
    if (response != null) {

      safePrint("PdfStatementModel");
      safePrint(jsonEncode(response.body));

      pdfStatement = PdfStatementFromJson(response.body);
      if(pdfStatement!.reportPath!=null){
        print("pdf path");
        print(pdfStatement.reportPath.toString());
        loading(true);
      }
      update();
    } else {
      loading(true);
    }

  }

}*/
