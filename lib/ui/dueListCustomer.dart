

import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:Loan360Cloud/ui/receiptLoadDetail.dart';
import 'package:Loan360Cloud/ui/updateAddress.dart';
import 'package:flutter/material.dart';
import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:get/get.dart';

class DueListCustomer extends StatefulWidget {
  const DueListCustomer({Key? key}) : super(key: key);

  @override
  State<DueListCustomer> createState() => _DueListCustomerState();
}

class _DueListCustomerState extends State<DueListCustomer> with SingleTickerProviderStateMixin{
 // GlobalKey<ScaffoldState> dueListCustomer = GlobalKey();

  TabController? _tabController;
  static List<Address>? _dropdownAddress = [];

  final formKey = new GlobalKey<FormState>();

  // var controller = new MaskedTextController(mask: '(000) 000 0000');

  Address? _dropdownAddressValue;
  String?  _errorText;
  bool isMan = false;
  bool isWoman = false;
  final _address = TextEditingController();
  bool val = false;
  bool val2 = false;
  bool val3 = false;


  // TextEditingController phoneController = new TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _dropdownAddress!.add(Address(addressCode: 'Select'));
    _dropdownAddressValue = _dropdownAddress![0];
    _tabController = TabController(
      length: 3,
      initialIndex: 0,
      vsync: this,
    );

