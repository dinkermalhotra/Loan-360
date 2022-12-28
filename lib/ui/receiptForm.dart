import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/drawer.dart';

import 'package:Loan360Cloud/ui/receiptLoadDetail.dart';
import 'package:flutter/material.dart';
import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:get/get.dart';


class ReceiptForm extends StatefulWidget {
  const ReceiptForm({Key? key}) : super(key: key);

  @override
  State<ReceiptForm> createState() => _ReceiptFormState();
}

class _ReceiptFormState extends State<ReceiptForm> {
  final dateTo = TextEditingController();
 GlobalKey<ScaffoldState> receiptFormkey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:  receiptFormkey,
      drawer: const Drawer(
         child: DrawerScreen(),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: appBar(appBarName:CommonText.receipt.toString(), onPressed: (){
          if (receiptFormkey.currentState != null) {
            if (receiptFormkey.currentState!.isDrawerOpen) {
              receiptFormkey.currentState!.closeDrawer();
            } else {
              receiptFormkey.currentState!.openDrawer();
            }
          }
        }),
      ),

      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 90,
                margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                child:Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(CommonText.fromDate,
                              style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor),
                            ),
                          ),

                          Container(
                            child: const Icon(
                              Icons.star,size: 10,color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  width: 320,
                                  child: TextField(
                                    controller: dateTo,
                                    textAlign: TextAlign.left,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '01-10-2020',
                                        hintStyle: TextStyle(color: Colors.black),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none
                                    ),
                                  ),
                                ),

                                Container(
                                  child: Image.asset('assets/calendar.png',height: 20,width: 20,),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Divider(
                              thickness: 2.0,
                              color: AppColor.LighGreyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                height: 90,
                margin: EdgeInsets.only(left: 15,right: 15,top:10,),
                child:Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(CommonText.toDate,style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor),
                            ),
                          ),
                          Container(
                            child:const Icon(
                              Icons.star,size: 10,color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  width: 320,
                                  child: TextField(
                                    controller: dateTo,
                                    textAlign: TextAlign.left,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '21-10-2020',
                                        hintStyle: TextStyle(color: Colors.black),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none
                                    ),
                                  ),
                                ),

                                Container(
                                  child: Image.asset('assets/calendar.png',height: 20,width: 20,),
                                )
                              ],
                            ),
                          ),

                          Container(
                            child: Divider(
                              thickness: 2.0,
                              color: AppColor.LighGreyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ) ,
              ),

              Container(
                 margin: EdgeInsets.only(top: 10,left: 10,right: 10),
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
                            color: AppColor.ThemeColor,
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                           ),
                          child: Text(CommonText.refresh.toUpperCase(),textAlign: TextAlign.center, style: textStyle.RegularBold.copyWith(color: Colors.white,fontWeight: FontWeight.w700,),
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

              Container(
                 margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                child: Card(
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(CommonText.receiveTotalAmount,style: textStyle.RegularBold.copyWith(),),
                        Text(CommonText.rupeeSign+'106,000',style: textStyle.RegularBold.copyWith(),),
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 30,top: 10),
                  alignment: Alignment.topLeft,
                  child: Text('Loans',style: textStyle.RegularBold.copyWith()),
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder:(context, index){
                    return  InkWell(
                      onTap: (){
                        Get.to(()=>ReceiptLoanDetail());
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                        child: Card(
                          elevation: 20,
                          child: Container(
                            width: double.infinity,
                            child:  Container(
                              padding: EdgeInsets.all(20),
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
                                            child: Text(CommonText.loanNo,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                          ),
                                        ),

                                        Expanded(
                                          child: Container(
                                            child: Text('DEMTRYAL 12',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                                            child: Text(CommonText.appNo,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                          ),
                                        ),

                                        Expanded(
                                          child: Container(
                                            child: Text('TRY 38',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                                            child: Text(CommonText.name,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                          ),
                                        ),

                                        Expanded(
                                          child: Container(
                                            child: Text('Samrat Bakshi S/0 Mr Virat Singh',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                                            child: Text(CommonText.amount,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                          ),
                                        ),

                                        Expanded(
                                          child: Container(
                                            child: Text('\u{20B9}'+'1,20,000',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                                    child:  Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Image.asset("assets/print.png",height: 20,width: 20,),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: Text(CommonText.print,style: textStyle.Regular.copyWith(color: Colors.red),),

                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),



    );
  }
}
