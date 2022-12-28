
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

  GlobalKey<ScaffoldState> leadManagementKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:  leadManagementKey,
      drawer: Drawer(
        child: DrawerScreen(),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: appBar(appBarName:CommonText.leadManagement.toString(),onPressed: (){
          if (leadManagementKey.currentState != null) {
            if (leadManagementKey.currentState!.isDrawerOpen) {
              leadManagementKey.currentState!.closeDrawer();
            } else {
              leadManagementKey.currentState!.openDrawer();
            }
          }
        }),
      ),

      body: Container(

      ),
    );
  }
}
