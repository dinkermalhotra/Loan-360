import 'package:Loan360Cloud/authManager/authManager.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:get/get.dart';

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({Key? key}) : super(key: key);

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  AuthenticationManager authenticationManager = Get.find();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Log Out',style: textStyle.Heading2,),
      content: Text('Do you want to Logout?',style: textStyle.Regular),
      actions: <Widget>[
        InkWell(
          onTap: () {
            Get.back();

          },
          child: Container(
              width: 100,
              padding: EdgeInsets.all(10),

              child: Text('No',style: textStyle.Regular,)),
        ),


        InkWell(
          onTap: () {
            signOut(); // dismisses only the dialog and returns true
            Future.delayed(Duration(seconds: 1),()async{
              authenticationManager.logOut();

            });
          },
          child: Container(
              width: 100,
              child: Text('Yes',style: textStyle.Regular)),
        ),
      ],
    );
  }
  signOut() async {
    try {
      await Amplify.Auth.signOut();


    } on AuthException catch (e) {
      print(e.message);
    }
  }
}
