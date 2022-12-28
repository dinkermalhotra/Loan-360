import 'dart:async';
import 'package:Loan360Cloud/authManager/authManager.dart';
import 'package:Loan360Cloud/ui/chart.dart';
import 'package:Loan360Cloud/ui/homeScreen.dart';
import 'package:Loan360Cloud/ui/jaguar.dart';
import 'package:Loan360Cloud/ui/loginScreen.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../amplifyconfiguration.dart';
import '../controller/companyByLoginController.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  AuthenticationManager authenticationManager = Get.put(AuthenticationManager());
 // CompanyByLoginController controller = Get.put(CompanyByLoginController());
 /// GetStorage box = GetStorage();
 /// CompanyByLoginController controller = Get.put(CompanyByLoginController());
  var token;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _configureAmplify();
    checkPermissionStatus();

  }

  void checkPermissionStatus() async{
    await Permission.locationAlways.request();
    await Permission.bluetooth.request();
    await Permission.photos.request();
    await Permission.camera.request();
    await Permission.bluetoothConnect.request();
    await Permission.nearbyWifiDevices.request();


    Future.delayed(Duration(seconds: 3),()async{
      bool data = authenticationManager.checkLoginIdStatus();
      if(data){
        bool branchLogin= authenticationManager.checkSaveHomeScreenData();
        if(branchLogin){
          //Get.to(()=> DemoBluetooth());

          Get.to(()=> Chart());
        }else{
          Get.to(()=> HomeScreen());
        }
      }else{
        Get.to(()=> LoginScreen());
      }
    });

  }

  signOut()async{
    try {
      authenticationManager.removeUserId();
      await Amplify.Auth.signOut();
    } on AuthException catch (e) {
      print(e.message);
    }
  }

  Future<void> _configureAmplify() async {
    try {
      final auth = AmplifyAuthCognito();
      await Amplify.addPlugin(auth);

      // call Amplify.configure to use the initialized categories in your app
      await Amplify.configure(amplifyconfig);
    } on Exception catch (e) {
      safePrint('An error occurred configuring Amplify: $e');

    }
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


