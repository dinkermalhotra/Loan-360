
import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:flutter/material.dart';

import 'package:Loan360Cloud/common/textStyle.dart';

class ReceiptLoanDetail extends StatefulWidget {
  const ReceiptLoanDetail({Key? key}) : super(key: key);

  @override
  State<ReceiptLoanDetail> createState() => _ReceiptLoanDetailState();
}

class _ReceiptLoanDetailState extends State<ReceiptLoanDetail> {

  bool addAcccount = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title: Container(
              alignment: Alignment.centerLeft,
              child: Text(CommonText.receipt.toString(),style: textStyle.Heading2.copyWith())),
     ),

      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 15,right: 15,top:30,),
          //   margin: EdgeInsets.only(top:30,),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Container(
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
              ),
              InkWell(
                onTap: (){

                },
                child: Container(
                    margin:EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(17),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.ThemeColor,
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),

                  child: Text(CommonText.searchText.toUpperCase(),textAlign: TextAlign.center, style: textStyle.RegularBold.copyWith(color: Colors.white,fontWeight: FontWeight.w700,),
                  ),
                ),
              ),
              ReceiptDetail1(),
              Container(
                margin: EdgeInsets.only(top: 20),
                alignment: Alignment.topLeft,
                child: Text(CommonText.receivedAmount,style: textStyle.RegularBold.copyWith(),),
              ),
              ReceiptDetail2(),
              Container(
                height: 70,
                margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                child:Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(CommonText.amount,style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),
                    ),

                    Container(
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
                    )

                  ],
                ) ,
              ),


              InkWell(
                onTap: (){
                  setState(() {
                    addAcccount = !addAcccount;
                  });

                },
                child: Container(
                  margin:EdgeInsets.only(top: 20,bottom: 20),
                  padding: EdgeInsets.all(17),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.ThemeColor,
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),

                  child: Text(CommonText.addOtherAccount.toUpperCase(),textAlign: TextAlign.center, style: textStyle.RegularBold.copyWith(color: Colors.white,fontWeight: FontWeight.w700,),
                  ),
                ),
              ),

              Visibility(
                visible: addAcccount,
                  child: addOtherAccount()
              ),



            ],
          ),
        ),
      ),


    );
  }
  Widget addOtherAccount(){
    return Container(
      margin: EdgeInsets.only(left: 10,right: 10,),
      child: Column(
        children: [
          Container(
            height: 70,
            child:Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(CommonText.narration,style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),
                ),

                Container(
                  child: const TextField(
                    //controller: emailController,
                    obscureText: true,
                    textAlign: TextAlign.left,
                    decoration:  InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Narration',
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
            height: 70,
            margin: EdgeInsets.only(top: 10),
            child:Column(
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(CommonText.receiptMode,style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),
                    ),

                    Container(
                      child: Icon(
                        Icons.star,size: 10,color: Colors.red,
                      ),
                    )
                  ],
                ),

                Container(
                  child: const TextField(
                    //controller: emailController,
                    obscureText: true,
                    textAlign: TextAlign.left,
                    decoration:  InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Cash',
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
            height: 70,
            margin: EdgeInsets.only(top: 10),
            child:Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(CommonText.paymentName,style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),
                ),

                Container(
                  child: const TextField(
                    //controller: emailController,
                    obscureText: true,
                    textAlign: TextAlign.left,
                    decoration:  InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Narration',
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
            height: 70,
            margin: EdgeInsets.only(top: 10),
            child:Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(CommonText.paymentMobile,style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),
                ),

                Container(
                  child: const TextField(
                    //controller: emailController,
                    obscureText: true,
                    textAlign: TextAlign.left,
                    decoration:  InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Depositor Mobile No.',
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

            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    //margin: EdgeInsets.only(right: 30),
                    child: Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        side: BorderSide(
                          color: AppColor.ThemeColor,
                          width: 1.5,
                        ),
                        value: false,
                        onChanged: (value) {
                          setState(() {

                          });
                        }),
                  ),
                  Text("Update Customer Mobile",style: textStyle.RegularBold.copyWith()),
                  Spacer(),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Image.asset("assets/phone.png",color: AppColor.ThemeColor,height: 20,width: 20,),),
                  )
                ]),

          ),

          Container(

            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    //margin: EdgeInsets.only(right: 30),
                    child: Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        side: BorderSide(
                          color: AppColor.ThemeColor,
                          width: 1.5,
                        ),
                        value: false,
                        onChanged: (value) {
                          setState(() {

                          });
                        }),
                  ),
                  Text("Update Customer Address",style: textStyle.RegularBold.copyWith()),



                ]),

          ),



          Container(

            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    //margin: EdgeInsets.only(right: 30),
                    child: Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        side: BorderSide(
                          color: AppColor.ThemeColor,
                          width: 1.5,
                        ),
                        value: false,
                        onChanged: (value) {
                          setState(() {

                          });
                        }),
                  ),
                  Text("Add Notes",style: textStyle.RegularBold.copyWith()),

                ]),

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
                        color: AppColor.ThemeColor,
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),

                      child: Text(CommonText.saveText.toUpperCase(),textAlign: TextAlign.center, style: textStyle.RegularBold.copyWith(color: Colors.white,fontWeight: FontWeight.w700,),
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










          /* Container(
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
          )*/
        ],
      ),
    );
  }
  Widget ReceiptDetail1(){
    return Container(

      margin: EdgeInsets.only(top: 10),
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
                        child: Text(CommonText.loanNo,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        child: Text('DEMTRYAL 12',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                        child: Text(CommonText.vehicle,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        child: Text('0',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                        child: Text(CommonText.name,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        child: Text('Samrat Bakshi S/0 Mr Virat Singh',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                        child: Text(CommonText.emiText,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        child: Text('\u{20B9}'+'5,543',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                        child: Text(CommonText.overDue,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        child: Text('\u{20B9}'+'1,20,5,543',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                        child: Text(CommonText.nidText,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        child: Text('\u{20B9}'+'43.98',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                        child: Text(CommonText.asset,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        child: Text('New Hero Honda Galmour',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                        child: Text('MOBILE 1',style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                      ),
                    ),

                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            child: Text('95777778888',style: textStyle.Regular.copyWith(color: Colors.black),),
                          ),
                          InkWell(
                            child: Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Image.asset("assets/phone.png",color: AppColor.ThemeColor,height: 20,width: 20,),),
                          )
                        ],
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
                        child: Text('MOBILE 2',style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                      ),
                    ),

                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            child: Text('95777778888',style: textStyle.Regular.copyWith(color: Colors.black),),
                          ),
                          InkWell(
                            child: Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Image.asset("assets/phone.png",color: AppColor.ThemeColor,height: 20,width: 20,),),
                          )
                        ],
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
                        child: Text(CommonText.address,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        child: Text('Mandir Wali Gali Azad Nagar,Punjab',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                        child: Text(CommonText.lastReceipt,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        child: Text('Mandir Wali Gali Azad Nagar,Punjab',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                        child: Text(CommonText.lastDate,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        child: Text('02/10/2022',style: textStyle.Regular.copyWith(color: Colors.black),),
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

  }

  Widget ReceiptDetail2(){
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
                        child: Text(CommonText.account,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        child: Text(CommonText.balance,style: textStyle.Regular.copyWith(color: Colors.black),),
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
                        child: Text(CommonText.installmentDue,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        child: Text(CommonText.rupeeSign+'1,10,000',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                        child: Text(CommonText.overDue,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        child: Text(CommonText.rupeeSign+'1,54,000',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                        child: Text(CommonText.installmentDue,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        child: Text(CommonText.rupeeSign+'1,38,000',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                        child: Text(CommonText.overDue,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
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
                // width: 320,
                child: Divider(
                  thickness: 2.0,
                  color: AppColor.LighGreyColor,
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
                        child: Text(CommonText.totalBalance,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        child: Text(CommonText.rupeeSign+'93,00,000',style: textStyle.Regular.copyWith(color: AppColor.ThemeColor),),
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

  }
}
