
import 'dart:convert';
import 'dart:math';
import 'package:Loan360Cloud/authManager/authManager.dart';
import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:Loan360Cloud/controller/receiptDetailController.dart';
import 'package:Loan360Cloud/model/receiptSaveModel.dart';
import 'package:Loan360Cloud/model/statementModel.dart';
import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter/material.dart';
import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'statementOfAccountSearch.dart';
import 'dart:async';



String? Assets='';
String? LoanAmount ='',LoanId = '';
bool? receiptTitle = false;

var decodeMap;

class ReceiptLoanDetail extends StatefulWidget {
  ReceiptLoanDetail({var decode,loadData? data,bool receiptTitleData = false,String? assets='',String? loanAmount='',String loanId=''}){
    decodeMap = decode;
    Assets = assets;
    receiptTitle = receiptTitleData;
    LoanAmount = loanAmount;
    LoanId = loanId;
  }

  @override
  State<ReceiptLoanDetail> createState() => _ReceiptLoanDetailState();
}

class _ReceiptLoanDetailState extends State<ReceiptLoanDetail> {
  final _receiptMode = TextEditingController();
  final _bankMode = TextEditingController();
  late bool updateCustomerValue = false;
  late bool updateCustomerAddress = false;
  late bool addNote = false;
  bool checkIcons = false;
  bool valueVisible = false;
  bool printTextVisible = false;
  int i =0;
  BluetoothDevice? device;
  ReceiptSaveModel receiptModelData = new ReceiptSaveModel();
  final amount = new TextEditingController();
  TextEditingController search = new TextEditingController();
  TextEditingController check = new TextEditingController();
  TextEditingController checkDate = new TextEditingController();

  Receipt_DetailController receipt_detailController = Get.put(Receipt_DetailController());
  bool addAcccount = false;
  var  _selectedRadioIndex ;
  var  _bluetoothRadioIndex ;
  var bluetoothDevice;
  final textFieldCode = TextEditingController();
  var codeData;
  final textFieldNarration = TextEditingController();
  final creditAmount = TextEditingController();
  String narration = "";
  int id = 1;
  int? _groupValue = 1;
  int? bankGroupValue = 1;
  bool chequeBoolValue = false;
  GlobalKey<ScaffoldState> _receiptKey = GlobalKey();
  String? receiptMode="";
  String? latitude ="";
  String? longitude ="";
  double? currentLat = 0.0;
  double? currentLong = 0.0;
  String user ="";
  String branchCode = "";
  String companyCode = "";
  var space;
  var bankId;
  var printData;
  //double totalAmount= 0;
  AuthenticationManager authManager = Get.find();
  final _focusNode = FocusNode();
  final amountFocusNode  = FocusNode();
  var amountDataField;
  double balance = 0.0;
  List<balanceJson> list =[];
  BluetoothPrint bluetoothPrint = BluetoothPrint.instance;
  bool _connected = false;
  BluetoothDevice? _device;
  String tips = 'no device connect';
 // List<ScanResult>? scanResult;
 // FlutterBlue flutterBlue = FlutterBlue.instance;


  @override
  void initState() {
    super.initState();
  //  findDevices();
    //getCurrentLocation();
    WidgetsBinding.instance.addPostFrameCallback((_) => initBluetooth());
    if(LoanId!=''){
      print("decoded");
      print(decodeMap['loanAmount']!=null?decodeMap['loanAmount'].toString():"");
      Future.delayed(Duration(milliseconds: 10), () {
        receipt_detailController.receivedAmountResponse(loanID: LoanId);
      });

    }

  }




  Future<void> initBluetooth() async {
    bluetoothPrint.startScan(timeout: Duration(seconds: 4));

/*    bool isConnected=await bluetoothPrint.isConnected??false;

    bluetoothPrint.state.listen((state) {
      switch (state) {
        case BluetoothPrint.CONNECTED:
          setState(() {
            _connected = true;
            tips = 'connect success';
          });
          break;
        case BluetoothPrint.DISCONNECTED:
          setState(() {
            _connected = false;
            tips = 'disconnect success';
          });
          break;
        default:
          break;
      }
    });

    if (!mounted) return;

    if(isConnected) {
      setState(() {
        _connected=true;
      });
    }*/
  }



/*  void findDevices() {
    flutterBlue.startScan(timeout: const Duration(seconds: 10));
    flutterBlue.scanResults.listen((results) {
      setState(() {
        print("find device");
        print(results);
        scanResult = results;
      });
    });
    flutterBlue.stopScan();
  }*/

  @override
  void dispose() {
    _focusNode.dispose();
    amountFocusNode.dispose();
    super.dispose();
  }


