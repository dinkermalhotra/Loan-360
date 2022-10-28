import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:Loan360Cloud/ui/updateAddress.dart';
import 'package:flutter/material.dart';
import 'package:Loan360Cloud/common/textStyle.dart';

class UpdateMobile extends StatefulWidget {
  const UpdateMobile({Key? key}) : super(key: key);

  @override
  State<UpdateMobile> createState() => _UpdateMobileState();
}

class _UpdateMobileState extends State<UpdateMobile> {
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
      key: _key,
      drawer: Drawer(
        child: DrawerScreen(),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: appBar(appBarName:CommonText.updateMobile.toString(),onPressed: (){
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
              height: 70,
              margin: EdgeInsets.only(left: 15,right: 15,top:20,),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(CommonText.customer,style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),
                  ),
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

                  CommonAstrickText(CommonText.customer),
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

            Container(
              height: 70,
              margin: EdgeInsets.only(left: 15,right: 15,top:20,),
              child:Column(
                children: [
                  WithoutAstrickText(CommonText.mobile1),
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
                  WithoutAstrickText(CommonText.mobile2),

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
              margin: EdgeInsets.only(top: 30,left: 15,right: 15),
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

                        child: Text(CommonText.updateMobile.toUpperCase(),textAlign: TextAlign.center, style: textStyle.RegularBold.copyWith(color: Colors.white,fontWeight: FontWeight.w700,),
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
            )


          ],
        ),

      ),
    );
  }
}
