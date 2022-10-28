import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:flutter/material.dart';
import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:get/get.dart';


class StatementAccountSearch extends StatefulWidget {
  const StatementAccountSearch({Key? key}) : super(key: key);

  @override
  State<StatementAccountSearch> createState() => _StatementAccountSearchState();
}

class _StatementAccountSearchState extends State<StatementAccountSearch> with SingleTickerProviderStateMixin{
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(
      length: 4,
      initialIndex: 2,
      vsync: this,
    );
  }

  var tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Container(
              child: IconButton(
                onPressed: (){
                  Navigator.of(context).pop();
                  //Get.back();
                },
                icon: Image.asset("assets/back.png",height: 30,width: 30,),
              ),
            ),
            Container(
              alignment:Alignment.topLeft,
              child: Text(CommonText.appStatementSearch,textAlign: TextAlign.left,style: textStyle.Heading2.copyWith(),),
            ),

          ],
        ),
      ),
      body: DefaultTabController(
        length: _tabController!.length,
        child:  Scaffold(
          body: Container(
              //color: Colors.grey,
              child: Column(
                children: [
                   Container(
                     margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                     child: Card(
                       elevation: 10,
                       child: Container(
                         height: 50,
                         width: 400,
                         // padding: EdgeInsets.all(10),
                         child:  SizedBox(
                           height: 50,
                           child: TabBar(
                               labelColor: AppColor.ThemeColor,
                               unselectedLabelColor:Colors.black,
                               controller: _tabController,
                               indicatorColor: AppColor.ThemeColor,
                                tabs: [

                                Container(
                                  child: Text("Customer",style: TextStyle(fontSize: 10,),),
                                 ),
                                 Container(
                                   child: Text("KYC",style: TextStyle(fontSize: 10,),),
                                 ),
                                    Container(
                                      child: Text("Loan",style: TextStyle(fontSize: 10,),)
                                    ),
                                    Container(

                                      child: Text("Assets",style: TextStyle(fontSize: 10,),),
                                    )

                                    ]),
                         ),
                       ),
                     ),
                   ),


                  Expanded(

                    child: TabBarView(
                      controller: _tabController,

                        children: [
                          Center(
                            child: Container(
                                child: Text('Customer')
                            ),
                          ),

                          Center(
                            child: Container(
                                child: Text('KYC')
                            ),
                          ),
                         Container(
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
                                 margin: EdgeInsets.only(top: 30,left: 15,right: 15),
                                 child:  InkWell(
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

                                     child: Text(CommonText.searchText,textAlign: TextAlign.center, style: textStyle.RegularBold.copyWith(color: Colors.white,fontWeight: FontWeight.w700,),
                                     ),
                                   ),
                                 ),

                               ),

                               Container(
                                 //  height: 330,
                                   margin: EdgeInsets.all(10),

                                   width: double.infinity,
                                   child: Card(
                                     elevation: 20,
                                     child: Flexible(
                                       child: Container(
                                         padding: EdgeInsets.all(20),
                                         child: Column(
                                           children: [
                                             Container(
                                               // margin: const EdgeInsets.only(left: 20,right: 10,top: 20),
                                               alignment: Alignment.topLeft,
                                               child: Text('DEMTRYAL 12626',style: textStyle.Regular.copyWith(color: AppColor.ThemeColor),),
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
                                                       child: Text('Samrat Bakshi S/0 Mr Virat Singh',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                                                       child: Text(CommonText.asset,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                                     ),
                                                   ),
                                                   Expanded(
                                                     child: Container(
                                                       child: Text('Royal Enfield Classic Base',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                                                       child: Text(CommonText.mobile,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                                     ),
                                                   ),

                                                   Expanded(
                                                     child: Container(
                                                       child: Text('768 787 878 7 ',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                                                       child: Text(CommonText.appDate,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                                     ),
                                                   ),
                                                   Expanded(
                                                     child:  Container(
                                                       child: Text('02-Jan-2022 ',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                                                       child: Text(CommonText.loanAmount,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                                     ),
                                                   ),

                                                   Expanded(
                                                     child: Container(
                                                       child: Text('\u{20B9}'+'1,20,000',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                                                       child: Text(CommonText.loanType,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                                                     ),
                                                   ),

                                                   Expanded(
                                                     child: Container(
                                                       child: Text('AL',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                                               margin: EdgeInsets.only(top:10),
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
                                                             child: Text(CommonText.select,style: textStyle.Regular.copyWith(color: Colors.green),),


                                                           )
                                                         ],

                                                       )
                                                   ),
                                                   Expanded(
                                                       child: Row(
                                                         mainAxisAlignment: MainAxisAlignment.center,
                                                         children: [
                                                           Container(
                                                             child: Image.asset("assets/customer.png",height: 20,width: 20,),
                                                           ),
                                                           Container(
                                                             child: Text(CommonText.customer,style: textStyle.Regular.copyWith(color:  Colors.red),),


                                                           )
                                                         ],

                                                       )
                                                   ),
                                                   Expanded(
                                                       child: Row(
                                                         mainAxisAlignment: MainAxisAlignment.center,
                                                         children: [
                                                           Container(
                                                             child: Image.asset("assets/asset.png",height: 20,width: 20,),
                                                           ),
                                                           Container(
                                                             child: Text(CommonText.asset,style: textStyle.Regular.copyWith(color: Colors.red),),


                                                           )
                                                         ],

                                                       )
                                                   ),
                                                 ],
                                               ),
                                             )

                                           ],
                                         ),
                                       ),
                                     ),

                                   ),
                                 ),
                               
                             ],
                           ),
                         ),
                          Center(
                            child: Container(
                                child: Text('Asset')
                            ),
                          ),
                          /*ListView.builder(
                              itemCount: 5,
                              itemBuilder: (context,index){
                                return Container(
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("i am $index"),
                                    ),
                                  ),
                                );
                              })*/
                        ]),
                  ),
                ],
              ),
            ),
          ),

      ),
    );
  }
}
