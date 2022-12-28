import 'dart:async';
import 'dart:convert';
import 'package:Loan360Cloud/authManager/authManager.dart';
import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:Loan360Cloud/model/branchByLogin.dart';
import 'package:Loan360Cloud/model/financialYear.dart';
import 'package:Loan360Cloud/ui/chart.dart';
import 'package:Loan360Cloud/ui/updateAddress.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../common/commonAppBar.dart';
import '../common/commonText.dart';
import '../controller/companyByLoginController.dart';
import '../model/getCompanyByLogin.dart';

class HomeScreen extends StatefulWidget {


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _homeKey = GlobalKey();
  final formKey = new GlobalKey<FormState>();
  CompanyByLoginController controller = Get.put(CompanyByLoginController());
  AuthenticationManager authenticationManager = Get.find();
  String?  _errorText;
  CompanyByLoginModel? dropdownCompanyValue;
  FinancialYearModel? dropdownfinancialYearModel;
  BranchByLoginModel? dropdownbranchByLoginModel;
  late LocationPermission permission;
  late Position position;
  String long = "", lat = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    function();
    //getDataFunction();
  }

  function()async{
    try {

      final user = await Amplify.Auth.getCurrentUser();
      AuthSession  userAuthSession = await Amplify.Auth.fetchAuthSession(
        options: CognitoSessionOptions(getAWSCredentials: true),
      );
      var userPool = (userAuthSession as CognitoAuthSession).userPoolTokens ?? 'no userPoolTokens';
      safePrint('userPool: $userPool');
      if (userPool is AWSCognitoUserPoolTokens) {
        AWSCognitoUserPoolTokens tokens = userPool;
        var  token  = tokens.accessToken;
      //  safePrint('accessToken: ${tokens.accessToken}');
        //print("  next ");
       // safePrint('idToken: ${tokens.idToken}');
      //  print("  next ");
      //  safePrint('refreshToken: ${tokens.refreshToken}');
      }
      var credentials = (userAuthSession as CognitoAuthSession).credentials ?? 'no credentials';
      //safePrint('credentials: $credentials');
      var identityId = (userAuthSession as CognitoAuthSession).identityId ?? 'no identityId';
     // safePrint('identityId: $identityId');
      var userSub = (userAuthSession as CognitoAuthSession).userSub ?? 'no userSub';
      //safePrint('userSub: $userSub');
    } catch(Exception){

    }
  }

  getDataFunction(){
    setState(() {

      if(authenticationManager.getCompanyByLoginData()!=null){

        print("getCompanyByLoginData");
        String companyData = authenticationManager.getCompanyByLoginData().toString();
        //controller.selectedCompanyValue = CompanyByLoginModel.fromJson(jsonDecode(companyData));
        //controller.companyLoginList.add(controller.selectedCompanyValue!);
        print("controller.companyLoginList");
        print(controller.companyLoginList.length);
        //print(controller.companyLoginList.elementAt(0).name);
        /*if(authenticationManager.getBranchByLoginData()!=null){
          String branchData = authenticationManager.getBranchByLoginData().toString();
          controller.selectedBranchValue = BranchByLoginModel.fromJson(jsonDecode(branchData));
         controller.branchList.add(controller.selectedBranchValue!);
           if(authenticationManager.getFinanceByLoginData()!=null) {
             String financeData = authenticationManager.getFinanceByLoginData().toString();
             controller.selectedFinancialValue  = FinancialYearModel.fromJson(jsonDecode(financeData));
             controller.financialList.add(controller.selectedFinancialValue!);
          }
        }*/
      }
    });



  }



  @override
  Widget build(BuildContext context) {
   // checkGps();
   // controller.checkGps();
    return GetBuilder(
        init:  CompanyByLoginController(),
        builder: (homeController) {
          return  Scaffold(
            key:  _homeKey,
            drawer: Drawer(
              child: DrawerScreen(),
            ),
            appBar: AppBar(
              automaticallyImplyLeading: false,
             title: Row(
               children: [
                 authenticationManager.getCompanyByLoginData()!=null? Container(
                   child: IconButton(
                     onPressed:() {
                   if (_homeKey.currentState != null) {
                   if (_homeKey.currentState!.isDrawerOpen){
                   _homeKey.currentState!.closeDrawer();
                   } else {
                   _homeKey.currentState!.openDrawer();
                   }
                   }
                   },
                     icon: Image.asset("assets/menu.png",height: 20,width: 20,),
                   ),
                 ):SizedBox(),
                 Container(
                   alignment:Alignment.topLeft,
                   child: Text(CommonText.appTitle.toString(),textAlign: TextAlign.left,style: textStyle.Heading2.copyWith(),),
                 ),

               ],
             ),
             /* title: appBar(appBarName:CommonText.appTitle.toString(),onPressed: (){
                if (_homeKey.currentState != null) {
                  if (_homeKey.currentState!.isDrawerOpen){
                    _homeKey.currentState!.closeDrawer();
                  } else {
                    _homeKey.currentState!.openDrawer();
                  }
                }
              }),*/
            ),
            body: Container(
              child: Column(
                children: [
                  Container(
                    height: 70,
                    margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                    child: Column(
                      children: [
                        CommonAstrickText(CommonText.company),
                        Container(
                          child:  FormField(
                            builder: (FormFieldState state) {
                              return DropdownButtonHideUnderline(
                                child: InputDecorator(
                                  decoration: InputDecoration(
                                    filled: false,
                                    hintText: 'Select',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    errorText: _errorText,
                                  ),
                                  isEmpty: controller.selectedCompanyValue == null,
                                  child:  DropdownButton<CompanyByLoginModel>(
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color:AppColor.GreyColor,
                                      size: 20.09,
                                    ),
                                    value: controller.selectedCompanyValue,
                                    isDense: true,
                                    onChanged: (CompanyByLoginModel? newValue){
                                        controller.setSelected(newValue);
                                        print(newValue!.code.toString());
                                        controller.financialList.clear();


                                        controller.financialYearFunction(newValue!.code.toString());
                                        setState(() {
                                          controller.selectedCompanyValue = newValue!;
                                        });

                                    },
                                    items: controller.companyLoginList!.map((CompanyByLoginModel value) {
                                      return DropdownMenuItem<CompanyByLoginModel>(
                                          value: value,
                                          child: Text(value!.name.toString(),style: textStyle.Regular,));
                                    }).toList(),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),


                  Container(
                    height: 70,
                    margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                    child: Column(
                      children: [
                        CommonAstrickText(CommonText.branch),
                        Container(
                          child: FormField(
                            builder: (FormFieldState state) {
                              return DropdownButtonHideUnderline(
                                child: InputDecorator(
                                  decoration: InputDecoration(
                                    filled: false,
                                    hintText: 'Select',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    errorText: _errorText,
                                  ),
                                  isEmpty: controller.selectedBranchValue == null,
                                  child:  DropdownButton<BranchByLoginModel>(
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color:AppColor.GreyColor,
                                      size: 20.09,
                                    ),
                                    value: controller.selectedBranchValue,
                                    isDense: true,
                                    onChanged: (BranchByLoginModel? newValue){
                                      controller.setSelectedBranch(newValue);
                                      print("selectedBranch");
                                      print(newValue!.code.toString());
                                      setState(() {
                                        controller.selectedBranchValue = newValue;
                                      });


                                    },
                                    items: homeController.branchList!.map((BranchByLoginModel value) {
                                      return DropdownMenuItem<BranchByLoginModel>(
                                        value: value,
                                        child: Text(value!.name.toString()),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),


                  Container(
                    height: 70,
                    margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                    child: Column(
                      children: [
                        CommonAstrickText(CommonText.financialYear),
                        Container(
                          child: FormField(
                            builder: (FormFieldState state) {
                              return DropdownButtonHideUnderline(
                                child: InputDecorator(
                                  decoration: InputDecoration(
                                    filled: false,
                                    hintText: 'Select',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    errorText: _errorText,
                                  ),
                                  isEmpty: controller.selectedFinancialValue == null,
                                  child:  DropdownButton<FinancialYearModel>(
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color:AppColor.GreyColor,
                                      size: 20.09,
                                    ),
                                    value: controller.selectedFinancialValue,
                                    isDense: true,
                                    onChanged: (FinancialYearModel? newValue) {
                                      controller.setSelectedFinance(newValue);
                                      /*print("selectedFinancialValue");
                                      print(newValue!.fromDate.toString());
                                      print("selectedFinancialcompanyCode");
                                      print(newValue!.companyCode.toString());
                                      print("selectedFinancialId");
                                      print(newValue!.id.toString());
                                      print("selectedFinancialName");
                                      print(newValue!.name.toString());*/
                                      authenticationManager.saveFinanceYearId(newValue!.id.toString());
                                      authenticationManager.saveFinanceYearDate(newValue!.fromDate.toString());
                                         setState(() {
                                           controller.selectedFinancialValue = newValue;
                                         });
                                    },
                                    items: homeController.financialList!.map((FinancialYearModel value) {
                                      return DropdownMenuItem<FinancialYearModel>(
                                        value: value,
                                        child: Text(value!.name.toString()),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),


                  InkWell(
                    onTap: (){
                      authenticationManager.saveBranchByLoginData(json.encode(controller.selectedBranchValue));
                      authenticationManager.saveCompanyByLoginData(json.encode(controller.selectedCompanyValue));
                      authenticationManager.saveFinanceByLoginData(json.encode(controller.selectedFinancialValue));
                      Get.off(()=> Chart());

                    },
                    child: Container(
                      width:100,
                      margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                      padding: EdgeInsets.all(17),

                      decoration: BoxDecoration(
                        color: AppColor.ThemeColor,
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),

                      child: Text(CommonText.saveSmallText,textAlign: TextAlign.center, style: textStyle.RegularBold.copyWith(color: Colors.white,fontWeight: FontWeight.w700,),
                      ),
                    ),
                  ),
                ],
              ),

            ),
          );

        }

    );
  }
}


