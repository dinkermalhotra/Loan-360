import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:Loan360Cloud/ui/dueListAssets.dart';
import 'package:Loan360Cloud/ui/dueListCustomer.dart';
import 'package:Loan360Cloud/ui/dueListLoan.dart';
import 'package:Loan360Cloud/ui/receiptLoadDetail.dart';
import 'package:Loan360Cloud/ui/updateAddress.dart';
import 'package:flutter/material.dart';
import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:get/get.dart';

class DueList extends StatefulWidget {
  const DueList({Key? key}) : super(key: key);

  @override
  State<DueList> createState() => _DueListState();
}

class _DueListState extends State<DueList> with SingleTickerProviderStateMixin{
  GlobalKey<ScaffoldState> dueListKey = GlobalKey();
   bool? val = false;
  bool? val2 = false;
  bool? val3 = false;
  TabController? _tabController;
  static List<Address>? _dropdownAddress = [];

  final formKey = new GlobalKey<FormState>();

  // var controller = new MaskedTextController(mask: '(000) 000 0000');

  Address? _dropdownAddressValue;
  String?  _errorText;
  bool isMan = false;
  bool isWoman = false;
  final _address = TextEditingController();

  // TextEditingController phoneController = new TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _dropdownAddress!.add(Address(addressCode: 'Select'));
    _dropdownAddressValue = _dropdownAddress![0];
    _tabController = TabController(
      length: 3,
      initialIndex: 0,
      vsync: this,
    );

    //_dropdownValue = _dropdownItems![0];
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:  dueListKey,
      drawer: Drawer(
        child: DrawerScreen(),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: appBar(appBarName:CommonText.dueList.toString(),onPressed: (){
          if (dueListKey.currentState != null) {
            if (dueListKey.currentState!.isDrawerOpen) {
              dueListKey.currentState!.closeDrawer();
            } else {
              dueListKey.currentState!.openDrawer();
            }
          }
        }),
      ),
      body: DefaultTabController(
        length: _tabController!.length,
        child:  Scaffold(
          body: Container(
            //color: Colors.grey,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: AppColor.ThemeColor.withOpacity(0.2),
                        blurRadius: 1,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                  child: Card(
                    elevation: 10,
                    child: Container(
                      // padding: EdgeInsets.all(10),
                      child:  SizedBox(
                        child: TabBar(
                            labelColor: AppColor.ThemeColor,
                            unselectedLabelColor:Colors.black,
                            controller: _tabController,
                            indicatorColor: AppColor.ThemeColor,
                            tabs: [

                              Container(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Text(CommonText.customer,style: TextStyle(fontSize: 10,),),
                              ),
                              Container(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Text(CommonText.loan,style: TextStyle(fontSize: 10,),)
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Text(CommonText.asset,style: TextStyle(fontSize: 10,),),
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
                        /// Due List Customer Widget
                        DueListCustomer(),
                        /*Center(
                          child: Container(
                              child: Text('Loan',style: textStyle.Heading3.copyWith())
                          ),
                        ),*/
                        /// Due List Loan Widget
                        DueListLoan(),

                        /// Assets Widget
                        DueListAssets(),
                        /*Center(
                          child: Container(
                              child: Text('Asset',style: textStyle.Heading3.copyWith())
                          ),
                        ),*/
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







