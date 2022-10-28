
import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:Loan360Cloud/ui/documentAttachment.dart';
import 'package:Loan360Cloud/ui/updateAddress.dart';
import 'package:flutter/material.dart';
import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:get/get.dart';

class FieldInvestigation extends StatefulWidget {
  const FieldInvestigation({Key? key}) : super(key: key);

  @override
  State<FieldInvestigation> createState() => _FieldInvestigationState();
}

class _FieldInvestigationState extends State<FieldInvestigation> {
  static final GlobalKey<ScaffoldState> _key = GlobalKey();
  static List<Customer>? _dropdownCustomer = [];
  Customer? _dropdownCustomerValue;
  final _customer = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dropdownCustomer!.add(Customer(customerName: 'Select', customerCode: '+91'));
    _dropdownCustomerValue = _dropdownCustomer![0];
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
        title: appBar(appBarName:CommonText.fieldInvestigation.toString(),onPressed: (){
          if (_key.currentState != null) {
            if (_key.currentState!.isDrawerOpen) {
              _key.currentState!.closeDrawer();
            } else {
              _key.currentState!.openDrawer();
            }
          }
        }),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 70,
                margin: EdgeInsets.only(left: 15,right: 15,top:30,),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            child: Text("USER",style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),
                          ),
                          Container(
                            child: Icon(
                              Icons.star,size: 10,color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: FormField(
                        builder: (FormFieldState state) {
                          return DropdownButtonHideUnderline(
                            child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                 InputDecorator(
                                  decoration:const InputDecoration(
                                    filled: false,
                                    hintText: 'Select',
                                    hintStyle: TextStyle(color: Colors.black),
                                    //  errorText: _errorText,
                                  ),
                                  isEmpty: _dropdownCustomer == null,
                                  child:  DropdownButton<Customer>(
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color:AppColor.GreyColor,
                                      size: 20.09,
                                    ),
                                    value: _dropdownCustomerValue,
                                    isDense: true,
                                    onChanged: (Customer? newValue) {
                                      print(newValue);
                                      setState(() {
                                        _dropdownCustomerValue = newValue;
                                        _customer.text = _dropdownCustomerValue!.customerCode!;
                                      });
                                    },
                                    items: _dropdownCustomer!.map((Customer value) {
                                      return DropdownMenuItem<Customer>(
                                        value: value,
                                        child: Text(value!.customerName.toString()),
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
                margin: EdgeInsets.only(left: 15,right: 15,top:10,),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            child: Text("LOAN STATUS",style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),
                          ),
                          Container(
                            child: Icon(
                              Icons.star,size: 10,color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: FormField(
                        builder: (FormFieldState state) {
                          return DropdownButtonHideUnderline(
                            child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                 InputDecorator(
                                  decoration:const InputDecoration(
                                    filled: false,
                                    hintText: 'Select',
                                    hintStyle: TextStyle(color: Colors.black),
                                    //  errorText: _errorText,
                                  ),
                                  isEmpty: _dropdownCustomer == null,
                                  child:  DropdownButton<Customer>(
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color:AppColor.GreyColor,
                                      size: 20.09,
                                    ),
                                    value: _dropdownCustomerValue,
                                    isDense: true,
                                    onChanged: (Customer? newValue) {
                                      print(newValue);
                                      setState(() {
                                        _dropdownCustomerValue = newValue;
                                        _customer.text = _dropdownCustomerValue!.customerCode!;
                                      });
                                    },
                                    items: _dropdownCustomer!.map((Customer value) {
                                      return DropdownMenuItem<Customer>(
                                        value: value,
                                        child: Text(value!.customerName.toString()),
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
                margin: EdgeInsets.only(left: 15,right: 15,top:10,),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            child: Text("BRANCH",style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),
                          ),
                          Container(
                            child: Icon(
                              Icons.star,size: 10,color: Colors.red,
                            ),
                          )
                        ],
                      ),
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
                                    //  errorText: _errorText,
                                  ),
                                  isEmpty: _dropdownCustomer == null,
                                  child:  DropdownButton<Customer>(
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color:AppColor.GreyColor,
                                      size: 20.09,
                                    ),
                                    value: _dropdownCustomerValue,
                                    isDense: true,
                                    onChanged: (Customer? newValue) {
                                      print(newValue);
                                      setState(() {
                                        _dropdownCustomerValue = newValue;
                                        _customer.text = _dropdownCustomerValue!.customerCode!;
                                      });
                                    },
                                    items: _dropdownCustomer!.map((Customer value) {
                                      return DropdownMenuItem<Customer>(
                                        value: value,
                                        child: Text(value!.customerName.toString()),
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
                margin: EdgeInsets.only(top: 30,left: 15,right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){

                          Get.to(()=> DocumentAttachment());

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
                          //decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [AppColor.ThemeColor, AppColor.ThemeColor.withOpacity(0.5)])),
                          margin: EdgeInsets.only(left: 5),
                          padding: EdgeInsets.all(17),
                          width: double.infinity,
                          decoration: BoxDecoration(
                           // gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [AppColor.ThemeColor, AppColor.ThemeColor.withOpacity(0.5)])
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
                margin: EdgeInsets.only(top: 20,left: 15,right: 15),
                child: Card(
                  color: AppColor.gainGreyColor,
                  child:  TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5.0),
                        hintText: CommonText.fieldInvestigation,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none
                    )
                  ),
                ),
              ),

              Container(
               height: 400,
                margin: EdgeInsets.all(10),
                width: double.infinity,
                child: Card(
                    elevation: 20,
                    child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Container(
                             // margin: const EdgeInsets.only(left: 20,right: 10,top: 20),
                              alignment: Alignment.topLeft,
                              child: Text(CommonText.Try,style: textStyle.Regular.copyWith(color: AppColor.ThemeColor),),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Expanded(
                                    child: Container(
                                      child: Text(CommonText.name,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                    ),
                                  ),

                                  Expanded(
                                    child: Container(
                                      child: Text('Satnam Singh',style: textStyle.Regular.copyWith(color: Colors.black),),
                                    ),
                                  )

                                ],
                              ),
                            ),

                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Expanded(
                                    child: Container(
                                      child: Text(CommonText.type,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Text('Vehicle',style: textStyle.Regular.copyWith(color: Colors.black),),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Expanded(
                                    child: Container(
                                      child: Text(CommonText.linkedAs,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                    ),
                                  ),

                                  Expanded(
                                    child: Container(
                                      child: Text('Borrower ',style: textStyle.Regular.copyWith(color: Colors.black),),
                                    ),
                                  )

                                ],
                              ),
                            ),


                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Expanded(
                                    child: Container(
                                      child: Text(CommonText.category,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                    ),
                                  ),
                                  Expanded(
                                    child:  Container(
                                      child: Text('Lorum Ipsum ',style: textStyle.Regular.copyWith(color: Colors.black),),
                                    ),
                                  )


                                ],
                              ),
                            ),


                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Container(
                                    child: Text(CommonText.address,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                  ),
                                  Container(
                                    child: Text('New Hero Honda Base ',style: textStyle.Regular.copyWith(color: Colors.black),),
                                  )

                                ],
                              ),
                            ),



                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Expanded(
                                    child: Container(
                                      child: Text(CommonText.mobile,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                    ),
                                  ),
                                  Expanded(
                                    child:  Container(
                                      child: Text('98989 - 89898 ',style: textStyle.Regular.copyWith(color: Colors.black),),
                                    ),
                                  )


                                ],
                              ),
                            ),

                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Expanded(
                                    child: Container(
                                      child: Text(CommonText.emailId,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                    ),
                                  ),
                                  Expanded(
                                    child:  Container(
                                      child: Text('Email-ID ',style: textStyle.Regular.copyWith(color: Colors.black),),
                                    ),
                                  )


                                ],
                              ),
                            ),


                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Expanded(
                                    child: Container(
                                      child: Text(CommonText.emailId,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                    ),
                                  ),
                                  Expanded(
                                    child:  Container(
                                      child: Text('Email-ID ',style: textStyle.Regular.copyWith(color: Colors.black),),
                                    ),
                                  )


                                ],
                              ),
                            ),

                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Expanded(
                                    child: Container(
                                      child: Text(CommonText.status,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                    ),
                                  ),
                                  Expanded(
                                    child:  Container(
                                      child: Text('Pending ',style: textStyle.Regular.copyWith(color: Colors.black),),
                                    ),
                                  )


                                ],
                              ),
                            ),


                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Expanded(
                                    child: Container(
                                      child: Text(CommonText.assigned,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                    ),
                                  ),
                                  Expanded(
                                    child:  Container(
                                      child: Text('Vijay ',style: textStyle.Regular.copyWith(color: Colors.black),),
                                    ),
                                  )


                                ],
                              ),
                            ),


                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Expanded(
                                    child: Container(
                                      child: Text(CommonText.assignedOn,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                    ),
                                  ),
                                  Expanded(
                                    child:  Container(
                                      child: Text('27/Aug/2021 ',style: textStyle.Regular.copyWith(color: Colors.black),),
                                    ),
                                  )


                                ],
                              ),
                            ),


                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Expanded(
                                    child: Container(
                                      child: Text(CommonText.assignedby,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                    ),
                                  ),
                                  Expanded(
                                    child:  Container(
                                      child: Text('Vijay',style: textStyle.Regular.copyWith(color: Colors.black),),
                                    ),
                                  )


                                ],
                              ),
                            ),

                          ],
                        ),
                      ),


                  ),

              )






            ],
          ),
        ),
      ),
    );
  }
}