  Future<void> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy:LocationAccuracy.high);
    setState(() {
      currentLat = position.latitude;
      currentLong = position.longitude;
      user = authManager.getUserName().toString();
      branchCode = authManager.getBranchByLoginData().toString();
      companyCode = authManager.getCompanyByLoginData().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _receiptKey,
      drawer: Drawer(
        child: DrawerScreen(),
      ),

      appBar: AppBar(
        automaticallyImplyLeading:false,
        title: appBar(appBarName:CommonText.receiptForm.toString(),onPressed: (){
          if (_receiptKey.currentState != null) {
            if (_receiptKey.currentState!.isDrawerOpen) {
              _receiptKey.currentState!.closeDrawer();
            } else {
              Get.delete<Receipt_DetailController>();
              _receiptKey.currentState!.openDrawer();
            }
          }
        }),
        actions: [
          printTextVisible?
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return  StatefulBuilder(
                          builder: (context, StateSetter newsetState) {
                            return  AlertDialog(
                              title: Text('BlueTooth Device',style: textStyle.Heading2.copyWith(color: Colors.black,fontWeight: FontWeight.w700,),),
                              content: Container(
                                width: double.maxFinite,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      StreamBuilder<List<BluetoothDevice>>(
                                        stream: bluetoothPrint.scanResults,
                                        initialData: [],
                                        builder: (c, snapshot) => Column(
                                          children: snapshot.data!.map((d) => ListTile(
                                            title: Text(d.name??''),
                                            onTap: ()  {
                                              connectBluetooth();
                                              newsetState((){
                                                setState(() {
                                                  _device = d;
                                                });
                                              });


                                            },
                                            trailing: _device!=null && _device!.address == d.address?Icon(
                                              Icons.check,
                                              color: Colors.green,
                                            ):null,
                                          )).toList(),
                                        ),
                                      ),

                                    /*  ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {

                                          return scanResult!.elementAt(index).device.name!=""?
                                          RadioListTile(
                                            value: index,
                                            groupValue: _bluetoothRadioIndex,
                                            onChanged: (ind){
                                              newsetState((){
                                                setState(() {
                                                  findDevices();
                                                  _bluetoothRadioIndex = ind;
                                                  bluetoothDevice= scanResult!.elementAt(index).device;
                                                });
                                              });
                                            },
                                            title: Text(scanResult!.elementAt(index).device.name,
                                                style: textStyle.Regular.copyWith(color: Colors.black,fontWeight: FontWeight.w600,)),
                                          )
                                              :SizedBox();
                                        },
                                        itemCount:  scanResult!.length,
                                      ),*/
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            ElevatedButton(
                                              child: Text('Cancel'),
                                              onPressed: () {
                                                Get.back();
                                                // disConnect();
                                              },
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            ElevatedButton(
                                              child: Text('Ok'),
                                                onPressed:  _device==null ?null:() async {
                                                if(_device!=null && _device!.address !=null){
                                                setState(() {
                                                tips = 'connecting...';
                                                });
                                               // await bluetoothPrint.connect(_device!);
                                                }else{
                                                setState(() {
                                                tips = 'please select device';
                                                });

                                                }

                                                if(_device!=null && _device!.address !=null){
                                                  for(int i=0;i<receipt_detailController.listData.length;i++){
                                                    list.add(balanceJson(accountCode: receipt_detailController.listData.elementAt(i).acCodeName.toString(),balance:receipt_detailController.listData.elementAt(i).rupees.toString()));
                                                  }
                                                 String jsonData = json.encode(list.toList());
                                                  String remainingJsonData  = json.encode(receipt_detailController.remainingBalance.toList());
                                                  var jsonString = '{"branchCode": "$branchCode", "companyCode": "$companyCode","user":"$user","receiptMode": "$receiptMode","lat":"$currentLat","long":"$currentLong","narration": "${textFieldNarration.text}","balanceTotal":"${receipt_detailController.totalAccountBalance}","receiveAmount":"${receipt_detailController.totalAmount}","chqno":"${check.text}","chqDate":"${checkDate.text}","bankId":"$bankId","installment":"${receipt_detailController.installmentData}","balanceLeft":"${receipt_detailController.totalOsBalance}"}';
                                                  final decodedData = json.decode(jsonString);
                                                  bluetoothPrinter(loanMap: decodeMap,userData: decodedData,balancejsonData: jsonData,AppUserName: authManager.getUserName(),RNo: receipt_detailController.receiptMaxResponse.code.toString(),device: bluetoothDevice,remainingJson:remainingJsonData);

                                                 // printwithBluetoothPrinter(loanMap: decodeMap,userData: decodedData,balancejsonData: jsonData,AppUserName: authManager.getUserName(),RNo: receipt_detailController.receiptMaxResponse.code.toString(),device: bluetoothDevice,remainingJson:remainingJsonData);

                                                  Get.back();
                                                  Get.snackbar('',"Data Successfully Printed",
                                                      snackPosition: SnackPosition.BOTTOM,backgroundColor:
                                                      Colors.blue);


                                                }else{
                                                  Get.snackbar('',
                                                      "Please select bluetooth device",
                                                      snackPosition: SnackPosition.BOTTOM,backgroundColor:
                                                      Colors.blue);
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                      );
                });

            },
            child: Container(
                margin: EdgeInsets.only(right: 10),
                child: Center(child: Text("Print",style:  textStyle.RegularBold.copyWith(color: Colors.white),))),
          ) :SizedBox()
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 15,right: 15,top:30,),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5),
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
                              readOnly: true,
                              decoration: InputDecoration(
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
                        Get.to(()=> StatementAccountSearch(callback: 'receiptLoadDetail',));
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
                  visible:LoanId!= '' && LoanId!=''?true:false,
                  child: receipt_detailController.ListReceivedAmount!=null?
                  receiptDetail()
                      : Container()
              ),

              Visibility(
                  visible:LoanId!=null &&LoanId!=''?true:false,
                  child: receipt_detailController.ListReceivedAmount!= null
                      ? receiveAmount()
                      : Container()

              ),


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
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.5, color: AppColor.GreyColor),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: TextField(
                                autofocus: false,
                                focusNode: amountFocusNode,
                                keyboardType: TextInputType.numberWithOptions(decimal: true),
                                controller: amount,
                                onChanged: (value) {
                                  if(decodeMap!=null){

                                    if(value.isNotEmpty){
                                      if(double.parse(value) <= receipt_detailController.totalAccountBalance.toDouble()){
                                        receipt_detailController.listData.clear();
                                        receipt_detailController.totalAmount = 0;
                                        valueVisible= false;
                                        setState(() {
                                          checkIcons = true;
                                        });
                                      }else{
                                        setState(() {
                                          checkIcons = false;
                                        });
                                      }
                                    }else{
                                      setState(() {
                                        checkIcons = false;
                                        amount.clear();
                                        receipt_detailController.totalAmount = 0;
                                        valueVisible= false;
                                        receipt_detailController.listData.clear();
                                      });

                                    }
                                  }
                                },
                                textAlign: TextAlign.left,
                                decoration:const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter Amount',
                                    hintStyle: TextStyle(color: Colors.black),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder:InputBorder.none
                                ),
                              ),
                            ),
                          ),

                          Visibility(
                            visible:checkIcons,
                            child: ElevatedButton(
                              child: Icon(Icons.check),
                              onPressed: () {

                                FocusScope.of(context).unfocus();
                                if(double.parse(amount.text.toString()) > 0){
                                  receipt_detailController.totalAmount = 0.0;
                                  receipt_detailController.addReceiveAmount(Code: "OVERDUE",amount: amount.text.toString());

                                  setState(() {
                                    checkIcons = false;
                                    valueVisible = true;
                                    amount.clear();
                                  });
                                } else{
                                  setState(() {
                                    checkIcons = false;
                                    valueVisible = false;

                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),




              Visibility(
                visible: valueVisible,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: receipt_detailController.listData.length,
                  itemBuilder: (context,i){
                    return Container(
                      child: Card(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Container(
                                      width: 100,
                                      child: Text("A/c Codes:",style: textStyle.Regular.copyWith(),),
                                    ),
                                    Container(
                                      width: 150,
                                      margin: EdgeInsets.only(left: 50),
                                      child: Text(receipt_detailController.listData.elementAt(i).acCodeName.toString(),style: textStyle.Regular.copyWith(),),

                                    ),
                                  ],
                                ),
                              ),


                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(top: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Container(
                                      width: 100,
                                      child: Text("Credit:",style: textStyle.Regular.copyWith(),),
                                    ),


                                    Container(
                                      width: 230,
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 50),
                                            child: Text("\u{20B9}"+receipt_detailController.listData.elementAt(i).rupees.toString(),style: textStyle.Regular.copyWith()),
                                          ),
                                          i>0 ?
                                          Visibility(
                                            visible: receipt_detailController.listData.elementAt(i).isVisible!,
                                            child: Expanded(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  InkWell(
                                                    onTap: (){
                                                      setState((){
                                                        removeAmount(receipt_detailController.listData.elementAt(i).rupees.toString());
                                                        receipt_detailController.listData.removeAt(i);
                                                      });
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.only(right: 10),
                                                      color:Colors.red,
                                                      height:30,
                                                      width: 30,
                                                      child: Icon(Icons.close,color: Colors.white,),
                                                    ),
                                                  ),

                                                  InkWell(
                                                    onTap: (){

                                                    },
                                                    child: Container(
                                                      color:Colors.blue,
                                                      height:30,
                                                      width: 30,
                                                      child: Icon(Icons.edit,color: Colors.white,),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                              :SizedBox()
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),




              InkWell(
                onTap: (){
                  if(receipt_detailController.totalAmount==0){
                    Get.snackbar('',
                        'Please add amount',
                        snackPosition: SnackPosition.BOTTOM,backgroundColor:
                        Colors.blue);
                  }else{
                    if(receipt_detailController.totalAmount == receipt_detailController.totalAccountBalance){

                    }else{
                      setState(() {
                        addAcccount = !addAcccount;
                      });
                    }

                  }
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
                child: Container(
                  margin: EdgeInsets.only(left: 10,right: 10,top:20,),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 1.5, color: AppColor.GreyColor),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                child: Text(CommonText.Codes,style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor,fontWeight: FontWeight.w700,),)
                            ),
                            InkWell(
                              onTap: (){
                                print("length");
                                print(receipt_detailController.accountCodeListData.length);
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return  StatefulBuilder(
                                          builder: (context, StateSetter newsetState) {
                                            return  AlertDialog(
                                              title: Text('A/c Codes',style: textStyle.Heading2.copyWith(color: Colors.black,fontWeight: FontWeight.w700,),),
                                              content: Container(
                                                width: double.maxFinite,
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      ListView.builder(
                                                        padding: EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        physics: NeverScrollableScrollPhysics(),
                                                        itemBuilder: (context, index) {

                                                          return RadioListTile(
                                                            value: index,
                                                            groupValue: _selectedRadioIndex,
                                                            onChanged: (ind){
                                                              newsetState((){
                                                                setState(() {
                                                                  _selectedRadioIndex = ind;
                                                                  textFieldCode.text = receipt_detailController.accountCodeListData.elementAt(index).code.toString();
                                                                  codeData =  receipt_detailController.accountCodeListData.elementAt(index).code.toString();
                                                                });
                                                              });

                                                            },
                                                            title: Text(receipt_detailController.accountCodeListData.elementAt(index).code.toString(),
                                                                style: textStyle.Regular.copyWith(color: Colors.black,fontWeight: FontWeight.w600,)),
                                                          );
                                                        },
                                                        itemCount:  receipt_detailController.accountCodeListData.length,
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(top: 10),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                          children: [
                                                            ElevatedButton(
                                                              child: Text('Cancel'),
                                                              onPressed: () {
                                                                Get.back();
                                                              },
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),

                                                            ElevatedButton(
                                                              child: Text('Ok'),
                                                              onPressed: () {
                                                                Get.back();
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                      );
                                    });
                              },
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 200,
                                      child:  TextField(
                                        readOnly: true,
                                        controller:textFieldCode,
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: '--Select--',
                                            hintStyle: TextStyle(color: Colors.black),
                                            enabledBorder:InputBorder.none,
                                            focusedBorder: InputBorder.none
                                        ),
                                      ),
                                    ),

                                    Container(
                                      child: Icon(Icons.arrow_drop_down_sharp,color:AppColor.GreyColor,),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top:20,),
                        height: 70,
                        child:Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(CommonText.credit,style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),
                            ),


                            Container(
                              child: TextField(
                                focusNode: _focusNode,
                                textAlign: TextAlign.left,
                                controller: creditAmount,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter Credit Amount',
                                  hintStyle: TextStyle(color: Colors.black),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)
                                  ),
                                ),
                              ),
                            )
                          ],
                        ) ,
                      ),

                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: (){
                                var total = receipt_detailController.totalAmount;
                                setState(() {
                                  addAcccount = false;
                                  _selectedRadioIndex = -1;
                                  if(int.parse(creditAmount.text) <= receipt_detailController.totalAccountBalance.toInt()){
                                    receipt_detailController.addCreditAmount(Code:codeData,amount: creditAmount.text.toString(),);
                                    if(double.parse(receipt_detailController.totalAmount.toString()) <= receipt_detailController.totalAccountBalance.toDouble()){
                                      textFieldCode.clear();
                                      creditAmount.clear();
                                    }else{
                                      receipt_detailController.totalAmount=0;
                                      receipt_detailController.totalAmount = total;
                                    }
                                  }
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                height: 50,
                                width: 50,
                                color: Colors.blue,
                                child: Icon(Icons.add,color: Colors.white,),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              addOtherAccount(),
            ],
          ),
        ),
      ),
    );
  }



  Widget addOtherAccount(){
    return Container(
      margin: EdgeInsets.only(left: 10,right: 10,top: 20),
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
                  child:  TextField(
                    controller: textFieldNarration,
                    textAlign: TextAlign.left,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Narration',
                      hintStyle: TextStyle(color: Colors.black),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)
                      ),
                    ),
                  ),
                )
              ],
            ) ,
          ),


          Visibility(
            visible: valueVisible,
            child: Container(
              margin: EdgeInsets.only(top: 20,bottom: 20),
              child: Text("Total"+"  :  "+"\u{20B9}"+receipt_detailController.totalAmount.toString(),style: textStyle.Heading2.copyWith(color: Colors.black,fontWeight: FontWeight.w700,),),
            ),
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

                InkWell(
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (context){
                          return StatefulBuilder(
                              builder: (context, StateSetter newSetState) {
                                return  Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(20.0)),
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10,bottom: 10),
                                    child: Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.center,
                                            child: Text('Receipt Mode *', style:textStyle.Heading2.copyWith(color: Colors.black,fontWeight: FontWeight.w600,),
                                            ),
                                          ),

                                          Container(
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  child: RadioListTile(
                                                    value: 1,
                                                    groupValue:_groupValue,
                                                    title: Text("--Select--",style: textStyle.Regular.copyWith(color: Colors.black,fontWeight: FontWeight.w600,)),
                                                    onChanged: (newValue) {
                                                      newSetState((){
                                                        setState((){
                                                          receiptMode="";
                                                          chequeBoolValue = false;
                                                          _receiptMode.text = "--Select--";
                                                          _groupValue = newValue;

                                                        });
                                                      });

                                                    },
                                                    activeColor: AppColor.ThemeColor,
                                                    // selected: false,
                                                  ),
                                                ),

                                                Container(
                                                  child: RadioListTile(
                                                    value: 2,
                                                    groupValue: _groupValue,
                                                    title: Text("Cash",style: textStyle.Regular.copyWith(color: Colors.black,fontWeight: FontWeight.w600,)),
                                                    onChanged: (newValue){
                                                      newSetState((){
                                                        setState((){
                                                          chequeBoolValue = false;
                                                          print("chequeBoolValue");
                                                          print(chequeBoolValue);
                                                          _receiptMode.text = "Cash";
                                                          receiptMode = "A";
                                                          _groupValue = newValue;
                                                        });
                                                      });
                                                    },
                                                    activeColor: AppColor.ThemeColor,
                                                  ),
                                                ),
                                                Container(
                                                  child: RadioListTile(
                                                    value: 3,
                                                    groupValue: _groupValue,
                                                    title: Text("Cheque",style: textStyle.Regular.copyWith(color: Colors.black,fontWeight: FontWeight.w600,)),
                                                    onChanged: (newValue) {
                                                      newSetState((){
                                                        setState((){
                                                          chequeBoolValue = true;
                                                          print("chequeBoolValue");
                                                          print(chequeBoolValue);
                                                          _receiptMode.text = "Cheque";
                                                          receiptMode = "C";
                                                          _groupValue = newValue;
                                                        });
                                                      });
                                                    },
                                                    activeColor: AppColor.ThemeColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),


                                          Container(
                                            margin: EdgeInsets.only(top: 10,right: 20),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                ElevatedButton(
                                                  child: Text('Cancel'),
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                ),

                                                SizedBox(
                                                  width: 20,
                                                ),


                                                ElevatedButton(
                                                  child: Text('Ok'),
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
                          );
                        }
                    );
                  },
                  child: Container(
                    decoration:BoxDecoration(
                      border:Border(
                        bottom:  BorderSide(
                            color: AppColor.GreyColor,
                            width: 1.0
                        ),
                      ),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 200,
                          child:  TextField(
                            readOnly: true,
                            controller: _receiptMode,
                            textAlign: TextAlign.left,
                            decoration: const InputDecoration(
                                hintText: "Select",
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.black),
                                enabledBorder:InputBorder.none,
                                focusedBorder:InputBorder.none
                            ),
                          ),
                        ),
                        Container(
                          child: Icon(Icons.arrow_drop_down_outlined),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ) ,
          ),

          Visibility(
            visible: chequeBoolValue,
            child: Column(
              children: [
                Container(
                  child: TextField(
                    controller: check,
                    textAlign: TextAlign.left,
                    decoration:const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Chq#',
                      hintText: 'Cheque#',
                      hintStyle: TextStyle(color: Colors.black),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)
                        //  borderSide: BorderSide(color: AppColor.LighGreyColor),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: TextField(
                    controller: checkDate,
                    textAlign: TextAlign.left,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Chq.Date',
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
                Container(
                  height: 70,
                  margin: EdgeInsets.only(top: 10),
                  child:Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(CommonText.bank,style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),
                          ),

                        ],
                      ),

                      InkWell(
                        onTap: (){
                          showDialog(
                              context: context,
                              builder: (context) {
                                return  StatefulBuilder(
                                    builder: (context, StateSetter newsetState) {
                                      return  AlertDialog(
                                        title: Text('Bank',style: textStyle.Heading2.copyWith(color: Colors.black,fontWeight: FontWeight.w700,),),
                                        content: Container(
                                          width: double.maxFinite,
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  physics: NeverScrollableScrollPhysics(),
                                                  itemBuilder: (context, index) {

                                                    return RadioListTile(
                                                      value: index,
                                                      groupValue: bankGroupValue,
                                                      onChanged: (ind){
                                                        newsetState((){
                                                          setState(() {
                                                            bankGroupValue = ind;
                                                            _bankMode.text = receipt_detailController.bankListId.elementAt(index).name.toString();
                                                            bankId = receipt_detailController.bankListId.elementAt(index).code.toString();
                                                          });
                                                        });

                                                      },
                                                      title: Text(receipt_detailController.bankListId.elementAt(index).name.toString(),
                                                          style: textStyle.Regular.copyWith(color: Colors.black,fontWeight: FontWeight.w600,)),
                                                    );
                                                  },
                                                  itemCount:  receipt_detailController.bankListId.length,
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(top: 10),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      ElevatedButton(
                                                        child: Text('Cancel'),
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                      ),
                                                      SizedBox(
                                                        width: 20,
                                                      ),

                                                      ElevatedButton(
                                                        child: Text('Ok'),
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                );
                              });
                        },
                        child: Container(
                          decoration:BoxDecoration(
                            border:Border(
                              bottom:  BorderSide(
                                  color: AppColor.GreyColor,
                                  width: 1.0
                              ),
                            ),
                          ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 200,
                                child:  TextField(
                                  readOnly: true,
                                  controller: _bankMode,
                                  textAlign: TextAlign.left,
                                  decoration: const InputDecoration(
                                      hintText: "Select",
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(color: Colors.black),
                                      enabledBorder:InputBorder.none,
                                      focusedBorder:InputBorder.none
                                  ),
                                ),
                              ),
                              Container(
                                child: Icon(Icons.arrow_drop_down_outlined),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ) ,
                ),
              ],
            ),
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
                    textAlign: TextAlign.left,
                    decoration:  InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Depositor Name',
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
            ),
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
                    textAlign: TextAlign.left,
                    decoration:  InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Depositor Mobile No.',
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
            ),
          ),


          Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Checkbox(
                      value: updateCustomerValue,
                      onChanged: (newValue) => setState(() {
                        updateCustomerValue = newValue!;
                      }),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      side: BorderSide(
                        color: AppColor.ThemeColor,
                        width: 1.5,
                      ),
                    ),
                  ),
                  Text("Update Customer Mobile",style: textStyle.RegularBold.copyWith()),
                  Spacer(),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Image.asset("assets/phone.png",color: AppColor.ThemeColor,height: 20,width: 20,),),
                  ),
                ]
            ),
          ),

          Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Checkbox(
                      value: updateCustomerAddress,
                      onChanged: (newValue) => setState(() {
                        updateCustomerAddress = newValue!;
                      }),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      side: BorderSide(
                        color: AppColor.ThemeColor,
                        width: 1.5,
                      ),
                    ),
                  ),
                  Text("Update Customer Address",style: textStyle.RegularBold.copyWith()),
                ]),

          ),


          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Checkbox(
                    value: addNote,
                    onChanged: (newValue) => setState(() {
                      addNote = newValue!;
                    }),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    side: BorderSide(
                      color: AppColor.ThemeColor,
                      width: 1.5,
                    ),

                  ),
                ),
                Text("Add Notes",style: textStyle.RegularBold.copyWith()),
              ],
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
                      for(int i=0;i<receipt_detailController.listData.length;i++){
                        list.add(balanceJson(accountCode: receipt_detailController.listData.elementAt(i).acCodeName.toString(),balance:receipt_detailController.listData.elementAt(i).rupees.toString()));
                      }
                      print("Json data");
                      String jsonData = json.encode(list.toList());
                      print(jsonData);
                      if(decodeMap!=null) {
                        if(receipt_detailController.totalAmount>0){
                          if(!_receiptMode.text.toString().contains("--Select--")&&_receiptMode.text!=""){
                            printTextVisible = false;

                            var jsonString = '{"branchCode": "$branchCode", "companyCode": "$companyCode","user":"$user","receiptMode": "$receiptMode","lat":"$currentLat","long":"$currentLong","narration": "${textFieldNarration.text}","balanceTotal":"${receipt_detailController.totalAccountBalance}","receiveAmount":"${receipt_detailController.totalAmount}","chqno":"${check.text}","chqDate":"${checkDate.text}","bankId":"$bankId","installment":"${receipt_detailController.installmentData}","balanceLeft":"${receipt_detailController.totalOsBalance}"}';
                            final decodedData = json.decode(jsonString);

                            receipt_detailController.receiptSaveList(loanMap:decodeMap,userData: decodedData,balancejsonData:jsonData,AppUserName: authManager.getUserName()).then((value){
                              setState((){
                                receiptModelData = value;
                              });
                              if(receiptModelData.displayMessage!=null){
                                setState(() {
                                  printTextVisible = true;
                                  receipt_detailController.listData.clear();
                                  valueVisible = false;
                                });
                                Get.snackbar('',
                                    receiptModelData.displayMessage.toString(),
                                    snackPosition: SnackPosition.BOTTOM,backgroundColor:
                                    Colors.blue);
                              }
                            });

                          }else{
                            Get.snackbar('',
                                "Please select receipt mode",
                                snackPosition: SnackPosition.BOTTOM,backgroundColor:
                                Colors.blue);
                          }



                        }else{
                          Get.snackbar('',
                              "Please enter amount",
                              snackPosition: SnackPosition.BOTTOM,backgroundColor:
                              Colors.blue);
                        }
                      }else{
                        Get.snackbar('',
                            "Please select loan user",
                            snackPosition: SnackPosition.BOTTOM,backgroundColor:
                            Colors.blue);
                      }
                    /*if(_receiptMode.text.toString().contains("--Select--")){


                    }else{
                      Get.snackbar('',
                          "Please select receipt mode",
                          snackPosition: SnackPosition.BOTTOM,backgroundColor:
                          Colors.blue);
                    }*/


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
          ),
        ],
      ),
    );
  }
  Widget receiptDetail(){
    return Container(
      // margin: EdgeInsets.only(top: 10,bottom: 10),
      child: Card(
        elevation: 10,

        child: Container(
          padding: EdgeInsets.all(10),
          margin: const EdgeInsets.only(top: 10,bottom: 10),
          child: Column(
            children: [

              Container(

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
                        child: Text(decodeMap!=null && decodeMap["loanNo"]!=""?decodeMap["loanNo"]:"0",style: textStyle.Regular.copyWith(color: Colors.black),),
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
                        child: Text(CommonText.vehicle,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        child: Text('0',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                        child: Text(CommonText.name,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        child: Text(decodeMap!=null?decodeMap["loanUserName"].toString().toString():"0",style: textStyle.Regular.copyWith(color: Colors.black),),
                      ),
                    )

                  ],
                ),
              ),


              Container(
                margin:  EdgeInsets.only(top: 10),
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
                        child: Text('0',style: textStyle.Regular.copyWith(color: Colors.black),),
                        //  child: Text('\u{20B9}'+'0',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                        child: Text(CommonText.overDue,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        child: Text('0',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                        child: Text(CommonText.nidText,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        child: Text('0',style: textStyle.Regular.copyWith(color: Colors.black),),
                        //child: Text('\u{20B9}'+'43.98',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                        child: Text(decodeMap!=null?decodeMap["assets"]:"0",style: textStyle.Regular.copyWith(color: Colors.black),),

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
                            child: Text(decodeMap!=null?decodeMap["mobile"].toString():"0",style: textStyle.Regular.copyWith(color: Colors.black),),
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
                            child: Text('0',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                        child: Text('',style: textStyle.Regular.copyWith(color: Colors.black),),
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
                        child: Text(CommonText.loanAmount,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        child: Text(decodeMap!=null?decodeMap["loanAmount"].toString():"",style: textStyle.Regular.copyWith(color: Colors.black),),
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
                        // child: Text(loanDate.toString()??"0",style: textStyle.Regular.copyWith(color: Colors.black),),
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
                        child: Text(CommonText.lastDate,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        child: Text(decodeMap!=null?decodeMap["loanDate"].toString():"",style: textStyle.Regular.copyWith(color: Colors.black),),
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


/*
  void printData() async {
        Map<String, dynamic> config = Map();
        List<LineText> list = [];

        list.add(LineText(type: LineText.TYPE_TEXT, content: '**********************************************', weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));
        list.add(LineText(type: LineText.TYPE_TEXT, content: '打印单据头', weight: 1, align: LineText.ALIGN_CENTER, fontZoom: 2, linefeed: 1));
        list.add(LineText(linefeed: 1));

        list.add(LineText(type: LineText.TYPE_TEXT, content: '物资名称规格型号', align: LineText.ALIGN_LEFT, linefeed: 0));
        list.add(LineText(type: LineText.TYPE_TEXT, content: '单位', align: LineText.ALIGN_LEFT,  linefeed: 0));
        list.add(LineText(type: LineText.TYPE_TEXT, content: '数量', align: LineText.ALIGN_LEFT,  linefeed: 1));

        list.add(LineText(type: LineText.TYPE_TEXT, content: '混凝土C30', align: LineText.ALIGN_LEFT, linefeed: 0));
        list.add(LineText(type: LineText.TYPE_TEXT, content: '吨', align: LineText.ALIGN_LEFT,  linefeed: 0));
        list.add(LineText(type: LineText.TYPE_TEXT, content: '12.0', align: LineText.ALIGN_LEFT,  linefeed: 1));

        list.add(LineText(type: LineText.TYPE_TEXT, content: '**********************************************', weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));
        list.add(LineText(linefeed: 1));

        ByteData data = await rootBundle.load("assets/images/bluetooth_print.png");
        List<int> imageBytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        String base64Image = base64Encode(imageBytes);
        // list.add(LineText(type: LineText.TYPE_IMAGE, content: base64Image, align: LineText.ALIGN_CENTER, linefeed: 1));

        await bluetoothPrint.printReceipt(config, list);
      }
*/
/*connected()async{
  await device?.connect();
}*/

  Widget receiveAmount(){
    return Obx(()=>
    receipt_detailController.loading.value
        ? Center(
      child: Container(
          margin: EdgeInsets.only(top: 20),
          child: CircularProgressIndicator()),
    ):receipt_detailController.ListReceivedAmount!=null?
    Card(
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
                      child: Text(CommonText.receivedAmount??"",style: textStyle.Heading3.copyWith(fontWeight: FontWeight.w600),),
                    ),
                  ),

                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 10,bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Expanded(
                    child: Container(
                      child: Text(CommonText.account,style: textStyle.Regular.copyWith(fontWeight: FontWeight.w600),),
                    ),
                  ),

                  Expanded(
                    child: Container(
                      child: Text(CommonText.balance,style: textStyle.Regular.copyWith(fontWeight: FontWeight.w600),),
                    ),
                  ),
                ],
              ),
            ),

            ListView.builder(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: receipt_detailController.ListReceivedAmount.length,
                itemBuilder: (BuildContext context, int index) {

                  return  receipt_detailController.ListReceivedAmount.elementAt(index).balance.toString()!="0.0"?
                  receipt_detailController.ListReceivedAmount.elementAt(index).balance.toString()!="0"?
                  Container(
                    padding: EdgeInsets.only(top: 5,bottom: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(receipt_detailController.ListReceivedAmount.elementAt(index).accountCode.toString(),style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Text("\u{20B9}"+receipt_detailController.ListReceivedAmount.elementAt(index).balance.toString()??"",style: textStyle.Regular.copyWith(color: Colors.black),),

                          ),
                        )

                      ],
                    ),
                  ):SizedBox():SizedBox();

                }),

            Divider(),

            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Expanded(
                    child: Container(
                      child: Text(CommonText.totalAmountBalance,style: textStyle.Regular.copyWith(color: AppColor.GreyColor),),
                    ),
                  ),

                  Expanded(
                    child: Container(
                      child: Text("\u{20B9}"+receipt_detailController.totalAccountBalance.toString()??"",style: textStyle.Regular.copyWith(color: Colors.black),),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ):SizedBox(),
    );
  }
  removeAmount(removeAmount){
    receipt_detailController.totalAmount = receipt_detailController.totalAmount - double.parse(removeAmount);

  }

/*  connected() async {
    if(_device!=null && _device!.address !=null){
      setState(() {
        tips = 'connecting...';
      });
      await bluetoothPrint.connect(_device!);
      Get.snackbar('',
          "Bluetooth Connected",
          snackPosition: SnackPosition.BOTTOM,backgroundColor:
          Colors.blue);
    }else{
      setState(() {
        tips = 'please select device';
      });
      print('please select device');
    }
  }*/

/*  printWithDevice(BluetoothDevice device) async {
    await device.connect();
    final gen = Generator(PaperSize.mm58, await CapabilityProfile.load());
    final printer = BluePrint();

    printer.add(gen.text('Hello'));
    printer.add(gen.text('World', styles: const PosStyles(bold: true)));
    printer.add(gen.feed(1));
    await printer.printData(device);
    device.disconnect();
  }*/


/*
  printwithBluetoothPrinter({loanMap,userData,balancejsonData,String? AppUserName,String? RNo}) async {
    Map<String, dynamic> config = Map();
    if (loanMap['loanNo'] != '') {
      // console.log("print section");
      // console.log(data);
      Map<String, dynamic> responseData = {};
      var spaceData = ' ';
      // var login = localStorage.login;
      responseData['companyPhone'] =
          receipt_detailController!.companyDetail.phones.toString().split(
              ",")[0].toString();
      responseData['vtype'] = 'Receipt';
      // responseData['date'] = getDateAndTime(DateTime.now());
      responseData['narration'] = userData['narration'];
      responseData['paymentName'] = userData['narration'];
      responseData['paymentMobile'] = userData['narration'];
      responseData['rno'] = RNo;
      responseData['dueAmount'] = userData['installment'];
      responseData['loanno'] = loanMap['loanNo'];
      responseData['name'] = loanMap['loanUserName'];
      responseData['relName'] = userData['relName'];
      responseData['receivedJson'] =
      balancejsonData != null ? balancejsonData : '';
      responseData['remainingBal'] =
      balancejsonData != null ? balancejsonData : '';
      responseData['company'] =
      json.decode(authManager.getCompanyByLoginData().toString())['code'];
      responseData['branch'] =
      json.decode(authManager.getBranchByLoginData().toString())['code'];
      responseData['bankName'] =
      userData['bankId'] != '' ? userData['bankId'] : "";
      print('responseData: ${responseData}');
      printData = '';
      var totalAmount = 0;
      var creditSpace;
      var accHeadSpace;
      print('repeat count: ${((32 - responseData['company'].length) / 2 < 0
          ? ''
          : (32 - responseData['company'].length) / 2)}');

      double spacingCountOne = double.parse('${((32 - responseData['company'].length) / 2 < 0 ? '' : (32 - responseData['company'].length) / 2)}');
      int one = spacingCountOne.round();
      print('repeat count int: $one');
      for (int i=0; i< one; i++){
        printData += spaceData;
      }
      printData = '\n';

      double spacingCountSecond = double.parse('${((32 - responseData['branch'].length) / 2 < 0 ? '' : (32 - responseData['branch'].length) / 2)}');
      int second = spacingCountSecond.round();
      print('repeat count int: $second');
      for (int i=0; i< second; i++){
        printData += spaceData;
      }
      printData = '\n';


      *//*printData += spaceData.repeat(((32 - responseData['company'].length) / 2 < 0 ? '' : (32 - responseData['company'].length) / 2)) + responseData['company']+ space.repeat(((32 - responseData['company'].length) / 2 < 0 ? '' : (32 - responseData['company'].length) / 2)) + '\n';
        printData += spaceData.repeat(((32 - responseData['branch'].length) / 2 < 0 ? '' : (32 - responseData['branch'].length) / 2)) + responseData['branch'] + space.repeat(((32 - responseData['branch'].length) / 2 < 0 ? '' : (32 - responseData['branch'].length) / 2)) + '\n';
*//*
      //   printData += "Date : " + responseData['date'] + '\n';
      printData += '-------------------------------\n';
      // printData += "Loan No : " + (responseData['loanno']!=null ? responseData['loanno'].toString().replace('/\s\s+/g', ' ') : '') + '\n';
      // printData += "Name : " + responseData['name'].replace('/\s\s+/g', ' ') + " " + (responseData['relName']  ? responseData['relName'].replace('/\s\s+/g', ' ') : '') + '\n';
      if (userData['receiptMode'] == 'C') {

        printData += "Rcpt. Mode  : CHEQUE" + '\n';
        printData += "Cheque No   : " + loanMap['chqno'] != null? loanMap['chqno']:" " + '\n';
        printData += "Cheque Date : " + loanMap['chqDate'] != null? loanMap['chqDate']:" " + '\n';
      }
      if (userData['receiptMode']  == 'C' && responseData['bankName']) {
        printData += "Bank        : " + responseData['bankName'] + '\n';
      }
      if (userData['receiptMode']  == 'A') {
        printData += "Receipt Mode : CASH" + '\n';
      }
      if (responseData['paymentName']!="") {
        printData += "Payment Name : " + responseData['paymentName'] + '\n';
      }
      if (responseData['paymentMobile']!="") {
        printData += "Payment Mobile : " + responseData['paymentMobile'] + '\n';
      }
      printData += "Received By : " + AppUserName.toString() + '\n' + ' Receipt No : ' +AppUserName.toString() + '\n';

      printData += "-------------------------------\n";
      printData += "Account               " + "    Amount" + '\n';
      printData += '-------------------------------\n';

      *//* responseData['remainingBal'].forEach((obj) => {
        //obj.balance  = obj.balance + ".00" ;
        obj.balance  = obj.balance+".00",
        creditSpace = obj.balance == 0 ? space.repeat(9) : space.repeat(9 - obj.balance.toString().length),
        accHeadSpace = obj.accountCode == 0 ? space.repeat(21) : space.repeat(21 - obj.accountCode.length),
        printData += obj.accountCode.substring(0, 21) + accHeadSpace + creditSpace + obj.balance + '\n',
        obj.balance = int.parse(obj.balance),
        totalAmount = int.parse(obj.balance)+ int.parse(obj.balance),
        });*//*
      printData += '-------------------------------\n';
      //var totalAmountSapce = totalAmount == 0 ? space.repeat(10) : space.repeat(11 - totalAmount.toString().length);
      var totalAmountSapce = totalAmount;

      printData += "Collected Amt.: " + totalAmountSapce.toString() + "${receipt_detailController!.totalAmount}"+'.00' + '\n';

      printData += "Narration :" + responseData['narration']!='' ? responseData['narration'] + '\n' : '' + '\n';

      printData += '-------------------------------\n';
      *//* responseData['remainingBal'].forEach((obj) => {
        if (obj.displayName == "Overdue") {
        obj.displayName = "Overdue Interest"
        }
        else if (obj.displayName == "Stock") {
        obj.displayName = "Future Stock"
        },
        //this.printData += "" + obj.displayName + ":" + obj.balance + ";"

        });*//*
      printData += '\n';
      if (responseData['companyPhone']!='') {
        printData += '________________________________\n';
        printData += "For Any Enquiries conatct our number(s) " + responseData['companyPhone'] + '\n';
      }
      if (responseData['receiptMode'] == 'C') {
        printData += 'Note:If bounce the verifier will mark it as bounced and a reverce entry will be made\n';
      }
      printData += '~~~~~~~~*** Thank You ***~~~~~~~\n';
      printData += '\n';
      printData += '\n';


    }
    await bluetoothPrint.printLabel(config, printData);


  }*/

  /* disConnect()async {
    Get.back();
    await bluetoothPrint.disconnect();
  }
*/

/*  void printWithDevice(BluetoothDevice device) async {
    await device.connect();
    final gen = Generator(PaperSize.mm58, await CapabilityProfile.load());
    final printer = BluePrint();

    printer.add(gen.text('Hello'));
    printer.add(gen.text('World', styles: const PosStyles(bold: true)));

    await printer.printData(device);
    device.disconnect();
  }*/


  connectBluetooth()async{
    await bluetoothPrint.connect(_device!);

    bool isConnected = await bluetoothPrint.isConnected??false;

    bluetoothPrint.state.listen((state) {
      switch (state) {
        case BluetoothPrint.CONNECTED:
          setState(() {
            _connected = true;
            tips = 'connect success';
          });
          break;
        case BluetoothPrint.DISCONNECTED:
          setState(() {
            _connected = false;
            tips = 'disconnect success';
          });
          break;
        default:
          break;
      }
    });

    if (!mounted) return;

    if(isConnected) {
      setState(() {
        _connected=true;
      });
    }
  }
  bluetoothPrinter({loanMap,userData,balancejsonData,remainingJson,String? AppUserName,String? RNo,device}) async {
    Map<String, dynamic> config = Map();

    List<LineText> list = [];
    if (loanMap['loanNo'] != '') {
      // console.log("print section");
      // console.log(data);
      Map<String, dynamic> responseData = {};
      var spaceData = ' ';
      // var login = localStorage.login;
      responseData['companyPhone'] =
          receipt_detailController!.companyDetail.phones.toString().split(
              ",")[0].toString();
      responseData['vtype'] = 'Receipt';
      responseData['date'] = DateTime.now();
      responseData['narration'] = userData['narration'];
      responseData['paymentName'] = userData['narration'];
      responseData['paymentMobile'] = userData['narration'];
      responseData['rno'] = RNo;
      responseData['dueAmount'] = userData['installment'];
      responseData['loanno'] = loanMap['loanNo'];
      responseData['name'] = loanMap['loanUserName'];
      responseData['relName'] = userData['relName'];
      responseData['receivedJson'] = balancejsonData != null ? balancejsonData : '';
      responseData['remainingBal'] = remainingJson != null ? remainingJson : '';
      responseData['company'] =
      json.decode(authManager.getCompanyByLoginData().toString())['code'];
      responseData['branch'] =
      json.decode(authManager.getBranchByLoginData().toString())['code'];
      responseData['bankName'] =
      userData['bankId'] != '' ? userData['bankId'] : "";
      print('responseData: ${responseData}');
      //printData = '';



      list.add(LineText(type: LineText.TYPE_TEXT, content: "Date : "+responseData['date'].toString().split(".")[0], weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));
      list.add(LineText(type: LineText.TYPE_TEXT, content: '-------------------------------', weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));
      list.add(LineText(type: LineText.TYPE_TEXT, content: "Loan No : " + (responseData['loanno']!=null ? responseData['loanno'].toString().replaceAll('/\s\s+/g', ' ') : ''), weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));

      list.add(LineText(type: LineText.TYPE_TEXT, content: "Name : " + responseData['name'].toString().replaceAll('/\s\s+/g', ' ') + " " + (responseData['relName'] !=null ? responseData['relName'].toString().replaceAll('/\s\s+/g', ' ') : '') , weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));

      if (userData['receiptMode'] == 'C') {
        list.add(LineText(type: LineText.TYPE_TEXT, content:  "Rcpt. Mode  : CHEQUE", weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));
        list.add(LineText(type: LineText.TYPE_TEXT, content:  "Cheque No   : " + loanMap['chqno'] != null? loanMap['chqno']:" ", weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));

        list.add(LineText(type: LineText.TYPE_TEXT, content: "Cheque Date : " + loanMap['chqDate'] != null? loanMap['chqDate']:" " , weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));

      }

      if (userData['receiptMode']  == 'C' && responseData['bankName']) {
        list.add(LineText(type: LineText.TYPE_TEXT, content: "Bank        : " + responseData['bankName'], weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));
      }

      if (userData['receiptMode']  == 'A') {
        list.add(LineText(type: LineText.TYPE_TEXT, content: "Receipt Mode : CASH", weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));
      }

      if (responseData['paymentName']!="") {
        list.add(LineText(type: LineText.TYPE_TEXT, content:  "Payment Name : " + responseData['paymentName'], weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));
      }

      if (responseData['paymentMobile']!="") {
        list.add(LineText(type: LineText.TYPE_TEXT, content:  "Payment Mobile : " + responseData['paymentMobile'], weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));
      }

      list.add(LineText(type: LineText.TYPE_TEXT, content:  "Received By : " + AppUserName.toString(), weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));

      list.add(LineText(type: LineText.TYPE_TEXT, content: '-------------------------------', weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));
      list.add(LineText(type: LineText.TYPE_TEXT, content: "Account               " + "    Amount", weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));
      list.add(LineText(type: LineText.TYPE_TEXT, content: '-------------------------------', weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));

      List<dynamic> result= jsonDecode(responseData['receivedJson']);
      List<dynamic> remaining = jsonDecode(responseData['remainingBal']);
      double totalAmount = 0.0;
      var creditSpace;
      var accHeadSpace;
      const space = " ";

      result.forEach((obj) => {
        print("spaceTwentyOne balance"),
        print(double.parse(obj['balance'])),
        creditSpace = obj['balance'] == 0 ? space * 9 : (space * 9).length - obj['balance'].toString().length,
        accHeadSpace = obj['accountCode'] == 0 ? space * 21 : (space * 21).length - obj['accountCode'].toString().length,
        //this.printData += obj.accountCode.substring(0, 21) + accHeadSpace + creditSpace + obj.balance + '\n';
        list.add(LineText(type: LineText.TYPE_TEXT, content: obj['accountCode'] + (space * accHeadSpace) + (space * creditSpace) + obj['balance'], weight: 1, align: LineText.ALIGN_CENTER, linefeed: 1)),
        obj['balance'] = obj['balance'],
        totalAmount += double.parse(obj['balance']),
      });

      var totalAmountSapce = totalAmount == 0 ? (space * 10).length : (space * 11).length - totalAmount.toString().length;
      list.add(LineText(type: LineText.TYPE_TEXT, content: '-------------------------------', weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));
      list.add(LineText(type: LineText.TYPE_TEXT, content:  "Collected Amt.: " + (space * totalAmountSapce) + "${receipt_detailController!.totalAmount}" , weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));
      list.add(LineText(type: LineText.TYPE_TEXT, content:  "Narration :" + responseData['narration']!='' ? responseData['narration']:"", weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));
      list.add(LineText(type: LineText.TYPE_TEXT, content: '-------------------------------', weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));
      remaining.forEach((obj) => {

        if (obj['displayName']== "Overdue") {
          obj['displayName'] = "Overdue Interest"
        }
        else if (obj['displayName'] == "Stock") {
          obj['displayName'] = "Future Stock"
        },
        //this.printData += "" + obj.displayName + ":" + obj.balance + ";"

      });

      if (responseData['companyPhone']!='') {
        list.add(LineText(type: LineText.TYPE_TEXT, content: '________________________________', weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));
        list.add(LineText(type: LineText.TYPE_TEXT, content:  "For Any Enquiries conatct our number(s) " + responseData['companyPhone'], weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));
      }
      if (responseData['receiptMode'] == 'C') {
        list.add(LineText(type: LineText.TYPE_TEXT, content:  "'Note:If bounce the verifier will mark it as bounced and a reverce entry will be made ", weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));

      }
      list.add(LineText(type: LineText.TYPE_TEXT, content:  "~~~~~~~~*** Thank You ***~~~~~~~", weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));


    }

    await bluetoothPrint.printLabel(config, list);


  }
  /*printwithBluetoothPrinter({loanMap,userData,balancejsonData,remainingJson,String? AppUserName,String? RNo,device}) async {
    if (loanMap['loanNo'] != '') {
      // console.log("print section");
      // console.log(data);
      Map<String, dynamic> responseData = {};
      var spaceData = ' ';
      // var login = localStorage.login;
      responseData['companyPhone'] =
          receipt_detailController!.companyDetail.phones.toString().split(
              ",")[0].toString();
      responseData['vtype'] = 'Receipt';
      responseData['date'] = DateTime.now();
      responseData['narration'] = userData['narration'];
      responseData['paymentName'] = userData['narration'];
      responseData['paymentMobile'] = userData['narration'];
      responseData['rno'] = RNo;
      responseData['dueAmount'] = userData['installment'];
      responseData['loanno'] = loanMap['loanNo'];
      responseData['name'] = loanMap['loanUserName'];
      responseData['relName'] = userData['relName'];
      responseData['receivedJson'] = balancejsonData != null ? balancejsonData : '';
      responseData['remainingBal'] = remainingJson != null ? remainingJson : '';
      responseData['company'] =
      json.decode(authManager.getCompanyByLoginData().toString())['code'];
      responseData['branch'] =
      json.decode(authManager.getBranchByLoginData().toString())['code'];
      responseData['bankName'] =
      userData['bankId'] != '' ? userData['bankId'] : "";
      print('responseData: ${responseData}');
      //printData = '';
      double totalAmount = 0.0;
      var creditSpace;
      var accHeadSpace;
      print('repeat count: ${((32 - responseData['company'].length) / 2 < 0 ? '' : (32 - responseData['company'].length) / 2)}');

      double spacingCountOne = double.parse('${((32 - responseData['company'].length) / 2 < 0 ? '' : (32 - responseData['company'].length) / 2)}');
      int one = spacingCountOne.round();
      print('repeat count int: $one');
      printData = '\n';

      double spacingCountSecond = double.parse('${((32 - responseData['branch'].length) / 2 < 0 ? '' : (32 - responseData['branch'].length) / 2)}');
      int second = spacingCountSecond.round();
      print('repeat count int: $second');
      for (int i=0; i < second; i++){
        printData += spaceData;
      }
      printData = '\n';



      printData += "Date : " + responseData['date'].toString() + '\n';
      printData += '-------------------------------\n';
       printData += "Loan No : " + (responseData['loanno']!=null ? responseData['loanno'].toString().replaceAll('/\s\s+/g', ' ') : '') + '\n';
       printData += "Name : " + responseData['name'].toString().replaceAll('/\s\s+/g', ' ') + " " + (responseData['relName'] !=null ? responseData['relName'].toString().replaceAll('/\s\s+/g', ' ') : '') + '\n';
      if (userData['receiptMode'] == 'C') {

        printData += "Rcpt. Mode  : CHEQUE" + '\n';
        printData += "Cheque No   : " + loanMap['chqno'] != null? loanMap['chqno']:" " + '\n';
        printData += "Cheque Date : " + loanMap['chqDate'] != null? loanMap['chqDate']:" " + '\n';
      }
      if (userData['receiptMode']  == 'C' && responseData['bankName']) {
        printData += "Bank        : " + responseData['bankName'] + '\n';
      }
      if (userData['receiptMode']  == 'A') {
        printData += "Receipt Mode : CASH" + '\n';
      }
      if (responseData['paymentName']!="") {
        printData += "Payment Name : " + responseData['paymentName'] + '\n';
      }
      if (responseData['paymentMobile']!="") {
        printData += "Payment Mobile : " + responseData['paymentMobile'] + '\n';
      }
      printData += "Received By : " + AppUserName.toString() + '\n' + ' Receipt No : ' +AppUserName.toString() + '\n';

      printData += "-------------------------------\n";
      printData += "Account               " + "    Amount" + '\n';
      printData += '-------------------------------\n';
      List<dynamic> result= jsonDecode(responseData['receivedJson']);
      List<dynamic> remaining = jsonDecode(responseData['remainingBal']);


      var spaceNine = "         ";
      var spaceTen = "         ";
      var spaceEleven = "         ";
      var spaceTwentyOne = "                     ";
      result.forEach((obj) => {
       print("spaceTwentyOne balance"),
        print(double.parse(obj['balance'])),
        creditSpace = obj['balance'] == 0 ? spaceNine : spaceNine.length - obj['balance'].toString().length,
         accHeadSpace = obj['accountCode'] == 0 ? spaceTwentyOne : spaceTwentyOne.length - obj['accountCode'].toString().length,
        printData += obj['accountCode'] + accHeadSpace.toString() + creditSpace.toString() + obj['balance'] + '\n',
         obj['balance'] = obj['balance'],

        totalAmount +=  double.parse(obj['balance']),
     });
      printData += '-------------------------------\n';
      var totalAmountSapce = totalAmount == 0 ? spaceTen.length : spaceEleven.length - totalAmount.toString().length;

      printData += "Collected Amt.: " + totalAmountSapce.toString() + "${receipt_detailController!.totalAmount}"+'.00' + '\n';
      printData += "Narration :" + responseData['narration']!='' ? responseData['narration'] + '\n' : '' + '\n';

      printData += '-------------------------------\n';
      remaining.forEach((obj) => {

       if (obj['displayName']== "Overdue") {
         obj['displayName'] = "Overdue Interest"
        }
        else if (obj['displayName'] == "Stock") {
         obj['displayName'] = "Future Stock"
        },
        //this.printData += "" + obj.displayName + ":" + obj.balance + ";"

        });
      printData += '\n';
      if (responseData['companyPhone']!='') {
        printData += '________________________________\n';
        printData += "For Any Enquiries conatct our number(s) " + responseData['companyPhone'] + '\n';
      }
      if (responseData['receiptMode'] == 'C') {
        printData += 'Note:If bounce the verifier will mark it as bounced and a reverce entry will be made\n';
      }
      printData += '~~~~~~~~*** Thank You ***~~~~~~~\n';
      printData += '\n';
      printData += '\n';

    }

   /// printer.add(gen.text(printData));

    *//*await printer.printData(device);
    device.disconnect();*//*

  }
*/

  getDateAndTime(date) {

    var datetime = date.getDate() + "/"
        + (date.getMonth() + 1) + "/"
        + date.getFullYear() + " @ "
        + date.getHours() + ":"
        + date.getMinutes() + ":"
        + date.getSeconds();
    return datetime;
  }
}





class creditData{

  String? rupees;
  String? acCodeName;
  bool? isVisible = false;

  creditData({
    this.isVisible,
    this.rupees,
    this.acCodeName,});


  creditData.fromJson(Map<String, dynamic> json) {
    isVisible = json['isVisible'];
    rupees = json['rupees'];
    acCodeName = json['acCodeName'];
  }
}



class balanceJson{

  String? balance;
  String? accountCode;


  balanceJson({

    this.balance,
    this.accountCode,});


  balanceJson.fromJson(Map<String, dynamic> json) {

    balance = json['balance'];
    accountCode = json['accountCode'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['balance'] = this.balance;
    data['accountCode'] = this.accountCode;
    return data;
  }


}



class RemainingJson {
  String? accountCode;
  String? balance;
  String? accountHead;
  String? displayName;

  RemainingJson(
      {this.accountCode, this.balance, this.accountHead, this.displayName});

  RemainingJson.fromJson(Map<String, dynamic> json) {
    accountCode = json['accountCode'];
    balance = json['balance'];
    accountHead = json['accountHead'];
    displayName = json['displayName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accountCode'] = this.accountCode;
    data['balance'] = this.balance;
    data['accountHead'] = this.accountHead;
    data['displayName'] = this.displayName;
    return data;
  }
}



/*
import 'dart:convert';
import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:esc_pos_bluetooth/esc_pos_bluetooth.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:oktoast/oktoast.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PrinterBluetoothManager printerManager = PrinterBluetoothManager();
  List<PrinterBluetooth> _devices = [];
  var base64;
  List<int> bytes = [];
  @override
  void initState() {
    super.initState();

    printerManager.scanResults.listen((devices) async {
      print('UI: Devices found ${devices.length}');
      setState(() {
        _devices = devices;
      });
    });
    _startScanDevices();
  }

  void _startScanDevices() {
    setState(() {
      _devices = [];
    });
    printerManager.startScan(Duration(seconds: 4));
  }

  void _stopScanDevices() {
    printerManager.stopScan();
  }

  Future<List<int>> demoReceipt(PaperSize paper, CapabilityProfile profile) async {
    final Generator ticket = Generator(paper, profile);
    List<int> bytes = [];


    bytes += ticket.text('GROCERYLY', styles: PosStyles(align: PosAlign.center, height: PosTextSize.size2, width: PosTextSize.size2,), linesAfter: 1);
    bytes += ticket.text('889  Watson Lane', styles: PosStyles(align: PosAlign.center));
    bytes += ticket.text('New Braunfels, TX', styles: PosStyles(align: PosAlign.center));
    bytes += ticket.text('Tel: 830-221-1234', styles: PosStyles(align: PosAlign.center));
    bytes += ticket.text('Web: www.example.com', styles: PosStyles(align: PosAlign.center), linesAfter: 1);

    bytes += ticket.hr();
    bytes += ticket.row([
      PosColumn(text: 'Qty', width: 1),
      PosColumn(text: 'Item', width: 7),
      PosColumn(text: 'Price', width: 2, styles: PosStyles(align: PosAlign.right)),
      PosColumn(text: 'Total', width: 2, styles: PosStyles(align: PosAlign.right)),
    ]);

    bytes += ticket.row([
      PosColumn(text: '2', width: 1),
      PosColumn(text: 'ONION RINGS', width: 7),
      PosColumn(text: '0.99', width: 2, styles: PosStyles(align: PosAlign.right)),
      PosColumn(text: '1.98', width: 2, styles: PosStyles(align: PosAlign.right)),
    ]);
    bytes += ticket.row([
      PosColumn(text: '1', width: 1),
      PosColumn(text: 'PIZZA', width: 7),
      PosColumn(text: '3.45', width: 2, styles: PosStyles(align: PosAlign.right)),
      PosColumn(text: '3.45', width: 2, styles: PosStyles(align: PosAlign.right)),
    ]);
    bytes += ticket.row([
      PosColumn(text: '1', width: 1),
      PosColumn(text: 'SPRING ROLLS', width: 7),
      PosColumn(text: '2.99', width: 2, styles: PosStyles(align: PosAlign.right)),
      PosColumn(text: '2.99', width: 2, styles: PosStyles(align: PosAlign.right)),
    ]);
    bytes += ticket.row([
      PosColumn(text: '3', width: 1),
      PosColumn(text: 'CRUNCHY STICKS', width: 7),
      PosColumn(text: '0.85', width: 2, styles: PosStyles(align: PosAlign.right)),
      PosColumn(text: '2.55', width: 2, styles: PosStyles(align: PosAlign.right)),
    ]);
    bytes += ticket.hr();

    bytes += ticket.row([
      PosColumn(text: 'TOTAL', width: 6, styles: PosStyles(height: PosTextSize.size2, width: PosTextSize.size2,)),
      PosColumn(text: '\$10.97', width: 6, styles: PosStyles(align: PosAlign.right, height: PosTextSize.size2, width: PosTextSize.size2,)),
    ]);

    bytes += ticket.hr(ch: '=', linesAfter: 1);
    bytes += ticket.row([
      PosColumn(text: 'Cash', width: 7,styles: PosStyles(align: PosAlign.right, width: PosTextSize.size2)),
      PosColumn(text: '\$15.00', width: 5, styles: PosStyles(align: PosAlign.right, width: PosTextSize.size2)),
    ]);
    bytes += ticket.row([
      PosColumn(text: 'Change', width: 7, styles: PosStyles(align: PosAlign.right, width: PosTextSize.size2)),
      PosColumn(text: '\$4.03', width: 5, styles: PosStyles(align: PosAlign.right, width: PosTextSize.size2)),
    ]);

    bytes += ticket.feed(2);
    bytes += ticket.text('Thank you!',styles: PosStyles(align: PosAlign.center, bold: true));

    final now = DateTime.now();
    final formatter = DateFormat('MM/dd/yyyy H:m');
    final String timestamp = formatter.format(now);
    bytes += ticket.text(timestamp, styles: PosStyles(align: PosAlign.center), linesAfter: 2);

    ticket.feed(2);
    ticket.cut();
    print('ticket');
    print(bytes);
    base64 = base64Encode(bytes);
    print("base 64");
    print(base64);



    return bytes;
  }
*/
/*
  Future<List<int>> testTicket(
      PaperSize paper, CapabilityProfile profile) async {
    final Generator generator = Generator(paper, profile);


    bytes += generator.text('Regular: aA bB cC dD eE fF gG hH iI jJ kK lL mM nN oO pP qQ rR sS tT uU vV wW xX yY zZ');

    bytes += generator.text('Bold text', styles: PosStyles(bold: true));
    bytes += generator.text('Reverse text', styles: PosStyles(reverse: true));
    bytes += generator.text('Underlined text',
        styles: PosStyles(underline: true), linesAfter: 1);
    bytes +=
        generator.text('Align left', styles: PosStyles(align: PosAlign.left));
    bytes += generator.text('Align center',
        styles: PosStyles(align: PosAlign.center));
    bytes += generator.text('Align right',
        styles: PosStyles(align: PosAlign.right), linesAfter: 1);

    bytes += generator.row([
      PosColumn(
        text: 'col3',
        width: 3,
        styles: PosStyles(align: PosAlign.center, underline: true),
      ),
      PosColumn(
        text: 'col6',
        width: 6,
        styles: PosStyles(align: PosAlign.center, underline: true),
      ),
      PosColumn(
        text: 'col3',
        width: 3,
        styles: PosStyles(align: PosAlign.center, underline: true),
      ),
    ]);

    bytes += generator.text('Text size 200%',
        styles: PosStyles(
          height: PosTextSize.size2,
          width: PosTextSize.size2,
        ));

    // Print image
    final ByteData data = await rootBundle.load('assets/logo.png');
    final Uint8List buf = data.buffer.asUint8List();
    final Image image = decodeImage(buf)!;
    bytes += generator.image(image);
    // Print image using alternative commands
    // bytes += generator.imageRaster(image);
    // bytes += generator.imageRaster(image, imageFn: PosImageFn.graphics);

    // Print barcode
    final List<int> barData = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 4];
    bytes += generator.barcode(Barcode.upcA(barData));
    bytes += generator.feed(2);

    bytes += generator.cut();
    return bytes;
  }*//*


  void _testPrint(PrinterBluetooth printer) async {
    printerManager.selectPrinter(printer);

    // TODO Don't forget to choose printer's paper
    const PaperSize paper = PaperSize.mm80;
    final profile = await CapabilityProfile.load();

    // TEST PRINT
    // final PosPrintResult res =
    // await printerManager.printTicket(await testTicket(paper));

    // DEMO RECEIPT


    await demoReceipt(paper, profile);

  //  final PosPrintResult res = await printerManager.printTicket((await demoReceipt(paper, profile)));

   // showToast(res.msg);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
              itemCount: _devices.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => _testPrint(_devices[index]),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 60,
                        padding: EdgeInsets.only(left: 10),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.print),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(_devices[index].name ?? ''),
                                  Text(_devices[index].address!),
                                  Text('Click to print a test receipt',
                                    style: TextStyle(color: Colors.grey[700]),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                );
              }),

        ],
      ),
      floatingActionButton: StreamBuilder<bool>(
        stream: printerManager.isScanningStream,
        initialData: false,
        builder: (c, snapshot) {
          if (snapshot.data!) {
            return FloatingActionButton(
              child: Icon(Icons.stop),
              onPressed: _stopScanDevices,
              backgroundColor: Colors.red,
            );
          } else {
            return FloatingActionButton(
              child: Icon(Icons.search),
              onPressed: _startScanDevices,
            );
          }
        },
      ),
    );
  }
}
*/



/*
class BluePrint {
  BluePrint({this.chunkLen = 512});

  final int chunkLen;
  final _data = List<int>.empty(growable: true);

  void add(List<int> data) {
    _data.addAll(data);
  }

  List<List<int>> getChunks() {
    final chunks = List<List<int>>.empty(growable: true);
    for (var i = 0; i < _data.length; i += chunkLen) {
      chunks.add(_data.sublist(i, min(i + chunkLen, _data.length)));
    }
    return chunks;
  }

  Future<void> printData(BluetoothDevice device) async {
    final data = getChunks();
    final characs = await _getCharacteristics(device);
    for (var i = 0; i < characs.length; i++) {
      if (await _tryPrint(characs[i], data)) {
        break;
      }
    }
  }

  Future<bool> _tryPrint(BluetoothCharacteristic charac,
      List<List<int>> data,
      ) async {
    for (var i = 0; i < data.length; i++) {
      try {
        await charac.write(data[i]);
      } catch (e) {
        return false;
      }
    }
    return true;
  }

  Future<List<BluetoothCharacteristic>> _getCharacteristics(
      BluetoothDevice device,
      ) async {
    final services = await device.discoverServices();
    final res = List<BluetoothCharacteristic>.empty(growable: true);
    for (var i = 0; i < services.length; i++) {
      res.addAll(services[i].characteristics);
    }
    return res;
  }
}*/
