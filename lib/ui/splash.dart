import 'dart:async';
import 'package:Loan360Cloud/ui/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){

      Get.to(()=> LoginScreen());
    });
    /*Timer.periodic(const Duration(seconds: 3), (t) {

        if (mounted) {
          Get.to(()=> LoginScreen());
        }

    });*/
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Image.asset('assets/splash.png',height: double.infinity, width: double.infinity,fit: BoxFit.fill,),
        ),
    );
  }
}


/*
              Container(
                child: Text(CommonText.logoName,style:  textStyle.Heading1.copyWith(
                    color: Colors.white
                ),
                ),
              ),

              Container(
                child: Text(CommonText.companyName,style:  textStyle.Heading2.copyWith(
                  color: Colors.grey
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(CommonText.appName,style:  textStyle.Heading3.copyWith(
                    color: Colors.white
                ),),
              )*/
