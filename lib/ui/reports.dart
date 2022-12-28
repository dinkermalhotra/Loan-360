
import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:Loan360Cloud/ui/updateAddress.dart';
import 'package:flutter/material.dart';
import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:get/get.dart';

class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  State<Reports> createState() => _ReportsState();
}


class _ReportsState extends State<Reports> {
  GlobalKey<ScaffoldState> _Reportkey = GlobalKey();
  static List<ReportsData>? dropdownReport = [];
  GlobalKey<ScaffoldState> updateKey = GlobalKey();
  int? _groupValue = 1;
  // var controller = new MaskedTextController(mask: '(000) 000 0000');
  // Customer? _dropdownCustomerValue;
  ReportsData? dropDownValue;
  String?  _errorText;
  bool isMan = false;
  bool isWoman = false;
  final select = TextEditingController();
  final laonNo = TextEditingController();
  final receiptDate = TextEditingController();
  bool boolValue = false;
  // TextEditingController phoneController = new TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropdownReport!.add(ReportsData(receiptName: 'Select', code: 'none'));
    dropdownReport!.add(ReportsData(receiptName: 'Receipts', code: 'rc'));
    dropdownReport!.add(ReportsData(receiptName: 'Mobile', code: 'mob'));
    dropdownReport!.add(ReportsData(receiptName: 'Address', code: 'address'));
    dropDownValue = dropdownReport![0];


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:  _Reportkey,
      drawer: Drawer(
        child: DrawerScreen(),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: appBar(appBarName:CommonText.report.toString(),onPressed: (){
          if (_Reportkey.currentState != null) {
            if (_Reportkey.currentState!.isDrawerOpen) {
              _Reportkey.currentState!.closeDrawer();
            } else {
              _Reportkey.currentState!.openDrawer();
            }
          }
        }),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20,right: 20,top: 20),
        child: Column(
          children: [
            Container(
              height: 70,
              margin: EdgeInsets.only(top:10,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonAstrickText(CommonText.selectType),
                  InkWell(
                    onTap: (){
                      showDialog(
                          context: context,
                          builder: (context){
                            return StatefulBuilder(
                                builder: (context, StateSetter newSetState) {
                                  return  Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(20.0)),
                                    child: Container(
                                      margin: EdgeInsets.only(top: 10,bottom: 10),
                                      child: Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              alignment: Alignment.center,
                                              child: Text('Select Type *', style:textStyle.Heading2.copyWith(color: Colors.black,fontWeight: FontWeight.w600,),
                                              ),
                                            ),

                                            Container(
                                              child: Column(
                                                children: <Widget>[
                                                  Container(
                                                    child: RadioListTile(
                                                      value: 1,
                                                      groupValue:_groupValue,
                                                      title: Text("--Select--",style: textStyle.Regular.copyWith(color: Colors.black,fontWeight: FontWeight.w600,)),
                                                      onChanged: (newValue) {
                                                        newSetState((){
                                                          setState((){
                                                            //receiptMode="";
                                                           // chequeBoolValue = false;
                                                            boolValue = false;
                                                            select.text = "--Select--";
                                                            _groupValue = newValue;

                                                          });
                                                        });

                                                      },
                                                      activeColor: AppColor.ThemeColor,
                                                      // selected: false,
                                                    ),
                                                  ),

                                                  Container(
                                                    child: RadioListTile(
                                                      value: 2,
                                                      groupValue: _groupValue,
                                                      title: Text("Receipts",style: textStyle.Regular.copyWith(color: Colors.black,fontWeight: FontWeight.w600,)),
                                                      onChanged: (newValue){
                                                        newSetState((){
                                                          setState((){
                                                            /*chequeBoolValue = false;
                                                            print("chequeBoolValue");
                                                            print(chequeBoolValue);*/
                                                            boolValue = true;
                                                            select.text = "Receipts";
                                                            //receiptMode = "A";
                                                            _groupValue = newValue;
                                                          });
                                                        });
                                                      },
                                                      activeColor: AppColor.ThemeColor,
                                                    ),
                                                  ),
                                                  Container(
                                                    child: RadioListTile(
                                                      value: 3,
                                                      groupValue: _groupValue,
                                                      title: Text("Mobile",style: textStyle.Regular.copyWith(color: Colors.black,fontWeight: FontWeight.w600,)),
                                                      onChanged: (newValue) {
                                                        newSetState((){
                                                          setState((){
                                                            /*chequeBoolValue = true;
                                                            print("chequeBoolValue");
                                                            print(chequeBoolValue);*/
                                                            boolValue = false;
                                                            select.text = "Mobile";
                                                           /// receiptMode = "C";
                                                            _groupValue = newValue;
                                                          });
                                                        });
                                                      },
                                                      activeColor: AppColor.ThemeColor,
                                                    ),
                                                  ),
                                                  Container(
                                                    child: RadioListTile(
                                                      value: 4,
                                                      groupValue: _groupValue,
                                                      title: Text("Address",style: textStyle.Regular.copyWith(color: Colors.black,fontWeight: FontWeight.w600,)),
                                                      onChanged: (newValue) {
                                                        newSetState((){
                                                          setState((){
                                                            boolValue = false;
                                                            /*chequeBoolValue = true;
                                                            print("chequeBoolValue");
                                                            print(chequeBoolValue);*/
                                                            select.text = "Address";
                                                            /// receiptMode = "C";
                                                            _groupValue = newValue;
                                                          });
                                                        });
                                                      },
                                                      activeColor: AppColor.ThemeColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),


                                            Container(
                                              margin: EdgeInsets.only(top: 10,right: 20),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  ElevatedButton(
                                                    child: Text('Cancel'),
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                  ),

                                                  SizedBox(
                                                    width: 20,
                                                  ),


                                                  ElevatedButton(
                                                    child: Text('Ok'),
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                            );
                          }
                      );
                    },
                    child: Container(
                      decoration:BoxDecoration(
                        border:Border(
                          bottom:  BorderSide(
                              color: AppColor.GreyColor,
                              width: 1.0
                          ),
                        ),
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 200,
                            child:  TextField(
                              readOnly: true,
                              controller: select,
                              textAlign: TextAlign.left,
                              decoration: const InputDecoration(
                                  hintText: "Select",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.black),
                                  enabledBorder:InputBorder.none,
                                  focusedBorder:InputBorder.none
                              ),
                            ),
                          ),
                          Container(
                            child: Icon(Icons.arrow_drop_down_outlined),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Visibility(
              visible: boolValue,
              child: Column(
                children: [
                  Container(
                    child: TextField(
                      controller: receiptDate,
                      textAlign: TextAlign.left,
                      decoration:const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Chq#',
                        hintText: 'Cheque#',
                        hintStyle: TextStyle(color: Colors.black),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)
                          //  borderSide: BorderSide(color: AppColor.LighGreyColor),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: TextField(
                      controller: laonNo,
                      textAlign: TextAlign.left,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Chq.Date',
                        hintStyle: TextStyle(color: Colors.black),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)
                        ),
                      ),
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

                        child: Text("Get Report",textAlign: TextAlign.center, style: textStyle.RegularBold.copyWith(color: Colors.white,fontWeight: FontWeight.w700,),
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
      )
    );

  }
}

class ReportsData {
  String? receiptName = '';
  String? code = '';


  ReportsData({
    this.receiptName,
    this.code,
  });
}