import 'dart:async';

import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:Loan360Cloud/ui/chart.dart';
import 'package:Loan360Cloud/ui/updateAddress.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../common/commonAppBar.dart';
import '../common/commonText.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String?  _errorText;
  bool isMan = false;
  bool isWoman = false;
  final _address = TextEditingController();
  Address? _dropdownAddressValue;
  static List<Address>? _dropdownAddress = [];
  static final GlobalKey<ScaffoldState> _key = GlobalKey();
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dropdownAddress!.add(Address(addressCode: 'Select'));
    _dropdownAddressValue = _dropdownAddress![0];
    //_dropdownValue = _dropdownItems![0];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     key:  HomeScreen._key,
      drawer: Drawer(
          child: DrawerScreen(),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: appBar(appBarName:CommonText.appTitle.toString(),onPressed: (){
          if (HomeScreen._key.currentState != null) {
            if (HomeScreen._key.currentState!.isDrawerOpen) {
              HomeScreen._key.currentState!.closeDrawer();
            } else {
              HomeScreen._key.currentState!.openDrawer();
            }
          }

        }),
      ),
     body: Container(
       child: Column(
         children: [
           Container(
             height: 70,
             margin: EdgeInsets.only(left: 15,right: 15,top:20,),
             child: Column(
               children: [
                 CommonAstrickText(CommonText.company),
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
                               isEmpty: _dropdownAddress == null,
                               child:  DropdownButton<Address>(
                                 icon: Icon(
                                   Icons.keyboard_arrow_down,
                                   color:AppColor.GreyColor,
                                   size: 20.09,
                                 ),
                                 value: _dropdownAddressValue,
                                 isDense: true,
                                 onChanged: (Address? newValue) {
                                   setState(() {
                                     _dropdownAddressValue = newValue;
                                     _address.text = _dropdownAddressValue!.addressCode!;
                                   });
                                 },
                                 items: _dropdownAddress!.map((Address value) {
                                   return DropdownMenuItem<Address>(
                                     value: value,
                                     child: Text(value!.addressCode.toString()),
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
             margin: EdgeInsets.only(left: 15,right: 15,top:20,),
             child: Column(
               children: [
                 CommonAstrickText(CommonText.branch),
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
                               isEmpty: _dropdownAddress == null,
                               child:  DropdownButton<Address>(
                                 icon: Icon(
                                   Icons.keyboard_arrow_down,
                                   color:AppColor.GreyColor,
                                   size: 20.09,
                                 ),
                                 value: _dropdownAddressValue,
                                 isDense: true,
                                 onChanged: (Address? newValue) {
                                   setState(() {
                                     _dropdownAddressValue = newValue;
                                     _address.text = _dropdownAddressValue!.addressCode!;
                                   });
                                 },
                                 items: _dropdownAddress!.map((Address value) {
                                   return DropdownMenuItem<Address>(
                                     value: value,
                                     child: Text(value!.addressCode.toString()),
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
             margin: EdgeInsets.only(left: 15,right: 15,top:20,),
             child: Column(
               children: [
                 CommonAstrickText(CommonText.financialYear),
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
                               isEmpty: _dropdownAddress == null,
                               child:  DropdownButton<Address>(
                                 icon: Icon(
                                   Icons.keyboard_arrow_down,
                                   color:AppColor.GreyColor,
                                   size: 20.09,
                                 ),
                                 value: _dropdownAddressValue,
                                 isDense: true,
                                 onChanged: (Address? newValue) {
                                   setState(() {
                                     _dropdownAddressValue = newValue;
                                     _address.text = _dropdownAddressValue!.addressCode!;
                                   });
                                 },
                                 items: _dropdownAddress!.map((Address value) {
                                   return DropdownMenuItem<Address>(
                                     value: value,
                                     child: Text(value!.addressCode.toString()),
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

           /*Container(
             height: 70,
             margin: EdgeInsets.only(left: 15,right: 15,top:20,),
             child:Column(
               children: [

                 CommonAstrickText(CommonText.company),
                 Container(
                   child: const TextField(
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

                 CommonAstrickText(CommonText.branch),
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
             height: 70,
             margin: EdgeInsets.only(left: 15,right: 15,top:20,),
             child:Column(
               children: [

                 CommonAstrickText(CommonText.financialYear),
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
           ),*/

           InkWell(
             onTap: (){
               Get.to(()=> Chart());

             },
             child: Container(
               width:100,
               margin: EdgeInsets.only(left: 15,right: 15,top:20,),
               //margin: EdgeInsets.only(right: 5),
               padding: EdgeInsets.all(17),

               decoration: BoxDecoration(
                 color: AppColor.ThemeColor,
                 borderRadius: BorderRadius.all(Radius.circular(40)),
               ),

               child: Text(CommonText.saveSmallText,textAlign: TextAlign.center, style: textStyle.RegularBold.copyWith(color: Colors.white,fontWeight: FontWeight.w700,),
               ),
             ),
           ),




         ],
       ),
     ),

     /*body: Container(
      child: Image.asset("assets/screenshot.png",fit: BoxFit.fill,width: double.infinity,),
    ),*/

    /*  body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10,top: 10),
              alignment: Alignment.topLeft,
              child: Text(
                  CommonText.demoUserWame,style: textStyle.Heading2.copyWith(),
              ),
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: Card(
                child: Container(
                  height: 200,
                  child: Image.asset("assets/screenshot.png"),
                ),
              elevation: 10,
              ),
            )

          ],
        ),
      ),*/

    );
  }
}


