
import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:flutter/material.dart';
import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:get/get.dart';

class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  State<Reports> createState() => _ReportsState();
}


class _ReportsState extends State<Reports> {
  static final GlobalKey<ScaffoldState> _key = GlobalKey();
  TextEditingController dateTo =  TextEditingController();
  int? _groupValue = -1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


     Future.delayed(Duration.zero, () {
       showDialog(
           context: context,
           builder: (BuildContext context){
             return StatefulBuilder(
                 builder: (context, StateSetter setState) {
                   return  Dialog(
                     shape: RoundedRectangleBorder(
                         borderRadius:
                         BorderRadius.circular(20.0)),
                     child: Container(
                       height: 280,
                       child:Container(
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget>[
                             Container(
                               alignment: Alignment.center,
                               child: Text('Select Type', style:textStyle.Heading2.copyWith(),
                               ),
                             ),
                             Container(
                               child: Column(
                                 children: <Widget>[
                                   Container(
                                     child: RadioListTile(
                                       value: 1,
                                       groupValue:_groupValue,
                                       title: Text("Receipts",style: textStyle.Regular.copyWith()),
                                       onChanged: (newValue) =>
                                           setState(() => _groupValue = newValue),
                                       activeColor: AppColor.ThemeColor,
                                       // selected: false,
                                     ),
                                   ),
                                   Container(
                                     child: RadioListTile(
                                       value: 2,
                                       groupValue: _groupValue,
                                       title: Text("Mobile",style: textStyle.Regular.copyWith()),
                                       onChanged: (newValue) =>
                                           setState(() => _groupValue = newValue),

                                       activeColor: AppColor.ThemeColor,
                                       //selected: false,
                                     ),
                                   ),
                                   Container(
                                     child: RadioListTile(
                                       value: 3,
                                       groupValue: _groupValue,
                                       title: Text("Address",style: textStyle.Regular.copyWith()),
                                       onChanged: (newValue) =>
                                           setState(() => _groupValue = newValue),

                                       activeColor: AppColor.ThemeColor,
                                       //   selected: false,
                                     ),
                                   ),





                                   Container(
                                     margin: EdgeInsets.only(top: 20),
                                     // width: 320,
                                     child: Divider(
                                       thickness: 2.0,
                                       color: AppColor.LighGreyColor,
                                     ),
                                   ),

                                   InkWell(
                                     onTap: (){
                                       Get.back();
                                     },
                                     child: Container(
                                       margin: EdgeInsets.only(top: 10),
                                       alignment: Alignment.center,
                                       child: Text('CANCEL ',style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor),),

                                     ),
                                   ),

                                 ],
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                   );
                 }
             );
           }
       );

    });

    /*showDialog(
        context: context,
        builder: (BuildContext context){
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20.0)),
            child: Container(
              height: 280,
              child:Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Text('Select Type', style:textStyle.Heading2.copyWith(),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: RadioListTile(
                              value: 1,
                              groupValue:_groupValue,
                              title: Text("Receipts",style: textStyle.Regular.copyWith()),
                              onChanged: (newValue) =>
                                  setState(() => _groupValue = newValue),
                              activeColor: AppColor.ThemeColor,
                              // selected: false,
                            ),
                          ),
                          Container(
                            child: RadioListTile(
                              value: 2,
                              groupValue: _groupValue,
                              title: Text("Mobile",style: textStyle.Regular.copyWith()),
                              onChanged: (newValue) =>
                                  setState(() => _groupValue = newValue),

                              activeColor: AppColor.ThemeColor,
                              //selected: false,
                            ),
                          ),
                          Container(
                            child: RadioListTile(
                              value: 3,
                              groupValue: _groupValue,
                              title: Text("Address",style: textStyle.Regular.copyWith()),
                              onChanged: (newValue) =>
                                  setState(() => _groupValue = newValue),

                              activeColor: AppColor.ThemeColor,
                              //   selected: false,
                            ),
                          ),





                          Container(
                            margin: EdgeInsets.only(top: 20),
                            // width: 320,
                            child: Divider(
                              thickness: 2.0,
                              color: AppColor.LighGreyColor,
                            ),
                          ),

                          InkWell(
                            onTap: (){
                              Get.back();
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              alignment: Alignment.center,
                              child: Text('CANCEL ',style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor),),

                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );*/

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
        title: appBar(appBarName:CommonText.report.toString(),onPressed: (){
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
         /*   InkWell(
              onTap: (){
               *//* showDialog(
                  context: context,
                  builder: (BuildContext context) => Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(20.0)),
                    child: Container(
                      height: 280,
                      child:Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                                child: Text('Select Type', style:textStyle.Heading2.copyWith(),
                                ),
                            ),
                           Container(
                              child: Column(
                                children: <Widget>[
                                      Container(
                                        child: RadioListTile(
                                          value: 1,
                                          groupValue:_groupValue,
                                          title: Text("Receipts",style: textStyle.Regular.copyWith()),
                                          onChanged: (newValue) =>
                                              setState(() => _groupValue = newValue),
                                          activeColor: Colors.red,
                                          selected: false,
                                        ),
                                      ),
                                      Container(
                                        child: RadioListTile(
                                          value: 2,
                                          groupValue: _groupValue,
                                          title: Text("Mobile",style: textStyle.Regular.copyWith()),
                                          onChanged: (newValue) =>
                                              setState(() => _groupValue = newValue),
                                          activeColor: Colors.red,
                                          selected: false,
                                        ),
                                      ),
                                  Container(
                                    child: RadioListTile(
                                      value: 3,
                                      groupValue: _groupValue,
                                      title: Text("Address",style: textStyle.Regular.copyWith()),
                                      onChanged: (newValue) =>
                                          setState(() => _groupValue = newValue),
                                      activeColor: Colors.red,
                                      selected: false,
                                    ),
                                  ),





                                  Container(
                                    margin: EdgeInsets.only(top: 20),
                                    // width: 320,
                                    child: Divider(
                                      thickness: 2.0,
                                      color: AppColor.LighGreyColor,
                                    ),
                                  ),

                                  InkWell(
                                    onTap: (){
                                      Get.back();
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(top: 10),
                                      alignment: Alignment.center,
                                      child: Text('CANCEL ',style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor),),

                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );*//*

              },
              child: Container(
                child: Text('pop- up'),
              ),
            )*/
          ],
        ),
      )
    );

  }
}
