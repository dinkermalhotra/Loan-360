import 'dart:async';

import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:Loan360Cloud/ui/chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../common/commonText.dart';
import 'homeScreen.dart';

class LoginScreen extends StatelessWidget {
  final _validationKey = GlobalKey<FormState>();
  final TextEditingController _emailTextField = TextEditingController();
  final TextEditingController _passwordTextField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 10),
        child: Form(
          key: _validationKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 150,),
                  child: Image.asset("assets/login_logo.png",width: 250,),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                alignment: Alignment.topLeft,
                child: Text(CommonText.loginName, style: textStyle.Heading1.copyWith(),
                ),
                //child: Text(CommonText.loginName),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                alignment: Alignment.topLeft,
                child: Text(CommonText.loginText,style: textStyle.Heading2.copyWith(color: AppColor.GreyColor),
                ),
              ),
              Container(
                height: 80,
                  margin: EdgeInsets.only(top: 20,right: 20),
                child: Column(
                  children: [
                    Row(
                     children: [
                       Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Image.asset("assets/user.png",height: 20,fit: BoxFit.fill,),
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width - 70,
                        height: 35,
                        child: TextFormField(
                          controller: _emailTextField,
                          decoration: InputDecoration(
                            hintText: 'USERNAME',
                            filled: true,
                            fillColor: Color.fromRGBO(235, 235, 245, 0.6),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                            validator: (value){
                              String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regex =  RegExp(pattern);
                              // Null check
                              if(value!.isEmpty){
                                return 'please enter your email';
                              }
                              // Valid email formatting check
                              else if(!regex.hasMatch(value)){
                                return 'Enter valid email address';
                              }
                              // success condition
                              else {
                              _emailTextField.text = value;
                              }
                              return null;
                            }

                        ),
                      ),
                    ],
                  ),
                   Divider(
                     thickness: 1,
                     color: Colors.black,
                   )

                  ],
                ),
              ),

              Container(
                  height: 80,
                  margin: EdgeInsets.only(top: 10,right: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Image.asset("assets/password.png",height: 20,fit: BoxFit.fill,),
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width - 70,
                            height: 35,
                            child: TextFormField(
                              controller: _passwordTextField,
                              decoration: InputDecoration(
                                hintText: 'PASSWORD',
                                filled: true,
                                //fillColor: Color.fromRGBO(235, 235, 245, 0.6),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,

                              ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "please enter password";
                                  } else {
                                    _passwordTextField.text = value;
                                    //return null;
                                  }
                                }
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.black,
                      )
                    ],
                  )
              ),



              InkWell(
                onTap: (){
                //  Get.to(() => HomeScreen());
                   Get.to(()=>HomeScreen());
                 // if(_validationKey.currentState!.validate()){
                   // Get.offAll(()=> Chart());
                   // Get.to(()=>BarChartSample2());

                // }
                },
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [AppColor.ThemeColor, Colors.lightBlueAccent]),
                    //color: AppColor.ThemeColor,
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),

                  child: Text(CommonText.loginName.toUpperCase(),textAlign: TextAlign.center, style: textStyle.Heading3.copyWith(color: Colors.white),
                 ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



/*Center(
              child: Container(
               // margin: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Container(
                      child: Image.asset("assets/user.png",height: 20,fit: BoxFit.fill,),
                    ),
                    Container(
                      child: TextFormField(
                          decoration: InputDecoration(
                            // prefixIcon: Icon(Ionicons.person_outline),
                             //prefixIcon: Image.asset("assets/user.png",height: 2,fit: BoxFit.fitHeight,),
                            hintText: 'USERNAME',
                             // suffixIcon: //Your widget

                          ),
                      ),
                    ),
                  ],
                ),
              ),
            ),*/
