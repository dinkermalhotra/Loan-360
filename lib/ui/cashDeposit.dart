
import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonDialog.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:Loan360Cloud/ui/updateAddress.dart';
import 'package:flutter/material.dart';
import 'package:Loan360Cloud/common/textStyle.dart';

class CashDeposit extends StatefulWidget {
  const CashDeposit({Key? key}) : super(key: key);

  @override
  State<CashDeposit> createState() => _CashDepositState();
}

class _CashDepositState extends State<CashDeposit> {
  static final GlobalKey<ScaffoldState> _key = GlobalKey();

  final _customer = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerScreen(),
      ),
      key:  _key,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: appBar(appBarName:CommonText.cashDeposit.toString(),onPressed: (){
          if (_key.currentState != null) {
            if (_key.currentState!.isDrawerOpen) {
              _key.currentState!.closeDrawer();
            } else {
              _key.currentState!.openDrawer();
            }
          }
        }),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              cashAmountTextField(),
              depositHistory(),
            ],
          ),
        ),
      ),
    );
  }

  Widget cashAmountTextField(){
    return Container(
      margin: EdgeInsets.only(left: 15,right: 15,top:20,),
      child: Column(
        children: [
          Container(
            height: 70,
           // margin: EdgeInsets.only(left: 15,right: 15,top:20,),
            child:Column(
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(CommonText.amount,style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),

                    ),
                    Container(
                      child: Icon(
                        Icons.star,size: 10,color: Colors.red,
                      ),
                    )
                  ],
                ),

                Container(
                  // width: 320,
                  child: const TextField(
                    //controller: emailController,
                    obscureText: true,
                    textAlign: TextAlign.left,
                    decoration:  InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Amount',
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
                ),

              ],
            ) ,
          ),

          Container(
            height: 70,
            margin: EdgeInsets.only(top:20,),
            child:Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(CommonText.remarks,style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),

                ),

                Container(
                  // width: 320,
                  child: const TextField(
                    //controller: emailController,
                    obscureText: true,
                    textAlign: TextAlign.left,
                    decoration:  InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Remark',
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
            ) ,
          ),


          InkWell(
            onTap: (){
             showDialog(
                context: context,
                builder: (BuildContext context) => Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(20.0)),
                  child: Container(
                      height: 200,
                      child: customFileSelectDialog()),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: Text(CommonText.uploadReceipt,style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),

            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 10,bottom: 30),
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
                        gradient: LinearGradient(
                            colors: [
                             AppColor.ThemeColor,
                              Colors.lightBlueAccent
                              // const Color(0xFF3366FF),

                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,

                            ),
                       // color: AppColor.ThemeColor,
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),

                      child: Text(CommonText.getReport.toUpperCase(),textAlign: TextAlign.center, style: textStyle.RegularBold.copyWith(color: Colors.white,fontWeight: FontWeight.w700,),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child:InkWell(
                    onTap: (){

                    },
                    child: Container(
                      //decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [AppColor.ThemeColor, AppColor.ThemeColor.withOpacity(0.5)])),
                      margin: EdgeInsets.only(left: 5),
                      padding: EdgeInsets.all(17),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        // gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [AppColor.ThemeColor, AppColor.ThemeColor.withOpacity(0.5)])
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
    );
  }



  Widget depositHistory(){
    return Container(
      margin: EdgeInsets.only(left: 15,right: 15,),
      child: Column(
        children: [
         Container(
           alignment: Alignment.topLeft,
             child: Text(CommonText.depositHistory,style: textStyle.RegularBold.copyWith(color: Colors.black)),

         ),


          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
               itemCount: 4,
              shrinkWrap: true,
              itemBuilder:(context,index){
                return Container(
                  margin: EdgeInsets.only(top: 10,),
                  child: Card(
                    elevation: 10,
                    child: Container(
                      padding: EdgeInsets.all(10),
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
                                    child: Text(CommonText.amount,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                  ),
                                ),

                                Expanded(
                                  child: Container(
                                    child: Text("45,000",style: textStyle.Regular.copyWith(color: Colors.black),),
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
                                    child: Text(CommonText.depositOn,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                  ),
                                ),

                                Expanded(
                                  child: Container(
                                    child: Text('27/Aug/2021 17:26PM',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                                    child: Text(CommonText.remarks,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                  ),
                                ),

                                Expanded(
                                  child: Container(
                                    child: Text("By amt deposit in PNB Bank",style: textStyle.Regular.copyWith(color: Colors.black),),
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
                                    child: Text(CommonText.verified,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                  ),
                                ),

                                Expanded(
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    //margin: EdgeInsets.only(right: 20),
                                    child: Image.asset("assets/verified.png",height: 20,width: 20,),
                                    //child: Text(CommonText.rupeeSign+'1,38,000',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                                    child: Text(CommonText.verifiedBy,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                  ),
                                ),

                                Expanded(
                                  child: Container(
                                    child: Text(CommonText.rupeeSign+'10,000',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                                    child: Text(CommonText.verifiedOn,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                  ),
                                ),

                                Expanded(
                                  child: Container(
                                    child: Text('27/Aug/2021 17:54PM',style: textStyle.Regular.copyWith(color:Colors.black),),
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
                                    child: Text(CommonText.file,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                  ),
                                ),

                                Expanded(
                                  child: Container(
                                    child: Text('202110099.jpg',style: textStyle.Regular.copyWith(color: AppColor.ThemeColor),),
                                  ),
                                )

                              ],
                            ),
                          ),



                        ],
                      ),
                    ),
                  ),
                );
              }),






        ],
      ),
    );
  }
}
