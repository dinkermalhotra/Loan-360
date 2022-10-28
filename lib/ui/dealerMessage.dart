
import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:Loan360Cloud/ui/updateAddress.dart';
import 'package:flutter/material.dart';
import 'package:Loan360Cloud/common/textStyle.dart';

class DealerMessage extends StatefulWidget {

  @override
  State<DealerMessage> createState() => _DealerMessageState();
}

class _DealerMessageState extends State<DealerMessage> {

  static List<Address>? _dropdownAddress = [];
  static final GlobalKey<ScaffoldState> _key = GlobalKey();
  final formKey = new GlobalKey<FormState>();

  // var controller = new MaskedTextController(mask: '(000) 000 0000');

  String?  _errorText;
  bool isMan = false;
  bool isWoman = false;
  final _address = TextEditingController();
  Address? _dropdownAddressValue;
  // TextEditingController phoneController = new TextEditingController();


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
        key:  _key,
        drawer: Drawer(
          child: DrawerScreen(),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: appBar(appBarName:CommonText.delearMessage.toString(),onPressed: (){
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
          child:Column(
            children: [
              Container(
                height: 70,
                margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text("DEALER",style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),
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
              ),

              InkWell(
                  onTap: (){

                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                    //margin: EdgeInsets.only(right: 5),
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

            ],
          ),
        ),

    );
  }
}


//user
//loan status
//branch