    //_dropdownValue = _dropdownItems![0];
  }

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child:  Container(
        margin: EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [

            Container(
              margin: EdgeInsets.only(top: 10),
              height: 70,
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: AppColor.ThemeColor.withOpacity(0.1),
                    blurRadius: 1,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              width: double.infinity,

              child: Card(
                elevation: 5,
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(CommonText.name,style: textStyle.Regular.copyWith(color: AppColor.ThemeColor),),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child:  Text('John Doe',style: textStyle.Regular.copyWith(color: Colors.black),),
                    )
                  ],
                ),
              ),
            ),

            Container(
              child: Row(
                  children: [
                    Container(
                      child: Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          side: BorderSide(
                            color: AppColor.ThemeColor,
                            width: 1.5,
                          ),
                          value: false,
                          onChanged: (value) {
                            setState(() {

                            });
                          }),
                    ),
                    Text(CommonText.specialAssign,style: textStyle.Regular.copyWith()),
                  ]),
            ),

            Container(
              height: 70,
              margin: EdgeInsets.only(top:10,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Container(
                      child: Text(CommonText.product,style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),
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
              height: 70,
              margin: EdgeInsets.only(top:10,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Container(
                      child: Text(CommonText.sale,style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),
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
              margin: EdgeInsets.only(top:10,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Container(
                      child: Text(CommonText.sortBy,style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),
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

            Container(
              margin: EdgeInsets.only(top: 10),
              child: Card(
                color: AppColor.gainGreyColor,
                child:  TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5.0),
                        hintText: CommonText.balances,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none
                    )
                ),
              ),
            ),

            Container(

              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: AppColor.ThemeColor.withOpacity(0.2),
                    blurRadius: 1,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Card(
                elevation: 20,
                child:  Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            val = ! val;

                          });
                        },

                        child: Container(
                          padding: EdgeInsets.only(top: 10,bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text('DEMTRYAL 12',style: textStyle.Regular.copyWith(color: AppColor.ThemeColor),),
                              ),
                              Container(

                                padding: EdgeInsets.only(left: 10,right: 10,top: 8,bottom: 8),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [AppColor.ThemeColor, Colors.lightBlueAccent]),
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  //  color: Colors.lightBlueAccent,
                                ),
                                margin: EdgeInsets.only(right: 10),
                                child: Text('1',style: textStyle.Regular.copyWith(color: Colors.white),
                                 ),
                                //child: Image.asset("assets/asset.png",height: 20,width: 20,),
                              )
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: val,
                        child:  Container(
                          width: double.infinity,
                          child:  Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Expanded(
                                        child: Container(
                                          child: Text(CommonText.vehicle,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                        ),
                                      ),

                                      Expanded(
                                        child: Container(
                                          child: Text('0',style: textStyle.Regular.copyWith(color: Colors.black),),
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Expanded(
                                        child: Container(
                                          child: Text(CommonText.name,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                        ),
                                      ),

                                      Expanded(
                                        child: Container(
                                          child: Text('Samrat Bakshi S/0 Mr Virat Singh',style: textStyle.Regular.copyWith(color: Colors.black),),
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Expanded(
                                        child: Container(
                                          child: Text('OVERDUE',style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                        ),
                                      ),

                                      Expanded(
                                        child: Container(
                                          child: Text('1,20,000',style: textStyle.Regular.copyWith(color: Colors.black),),
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Expanded(
                                        child: Container(
                                          child: Text("NID",style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                        ),
                                      ),

                                      Expanded(
                                        child: Container(
                                          child: Text('34.98',style: textStyle.Regular.copyWith(color: Colors.black),),
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Expanded(
                                        child: Container(
                                          child: Text("LAST RECEIPT AMT",style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                        ),
                                      ),

                                      Expanded(
                                        child: Container(
                                          child: Text('200',style: textStyle.Regular.copyWith(color: Colors.black),),
                                        ),
                                      )

                                    ],
                                  ),
                                ),

                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Expanded(
                                        child: Container(
                                          child: Text("LAST RECEIPT DATE",style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                        ),
                                      ),

                                      Expanded(
                                        child: Container(
                                          child: Text('2/10/2022',style: textStyle.Regular.copyWith(color: Colors.black),),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Expanded(
                                        child: Container(
                                          child: Text("EMI",style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                        ),
                                      ),

                                      Expanded(
                                        child: Container(
                                          child: Text('\u{20B9}5,548',style: textStyle.Regular.copyWith(color: Colors.black),),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Expanded(
                                        child: Container(
                                          child: Text(CommonText.asset,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Text('Royal Enfield Classic Base',style: textStyle.Regular.copyWith(color: Colors.black),),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Expanded(
                                        child: Container(
                                          child: Text(CommonText.mobile,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                        ),
                                      ),

                                      Expanded(
                                        child: Container(
                                          child: Text('768 787 878 7 ',style: textStyle.Regular.copyWith(color: Colors.black),),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),


                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Expanded(
                                        child: Container(
                                          child: Text(CommonText.appDate,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                        ),
                                      ),
                                      Expanded(
                                        child:  Container(
                                          child: Text('02-Jan-2022 ',style: textStyle.Regular.copyWith(color: Colors.black),),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),


                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Expanded(
                                        child: Container(
                                          child: Text(CommonText.loanAmount,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                        ),
                                      ),

                                      Expanded(
                                        child: Container(
                                          child: Text('\u{20B9}'+'1,20,000',style: textStyle.Regular.copyWith(color: Colors.black),),
                                        ),
                                      )

                                    ],
                                  ),
                                ),

                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Expanded(
                                        child: Container(
                                          child: Text(CommonText.loanType,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                        ),
                                      ),

                                      Expanded(
                                        child: Container(
                                          child: Text('AL',style: textStyle.Regular.copyWith(color: Colors.black),),
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  // width: 320,
                                  child: Divider(
                                    thickness: 2.0,
                                    color: AppColor.LighGreyColor,
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(top:10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Image.asset("assets/map.png",height: 20,width: 20,),
                                              ),
                                              Container(
                                                child: Text(CommonText.map,style: textStyle.Regular.copyWith(color: Colors.red),),


                                              )
                                            ],

                                          )
                                      ),
                                      Expanded(
                                          child: InkWell(
                                            onTap: (){
                                              Get.to(()=> ReceiptLoanDetail(receiptTitleData: false,));
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  child: Image.asset("assets/receipt.png",height: 20,width: 20,),
                                                ),
                                                Container(
                                                  child: Text(CommonText.receipt,style: textStyle.Regular.copyWith(color: Colors.green),),


                                                )
                                              ],

                                            ),
                                          )
                                      ),


                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Container(

              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: AppColor.ThemeColor.withOpacity(0.2),
                    blurRadius: 1,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Card(
                elevation: 20,
                child:  Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            val2 = ! val2;

                          });
                        },

                        child: Container(
                          padding: EdgeInsets.only(top: 10,bottom: 10),
                          child: Row(

                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text('DEMTRYAL 10',style: textStyle.Regular.copyWith(color: AppColor.ThemeColor),),
                              ),
                              Container(

                                padding: EdgeInsets.only(left: 10,right: 10,top: 8,bottom: 8),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [AppColor.ThemeColor, Colors.lightBlueAccent]),
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  //  color: Colors.lightBlueAccent,
                                ),
                                margin: EdgeInsets.only(right: 10),
                                child: Text('2',style: textStyle.Regular.copyWith(color: Colors.white),),
                                //child: Image.asset("assets/asset.png",height: 20,width: 20,),
                              )
                            ],
                          ),
                        ),
                      ),


                      Visibility(
                        visible: val2,
                        child:  Container(
                          width: double.infinity,
                          child:  Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [

                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Expanded(
                                        child: Container(
                                          child: Text(CommonText.name,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                        ),
                                      ),

                                      Expanded(
                                        child: Container(
                                          child: Text('Samrat Bakshi S/0 Mr Virat Singh',style: textStyle.Regular.copyWith(color: Colors.black),),
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Expanded(
                                        child: Container(
                                          child: Text(CommonText.asset,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Text('Royal Enfield Classic Base',style: textStyle.Regular.copyWith(color: Colors.black),),
                                        ),
                                      )


                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Expanded(
                                        child: Container(
                                          child: Text(CommonText.mobile,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                        ),
                                      ),

                                      Expanded(
                                        child: Container(
                                          child: Text('768 787 878 7 ',style: textStyle.Regular.copyWith(color: Colors.black),),
                                        ),
                                      )

                                    ],
                                  ),
                                ),


                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Expanded(
                                        child: Container(
                                          child: Text(CommonText.appDate,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                        ),
                                      ),
                                      Expanded(
                                        child:  Container(
                                          child: Text('02-Jan-2022 ',style: textStyle.Regular.copyWith(color: Colors.black),),
                                        ),
                                      )
                                    ],
                                  ),
                                ),


                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Expanded(
                                        child: Container(
                                          child: Text(CommonText.loanAmount,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                        ),
                                      ),

                                      Expanded(
                                        child: Container(
                                          child: Text('\u{20B9}'+'1,20,000',style: textStyle.Regular.copyWith(color: Colors.black),),
                                        ),
                                      )

                                    ],
                                  ),
                                ),

                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Expanded(
                                        child: Container(
                                          child: Text(CommonText.loanType,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                        ),
                                      ),

                                      Expanded(
                                        child: Container(
                                          child: Text('AL',style: textStyle.Regular.copyWith(color: Colors.black),),
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  // width: 320,
                                  child: Divider(
                                    thickness: 2.0,
                                    color: AppColor.LighGreyColor,
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(top:10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Image.asset("assets/map.png",height: 20,width: 20,),
                                              ),
                                              Container(
                                                child: Text(CommonText.map,style: textStyle.Regular.copyWith(color: Colors.red),),
                                              )
                                            ],

                                          )
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: (){
                                            Get.to(()=> ReceiptLoanDetail(receiptTitleData: false,));
                                          },
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Image.asset("assets/receipt.png",height: 20,width: 20,),
                                              ),
                                              Container(
                                                child: Text(CommonText.receipt,style: textStyle.Regular.copyWith(color: Colors.green),),


                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: AppColor.ThemeColor.withOpacity(0.2),
                    blurRadius: 1,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Card(
                elevation: 20,
                child:  Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            val3 = ! val3;
                          });
                        },

                        child: Container(
                          padding: EdgeInsets.only(top: 10,bottom: 10),
                          child: Row(

                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text('DEMTRYAL 10',style: textStyle.Regular.copyWith(color: AppColor.ThemeColor),),
                              ),
                              Container(

                                padding: EdgeInsets.only(left: 10,right: 10,top: 8,bottom: 8),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [AppColor.ThemeColor, Colors.lightBlueAccent]),
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  //  color: Colors.lightBlueAccent,
                                ),
                                margin: EdgeInsets.only(right: 10),
                                child: Text('3',style: textStyle.Regular.copyWith(color: Colors.white),),
                                //child: Image.asset("assets/asset.png",height: 20,width: 20,),
                              )
                            ],
                          ),
                        ),
                      ),

                      Visibility(
                        visible: val3,
                        child:  Container(
                          width: double.infinity,
                          child:  Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [

                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Expanded(
                                        child: Container(
                                          child: Text(CommonText.name,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                        ),
                                      ),

                                      Expanded(
                                        child: Container(
                                          child: Text('Samrat Bakshi S/0 Mr Virat Singh',style: textStyle.Regular.copyWith(color: Colors.black),),
                                        ),
                                      )

                                    ],
                                  ),
                                ),

                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Expanded(
                                        child: Container(
                                          child: Text(CommonText.asset,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Text('Royal Enfield Classic Base',style: textStyle.Regular.copyWith(color: Colors.black),),
                                        ),
                                      )


                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Expanded(
                                        child: Container(
                                          child: Text(CommonText.mobile,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                        ),
                                      ),

                                      Expanded(
                                        child: Container(
                                          child: Text('768 787 878 7 ',style: textStyle.Regular.copyWith(color: Colors.black),),
                                        ),
                                      )

                                    ],
                                  ),
                                ),


                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Expanded(
                                        child: Container(
                                          child: Text(CommonText.appDate,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                        ),
                                      ),
                                      Expanded(
                                        child:  Container(
                                          child: Text('02-Jan-2022 ',style: textStyle.Regular.copyWith(color: Colors.black),),
                                        ),
                                      )


                                    ],
                                  ),
                                ),


                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Expanded(
                                        child: Container(
                                          child: Text(CommonText.loanAmount,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                        ),
                                      ),

                                      Expanded(
                                        child: Container(
                                          child: Text('\u{20B9}'+'1,20,000',style: textStyle.Regular.copyWith(color: Colors.black),),
                                        ),
                                      )

                                    ],
                                  ),
                                ),

                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Expanded(
                                        child: Container(
                                          child: Text(CommonText.loanType,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                        ),
                                      ),

                                      Expanded(
                                        child: Container(
                                          child: Text('AL',style: textStyle.Regular.copyWith(color: Colors.black),),
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  // width: 320,
                                  child: Divider(
                                    thickness: 2.0,
                                    color: AppColor.LighGreyColor,
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(top:10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Image.asset("assets/map.png",height: 20,width: 20,),
                                              ),
                                              Container(
                                                child: Text(CommonText.map,style: textStyle.Regular.copyWith(color: Colors.red),),


                                              )
                                            ],

                                          )
                                      ),
                                      Expanded(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Image.asset("assets/receipt.png",height: 20,width: 20,),
                                              ),
                                              Container(
                                                child: Text(CommonText.receipt,style: textStyle.Regular.copyWith(color: Colors.green),),


                                              )
                                            ],

                                          )
                                      ),


                                    ],
                                  ),
                                )







                              ],
                            ),
                          ),


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

    );
  }
}