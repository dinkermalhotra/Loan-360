
import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonDialog.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:Loan360Cloud/ui/updateAddress.dart';
import 'package:flutter/material.dart';
import 'package:Loan360Cloud/common/textStyle.dart';

class UpdatePhotoSign extends StatefulWidget {
  const UpdatePhotoSign({Key? key}) : super(key: key);

  @override
  State<UpdatePhotoSign> createState() => _UpdatePhotoSignState();
}

class _UpdatePhotoSignState extends State<UpdatePhotoSign> {
  static final GlobalKey<ScaffoldState> _key = GlobalKey();
  static List<Customer>? _dropdownCustomer = [];
  Customer? _dropdownCustomerValue;
 final _customer = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dropdownCustomer!.add(Customer(customerName: 'Select', customerCode: '+91'));
    _dropdownCustomer!.add(Customer(customerName: 'India', customerCode: '+91'));
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
        title: appBar(appBarName:CommonText.updatePhotoSignTitle.toString(),
           onPressed: (){
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

                        showDialog(
                          context: context,
                          builder: (BuildContext context) => Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(20.0)),
                            child: Container(
                                height: 200,
                                child: customGalleryDialog()),
                          ),
                        );

                      },
                      child: Container(

                        margin: EdgeInsets.only(right: 5),
                        padding: EdgeInsets.all(17),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.ThemeColor,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),

                        child: Text(CommonText.photo.toUpperCase(),textAlign: TextAlign.center, style: textStyle.RegularBold.copyWith(color: Colors.white,fontWeight: FontWeight.w700,),
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
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                              border: Border.all(color: Colors.blueAccent)

                          //borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),

                        child: Text(CommonText.signature.toUpperCase(),textAlign: TextAlign.center, style: textStyle.RegularBold.copyWith(color: Colors.black,fontWeight: FontWeight.w700,),
                        ),
                      ),
                    ),
                  )

                ],
              ),
            ),
            InkWell(
              onTap: (){

              },
              child: Container(
                margin: EdgeInsets.only(top: 30,),
                child: Text(CommonText.reset.toUpperCase(),textAlign: TextAlign.center, style: textStyle.RegularBold.copyWith(color:AppColor.ThemeColor,fontWeight: FontWeight.w700,),            ),
              ),
            ),



          ],
        ),

      ),
    );
  }
}
