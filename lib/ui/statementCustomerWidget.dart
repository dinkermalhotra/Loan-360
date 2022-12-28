
import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:Loan360Cloud/controller/statementAcountController.dart';
import 'package:Loan360Cloud/ui/updateAddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatementCustomerWidget extends StatefulWidget {
  @override
  State<StatementCustomerWidget> createState() => _StatementCustomerWidgetState();
}

class _StatementCustomerWidgetState extends State<StatementCustomerWidget> {

  final search = new TextEditingController();
  final textFieldDate = new TextEditingController();

  StatementAccountController statementAccountController = Get.put(StatementAccountController());
  var dob;

  static List<Customer>? _dropdownCustomer = [];
  static List<Address>? _dropdownContain = [];
  Customer? _dropdownCustomerValue;
  Address? _dropdownContainValue;
  String?  _errorText;
  final _customer = TextEditingController();
  final _contain = TextEditingController();

  List<int> list=[];
  int Index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dropdownCustomer!.add(Customer(customerName: 'Select'));
    _dropdownCustomer!.add(Customer(customerName: 'Name'));
    _dropdownCustomer!.add(Customer(customerName: 'Relation Name'));
    _dropdownCustomer!.add(Customer(customerName: 'Address'));
    _dropdownCustomer!.add(Customer(customerName: 'Mobile'));
    _dropdownCustomer!.add(Customer(customerName: 'Email'));
    _dropdownContain!.add(Address(addressCode: 'Select'));
    _dropdownContain!.add(Address(addressCode: 'Starts with'));
    _dropdownContain!.add(Address(addressCode: 'Ends with'));
    _dropdownContain!.add(Address(addressCode: 'Contain'));
    _dropdownContain!.add(Address(addressCode: 'Equal'));
    _dropdownCustomerValue = _dropdownCustomer![0];
    _dropdownContainValue = _dropdownContain![0];
    list.add(Index);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: Column(
            children: [
               ListView.builder(
                 physics: NeverScrollableScrollPhysics(),
                 shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          children: [

                            Container(
                              height: 70,
                              margin: EdgeInsets.only(left: 15,right: 15,top: 10),
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Text(CommonText.Name,
                                              style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),
                                        ),
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
                                          child: Text(CommonText.contain,
                                              style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),
                                        ),
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
                                                  errorText: _errorText,
                                                ),
                                                isEmpty: _dropdownContainValue == null,
                                                child:  DropdownButton<Address>(
                                                  icon: Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color:AppColor.GreyColor,
                                                    size: 20.09,
                                                  ),
                                                  value: _dropdownContainValue,
                                                  isDense: true,
                                                  onChanged: (Address? newValue) {
                                                    print(newValue);
                                                    setState(() {
                                                      _dropdownContainValue = newValue;
                                                    });
                                                  },
                                                  items: _dropdownContain!.map((Address value) {
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
                              margin: EdgeInsets.only(left: 15,right: 15,top:10,),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.5, color: Colors.grey),
                                ),
                              ),
                              child:Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 300,
                                    child: TextField(
                                      controller: _contain,
                                      textAlign: TextAlign.left,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Enter Name',
                                          hintStyle: TextStyle(color: Colors.black),
                                          enabledBorder:InputBorder.none,
                                          focusedBorder: InputBorder.none
                                      ),
                                    ),
                                  ),


                                  InkWell(
                                    onTap: (){
                                      if(list.length>1){
                                        setState(() {
                                            list.removeAt(index);
                                            Index = Index-1;
                                            print("Index"+Index.toString());
                                            print("list"+list.length.toString());

                                        });
                                      }
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 50,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: AppColor.ThemeColor,
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                      ),

                                      child: Text("-",textAlign: TextAlign.center, style: textStyle.Heading1.copyWith(color: Colors.white,fontWeight: FontWeight.w700,),
                                      ),
                                    ),
                                  ),
                                ],
                              ) ,
                            ),
                          ],
                        ),
                      );
                   }),


              Container(
                margin: EdgeInsets.only(top: 20,left: 15,right: 15,bottom: 30,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          Index = Index+1;
                          list.add(Index);
                          print("Index"+Index.toString());
                          print("list"+list.length.toString());
                        });

                       },
                      child: Container(
                        alignment: Alignment.center,
                        width: 50,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColor.ThemeColor,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Text("+",textAlign: TextAlign.center, style: textStyle.Heading1.copyWith(color: Colors.white,fontWeight: FontWeight.w700,),
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: (){

                      },
                      child: Container(
                        padding: EdgeInsets.all(17),
                        width: 200,
                        decoration: BoxDecoration(
                          color: AppColor.ThemeColor,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        child: Text(
                          CommonText.searchText, textAlign: TextAlign.center,
                          style: textStyle.RegularBold.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w700,),
                        ),
                      ),
                    ),
                    Spacer(),

                  ],
                ),
              ),
            ],
          ),
       ),
    );
  }


}