import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:Loan360Cloud/controller/mobileController.dart';
import 'package:Loan360Cloud/model/statementModel.dart';
import 'package:Loan360Cloud/ui/updateAddress.dart';
import 'package:flutter/material.dart';
import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:get/get.dart';

class UpdateMobile extends StatefulWidget {
  const UpdateMobile({Key? key}) : super(key: key);

  @override
  State<UpdateMobile> createState() => _UpdateMobileState();
}

class _UpdateMobileState extends State<UpdateMobile> {
  MobileController mobileController = Get.put(MobileController());
  String?  _errorText;
  TextEditingController customerName = TextEditingController();
  TextEditingController phoneMobile1 = TextEditingController();
  TextEditingController phoneMobile2 = TextEditingController();
  String customerId='';
  String loanId='';
  final search = TextEditingController();
  GlobalKey<ScaffoldState> _mobileUpdatekey = GlobalKey();
  final formKey = new GlobalKey<FormState>();

  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _mobileUpdatekey,
      drawer: Drawer(
        child: DrawerScreen(),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: appBar(appBarName:CommonText.updateMobile.toString(),onPressed: (){
          if (_mobileUpdatekey.currentState != null) {
            if (_mobileUpdatekey.currentState!.isDrawerOpen) {
              _mobileUpdatekey.currentState!.closeDrawer();
            } else {
              _mobileUpdatekey.currentState!.openDrawer();
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
                          child: TextField(
                            controller: search,
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
                      print("search"+search.value.text.toString());
                      Get.delete<MobileController>();
                      mobileController.statmentSearch(searchLoanNo:search.value.text.toString());
                      customerName.clear();
                      phoneMobile1.clear();
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


            Obx(()=> mobileController!.loading.value?
             Container(
              margin: EdgeInsets.only(top: 10),
              child: CircularProgressIndicator(),
               ) : Container(
                height: 70,
                 margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                child: Column(
                 children: [
                   Container(
                     alignment: Alignment.topLeft,
                     child: Text(CommonText.customer,style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),
                   ),

                 /* Container(
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
                                isEmpty: mobileController.dropdownAddress == null,
                                child:  DropdownButton<loadData>(
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color:AppColor.GreyColor,
                                    size: 20.09,
                                  ),
                                  value: mobileController.dropdownAddressValue,
                                  isDense: true,
                                  onChanged: (loadData? newValue) {
                                    setState(() {
                                      mobileController.dropdownAddressValue = newValue;
                                      customerName.text = mobileController!.dropdownAddressValue!.toString();
                                      customerId = newValue!.customerId.toString();
                                      loanId = newValue!.id.toString();
                                      if(newValue!.mobile != null){
                                        phoneMobile1.text = newValue!.mobile.toString();
                                      }

                                    });
                                  },
                                  items: mobileController.dropdownAddress!.map((loadData? value) {
                                    return DropdownMenuItem<loadData>(
                                      value: value,
                                      child: Text(value!.name.toString()),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),*/
                ],
               ),
             ),
           ),

            Container(
              height: 70,
              margin: EdgeInsets.only(left: 15,right: 15,top:20,),
              child:Column(
                children: [
                  WithoutAstrickText(CommonText.mobile1),
                  Container(
                    // width: 320,
                    child: TextField(
                     controller: phoneMobile1,
                      textAlign: TextAlign.left,
                      decoration:  const InputDecoration(
                        border: InputBorder.none,
                        hintText: '+91',
                        hintStyle: TextStyle(color: Colors.grey),
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
                ],
              ) ,
            ),

            Container(
              height: 70,
              margin: EdgeInsets.only(left: 15,right: 15,top:20,),
              child:Column(
                children: [
                  WithoutAstrickText(CommonText.mobile2),

                  Container(
                    // width: 320,
                    child: TextField(
                      controller: phoneMobile2,

                      textAlign: TextAlign.left,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: '+91',
                        hintStyle: TextStyle(color: Colors.grey),

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
                        if(customerName.text.isNotEmpty){
                          mobileController.mobileUpdateResponseData(MobileNo1:phoneMobile1.text,MobileNo2: phoneMobile2.text,LoanId: loanId,CustomerId:customerId);
                        }else{
                          Get.defaultDialog(
                              middleText: "Please select customer name",
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
                          color: AppColor.ThemeColor,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),

                        child: Text(CommonText.updateMobile.toUpperCase(),textAlign: TextAlign.center, style: textStyle.RegularBold.copyWith(color: Colors.white,fontWeight: FontWeight.w700,),
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
            )


          ],
        ),

      ),
    );
  }
}
