import 'dart:async';

import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:Loan360Cloud/ui/statementOfAccountSearch.dart';
import 'package:flutter/material.dart';
import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:get/get.dart';

class StatementOfAccount extends StatefulWidget {
  const StatementOfAccount({Key? key}) : super(key: key);
  @override
  State<StatementOfAccount> createState() => _StatementOfAccountState();
}

class _StatementOfAccountState extends State<StatementOfAccount> {
  static final GlobalKey<ScaffoldState> _key = GlobalKey();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2),(){

      Get.to(()=> StatementAccountSearch());
     });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:  _key,
      drawer: Drawer(
        child: DrawerScreen(),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: appBar(appBarName:CommonText.statementofAccount.toString(),onPressed: (){
          if (_key.currentState != null) {
            if (_key.currentState!.isDrawerOpen) {
              _key.currentState!.closeDrawer();
            } else {
              _key.currentState!.openDrawer();
            }
          }
        }),
      ),

      body: Container(
        child: Column(
          children: [

            Container(
              margin: EdgeInsets.only(left: 15,right: 15,top:30,),
              //   margin: EdgeInsets.only(top:30,),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    //  margin: EdgeInsets.only(left: 10,right: 10,top:30,),
                    width: 300,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon:Icon(Icons.search, color: Colors.grey,size: 30,),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          borderSide: BorderSide(color:AppColor.GreyColor, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          borderSide: BorderSide(color:AppColor.GreyColor, width: 1.0),
                        ),
                        hintText: 'Loan A/c#',
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    child: Icon(Icons.search, color: Colors.white,size: 30,),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.ThemeColor,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              height: 90,
              margin: EdgeInsets.only(left: 15,right: 15,top:30,),
              child:Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(CommonText.onDate,style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),

                        ),
                      ],
                    ),
                  ),


                  Container(

                    // margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Container(

                          child: Row(
                            children: [
                              Container(
                                width: 320,
                                child: TextField(
                                 // controller: dateTo,
                                  textAlign: TextAlign.left,
                                  decoration:  InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '01-03-2020',
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
                          // width: 320,
                          child: Divider(
                            thickness: 2.0,
                            color: AppColor.LighGreyColor,
                          ),
                        )

                      ],
                    ),
                  ),



                ],
              ) ,
            ),

            Container(
              margin: EdgeInsets.only(top: 30,left: 15,right: 15),
              child:  InkWell(
                onTap: (){

                },
                child: Container(

                  margin: EdgeInsets.only(right: 5),
                  padding: EdgeInsets.all(17),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.LighGreyColor,
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),

                  child: Text(CommonText.submit,textAlign: TextAlign.center, style: textStyle.RegularBold.copyWith(color: Colors.black,fontWeight: FontWeight.w700,),
                  ),
                ),
              ),

            ),

          ],
        ),
      ),
    );
  }
}
