import 'dart:convert';

import 'package:Loan360Cloud/authManager/authManager.dart';
import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:Loan360Cloud/model/branchByLogin.dart';
import 'package:Loan360Cloud/model/getCompanyByLogin.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  AuthenticationManager authenticationManager = Get.find();
  CompanyByLoginModel dropdownCompanyValue = new CompanyByLoginModel();
  String? data = '';
  String? nextData = '';
  //String? dropdownfinancialYearModel;

  BranchByLoginModel dropdownbranchByLoginModel = new BranchByLoginModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();



  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:  _key,
      drawer: Drawer(
        child: DrawerScreen(),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: appBar(appBarName:CommonText.jaguar.toString(),onPressed: (){
          if (_key.currentState != null) {
            if (_key.currentState!.isDrawerOpen) {
              _key.currentState!.closeDrawer();
            } else {
              _key.currentState!.openDrawer();
            }
          }
        }),
      ),
      body: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(CommonText.welcome+" "+authenticationManager!.getUserName().toString(),style: textStyle.Heading2,),
                ),
                Container(
                  width: double.infinity,
                    height: 300,
                  child: BarChartSample2()),

                Card(
                  child: Container(
                    margin: EdgeInsets.only(left: 10,right: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [

                            Container(
                              padding: EdgeInsets.only(left: 8,right: 8,top: 12,bottom: 12),
                                  color: AppColor.LightBlueColor,
                                  child: Text(CommonText.month,style: textStyle.Regular.copyWith(color: Colors.white)),

                            ),
                            Container(
                              padding: EdgeInsets.only(left: 8,right: 8,top: 12,bottom: 12),
                                  color: AppColor.ThemeColor,
                                  child: Text(CommonText.target,style: textStyle.Regular.copyWith(color: Colors.white)),

                            ),
                             Container(
                                    //padding: EdgeInsets.all(10),
                                 padding: EdgeInsets.only(left: 8,right: 8,top: 12,bottom: 12),
                                  color: AppColor.LightBlueColor,
                                  child:  Text(CommonText.archievement,style: textStyle.Regular.copyWith(color: Colors.white))
                                ),

                             Container(
                               padding: EdgeInsets.only(left: 8,right: 8,top: 12,bottom: 12),
                                  color: AppColor.ThemeColor,
                                  child: Text(CommonText.comments,style: textStyle.Regular.copyWith(color: Colors.white)),

                            ),

                          ],
                        ),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 9,
                            itemBuilder: (context,index){
                              return Container(
                                margin: EdgeInsets.only(left: 10,right: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(left: 8,right: 8,top: 12,bottom: 12),
                                        child: Text('Jan',style: textStyle.Regular.copyWith(color: Colors.black)),

                                      ),
                                    ),

                                    Expanded(
                                      child: Container(
                                       padding: EdgeInsets.only(left: 8,right: 8,top: 12,bottom: 12),
                                       child: Text('16',style: textStyle.Regular.copyWith(color: Colors.black)),
                                      ),
                                    ),
                                    
                                    Expanded(
                                      child: Container(
                                          padding: EdgeInsets.only(left: 8,right: 8,top: 12,bottom: 12),
                                          // color: AppColor.LightBlueColor,
                                          child:  Text('16',style: textStyle.Regular.copyWith(color: Colors.black))
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(

                                        padding: EdgeInsets.only(left: 8,right: 8,top: 12,bottom: 12),
                                        child: Text('Text Here',style: textStyle.Regular.copyWith(color: Colors.black)),

                                      ),
                                    ),

                                  ],
                                ),

                              );
                            }),
                        /*Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 8,right: 8,top: 12,bottom: 12),
                              child: Text('Jan',style: textStyle.Regular.copyWith(color: Colors.black)),

                            ),
                            Container(
                              padding: EdgeInsets.only(left: 8,right: 8,top: 12,bottom: 12),
                              child: Text('16',style: textStyle.Regular.copyWith(color: Colors.black)),

                            ),
                            Container(
                                padding: EdgeInsets.only(left: 8,right: 8,top: 12,bottom: 12),
                               // color: AppColor.LightBlueColor,
                                child:  Text('16',style: textStyle.Regular.copyWith(color: Colors.black))
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 8,right: 8,top: 12,bottom: 12),
                              child: Text('Text Here',style: textStyle.Regular.copyWith(color: Colors.black)),

                            ),

                          ],
                        ),

                        Row(
                          children: [


                            Container(
                              padding: EdgeInsets.only(left: 8,right: 8,top: 12,bottom: 12),

                              child: Text('Feb',style: textStyle.Regular.copyWith(color: Colors.black)),

                            ),
                            Container(
                              padding: EdgeInsets.only(left: 8,right: 8,top: 12,bottom: 12),

                              child: Text('16',style: textStyle.Regular.copyWith(color: Colors.black)),

                            ),
                            Container(
                                padding: EdgeInsets.only(left: 8,right: 8,top: 12,bottom: 12),

                                child:  Text('16',style: textStyle.Regular.copyWith(color: Colors.black))
                            ),

                            Container(
                              padding: EdgeInsets.only(left: 8,right: 8,top: 12,bottom: 12),

                              child: Text('Text Here',style: textStyle.Regular.copyWith(color: Colors.black)),

                            ),

                          ],
                        ),
                        Row(
                          children: [


                            Container(
                              padding: EdgeInsets.only(left: 8,right: 8,top: 12,bottom: 12),
                              child: Text('Mar',style: textStyle.Regular.copyWith(color: Colors.black)),

                            ),
                            Container(
                              padding: EdgeInsets.only(left: 8,right: 8,top: 12,bottom: 12),
                              child: Text('16',style: textStyle.Regular.copyWith(color: Colors.black)),

                            ),
                            Container(

                                padding: EdgeInsets.only(left: 8,right: 8,top: 12,bottom: 12),
                                // color: AppColor.LightBlueColor,
                                child:  Text('16',style: textStyle.Regular.copyWith(color: Colors.black))
                            ),

                            Container(
                              padding: EdgeInsets.only(left: 8,right: 8,top: 12,bottom: 12),

                              child: Text('Text Here',style: textStyle.Regular.copyWith(color: Colors.black)),

                            ),

                          ],
                        ),

                        Row(
                          children: [


                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 8,right: 8,top: 12,bottom: 12),
                                child: Text('Apr',style: textStyle.Regular.copyWith(color: Colors.black)),

                              ),
                            ),
                            Expanded(child: Container(
                              padding: EdgeInsets.only(left: 8,right: 8,top: 12,bottom: 12),

                              child: Text('16',style: textStyle.Regular.copyWith(color: Colors.black)),

                            ),),
                            
                            Expanded(
                              child: Container(
                                //padding: EdgeInsets.all(10),
                                  padding: EdgeInsets.only(left: 8,right: 8,top: 12,bottom: 12),

                                  child:  Text('16',style: textStyle.Regular.copyWith(color: Colors.black))
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.only(left: 8,right: 8,top: 12,bottom: 12),
                              
                              child: Text('Text Here',style: textStyle.Regular.copyWith(color: Colors.black)),

                            ),

                          ],
                        )*/


                      ],
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BarChartSample2 extends StatefulWidget {
  const BarChartSample2({super.key});

  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  final Color leftBarColor = AppColor.ThemeColor;
  final double width = 10;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 30, 0);
    final barGroup2 = makeGroupData(1, 50, 0);
    final barGroup3 = makeGroupData(2, 40, 0);
    final barGroup4 = makeGroupData(3, 30, 0);
    final barGroup5 = makeGroupData(4, 50, 0);
    final barGroup6 = makeGroupData(5, 40, 0);
    final barGroup7 = makeGroupData(6, 30, 0);
    final barGroup8 = makeGroupData(7, 50, 0);
    final barGroup9 = makeGroupData(8, 40, 0);
    final barGroup10 = makeGroupData(9, 10, 0);
    final barGroup11 = makeGroupData(10, 20, 0);
    final barGroup12 = makeGroupData(11, 30, 0);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
      barGroup8,
      barGroup9,
      barGroup10,
      barGroup11,
      barGroup12
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(

       margin: EdgeInsets.all(10),
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          //color: const Color(0xff2c4260),
          child: Container(
            padding: EdgeInsets.only(top: 20),
            child: Column(
             // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: BarChart(
                    BarChartData(
                      maxY:50,
                      barTouchData: BarTouchData(
                        touchTooltipData: BarTouchTooltipData(
                          tooltipBgColor: Colors.grey,
                          getTooltipItem: (a, b, c, d) => null,
                        ),
                        touchCallback: (FlTouchEvent event, response) {
                          /*if (response == null || response.spot == null) {
                            setState(() {
                              touchedGroupIndex = -1;
                              showingBarGroups = List.of(rawBarGroups);
                            });
                            return;
                          }

                          touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                          setState(() {
                            if (!event.isInterestedForInteractions) {
                              touchedGroupIndex = -1;
                              showingBarGroups = List.of(rawBarGroups);
                              return;
                            }
                            showingBarGroups = List.of(rawBarGroups);
                            if (touchedGroupIndex != -1) {
                              var sum = 0.0;
                              for (final rod
                              in showingBarGroups[touchedGroupIndex]
                                  .barRods) {
                                sum += rod.toY;
                              }
                              final avg = sum /
                                  showingBarGroups[touchedGroupIndex]
                                      .barRods
                                      .length;

                              showingBarGroups[touchedGroupIndex] =
                                  showingBarGroups[touchedGroupIndex].copyWith(
                                    barRods: showingBarGroups[touchedGroupIndex]
                                        .barRods
                                        .map((rod) {
                                      return rod.copyWith(toY: avg);
                                    }).toList(),
                                  );
                            }
                          });*/
                        },
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: bottomTitles,
                            reservedSize: 10,
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                          reservedSize: 20,
                            interval: 1,
                            getTitlesWidget: leftTitles,
                          ),
                        ),
                      ),

                      borderData: FlBorderData(
                        show: false,
                      ),
                      barGroups: showingBarGroups,
                      gridData: FlGridData(show: false),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    String text;
    if (value == 0) {
      text = '0';
    } else if (value == 10) {
      text = '10';
    } else if (value == 20) {
      text = '20';
    } else if(value == 30){
      text = '30';
    } else if(value == 40){
      text = '40';
    } else if(value == 50){
      text = '50';
    }

    else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Container(
         // margin:EdgeInsets.only(top: 30,bottom: 30),
          child: Text(text, style: style)
      )
        //margin: EdgeInsets.all(10),
         // margin:EdgeInsets.only(top: 10) ,
          //child: Text(text, style: style)),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul','Aug','Sep','Oct','Nov','Dec'];

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 10,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 10,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: leftBarColor,
          width: width,
        ),

      ],
    );
  }

  Widget makeTransactionsIcon() {
    const width = 4.5;
    const space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: Colors.white.withOpacity(1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
      ],
    );
  }
}
