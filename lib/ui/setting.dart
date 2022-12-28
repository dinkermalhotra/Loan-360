

import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:  _scaffoldKey,
      drawer: Drawer(
        child: DrawerScreen(),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: appBar(appBarName:CommonText.setting.toString(),onPressed: (){
          if (_scaffoldKey.currentState != null) {
            if (_scaffoldKey.currentState!.isDrawerOpen) {
              _scaffoldKey.currentState!.closeDrawer();
            } else {
              _scaffoldKey.currentState!.openDrawer();
            }
          }
        }),
      ),


       body: Container(
         child: Column(
           children: [

           Container(
             alignment: Alignment.topLeft,
             margin: EdgeInsets.only(left: 15,right: 15,top:20,),
             child: Text(CommonText.setOffline.toString(),style: textStyle.Regular.copyWith(),),
            ),

             Container(
               height: 70,
               margin: EdgeInsets.only(left: 15,right: 15,top:20,),
               child:Column(
                 children: [
                   Container(
                     child: Row(
                       children: [

                         Container(
                           alignment: Alignment.topLeft,
                           child: Text('ENTER PASSWORD',
                             style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor),
                           ),
                         ),

                         Container(
                           child: Icon(
                             Icons.star,size: 10,color: Colors.red,
                           ),
                         ),

                       ],
                     ),
                   ),

                   Container(
                     // width: 320,
                     child:const TextField(
                       //controller: emailController,
                       obscureText: true,
                       textAlign: TextAlign.left,
                       decoration:  InputDecoration(
                         border: InputBorder.none,
                         hintText: '0',
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
               margin: EdgeInsets.only(left: 15,right: 15,top:20,),
               child:Column(
                 children: [
                   Row(
                     children: [
                       Container(
                         alignment: Alignment.topLeft,
                         child: Text('RE-ENTER PASSWORD',style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),

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
                       //controller: emailController,
                       obscureText: true,
                       textAlign: TextAlign.left,
                       decoration:  InputDecoration(
                         border: InputBorder.none,
                         hintText: '0',
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
               margin: EdgeInsets.only(top: 30,left: 15,right: 15),
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

                     child: Text('SAVE',textAlign: TextAlign.center, style: textStyle.RegularBold.copyWith(color: Colors.white,fontWeight: FontWeight.w700,),
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
