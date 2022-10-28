
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:flutter/material.dart';

class LeadManagement extends StatefulWidget {
  const LeadManagement({Key? key}) : super(key: key);

  @override
  State<LeadManagement> createState() => _LeadManagementState();
}

class _LeadManagementState extends State<LeadManagement> {

  static final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:  _key,
      drawer: Drawer(
        child: DrawerScreen(),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: appBar(appBarName:CommonText.leadManagement.toString(),onPressed: (){
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

      ),
    );
  }
}
