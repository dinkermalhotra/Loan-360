import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:Loan360Cloud/ui/cashDeposit.dart';
import 'package:Loan360Cloud/ui/dealerMessage.dart';
import 'package:Loan360Cloud/ui/docsUpload.dart';
import 'package:Loan360Cloud/ui/dueList.dart';
import 'package:Loan360Cloud/ui/fieldInvestigation.dart';
import 'package:Loan360Cloud/ui/homeScreen.dart';
import 'package:Loan360Cloud/ui/jaguar.dart';
import 'package:Loan360Cloud/ui/leadManagement.dart';
import 'package:Loan360Cloud/ui/promiseToPay.dart';
import 'package:Loan360Cloud/ui/receiptForm.dart';
import 'package:Loan360Cloud/ui/reports.dart';
import 'package:Loan360Cloud/ui/setting.dart';
import 'package:Loan360Cloud/ui/statementOfAccount.dart';
import 'package:Loan360Cloud/ui/updateAddress.dart';
import 'package:Loan360Cloud/ui/updateApplication.dart';
import 'package:Loan360Cloud/ui/updateMobile.dart';
import 'package:Loan360Cloud/ui/updatePhoto&Sign.dart';
import 'package:Loan360Cloud/ui/update_FI.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerState();
}

class _DrawerState extends State<DrawerScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         margin: EdgeInsets.only(left: 10,right: 10),
            child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      Get.back();
                      setState(() {
                       Get.to(()=>HomeScreen());
                      });

                    },
                    child: Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 30,),
                      child: Image.asset("assets/login_logo.png",width: 200,fit: BoxFit.fill,),
                    ),
                  ),

                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: category.length,
                        itemBuilder:(context, index) {

                          return InkWell(
                            onTap: (){
                              Get.back();
                               /// id 6, 15
                              ///

                              if(category.elementAt(index).id == 1){
                                Get.to(()=> UpdateAddress());
                              } else if(category.elementAt(index).id == 2){
                                Get.to(()=> UpdatePhotoSign());

                              } else if(category.elementAt(index).id == 3){
                                Get.to(()=> FieldInvestigation());

                              }else if(category.elementAt(index).id == 4){
                                Get.to(()=> StatementOfAccount());
                              } else if(category.elementAt(index).id == 5){
                                Get.to(()=> DocsUpload());

                              } else if(category.elementAt(index).id == 7){
                                Get.to(()=> PromiseToPay());

                              }else if(category.elementAt(index).id == 8){
                                Get.to(()=> Setting());
                              } else if(category.elementAt(index).id == 9){
                                Get.to(()=> UpdateMobile());
                              } else if(category.elementAt(index).id == 10){
                                Get.to(()=> Jaguar());
                              }else if(category.elementAt(index).id == 11){
                                Get.to(()=> DealerMessage());

                              }else if(category.elementAt(index).id == 12){
                                Get.to(()=> ReceiptForm());

                              } else if(category.elementAt(index).id == 13){
                                Get.to(()=> DueList());
                              } else if(category.elementAt(index).id == 14){
                                Get.to(()=> Reports());
                              }else if(category.elementAt(index).id == 16) {
                                Get.to(()=> CashDeposit());
                              } else if(category.elementAt(index).id == 17) {

                                //  Get.to(() => Logout());
                              }




                              /*switch(index){
                                case category.elementAt(index).id:
                       //          Get.to(()=> UpdateFI());
                                   Get.to(()=> UpdateAddress());
                                break;

                                case 1:
                                  Get.to(()=> UpdatePhotoSign());
                                break;

                                case 2:
                                  Get.to(()=> FieldInvestigation());
                                  break;

                                case 3:
                                  Get.to(()=> StatementOfAccount());
                                  break;

                                case 4:
                                 Get.to(()=> DocsUpload());
                                 break;

                                case 5:
                                  Get.to(()=> LeadManagement());
                                  break;

                                case 6:
                                  Get.to(()=> PromiseToPay());
                                  break;

                                case 7:
                                  Get.to(()=> Setting());
                                  break;

                                case 8:
                                  Get.to(()=> UpdateMobile());
                                  break;

                                  case 9:
                                    Get.to(()=> Jaguar());
                                    break;

                                case 10:
                                  Get.to(()=>DealerMessage());
                                  break;

                                case 11:
                                  Get.to(()=> ReceiptForm());
                                  break;

                                case 12:
                                  Get.to(()=> DueList());
                                  break;

                                case 13:
                                  Get.to(()=>Reports() );
                                  break;

                                case 14:
                                  Get.to(()=> UpdateApplication());
                                  break;

                                case 15:

                                   Get.to(()=> CashDeposit());
                                  break;

                                case 16:
                                //  Get.to(()=> ());
                                  break;
                                default:
                                  break;



                               // case 17:
                                 // Get.to(()=>LogoutS)




                              }
                              */


                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 20),
                             child: Row(
                               children: [
                                 Container(
                                   child: Image.asset(category.elementAt(index).image.toString(),height: 20,width: 20,),
                                 ),
                                 Container(
                                   margin: EdgeInsets.only(left: 20),
                                   child: Text(category.elementAt(index).name.toString(),style: textStyle.Regular.copyWith(),),
                                 ),
                                 Spacer(),
                                 category.elementAt(index).id==17?SizedBox():Container(
                                   child: Image.asset('assets/right_arrow.png',height: 20,width: 20),
                                 )
                               ],
                             ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
        );
    }
}

List<DrawerModel> category = [



   DrawerModel(
      image: "assets/address.png",
      name: "Updated Address",
      id: 1
  ),
   DrawerModel(
      image: "assets/update_photo.png",
      name: "Updated Photo & Sign",
      id: 2
  ),

  DrawerModel(
      image: "assets/field_investigation.png",
      name: "Field Investigation",
      id: 3
  ),

  DrawerModel(
      image: "assets/statement_account.png",
      name: "Statement of Account",
      id: 4
  ),
  DrawerModel(
      image: "assets/docs_upload.png",
      name: "Docs Upload",
      id: 5
  ),

  /*DrawerModel(
      image: "assets/lead_manage.png",
      name: "Lead Management",
      id: 6
  ),*/

  DrawerModel(
      image: "assets/promise_to_pay.png",
      name: "Promise to Pay",
      id: 7
  ),

  DrawerModel(
      image: "assets/settings.png",
      name: "Settings",
      id: 8
  ),

  DrawerModel(
      image: "assets/update_mobile.png",
      name: "Update Mobile",
      id: 9
  ),

  DrawerModel(
      image: "assets/jaguar.png",
      name: "Jaguar",
      id: 10
  ),

  DrawerModel(
      image: "assets/dealer_messages.png",
      name: "Dealer Messages",
      id: 11
  ),


  DrawerModel(
      image: "assets/receipt_form.png",
      name: "Receipt Form",
      id: 12
  ),

  DrawerModel(
      image: "assets/due_list.png",
      name: "Due List",
      id: 13
  ),
  
  DrawerModel(
      image: "assets/report.png",
      name: "Reports",
      id: 14
  ),

 /* DrawerModel(
      image: "assets/update_app.png",
      name: "Update Application",
      id: 15
  ),*/
  DrawerModel(
      image: "assets/address.png",
      name: "Cash Deposit",
      id: 16
  ),

  DrawerModel(
      image: "assets/logout.png",
      name: "Logout",
      id: 17
  ),


];
class DrawerModel {
  int? id;
  String? image;
  String? name;

  DrawerModel({this.id, this.image,this.name,});

}
