import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:Loan360Cloud/ui/updateAddress.dart';
import 'package:flutter/material.dart';
import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:Loan360Cloud/common/appColor.dart';

class DocsUpload extends StatefulWidget {
  const DocsUpload({Key? key}) : super(key: key);

  @override
  State<DocsUpload> createState() => _DocsUploadState();
}

class _DocsUploadState extends State<DocsUpload> {

  static List<Customer>? _dropdownCustomer = [];
  static List<Address>? _dropdownAddress = [];
  GlobalKey<ScaffoldState> docUpload = GlobalKey();
  final formKey =  GlobalKey<FormState>();

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

    //_dropdownValue = _dropdownItems![0];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:  docUpload,
      drawer: Drawer(
        child: DrawerScreen(),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: appBar(appBarName:CommonText.docsUpload.toString(),onPressed: (){
          if (docUpload.currentState != null) {
            if (docUpload.currentState!.isDrawerOpen) {
              docUpload.currentState!.closeDrawer();
            } else {
              docUpload.currentState!.openDrawer();
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
                        hintText: CommonText.loanAc,
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
            _buildApplication(),
            _buildDocument(),
            Container(
              height: 70,
              margin: EdgeInsets.only(left: 15,right: 15,top:20,),
              child:Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(CommonText.remarks,style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),
                  ),

                  Container(
                    child: const TextField(
                      //controller: emailController,
                      obscureText: true,
                      textAlign: TextAlign.left,
                      decoration:  InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Lorem Ipsum dolar',
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
                  )

                ],
              ) ,
            ),

            Container(
              margin: EdgeInsets.only(left: 15,top:30,),
              child: Row(
                children: [
                  Container(
                    child: Image.asset("assets/upload.png",height: 20,width: 20,),

                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Text(CommonText.chooseFile,style: textStyle.RegularBold.copyWith(color: AppColor.ThemeColor),),

                  )
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

                        child: Text(CommonText.update.toUpperCase(),textAlign: TextAlign.center, style: textStyle.RegularBold.copyWith(color: Colors.white,fontWeight: FontWeight.w700,),
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
            ),
          ],
        ),
      ),


    );
  }
  Widget _buildApplication() {
    return Container(
      height: 70,
      margin: EdgeInsets.only(left: 15,right: 15,top:30,),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  child: Text(CommonText.applicable,style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),
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
  Widget _buildDocument() {
    return Container(
      height: 70,
      margin: EdgeInsets.only(left: 15,right: 15,top:20,),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(CommonText.documentCode,style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),
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
