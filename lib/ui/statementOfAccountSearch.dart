import 'package:Loan360Cloud/authManager/authManager.dart';
import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:Loan360Cloud/controller/statementAcountController.dart';
import 'package:Loan360Cloud/controller/statementController.dart';
import 'package:Loan360Cloud/model/statementModel.dart';
import 'package:Loan360Cloud/ui/mobileUpdate.dart';
import 'package:Loan360Cloud/ui/receiptLoadDetail.dart';
import 'package:Loan360Cloud/ui/statementKycWidget.dart';
import 'package:Loan360Cloud/ui/statementLoanWidget.dart';
import 'package:Loan360Cloud/ui/statementOfAccount.dart';
import 'package:Loan360Cloud/ui/updateAddress.dart';
import 'package:Loan360Cloud/ui/updatePhoto&Sign.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:get/get.dart';

import 'statementAssetWidget.dart';
import 'statementCustomerWidget.dart';

StatementModel? LoanNo;
String? statementCall = '';
class StatementAccountSearch extends StatefulWidget {
  StatementAccountSearch({StatementModel? loanNo,String? callback}){
    LoanNo = loanNo;
    statementCall = callback;
  }
  @override
  State<StatementAccountSearch> createState() => _StatementAccountSearchState();
}

class _StatementAccountSearchState extends State<StatementAccountSearch> with SingleTickerProviderStateMixin{
  TabController? _tabController;
  StatementAccountController statementController = Get.put(StatementAccountController());
  final search = TextEditingController();
  AuthenticationManager authenticationManager = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(
      length: 4,
      initialIndex: 2,
      vsync: this,
    );

  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print('The user tries to pop()');
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                Container(
                  child: IconButton(
                    onPressed: (){
                      if(statementCall == "statementAccount"){
                        Get.delete<StatementController>();
                        Get.off(()=> StatementOfAccount(ScreenRoute:true));
                      }else if(statementCall == "receiptLoadDetail"){
                        Get.delete<StatementController>();
                        Get.off(()=> ReceiptLoanDetail());
                      }else if(statementCall == "mobileUpdate"){
                        Get.off(()=> MobileUpdate(visible: false));
                      }
                      else if(statementCall == "updateAddress"){

                        Get.off(()=> UpdateAddress(visible: false));

                      }else if(statementCall == "upPhotoAndSign"){

                        Get.off(()=> UpdatePhotoSign(visible: false));
                      }

                  /*   if(statementCall!){
                       Get.delete<StatementController>();
                       Get.off(()=> StatementOfAccount(ScreenRoute:true));
                     }else{
                       Get.delete<StatementController>();
                       Get.off(()=> ReceiptLoanDetail());
                     }*/

                    },
                    icon: Image.asset("assets/back.png",height: 30,width: 30,),
                  ),
                ),
                Container(
                  alignment:Alignment.topLeft,
                  child: Text(CommonText.appStatementSearch,textAlign: TextAlign.left,style: textStyle.Heading2.copyWith(),),
                ),
              ],
            ),
          ),
          body: DefaultTabController(
            length: _tabController!.length,
            child: Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                    child: Card(
                      elevation: 10,
                      child: Container(
                        child:  SizedBox(
                          child: TabBar(
                              labelColor: AppColor.ThemeColor,
                              unselectedLabelColor:Colors.black,
                              controller: _tabController,
                              indicatorColor: AppColor.ThemeColor,
                              tabs: [

                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Text("Customer",style: TextStyle(fontSize: 10,),),
                                ),

                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Text("KYC",style: TextStyle(fontSize: 10,),),
                                ),

                                Container(
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    child: Text("Loan",style: TextStyle(fontSize: 10,),)
                                ),

                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Text("Assets",style: TextStyle(fontSize: 10,),),
                                ),
                              ],
                          ),
                        ),
                      ),
                    ),
                  ),


                  Expanded(
                    child: TabBarView(
                        controller: _tabController,
                        children: [

                          /// Customer Widget
                          StatementCustomerWidget(),

                          /// Assets Widget
                          StatementKycWidget(),

                          /// Loan Widget
                          StatementLoanWidget(callback: statementCall),

                          /// Asset Widget
                          StatementAssetsWidget()


                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}