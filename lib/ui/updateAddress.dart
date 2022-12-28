import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:Loan360Cloud/main.dart';
import 'package:Loan360Cloud/ui/homeScreen.dart';
import 'package:Loan360Cloud/ui/statementOfAccountSearch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:Loan360Cloud/common/textStyle.dart';

Map? decodeMap;
bool? Visible= false;
class UpdateAddress extends StatefulWidget {

  UpdateAddress({Key? key,Map? decode,bool? visible}){
  decodeMap = decode;
  Visible = visible;
  }

  @override
  State<UpdateAddress> createState() => _UpdateAddressState();
}

class _UpdateAddressState extends State<UpdateAddress> {
  static List<Customer>? _dropdownCustomer = [];
  static List<Address>? _dropdownAddress = [];
 GlobalKey<ScaffoldState> updateKey = GlobalKey();

 // var controller = new MaskedTextController(mask: '(000) 000 0000');
  Customer? _dropdownCustomerValue;
  Address? _dropdownAddressValue;
  String?  _errorText;
  bool isMan = false;
  bool isWoman = false;
  final _address = TextEditingController();
  final _customer = TextEditingController();
 // TextEditingController phoneController = new TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dropdownCustomer!.add(Customer(customerName: 'Select', customerCode: '+91'));
    _dropdownCustomer!.add(Customer(customerName: 'India', customerCode: '+91'));
    _dropdownAddress!.add(Address(addressCode: 'Select'));
    _dropdownAddressValue = _dropdownAddress![0];
    _dropdownCustomerValue = _dropdownCustomer![0];

  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Scaffold(
      key:  updateKey,
      drawer: Drawer(
        child: DrawerScreen(),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: appBar(appBarName:CommonText.updateAddressTitle.toString(),onPressed: (){
          if (updateKey.currentState != null) {
            if (updateKey.currentState!.isDrawerOpen) {
              updateKey.currentState!.closeDrawer();
            } else {
              updateKey.currentState!.openDrawer();
            }
          }
        }),
      ),

      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 15,right: 15,top:30,),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size * 0.77,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.GreyColor),
                      borderRadius: BorderRadius.all(
                          Radius.circular(30.0)
                      ),
                    ),
                    child:Row(
                      children: [
                        Container(
                            height: 50,
                            width: 50,
                            child: Icon(Icons.search, color: Colors.grey,size: 25,)
                        ),

                        Container(
                          height: 50,
                          width: size*0.6,
                          child: TextField(
                            readOnly: true,

                            decoration:const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: 'Loan A/c#',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  InkWell(
                    onTap: (){
                      Get.to(()=> StatementAccountSearch(callback: "updateAddress",));

                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Icon(Icons.search, color: Colors.white,size: 30,),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.ThemeColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible:Visible!,
              child: Container(
                margin: EdgeInsets.only(left: 20,top:10,),
                alignment: Alignment.centerLeft,
                child:  decodeMap!=null
                    ? Text("Customer Name: "+ decodeMap!['loanUserName']?? '',style: textStyle.RegularBold.copyWith(color: Colors.black))
                    : Text("",style: textStyle.RegularBold.copyWith(color: Colors.black)),
              ),
            ),
           /* Container(
             margin: EdgeInsets.only(left: 15,right: 15,top:30,),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
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
            ),*/

            _buildCustomer(),
            _buildAddress(),
            Container(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                Container(
                  //margin: EdgeInsets.only(right: 30),
                  child: Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      side: BorderSide(
                        color: AppColor.ThemeColor,
                        width: 1.5,
                      ),
                      value: isMan,
                      onChanged: (value) {
                        setState(() {
                          isMan = value!;
                          isWoman = !value;
                        });
                      }),
                ),
                Text("Location",style: textStyle.RegularBold.copyWith()),

              ]),

            ),


          Container(
            margin: EdgeInsets.only(left:15,right:15,),
           // child: Text(CommonText.checkBoxText),
            child: Text('If the location is checked. it will store the current location of the your device',style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
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

                       child: Text(CommonText.updateAddress.toUpperCase(),textAlign: TextAlign.center, style: textStyle.RegularBold.copyWith(color: Colors.white,fontWeight: FontWeight.w700,),
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
                 ),
               ],
             ),
          ),
          ],
        ),
      ),


    );
  }
  Widget _buildCustomer() {
    return Container(
      height: 70,
      margin: EdgeInsets.only(left: 15,right: 15,top:30,),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  child: Text("CUSTOMER",style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),
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
           // margin: EdgeInsets.only(top:5,),
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
    );
  }
  Widget _buildAddress() {
    return Container(
      height: 70,
      margin: EdgeInsets.only(left: 15,right: 15,top:30,),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  child: Text("ADDRESS",style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),
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
           // margin: EdgeInsets.only(top:5,),
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
                            print('value change');
                            print(newValue);
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
    );
  }
}


class Customer {
  String? customerName = '';
  String? customerCode = '';

  Customer({
    this.customerName,
    this.customerCode,
  });
}


class Address {
  String? addressCode = '';


  Address({
    this.addressCode,
  });
}