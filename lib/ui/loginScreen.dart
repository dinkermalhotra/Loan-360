import 'dart:async';
import 'package:Loan360Cloud/authManager/authManager.dart';
import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:Loan360Cloud/controller/companyByLoginController.dart';
import 'package:Loan360Cloud/controller/loginController.dart';
import 'package:Loan360Cloud/ui/chart.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../amplifyconfiguration.dart';
import '../common/commonText.dart';
import 'homeScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthenticationManager authenticationManager = Get.find();
  LoginController loginController = Get.put(LoginController());
  //CompanyByLoginController controller = Get.put(CompanyByLoginController());
  final _validationKey = GlobalKey<FormState>();
  bool isSignedIn = false;
  bool isSignUpComplete = false;
  final TextEditingController _usernameTextField = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController _passwordTextField = TextEditingController();

   @override
  void initState() {
    // TODO: implement initState
    super.initState();

     //_configureAmplify();
     //new Future.delayed(Duration(seconds: 1),(){
     // deleayed code here
      signOut();
     //signUpUser();
     // });
     //
  }
  signOut()async{
    try {
      authenticationManager.removeUserId();
      await Amplify.Auth.signOut();
    } on AuthException catch (e) {
      print(e.message);
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 10),
          child: Form(
            key: _validationKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  ///HTbxGqc&}z@)EjL
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 150,),
                    child: Image.asset("assets/login_logo.png",width: 250,),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  alignment: Alignment.topLeft,
                  child: Text(CommonText.loginName, style: textStyle.Heading1.copyWith(),
                  ),
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
                            controller: _usernameTextField,
                            decoration: InputDecoration(
                              hintText: 'USERNAME',
                              filled: true,
                              fillColor: Color.fromRGBO(235, 235, 245, 0.6),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'please enter your email';
                                }
                                else {
                                  _usernameTextField.text = value;
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
                     ),
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
                                obscureText: true,
                                controller: _passwordTextField,
                                decoration: InputDecoration(
                                  hintText: 'PASSWORD',
                                  filled: true,
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none
                                 ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "please enter password";
                                    } else {
                                      _passwordTextField.text = value;
                                      //return null;
                                    }
                                  },
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),

                InkWell(
                  onTap: (){
                    if(_validationKey.currentState!.validate()){
                      signInUser(_usernameTextField.text,_passwordTextField.text);
                    }
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
      ),
    );
  }



  Future<void> signInUser(String username, String password) async {
    //GetStorage box = GetStorage();
    try {
      final result = await Amplify.Auth.signIn(
        username: username,
        password: password,
      );

      final user = await Amplify.Auth.getCurrentUser();



      setState(() {
        authenticationManager.loginUserNameData(user.username);
        isSignedIn = result.isSignedIn;

        safePrint("login error");
        safePrint(result.isSignedIn);
        if (isSignedIn) {
          safePrint(user.userId);
          authenticationManager.loginId(user.userId.toString());
          //loginController.mobilePingFunction();
          Get.to(() => HomeScreen());

          /// Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
        }
      });
    } on AuthException catch (e) {
      safePrint("error");
      safePrint(e.message);
      Get.defaultDialog(
          middleText: e.message.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }

  /*Future<void> fetchAuthSession() async {
    try {
      authUser.value = await Amplify.Auth.getCurrentUser();
      authSession.value = await Amplify.Auth.fetchAuthSession(
        options: CognitoSessionOptions(getAWSCredentials: true),
      );
      var userPool = (authSession.value as CognitoAuthSession).userPoolTokens ?? 'no userPoolTokens';
      safePrint('userPool: $userPool');
      if (userPool is AWSCognitoUserPoolTokens) {
        AWSCognitoUserPoolTokens tokens = userPool;
        token.value = tokens.accessToken;
        safePrint('accessToken: ${tokens.accessToken}');
        safePrint('idToken: ${tokens.idToken}');
        safePrint('refreshToken: ${tokens.refreshToken}');
      }
      var credentials = (authSession.value as CognitoAuthSession).credentials ?? 'no credentials';
      safePrint('credentials: $credentials');
      var identityId = (authSession.value as CognitoAuthSession).identityId ?? 'no identityId';
      safePrint('identityId: $identityId');
      var userSub = (authSession.value as CognitoAuthSession).userSub ?? 'no userSub';
      safePrint('userSub: $userSub');
    } on AuthException catch (e) {
      safePrint(e.message);
    }
  }*/

////////////////////////////// Token Code

    /*Future<void> signInUser(String username, String password) async {
      //GetStorage box = GetStorage();
      try {
        final result = await Amplify.Auth.signIn(
          username: username,
          password: password,
        );

        final user = await Amplify.Auth.getCurrentUser();
        if(user.userId!=null){

        }
       AuthSession  userAuthSession = await Amplify.Auth.fetchAuthSession(
          options: CognitoSessionOptions(getAWSCredentials: true),
        );
        var userPool = (userAuthSession as CognitoAuthSession).userPoolTokens ?? 'no userPoolTokens';
        safePrint('userPool: $userPool');
        if (userPool is AWSCognitoUserPoolTokens) {
          AWSCognitoUserPoolTokens tokens = userPool;
         var  token  = tokens.accessToken;
          safePrint('accessToken: ${tokens.accessToken}');
          safePrint('idToken: ${tokens.idToken}');
          safePrint('refreshToken: ${tokens.refreshToken}');
        }
        var credentials = (userAuthSession as CognitoAuthSession).credentials ?? 'no credentials';
        safePrint('credentials: $credentials');
        var identityId = (userAuthSession as CognitoAuthSession).identityId ?? 'no identityId';
        safePrint('identityId: $identityId');
        var userSub = (userAuthSession as CognitoAuthSession).userSub ?? 'no userSub';
        safePrint('userSub: $userSub');
      } catch(Exception){

      }

    }*/

    /*SignIn()async {
      final userPool = CognitoUserPool(
        'ap-south-1_BUqH0YOTY',
        '7uepg9cc924uv1cprlh93d5f5d',
        clientSecret: 'fhr9cdalev86a1kacerd91avtmqpiotvnlvhlv12vmkdno072p3'
      );
      final cognitoUser = CognitoUser('vipuldahayat89@gmail.com', userPool);
      final authDetails = AuthenticationDetails(
        username: 'vipul_dahayat',
        password: 'Srfc@1234',
      );
      CognitoUserSession session = CognitoUserSession(idToken, accessToken);
      try {
        session = await cognitoUser.authenticateUser(authDetails);
        //session = await cognitoUser!.authenticateUser(authDetails);
      } on CognitoUserNewPasswordRequiredException catch (e) {
        // handle New Password challenge
      }catch (e) {
        print(e);
      }
      safePrint("token");
      safePrint(session!.getAccessToken().getJwtToken());


      // print(session.getAccessToken().getJwtToken());
    }*/
  }



