import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:Loan360Cloud/controller/promiseController.dart';
import 'package:Loan360Cloud/ui/addPromise_To_Pay.dart';
import 'package:flutter/material.dart';
import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PromiseToPay extends StatefulWidget {
  const PromiseToPay({Key? key}) : super(key: key);
  @override
  State<PromiseToPay> createState() => _PromiseToPayState();
}

class _PromiseToPayState extends State<PromiseToPay> {
  GlobalKey<ScaffoldState> promiseToPaykey = GlobalKey();
  TextEditingController Todate =  TextEditingController();
  TextEditingController Fromdate =  TextEditingController();
  TextEditingController loanSearch =  TextEditingController();
  PromiseController promiseController = Get.put(PromiseController());
  DateTime? selectedDate;
  DateTime _date = DateTime.now();
  var dob;

  bool Date = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:  promiseToPaykey,
      drawer: Drawer(
        child: DrawerScreen(),
      ),
      floatingActionButton:  FloatingActionButton(
        elevation: 50,
        hoverColor: Colors.red,
        autofocus: true,
        onPressed: () {
          Get.to(()=>AddPromiseToPay());

        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: appBar(appBarName:CommonText.promiseToPay.toString(),onPressed: (){
          if (promiseToPaykey.currentState != null) {
            if (promiseToPaykey.currentState!.isDrawerOpen) {
              promiseToPaykey.currentState!.closeDrawer();
            } else {
              promiseToPaykey.currentState!.openDrawer();
            }
          }
        }),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 90,
                margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                child:Column(

                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(CommonText.fromDate,style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),

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

                       // margin: EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          Container(

                            child: Row(
                              children: [
                                  Container(
                                    width: 320,
                                    child: TextField(
                                      readOnly: true,
                                      controller: Fromdate,
                                      textAlign: TextAlign.left,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '01-01-1888',
                                        hintStyle: TextStyle(color: Colors.grey),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none
                                      ),
                                    ),
                                  ),

                                  InkWell(
                                    onTap: (){
                                        datePicker(true);
                                      // datePicker(Fromdate.text);

                                    },
                                    child: Container(
                                      child: Image.asset('assets/calendar.png',height: 20,width: 20,),
                                    ),
                                  )
                              ],
                            ),
                          ),
                          Container(
                           // width: 320,
                            child: Divider(
                              thickness: 2.0,
                              color: AppColor.LighGreyColor,
                            ),
                          )

                        ],
                      ),
                    ),
                  ],
                ) ,
              ),

              Container(
                height: 90,
                margin: EdgeInsets.only(left: 15,right: 15,top:10,),
                child:Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(CommonText.toDate,style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),
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

                      // margin: EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          Container(

                            child: Row(
                              children: [
                                Container(
                                  width: 320,
                                  child: TextField(
                                    readOnly: true,
                                    controller: Todate,
                                    textAlign: TextAlign.left,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '01-01-1888',
                                        hintStyle: TextStyle(color: Colors.grey),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none
                                    ),
                                  ),
                                ),

                                InkWell(
                                  onTap: (){
                                    datePicker(false);
                                  },
                                  child: Container(
                                    child: Image.asset('assets/calendar.png',height: 20,width: 20,),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            // width: 320,
                            child: Divider(
                              thickness: 2.0,
                              color: AppColor.LighGreyColor,
                            ),
                          )

                        ],
                      ),
                    ),
                  ],
                ) ,
              ),

              Container(
                height: 90,
                margin: EdgeInsets.only(left: 15,right: 15,top:10,),
                child:Column(
                  children: [
                    Container(
                       alignment: Alignment.topLeft,
                       child: Text(CommonText.loanNo,style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),
                    ),



                    Container(
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  width: 320,
                                  child:  TextField(
                                    controller: loanSearch,
                                    textAlign: TextAlign.left,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Loan A/c#',
                                        hintStyle: TextStyle(color: Colors.grey),
                                      enabledBorder:  InputBorder.none,
                                      focusedBorder:  InputBorder.none

                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                          Container(
                            // width: 320,
                            child: Divider(
                              thickness: 2.0,
                              color: AppColor.LighGreyColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ) ,
              ),


              Container(
                margin: EdgeInsets.only(top: 30,left: 15,right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){

                        promiseController.statmentSearch(fromDate:Fromdate.text,toDate: Todate.text,searchLoanNo: loanSearch.text);
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
                    )

                  ],
                ),
              ),



             /* ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      // height: 250,
                      margin: EdgeInsets.all(10),

                      width: double.infinity,
                      child: Card(
                        elevation: 20,
                        child: Container(

                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [

                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Expanded(
                                        child: Container(
                                          child: Text(CommonText.loanNo,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                        ),
                                      ),

                                      Expanded(
                                        child: Container(
                                          child: Text('DEM TRY',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                                          child: Text(CommonText.name,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Text('Arvind Kumar' ,style: textStyle.Regular.copyWith(color: Colors.black),),
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
                                          child: Text(CommonText.description,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                        ),
                                      ),

                                      Expanded(
                                        child: Container(
                                          child: Text('Descriptipn ',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                                          child: Text(CommonText.reminderDate,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                        ),
                                      ),
                                      Expanded(
                                        child:  Container(
                                          child: Text('01/19/2017  17:54 PM',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                                          child: Text(CommonText.entryDate,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                        ),
                                      ),
                                      Expanded(
                                        child:  Container(
                                          child: Text('01/19/2017  17:54 PM',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Image.asset("assets/updated.png",height: 20,width: 20,),
                                              ),
                                              Container(
                                                child: Text(CommonText.updateSmall,style: textStyle.Regular.copyWith(color: Colors.green),),


                                              )
                                            ],

                                          )
                                      ),
                                      Expanded(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Image.asset("assets/map.png",height: 20,width: 20,),
                                              ),
                                              Container(
                                                child: Text(CommonText.map,style: textStyle.Regular.copyWith(color: Colors.red),
                                                ),
                                              )
                                            ],

                                          )
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ),
                    );
                  }),
              
              InkWell(
                onTap: (){
                  Get.to(()=> AddPromiseToPay());

                },
                child: Container(
                  alignment: Alignment.centerRight,

                  child: Image.asset("assets/add.png",height: 100,width: 100,fit:BoxFit.fitHeight),
                ),
              )*/
              



            ],
          ),

        ),
      ),

    );
  }
  datePicker(bool date) async {
    selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      helpText: 'Campaign Date Picker'.toUpperCase(),
    );
    if (selectedDate != null && selectedDate != _date) {
      setState(() {
        _date = selectedDate!;
        dob = DateFormat('yyyy-MM-dd').format(_date); //change date format on your need
        print('Date');
        print(dob.toString(),);

        if(date){
          Fromdate.text = dob;
        }else{
          Todate.text = dob;
        }

      });
    }
  }
}
