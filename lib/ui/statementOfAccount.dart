import 'dart:async';
import 'dart:core';
import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:Loan360Cloud/controller/statementAcountController.dart';
import 'package:Loan360Cloud/controller/statementController.dart';
import 'package:Loan360Cloud/ui/statementOfAccountSearch.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
bool? Screenchange;
String CompanyCode='', loanUserNameData=' ',BranchCode='',finYearId='',pathName='',fromDate='',ToDate='',isSummary='',code='',LoanId='',LoanNo='',loanDate='';

class StatementOfAccount extends StatefulWidget {
   StatementOfAccount({bool? ScreenRoute,String loanUserName='',String companyCode='',String branchCode='',String pathName='',String fromDate='',String ToDate='',String isSummary='',String code='',String loanId='',String loanNo='',String loanDate=''}){
    Screenchange = ScreenRoute;
    CompanyCode = companyCode;
    BranchCode = branchCode;
    LoanId = loanId;
    LoanNo = loanNo;
    loanUserNameData = loanUserName;
   }
  @override
  State<StatementOfAccount> createState() => _StatementOfAccountState();
}

class _StatementOfAccountState extends State<StatementOfAccount> {
  GlobalKey<ScaffoldState> _statementKey = GlobalKey();
  final search = new TextEditingController();
  final textFieldDate = new TextEditingController();
  DateTime? selectedDate;
  DateTime _date = DateTime.now();
  StatementAccountController statementAccountController = Get.put(StatementAccountController());
  var dob;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    safePrint("loanUserNameData");
    safePrint(loanUserNameData);
    safePrint(CompanyCode);
    safePrint(BranchCode);
    safePrint(LoanId);
    safePrint(LoanNo);

   /* Future.delayed(Duration(seconds: 2),(){
      if(Screenchange!){

      }else{
        Get.to(()=> StatementAccountSearch(callback: true,));
      }
     });*/
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return GetBuilder(
         init: StatementController(),
          builder: (StatementController controller) {
           return Scaffold(
             key:  _statementKey,
             drawer: Drawer(
               child: DrawerScreen(),
             ),
             appBar: AppBar(
               automaticallyImplyLeading: false,
               title: appBar(appBarName:CommonText.statementofAccount.toString(),onPressed: (){
                 if (_statementKey.currentState != null) {
                   if (_statementKey.currentState!.isDrawerOpen) {
                     _statementKey.currentState!.closeDrawer();
                   } else {
                     _statementKey.currentState!.openDrawer();
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
                                 //padding: EdgeInsets.all(5),
                                 //margin: EdgeInsets.only(left: 10,right: 10,top:30,),
                                 child: TextField(
                                   readOnly: true,
                                  // controller: search,
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
                             Get.to(()=> StatementAccountSearch(callback: "statementAccount",),);


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
                     visible: Screenchange!,
                       child: Container(
                         margin: EdgeInsets.only(left: 20,top:10,),
                         alignment: Alignment.centerLeft,
                         child: Text("Loan No: "+ loanUserNameData,style: textStyle.RegularBold.copyWith(color: Colors.black)),
                       ),
                   ),

                   Container(
                     height: 90,
                     margin:const EdgeInsets.only(left: 15,right: 15,top:30,),
                     child:Column(
                       children: [
                         Container(
                           child: Column(
                             children: [
                               Container(
                                 alignment: Alignment.topLeft,
                                 child: Text(CommonText.onDate,style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),
                               ),

                               Container(
                                 child: Row(
                                   children: [
                                     Container(
                                       width: 320,
                                       child: TextField(
                                         readOnly: true,
                                          controller: textFieldDate,
                                         textAlign: TextAlign.left,
                                         decoration:  InputDecoration(
                                             border: InputBorder.none,
                                             hintText: '01-03-2020',
                                             hintStyle: TextStyle(color: AppColor.GreyColor),
                                             enabledBorder: InputBorder.none,
                                             focusedBorder: InputBorder.none
                                         ),
                                       ),
                                     ),

                                     InkWell(
                                       onTap: (){
                                         datePicker();
                                       },
                                       child: Container(
                                         child: Image.asset('assets/calendar.png',height: 20,width: 20,),
                                       ),
                                     )
                                   ],
                                 ),
                               ),
                               Container(
                                 child: Divider(
                                   thickness: 2.0,
                                   color: AppColor.LighGreyColor,
                                 ),
                               ),
                             ],
                           ),
                         ),
                       ],
                     ),
                   ),

                   Container(
                     margin: EdgeInsets.only(top: 30,left: 15,right: 15),
                     child: InkWell(
                       onTap: (){
                         if(textFieldDate.text.isNotEmpty){

                          // statementAccountController.loanPdfStatementData(companyCode: CompanyCode,branchCode: BranchCode,loanNo: LoanNo,loanId: LoanId,loanUserName:loanUserNameData,toDate:textFieldDate.text,pathName: textFieldDate.text);
                         }else{
                           Get.defaultDialog(
                               middleText: "Please Select Date",
                               textConfirm: 'OK',
                               confirmTextColor: Colors.white,
                               onConfirm: () {
                                 Get.back();
                               });
                         }

                       },
                       child: Container(
                         margin: EdgeInsets.only(right: 5),
                         padding: EdgeInsets.all(17),
                         width: double.infinity,
                         decoration: BoxDecoration(
                           color: AppColor.LighGreyColor,
                           borderRadius: BorderRadius.all(Radius.circular(40)),
                         ),
                         child: Text(CommonText.submit,textAlign: TextAlign.center, style: textStyle.RegularBold.copyWith(color: Colors.black,fontWeight: FontWeight.w700,),
                         ),
                       ),
                     ),
                   ),


                   Obx(()=> Visibility(
                     visible: statementAccountController.loading.value,
                     child: Container(
                       margin: EdgeInsets.only(top: 30,left: 15,right: 15),
                       child: InkWell(
                         onTap: (){

                        },
                         child: Container(
                           margin: EdgeInsets.only(right: 5),
                           padding: EdgeInsets.all(17),
                           decoration: BoxDecoration(
                             color: AppColor.LighGreyColor,
                             borderRadius: BorderRadius.all(Radius.circular(40)),
                           ),
                           child: Text(CommonText.download,textAlign: TextAlign.center, style: textStyle.RegularBold.copyWith(color: Colors.black,fontWeight: FontWeight.w700,),
                           ),
                         ),
                       ),
                     ),
                   ),
                 ),

                 ],
               ),
             ),
           );
       },
    );
  }
  datePicker() async {
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
        textFieldDate.text = dob;
      });
    }
  }
}
