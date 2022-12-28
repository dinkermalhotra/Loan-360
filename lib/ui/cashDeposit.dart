
import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonDialog.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:Loan360Cloud/controller/cashDepositController.dart';
import 'package:Loan360Cloud/ui/updateAddress.dart';
import 'package:flutter/material.dart';
import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:get/get.dart';

class CashDeposit extends StatefulWidget {
  const CashDeposit({Key? key}) : super(key: key);

  @override
  State<CashDeposit> createState() => _CashDepositState();
}

class _CashDepositState extends State<CashDeposit> {
  GlobalKey<ScaffoldState> _cashDepositkey = GlobalKey();
  CashDepositController cashDepositController = Get.put(CashDepositController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerScreen(),
      ),
      key:  _cashDepositkey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: appBar(appBarName:CommonText.cashDeposit.toString(),onPressed: (){
          if (_cashDepositkey.currentState != null) {
            if (_cashDepositkey.currentState!.isDrawerOpen) {
              _cashDepositkey.currentState!.closeDrawer();
            } else {
              _cashDepositkey.currentState!.openDrawer();
            }
          }
        }),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              cashAmountTextField(),
              depositHistory(),
            ],
          ),
        ),
      ),
    );
  }

  Widget cashAmountTextField(){
    return Container(
      margin: EdgeInsets.only(left: 15,right: 15,top:20,),
      child: Column(
        children: [
          Container(
            height: 70,
           // margin: EdgeInsets.only(left: 15,right: 15,top:20,),
            child:Column(
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(CommonText.amount,style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),

                    ),
                    Container(
                      child: Icon(
                        Icons.star,size: 10,color: Colors.red,
                      ),
                    )
                  ],
                ),

                Container(
                  // width: 320,
                  child: const TextField(
                    obscureText: true,
                    textAlign: TextAlign.left,
                    decoration:  InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Amount',
                      hintStyle: TextStyle(color: Colors.black),

                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)
                        //   borderSide:  BorderSide(color: ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)
                        //  borderSide: BorderSide(color: AppColor.LighGreyColor),
                      ),
                    ),
                  ),
                ),
              ],
            ) ,
          ),

          Container(
            height: 70,
            margin: EdgeInsets.only(top:20,),
            child:Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(CommonText.remarks,style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),

                ),

                Container(
                  child: const TextField(
                    obscureText: true,
                    textAlign: TextAlign.left,
                    decoration:  InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Remark',
                      hintStyle: TextStyle(color: Colors.black),
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
             showDialog(
                context: context,
                builder: (BuildContext context) => Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(20.0)),
                  child: Container(
                      height: 200,
                      child: customFileSelectDialog()),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: Text(CommonText.uploadReceipt,style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),

            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 10,bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){

                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 5),
                      padding: EdgeInsets.all(17),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                             AppColor.ThemeColor,
                              Colors.lightBlueAccent
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),

                      child: Text(CommonText.getReport.toUpperCase(),textAlign: TextAlign.center, style: textStyle.RegularBold.copyWith(color: Colors.white,fontWeight: FontWeight.w700,),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child:InkWell(
                    onTap: (){

                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 5),
                      padding: EdgeInsets.all(17),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColor.LighGreyColor,
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      child: Text(CommonText.reset.toUpperCase(),textAlign: TextAlign.center, style: textStyle.RegularBold.copyWith(color: Colors.black,fontWeight: FontWeight.w700,),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }



  Widget depositHistory(){
    return Container(
      margin: EdgeInsets.only(left: 15,right: 15,),
      child: Column(
        children: [
         Container(
           alignment: Alignment.topLeft,
             child: Text(CommonText.depositHistory,style: textStyle.RegularBold.copyWith(color: Colors.black),
             ),
         ),


          Obx(()=>(
                cashDepositController.loading.value?
             Center(
                child: CircularProgressIndicator(),
             ):
            cashDepositController.cashDepositModel.object!=null?
            ListView.builder(
               physics: NeverScrollableScrollPhysics(),
               itemCount:cashDepositController.cashDepositModel.object!.length,
               shrinkWrap: true,
               itemBuilder:(context,index){
                  return Container(
                    margin: EdgeInsets.only(top: 10,),
                    child: Card(
                      elevation: 10,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Expanded(
                                    child: Container(
                                      child: Text(CommonText.amount,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                    ),
                                  ),

                                  Expanded(
                                    child: Container(
                                      child: Text(cashDepositController.cashDepositModel.object!.elementAt(index).amount.toString()??"",style: textStyle.Regular.copyWith(color: Colors.black),),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Expanded(
                                    child: Container(
                                      child: Text(CommonText.depositOn,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                    ),
                                  ),

                                  Expanded(
                                    child: Container(
                                      child: Text('27/Aug/2021 17:26PM',style: textStyle.Regular.copyWith(color: Colors.black),),
                                    ),
                                  )

                                ],
                              ),
                            ),

                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Expanded(
                                    child: Container(
                                      child: Text(CommonText.remarks,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                    ),
                                  ),

                                  Expanded(
                                    child: Container(
                                      child: Text(cashDepositController.cashDepositModel.object!.elementAt(index).remarks.toString(),style: textStyle.Regular.copyWith(color: Colors.black),),
                                    ),
                                  )

                                ],
                              ),
                            ),

                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Expanded(
                                    child: Container(
                                      child: Text(CommonText.verified,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                    ),
                                  ),

                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.topLeft,
                                      //margin: EdgeInsets.only(right: 20),
                                      child: cashDepositController.cashDepositModel.object!.elementAt(index).verified!?Image.asset("assets/verified.png",height: 20,width: 20,):SizedBox(),
                                      //child: Text(CommonText.rupeeSign+'1,38,000',style: textStyle.Regular.copyWith(color: Colors.black),),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Expanded(
                                    child: Container(
                                      child: Text(CommonText.verifiedBy,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                    ),
                                  ),

                                  Expanded(
                                    child: Container(
                                      child: cashDepositController.cashDepositModel.object!.elementAt(index).verifiedBy.toString()==""?Text('',style: textStyle.Regular.copyWith(color: Colors.black)):Text(cashDepositController.cashDepositModel.object!.elementAt(index).verifiedBy.toString(),style: textStyle.Regular.copyWith(color: Colors.black),),
                                    ),
                                  )

                                ],
                              ),
                            ),




                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Expanded(
                                    child: Container(
                                      child: Text(CommonText.verifiedOn,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                    ),
                                  ),

                                  Expanded(
                                    child: Container(
                                     child:  cashDepositController.cashDepositModel.object!.elementAt(index).verifiedOn.toString()==""?Text("",style: textStyle.Regular.copyWith(color: Colors.black)):Text(cashDepositController.cashDepositModel.object!.elementAt(index).verifiedOn.toString(),style: textStyle.Regular.copyWith(color: Colors.black),),
                                      // child: Text('27/Aug/2021 17:54PM',style: textStyle.Regular.copyWith(color:Colors.black),),
                                    ),
                                  )

                                ],
                              ),
                            ),


                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Expanded(
                                    child: Container(
                                      child: Text(CommonText.file,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                    ),
                                  ),

                                  Expanded(
                                    child: Container(
                                      child: Text(cashDepositController.cashDepositModel.object!.elementAt(index).fileName.toString(),style: textStyle.Regular.copyWith(color: AppColor.ThemeColor),),
                                    ),
                                  )
                                ],
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
                child: Text("No Data",style: textStyle.Regular.copyWith(color: AppColor.GreyColor)),
              ),
            )
           ),
          ),

        ],
      ),
    );
  }
}
