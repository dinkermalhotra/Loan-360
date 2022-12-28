
import 'dart:convert';

import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:Loan360Cloud/controller/statementAcountController.dart';
import 'package:Loan360Cloud/controller/statementController.dart';
import 'package:Loan360Cloud/ui/receiptLoadDetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StatementAssetsWidget extends StatefulWidget {
  @override
  State<StatementAssetsWidget> createState() => _StatementAssetsWidgetState();
}

class _StatementAssetsWidgetState extends State<StatementAssetsWidget> {

  final search = new TextEditingController();
  final textFieldRegNo = new TextEditingController();
  final textFieldEngNo = new TextEditingController();
  final textFieldChassisNo = new TextEditingController();
  StatementController statementController = Get.put(StatementController());
  DateTime? selectedDate;
  StatementAccountController statementAccountController = Get.put(StatementAccountController());
  var dob;

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
    var size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                width: double.infinity,
                child: TextField(
                  controller: textFieldRegNo,
                  textAlign: TextAlign.left,
                  onChanged: (value){

                    textFieldEngNo.clear();
                    textFieldChassisNo.clear();

                  },
                  decoration:  InputDecoration(
                    labelText: 'Regn#',
                    enabledBorder:const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder:const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    hintText: 'Enter Regn No',
                    hintStyle: TextStyle(color: AppColor.GreyColor),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                width: double.infinity,
                child: TextField(
                  controller: textFieldEngNo,
                  textAlign: TextAlign.left,
                  onChanged: (value){
                    textFieldRegNo.clear();
                    textFieldChassisNo.clear();
                  },
                  decoration:  InputDecoration(
                    labelText: 'Engine#',
                    hintText: 'Enter Engine No',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    enabledBorder:const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder:const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    hintStyle: TextStyle(color: AppColor.GreyColor),

                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                width: double.infinity,
                child: TextField(
                  controller: textFieldChassisNo,
                  textAlign: TextAlign.left,
                  onChanged: (value){
                    textFieldRegNo.clear();
                    textFieldEngNo.clear();
                  },
                  decoration:  InputDecoration(
                    labelText: 'Chassis#',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Enter Chessis No',
                    hintStyle: TextStyle(color: AppColor.GreyColor),
                    enabledBorder:const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder:const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),



              InkWell(
                onTap: (){
                  FocusScope.of(context).unfocus();
                  if(textFieldRegNo.text.isNotEmpty || textFieldEngNo.text.isNotEmpty || textFieldChassisNo.text.isNotEmpty){
                    if(textFieldRegNo.text.isNotEmpty){

                      statementController.assetsSearchData(registerNo: textFieldRegNo.text.toString());
                    }else if(textFieldEngNo.text.isNotEmpty){
                      statementController.assetsSearchData(engineNo: textFieldEngNo.text.toString());
                    }else{
                      statementController.assetsSearchData(chassisNo: textFieldChassisNo.text.toString());
                    }


                  }else{
                    Get.snackbar('',
                        'Please enter any value',
                        snackPosition: SnackPosition.BOTTOM,backgroundColor:
                        Colors.blue);
                  }

                },
                child: Container(
                  margin: EdgeInsets.only(left: 15,right: 15,top:20,bottom: 20),
                  //margin: EdgeInsets.only(right: 5),
                  padding: EdgeInsets.all(17),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.ThemeColor,
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),

                  child: Text(CommonText.searchText.toUpperCase(),textAlign: TextAlign.center, style: textStyle.RegularBold.copyWith(color: Colors.white,fontWeight: FontWeight.w700,),
                  ),
                ),
              ),
              Obx(() =>
              statementController.assetValueLoading.value?
              Center(
                child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: CircularProgressIndicator()),
              ):
              statementController.searchModel.assetSearchList!=null?
              statementController.searchModel.assetSearchList!.isNotEmpty?
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: statementController.searchModel.assetSearchList!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: 10,right: 10),
                      child: Card(
                        elevation: 20,
                        child:Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Expanded(
                                      child: Container(
                                        child: Text(CommonText.loanNo,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                      ),
                                    ),

                                    Expanded(
                                      child: Container(
                                        child: Text(statementController.searchModel.assetSearchList![index].loanNo.toString()??"",style: textStyle.Regular.copyWith(color: Colors.black),),
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
                                      child: Container(
                                        child: Text(statementController.searchModel.assetSearchList![index].appDate.toString()??"",style: textStyle.Regular.copyWith(color: Colors.black),),
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
                                        child: Text(CommonText.appNo,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                      ),
                                    ),

                                    Expanded(
                                      child: Container(
                                        child: Text(statementController.searchModel.assetSearchList![index].appNo.toString()??"",style: textStyle.Regular.copyWith(color: Colors.black),),
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
                                      child:  Container(
                                        child: Text(statementController.searchModel.assetSearchList![index].loanAmount.toString()??"",style: textStyle.Regular.copyWith(color: Colors.black),),
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
                                      child:  Container(
                                        child: Text(statementController.searchModel.assetSearchList![index].productCode.toString()??"",style: textStyle.Regular.copyWith(color: Colors.black),),
                                      ),
                                    )
                                  ],
                                ),
                              ),



                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Divider(
                                  thickness: 2.0,
                                  color: AppColor.LighGreyColor,
                                ),
                              ),

                              InkWell(
                                onTap: (){

                                  var name = statementController.searchModel.assetSearchList!.elementAt(index).name.toString();
                                  var LoanNo = statementController.searchModel.assetSearchList!.elementAt(index).loanNo.toString();
                                  var LoanId = statementController.searchModel.assetSearchList!.elementAt(index).id.toString();
                                  //  var Mobile = statementController.searchModel.assetSearchList!.elementAt(index).mobile.toString();
                                  // var Assets = statementController.searchModel.assetSearchList!.elementAt(index).asset.toString();
                                  var LoanAmount = statementController.searchModel.assetSearchList!.elementAt(index).loanAmount.toString();
                                  var loanDate = statementController.searchModel.assetSearchList!.elementAt(index).loanDate.toString();

                                  final jsonString = '{"mobile": "", "assets": "","loanAmount":"$LoanAmount" ,"loanNo": "$LoanNo","loanId": "$LoanId","loanUserName":"$name","loanDate":"$loanDate","date":"$currentTime"}';
                                  final decodedMap = json.decode(jsonString);
                                  Get.off(()=>ReceiptLoanDetail(decode: decodedMap,loanId:LoanId));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: Image.asset("assets/check-mark.png",height: 20,width: 20,color: AppColor.greenColor,),
                                      ),

                                      Container(
                                        child: Text(CommonText.select.toUpperCase(),
                                            style: textStyle.RegularBold.copyWith(color: AppColor.greenColor)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),



                            ],
                          ),
                        ),

                      ),
                    );
                  })
                  : Center(
                child: Container(
                  child: Text("No Data Found",style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),

                ),
              ):SizedBox()
              ),

            ],
          ),
        ),
      ),
    );
  }

}