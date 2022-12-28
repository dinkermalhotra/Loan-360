import 'dart:convert';

import 'package:Loan360Cloud/authManager/authManager.dart';
import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:Loan360Cloud/controller/statementAcountController.dart';
import 'package:Loan360Cloud/controller/statementController.dart';
import 'package:Loan360Cloud/model/statementModel.dart';
import 'package:Loan360Cloud/ui/mobileUpdate.dart';
import 'package:Loan360Cloud/ui/receiptLoadDetail.dart';
import 'package:Loan360Cloud/ui/statementOfAccount.dart';
import 'package:Loan360Cloud/ui/updateAddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'updatePhoto&Sign.dart';
String? statementCall = '';
class StatementLoanWidget extends StatefulWidget {
  StatementLoanWidget({String? callback}){
    statementCall = callback;
  }
  @override
  State<StatementLoanWidget> createState() => _StatementLoanWidgetState();
}

class _StatementLoanWidgetState extends State<StatementLoanWidget> {

  StatementAccountController statementAccountController = Get.put(StatementAccountController());
  StatementController statementController = Get.put(StatementController());
  final search = TextEditingController();
  AuthenticationManager authenticationManager = Get.find();
  DateTime now = DateTime.now();
 var currentTime;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      currentTime =  DateTime(now.year, now.month, now.day).toString().split(" ")[0];

    });


  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 50,
                margin: EdgeInsets.only(left: 15, right: 15, top: 30,),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.GreyColor
                  ),
                  borderRadius: BorderRadius.all(
                      Radius.circular(30.0) //         <--- border radius here
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        child: Icon(Icons.search, color: Colors.grey, size: 25,)
                    ),

                    Container(
                      height: 50,
                      width: 300,
                      //padding: EdgeInsets.all(5),
                      //margin: EdgeInsets.only(left: 10,right: 10,top:30,),
                      child: TextField(
                        controller: search,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'Loan A/c#',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30, left: 15, right: 15),
                child: InkWell(
                  onTap: () {
                    print("search" + search.value.text.toString());
                    FocusScope.of(context).unfocus();
                    statementController.statmentSearch(searchLoanNo: search.value.text.toString());
                  },
                  child: Container(

                    margin: EdgeInsets.only(right: 5),
                    padding: EdgeInsets.all(17),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.ThemeColor,
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),

                    child: Text(
                      CommonText.searchText, textAlign: TextAlign.center,
                      style: textStyle.RegularBold.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w700,),
                    ),
                  ),
                ),
              ),
              Obx(() => Listing())


            ],
          ),
        ),
    );
  }

  Widget Listing(){
    return statementController.loading.value
        ? Center(
        child: Container(
            margin: EdgeInsets.only(top: 20),
            child: CircularProgressIndicator()))
        : statementController.statementLoanSearch.loanSearchData != null && statementController.statementLoanSearch.loanSearchData!.isNotEmpty
        ? ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: statementController.statementLoanSearch.loanSearchData!.length,
        itemBuilder: (context, index){
          return Container(
            //  height: 330,
            margin: EdgeInsets.all(10),

            width: double.infinity,
            child: Card(
              elevation: 20,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      // margin: const EdgeInsets.only(left: 20,right: 10,top: 20),
                      alignment: Alignment.topLeft,
                      child: Text('DEMTRYAL 12626',style: textStyle.Regular.copyWith(color: AppColor.ThemeColor),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Expanded(
                            child: Container(
                              child: Text(CommonText.name,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                            ),
                          ),

                          Expanded(
                            child: Container(
                              child: Text(statementController!.statementLoanSearch!.loanSearchData![index].name.toString()??"",style: textStyle.Regular.copyWith(color: Colors.black),),
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Expanded(
                            child: Container(
                              child: Text(CommonText.asset,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Text(statementController!.statementLoanSearch!.loanSearchData![index].asset.toString()??"",style: textStyle.Regular.copyWith(color: Colors.black),),
                            ),
                          )


                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Expanded(
                            child: Container(
                              child: Text(CommonText.mobile,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                            ),
                          ),

                          Expanded(
                            child: Container(
                              child: Text(statementController!.statementLoanSearch!.loanSearchData![index].mobile.toString()??"",style: textStyle.Regular.copyWith(color: Colors.black),),
                            ),
                          )
                        ],
                      ),
                    ),


                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Expanded(
                            child: Container(
                              child: Text(CommonText.appDate,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                            ),
                          ),

                          Expanded(
                            child:  Container(
                              child: Text(statementController!.statementLoanSearch!.loanSearchData![index].appDate.toString()??"",style: textStyle.Regular.copyWith(color: Colors.black),),
                            ),
                          )
                        ],
                      ),
                    ),


                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Expanded(
                            child: Container(
                              child: Text(CommonText.loanAmount,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                            ),
                          ),

                          Expanded(
                            child: Container(
                              child: Text('\u{20B9}'+statementController!.statementLoanSearch!.loanSearchData![index].loanAmount.toString()??"",style: textStyle.Regular.copyWith(color: Colors.black),),
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Expanded(
                            child: Container(
                              child: Text(CommonText.loanType,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                            ),
                          ),

                          Expanded(
                            child: Container(
                              child: Text(statementController!.statementLoanSearch!.loanSearchData![index].accountingCategoryCode.toString()??"",style: textStyle.Regular.copyWith(color: Colors.black),),
                            ),
                          )

                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      // width: 320,
                      child: Divider(
                        thickness: 2.0,
                        color: AppColor.LighGreyColor,
                      ),
                    ),


                    Container(
                      margin: EdgeInsets.only(top:10),
                      child: Row(
                        children: [
                          Expanded(
                              child: InkWell(
                                onTap: (){
                                  if(statementCall == "statementAccount"){

                                    print(statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).name.toString());
                                    var name = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).name.toString();
                                    var CompanyCode = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).companyCode.toString();
                                    var BranchCode = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).branchCode.toString();
                                    var LoanNo = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).loanNo.toString();
                                    var LoanId = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).id.toString();

                                    Get.off(()=> StatementOfAccount(ScreenRoute:true,loanUserName: name,companyCode: CompanyCode,branchCode: BranchCode,loanNo: LoanNo,loanId: LoanId,));
                                  }else if(statementCall == "receiptLoadDetail"){
                                    print(statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).name.toString());
                                    var name = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).name.toString();
                                    var CompanyCode = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).companyCode.toString();
                                    var BranchCode = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).branchCode.toString();
                                    var LoanNo = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).loanNo.toString();
                                    var LoanId = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).id.toString();
                                    var Mobile = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).mobile.toString();
                                    var Assets = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).asset.toString();
                                    var LoanAmount = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).loanAmount.toString();
                                    var loanDate = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).loanDate.toString();

                                  final jsonString = '{"mobile": $Mobile, "assets": "$Assets","loanAmount":"$LoanAmount" ,"loanNo": "$LoanNo","relName":"${statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).relName.toString()}","loanId": "$LoanId","loanUserName":"$name","loanDate":"$loanDate","date":"$currentTime"}';
                                  final decodedMap = json.decode(jsonString);
                                  Get.off(()=>ReceiptLoanDetail(decode: decodedMap,loanId:LoanId));
                                  }else if(statementCall == "mobileUpdate"){
                                    var customerId = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).customerId.toString();
                                    var Mobile = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).mobile.toString();
                                    var name = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).name.toString();
                                    var CompanyCode = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).companyCode.toString();
                                    var BranchCode = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).branchCode.toString();
                                    var LoanNo = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).loanNo.toString();
                                    var LoanId = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).id.toString();
                                    final jsonString = '{"mobile": $Mobile,"assets":"$Assets","loanAmount":"$LoanAmount" ,"customerId": "$customerId","relName":"${statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).relName.toString()}","loanNo": "$LoanNo","loanId": "$LoanId","loanUserName":"$name","loanDate":"$loanDate","date":"$currentTime"}';
                                    final decodedMap = json.decode(jsonString);
                                    Get.off(()=> MobileUpdate(decode: decodedMap,visible: true));

                                  }else if(statementCall == "updateAddress"){
                                    var customerId = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).customerId.toString();
                                    var Mobile = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).mobile.toString();
                                    var name = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).name.toString();
                                    var CompanyCode = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).companyCode.toString();
                                    var BranchCode = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).branchCode.toString();
                                    var LoanNo = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).loanNo.toString();
                                    var LoanId = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).id.toString();
                                    final jsonString = '{"mobile": $Mobile,"assets":"$Assets","loanAmount":"$LoanAmount" ,"customerId": "$customerId","relName":"${statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).relName.toString()}","loanNo": "$LoanNo","loanId": "$LoanId","loanUserName":"$name","loanDate":"$loanDate","date":"$currentTime"}';
                                    final decodedMap = json.decode(jsonString);
                                    Get.off(()=> UpdateAddress(decode: decodedMap,visible: true));

                                  } else  if(statementCall == "upPhotoAndSign"){
                                  var customerId = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).customerId.toString();
                                  var Mobile = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).mobile.toString();
                                  var name = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).name.toString();
                                  var CompanyCode = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).companyCode.toString();
                                  var BranchCode = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).branchCode.toString();
                                  var LoanNo = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).loanNo.toString();
                                  var LoanId = statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).id.toString();
                                  final jsonString = '{"mobile": $Mobile,"assets":"$Assets","loanAmount":"$LoanAmount" ,"customerId": "$customerId","relName":"${statementController!.statementLoanSearch!.loanSearchData!.elementAt(index).relName.toString()}","loanNo": "$LoanNo","loanId": "$LoanId","loanUserName":"$name","loanDate":"$loanDate","date":"$currentTime"}';
                                  final decodedMap = json.decode(jsonString);
                                  Get.off(()=> UpdatePhotoSign(decode: decodedMap,visible: true));

                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Image.asset("assets/updated.png",height: 20,width: 20,),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 2),
                                      child: Text(CommonText.select,style: textStyle.Regular.copyWith(color: Colors.green),),

                                    )
                                  ],
                                ),
                              )
                          ),
                          Expanded(
                              child: InkWell(
                                onTap: (){
                                  statementController!.statementLoanSearch!.loanSearchData!.clear();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Image.asset("assets/customer.png",height: 20,width: 20,),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 2),
                                      child: Text(CommonText.customer,style: textStyle.Regular.copyWith(color:  Colors.red),),
                                    )
                                  ],

                                ),
                              )
                          ),
                          Expanded(
                              child: InkWell(
                                onTap: (){
                                  statementController!.statementLoanSearch!.loanSearchData!.clear();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Image.asset("assets/asset.png",height: 20,width: 20,),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 2),
                                      child: Text(CommonText.asset,style: textStyle.Regular.copyWith(color: Colors.red),),

                                    )
                                  ],

                                ),
                              )
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      ) : SizedBox();

  }
}