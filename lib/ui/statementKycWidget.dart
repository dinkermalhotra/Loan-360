import 'dart:convert';

import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:Loan360Cloud/controller/statementAcountController.dart';
import 'package:Loan360Cloud/controller/statementController.dart';
import 'package:Loan360Cloud/model/assetsKycModel.dart';
import 'package:Loan360Cloud/ui/receiptLoadDetail.dart';
import 'package:Loan360Cloud/ui/updateAddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';



class StatementKycWidget extends StatefulWidget {
  @override
  State<StatementKycWidget> createState() => _StatementKycWidgetState();
}

class _StatementKycWidgetState extends State<StatementKycWidget> {
  AssetsKycModel? dropdownAssetsValue;
  String?  _errorText;
  StatementController statementController = StatementController();
  final valuetext = TextEditingController();

  // var controller = new MaskedTextController(mask: '(000) 000 0000');
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
  //  var size = MediaQuery.of(context).size.width;
    return  GetBuilder(
        init:  StatementController(),
        builder: (statementController) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      margin: EdgeInsets.only(left: 15,right: 15,top:30,),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: Text(CommonText.kyc,
                                    style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            child: FormField(
                              builder: (FormFieldState state) {
                                return DropdownButtonHideUnderline(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      InputDecorator(
                                        decoration: InputDecoration(
                                          filled: false,
                                          hintText: 'Select',
                                          hintStyle: TextStyle(color: Colors.black),
                                          errorText: _errorText,
                                        ),
                                        isEmpty: statementController.selectAssetsKycModel == null,
                                        child: DropdownButton<AssetsKycModel>(
                                          icon: Icon(
                                            Icons.keyboard_arrow_down,
                                            color:AppColor.GreyColor,
                                            size: 20.09,
                                          ),
                                          value: statementController.selectAssetsKycModel,
                                          isDense: true,
                                          onChanged: (AssetsKycModel? newValue) {
                                            print(newValue);
                                            setState(() {

                                              statementController.setSelected(newValue);
                                              dropdownAssetsValue = newValue!;
                                              print("newValue code");
                                              print(newValue!.code.toString());


                                            });
                                          },
                                          items: statementController.assetsKycList!.map((AssetsKycModel value) {
                                            return DropdownMenuItem<AssetsKycModel>(
                                              value: value,
                                              child: Text(value!.code.toString()),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
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
                      margin: EdgeInsets.only(left: 15,right: 15,top:10,),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: Text(CommonText.pattern,style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),
                                ),
                                Container(
                                  child: const Icon(
                                    Icons.star,size: 10,color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                          ),

                          Container(
                            child: FormField(
                              builder: (FormFieldState state) {
                                return DropdownButtonHideUnderline(
                                  child:  Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      InputDecorator(
                                        decoration: InputDecoration(
                                          filled: false,
                                          hintText: 'Select',
                                          hintStyle: TextStyle(color: Colors.black),
                                          errorText: _errorText,
                                        ),
                                        isEmpty:  statementController.selectPatternModel == null,
                                        child:  DropdownButton<AssetsKycModel>(
                                          icon: Icon(
                                            Icons.keyboard_arrow_down,
                                            color:AppColor.GreyColor,
                                            size: 20.09,
                                          ),
                                          value: statementController.selectPatternModel,
                                          isDense: true,
                                          onChanged: (AssetsKycModel? newValue) {
                                            print(newValue);
                                            setState(() {
                                              dropdownAssetsValue = newValue!;
                                              //  _dropdownCustomerValue = newValue;
                                              // _customer.text = _dropdownCustomerValue!.customerCode!;
                                            });
                                          },
                                          items:  statementController.assetsPatternList!.map((AssetsKycModel value) {
                                            return DropdownMenuItem<AssetsKycModel>(
                                              value: value,
                                              child: Text(value!.patterns.toString()),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
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
                      margin: EdgeInsets.only(left: 15,right: 15,top:10,),
                      child:Column(
                        children: [
                          Container(
                            child: Row(
                              children: [

                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(CommonText.value,
                                    style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor),
                                  ),
                                ),

                                Container(
                                  child: Icon(
                                    Icons.star,size: 10,color: AppColor.redColor,
                                  ),
                                ),

                              ],
                            ),
                          ),

                          Container(
                            child: TextField(
                              controller: valuetext,
                              textAlign: TextAlign.left,
                              decoration: const InputDecoration(

                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(color: Colors.grey),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)
                                ),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)
                                ),
                              ),
                            ),
                          ),
                        ],
                      ) ,
                    ),

                    InkWell(
                      onTap: (){
                        FocusScope.of(context).unfocus();
                        if(dropdownAssetsValue!=null && valuetext.text.isNotEmpty){
                          statementController.kycSearchData(kyc:dropdownAssetsValue!.code,value:valuetext.text);
                        }else{
                          Get.snackbar('',
                              'Please enter value',
                              snackPosition: SnackPosition.BOTTOM,backgroundColor:
                              Colors.blue);
                        }


                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 15,right: 15,top:10,bottom: 10),
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
                    statementController.kycValueLoading.value?
                      Center(
                         child: Container(
                            margin: EdgeInsets.only(top: 20),
                            child: CircularProgressIndicator()),
                      ):
                      statementController.kycModel.kycList!=null?

                      statementController.kycModel.kycList!.isNotEmpty?
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: statementController.kycModel.kycList!.length,
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
                                              child: Text(CommonText.name,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                            ),
                                          ),

                                          Expanded(
                                            child: Container(
                                              child: Text(statementController.kycModel.kycList![index].name.toString()??"",style: textStyle.Regular.copyWith(color: Colors.black),),
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
                                              child: Text(CommonText.relationName,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: Text(statementController.kycModel.kycList![index].relName.toString()??"",style: textStyle.Regular.copyWith(color: Colors.black),),
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
                                              child: Text(statementController.kycModel.kycList![index].mobiles.toString()??"",style: textStyle.Regular.copyWith(color: Colors.black),),
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
                                              child: Text(CommonText.address,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                            ),
                                          ),

                                          Expanded(
                                            child:  Container(
                                              child: Text(statementController.kycModel.kycList![index].address.toString()??"",style: textStyle.Regular.copyWith(color: Colors.black),),
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

                                        var name = statementController.kycModel.kycList!.elementAt(index).name.toString();
                                        //var LoanNo = statementController.kycModel.kycList!.elementAt(index).loanNo.toString();
                                        var LoanId = statementController.kycModel.kycList!.elementAt(index).id.toString();
                                       // var Mobile = statementController.kycModel.kycList!.elementAt(index).mobile.toString();
                                       // var Assets = statementController.kycModel.kycList!.elementAt(index).asset.toString();
                                       // var LoanAmount = statementController.kycModel.kycList!.elementAt(index).loanAmount.toString();
                                       // var loanDate = statementController.kycModel.kycList!.elementAt(index).loanDate.toString();

                                        final jsonString = '{"mobile": "", "assets": "","loanAmount":"" ,"loanNo": "","loanId": "$LoanId","loanUserName":"$name","loanDate":"","date":"$currentTime"}';
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
                                              child: Image.asset("assets/loanIcon.png",height: 20,width: 20,color: AppColor.redColor),
                                            ),

                                            Container(
                                              child: Text(CommonText.loan,
                                                  style: textStyle.RegularBold.copyWith(color: AppColor.redColor)),
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
        });

  }
}