

import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:Loan360Cloud/ui/dueListCustomer.dart';
import 'package:Loan360Cloud/ui/receiptLoadDetail.dart';
import 'package:Loan360Cloud/ui/updateAddress.dart';
import 'package:flutter/material.dart';
import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:get/get.dart';

class DueListLoan extends StatefulWidget {
  const DueListLoan({Key? key}) : super(key: key);

  @override
  State<DueListLoan> createState() => _DueListLoanState();
}

class _DueListLoanState extends State<DueListLoan> {

  Address? _dropdownAddressValue;
  List<Address>? _dropdownAddress = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _dropdownAddress!.add(Address(addressCode: 'Select'));
    _dropdownAddressValue = _dropdownAddress![0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      child: Column(
        children: [

          Container(
            child: TextField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: CommonText.Lan,
                hintText: 'Enter Loan No',
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


          Container(
            height: 70,
            margin: EdgeInsets.only(top:10,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Container(
                    child: Text(CommonText.SortedBy,style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),
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
                                  print(newValue);
                                  setState(() {
                                    _dropdownAddressValue = newValue;
                                    //_customer.text = _dropdownAddressValue!.customerCode!;
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

                      child: Text(CommonText.search.toUpperCase(),textAlign: TextAlign.center, style: textStyle.RegularBold.copyWith(color: Colors.white,fontWeight: FontWeight.w700,),
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
    );
  }
}
