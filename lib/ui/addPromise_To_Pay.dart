
import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:Loan360Cloud/controller/promiseController.dart';
import 'package:Loan360Cloud/model/subjectPromise.dart';
import 'package:Loan360Cloud/ui/updateAddress.dart';
import 'package:flutter/material.dart';
import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:get/get.dart';


class AddPromiseToPay extends StatefulWidget {
  const AddPromiseToPay({Key? key}) : super(key: key);

  @override
  State<AddPromiseToPay> createState() => _AddPromiseToPayState();
}

class _AddPromiseToPayState extends State<AddPromiseToPay> {

  PromiseController promiseController = Get.put(PromiseController());
  static List<Address>? _dropdownAddress = [];
  GlobalKey<ScaffoldState> AddPromiseKey = GlobalKey();

  // var controller = new MaskedTextController(mask: '(000) 000 0000');

  String?  _errorText;
  final _address = TextEditingController();
  Address? _dropdownAddressValue;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /*_dropdownAddress!.add(Address(addressCode: 'Select'));
    _dropdownAddressValue = _dropdownAddress![0];*/

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:  AddPromiseKey,
      appBar: AppBar(
         title: Container(
           alignment: Alignment.topLeft,
           child: Text(CommonText.updateSmall.toString(),style: textStyle.Heading2.copyWith(),),
         ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [

              Container(
                height: 70,
                margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                child: Column(
                  children: [
                    CommonAstrickText(CommonText.subject),
                    Container(
                      // margin: EdgeInsets.only(top:5,),
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
                                  isEmpty: promiseController.dropdown == null,
                                  child:  DropdownButton<SubjectPromiseModel>(
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color:AppColor.GreyColor,
                                      size: 20.09,
                                    ),
                                    value: promiseController!.dropdown,
                                    isDense: true,
                                    onChanged: (SubjectPromiseModel? newValue) {
                                      print('value change');
                                      print(newValue);
                                      setState(() {
                                        promiseController!.dropdown = newValue;
                                       // _address.text = _dropdownAddressValue!.addressCode!;
                                      });
                                    },
                                    items: promiseController.subjectPromiseData!.map((SubjectPromiseModel value) {
                                      return DropdownMenuItem<SubjectPromiseModel>(
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
                    ),
                  ],
                ),
              ),

              Container(
                height: 70,
                margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                child: Column(
                  children: [
                    CommonAstrickText(CommonText.type),
                    Container(
                      // margin: EdgeInsets.only(top:5,),
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
                                  isEmpty: _dropdownAddress == null,
                                  child:  DropdownButton<Address>(
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color:AppColor.GreyColor,
                                      size: 20.09,
                                    ),
                                    value: _dropdownAddressValue,
                                    isDense: true,
                                    onChanged: (Address? newValue) {
                                      print('value change');
                                      print(newValue);
                                      setState(() {
                                        _dropdownAddressValue = newValue;
                                        _address.text = _dropdownAddressValue!.addressCode!;
                                      });
                                    },
                                    items: _dropdownAddress!.map((Address value) {
                                      return DropdownMenuItem<Address>(
                                        value: value,
                                        child: Text(value!.addressCode.toString()),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                height: 70,
                margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                child: Column(
                  children: [
                    WithoutAstrickText(CommonText.important),
                    Container(
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
                                  isEmpty: _dropdownAddress == null,
                                  child:  DropdownButton<Address>(
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color:AppColor.GreyColor,
                                      size: 20.09,
                                    ),
                                    value: _dropdownAddressValue,
                                    isDense: true,
                                    onChanged: (Address? newValue) {
                                      print('value change');
                                      print(newValue);
                                      setState(() {
                                        _dropdownAddressValue = newValue;
                                        _address.text = _dropdownAddressValue!.addressCode!;
                                      });
                                    },
                                    items: _dropdownAddress!.map((Address value) {
                                      return DropdownMenuItem<Address>(
                                        value: value,
                                        child: Text(value!.addressCode.toString()),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                height: 70,
                margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                child:Column(
                  children: [

                    CommonAstrickText(CommonText.reminderDate),
                    Container(
                      // width: 320,
                      child: const TextField(
                        //controller: emailController,
                        obscureText: true,
                        textAlign: TextAlign.left,
                        decoration:  InputDecoration(
                          border: InputBorder.none,
                          hintText: '0',
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
                margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                child:Column(
                  children: [

                    WithoutAstrickText(CommonText.location),
                    Container(
                      // width: 320,
                      child: const TextField(
                        //controller: emailController,
                        obscureText: true,
                        textAlign: TextAlign.left,
                        decoration:  InputDecoration(
                          border: InputBorder.none,
                          hintText: '0',
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
                          hintText: CommonText.loanAc,
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
                height: 70,
                margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                child: Column(
                  children: [
                    WithoutAstrickText(CommonText.login),
                    Container(
                      // margin: EdgeInsets.only(top:5,),
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
                                  isEmpty: _dropdownAddress == null,
                                  child:  DropdownButton<Address>(
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color:AppColor.GreyColor,
                                      size: 20.09,
                                    ),
                                    value: _dropdownAddressValue,
                                    isDense: true,
                                    onChanged: (Address? newValue) {
                                      print('value change');
                                      print(newValue);
                                      setState(() {
                                        _dropdownAddressValue = newValue;
                                        _address.text = _dropdownAddressValue!.addressCode!;
                                      });
                                    },
                                    items: _dropdownAddress!.map((Address value) {
                                      return DropdownMenuItem<Address>(
                                        value: value,
                                        child: Text(value!.addressCode.toString()),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )


                  ],
                ),
              ),

              Container(
                height: 70,
                margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                child: Column(
                  children: [
                    CommonAstrickText(CommonText.customerUpperCaseText),
                    Container(
                      // margin: EdgeInsets.only(top:5,),
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
                                  isEmpty: _dropdownAddress == null,
                                  child:  DropdownButton<Address>(
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color:AppColor.GreyColor,
                                      size: 20.09,
                                    ),
                                    value: _dropdownAddressValue,
                                    isDense: true,
                                    onChanged: (Address? newValue) {
                                      print('value change');
                                      print(newValue);
                                      setState(() {
                                        _dropdownAddressValue = newValue;
                                        _address.text = _dropdownAddressValue!.addressCode!;
                                      });
                                    },
                                    items: _dropdownAddress!.map((Address value) {
                                      return DropdownMenuItem<Address>(
                                        value: value,
                                        child: Text(value!.addressCode.toString()),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )


                  ],
                ),
              ),

              Container(
                height: 70,
                margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                child: Column(
                  children: [
                    WithoutAstrickText(CommonText.address),
                    Container(
                      // margin: EdgeInsets.only(top:5,),
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
                                  isEmpty: _dropdownAddress == null,
                                  child:  DropdownButton<Address>(
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color:AppColor.GreyColor,
                                      size: 20.09,
                                    ),
                                    value: _dropdownAddressValue,
                                    isDense: true,
                                    onChanged: (Address? newValue) {
                                      print('value change');
                                      print(newValue);
                                      setState(() {
                                        _dropdownAddressValue = newValue;
                                        _address.text = _dropdownAddressValue!.addressCode!;
                                      });
                                    },
                                    items: _dropdownAddress!.map((Address value) {
                                      return DropdownMenuItem<Address>(
                                        value: value,
                                        child: Text(value!.addressCode.toString()),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )


                  ],
                ),
              ),

              Container(
                height: 70,
                margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                child: Column(
                  children: [
                    WithoutAstrickText(CommonText.mobile),
                    Container(
                      // margin: EdgeInsets.only(top:5,),
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
                                  isEmpty: _dropdownAddress == null,
                                  child:  DropdownButton<Address>(
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color:AppColor.GreyColor,
                                      size: 20.09,
                                    ),
                                    value: _dropdownAddressValue,
                                    isDense: true,
                                    onChanged: (Address? newValue) {
                                      print('value change');
                                      print(newValue);
                                      setState(() {
                                        _dropdownAddressValue = newValue;
                                        _address.text = _dropdownAddressValue!.addressCode!;
                                      });
                                    },
                                    items: _dropdownAddress!.map((Address value) {
                                      return DropdownMenuItem<Address>(
                                        value: value,
                                        child: Text(value!.addressCode.toString()),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                height: 70,
                margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                child:Column(
                  children: [

                    WithoutAstrickText(CommonText.phone),
                    Container(
                      // width: 320,
                      child: const TextField(
                        //controller: emailController,
                        obscureText: true,
                        textAlign: TextAlign.left,
                        decoration:  InputDecoration(
                          border: InputBorder.none,
                          hintText: '0',
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
                margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                child: Column(
                  children: [
                    WithoutAstrickText(CommonText.remark),
                    Container(
                      // margin: EdgeInsets.only(top:5,),
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
                                  isEmpty: _dropdownAddress == null,
                                  child:  DropdownButton<Address>(
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color:AppColor.GreyColor,
                                      size: 20.09,
                                    ),
                                    value: _dropdownAddressValue,
                                    isDense: true,
                                    onChanged: (Address? newValue) {
                                      print('value change');
                                      print(newValue);
                                      setState(() {
                                        _dropdownAddressValue = newValue;
                                        _address.text = _dropdownAddressValue!.addressCode!;
                                      });
                                    },
                                    items: _dropdownAddress!.map((Address value) {
                                      return DropdownMenuItem<Address>(
                                        value: value,
                                        child: Text(value!.addressCode.toString()),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),

              Container(
                height: 70,
                margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                child:Column(
                  children: [

                    CommonAstrickText(CommonText.description),
                    Container(
                      // width: 320,
                      child: const TextField(
                        //controller: emailController,
                        obscureText: true,
                        textAlign: TextAlign.left,
                        decoration:  InputDecoration(
                          border: InputBorder.none,
                          hintText: '0',
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
                margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                child:Column(
                  children: [

                    CommonAstrickText(CommonText.type),
                    Container(
                      child: const TextField(
                        //controller: emailController,
                        obscureText: true,
                        textAlign: TextAlign.left,
                        decoration:  InputDecoration(
                          border: InputBorder.none,
                          hintText: '0',
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
                margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                child:Column(
                  children: [

                    CommonAstrickText(CommonText.remarks),
                    Container(
                      child: const TextField(
                        //controller: emailController,
                        obscureText: true,
                        textAlign: TextAlign.left,
                        decoration:  InputDecoration(
                          border: InputBorder.none,
                          hintText: '0',
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
                margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                child:Column(
                  children: [

                    WithoutAstrickText(CommonText.reminderDate),
                    Container(
                      // width: 320,
                      child: const TextField(
                        //controller: emailController,
                        obscureText: true,
                        textAlign: TextAlign.left,
                        decoration:  InputDecoration(
                          border: InputBorder.none,
                          hintText: '0',
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
                margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                child:Column(
                  children: [

                    WithoutAstrickText(CommonText.receiptNo),
                    Container(
                      child: const TextField(
                        //controller: emailController,
                        obscureText: true,
                        textAlign: TextAlign.left,
                        decoration:  InputDecoration(
                          border: InputBorder.none,
                          hintText: '0',
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
                margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                child:Column(
                  children: [

                    WithoutAstrickText(CommonText.receiptDate),
                    Container(
                      // width: 320,
                      child: const TextField(
                        //controller: emailController,
                        obscureText: true,
                        textAlign: TextAlign.left,
                        decoration:  InputDecoration(
                          border: InputBorder.none,
                          hintText: '0',
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
                margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                child:Column(
                  children: [

                    WithoutAstrickText(CommonText.receiptAmount),
                    Container(
                      // width: 320,
                      child: const TextField(
                        //controller: emailController,
                        obscureText: true,
                        textAlign: TextAlign.left,
                        decoration:  InputDecoration(
                          border: InputBorder.none,
                          hintText: '0',
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
                margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                child: Column(
                  children: [
                    WithoutAstrickText(CommonText.receiptMode),
                    Container(
                      // margin: EdgeInsets.only(top:5,),
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
                                  isEmpty: _dropdownAddress == null,
                                  child:  DropdownButton<Address>(
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color:AppColor.GreyColor,
                                      size: 20.09,
                                    ),
                                    value: _dropdownAddressValue,
                                    isDense: true,
                                    onChanged: (Address? newValue) {
                                      print('value change');
                                      print(newValue);
                                      setState(() {
                                        _dropdownAddressValue = newValue;
                                        _address.text = _dropdownAddressValue!.addressCode!;
                                      });
                                    },
                                    items: _dropdownAddress!.map((Address value) {
                                      return DropdownMenuItem<Address>(
                                        value: value,
                                        child: Text(value!.addressCode.toString()),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 30,left: 15,right: 15,bottom: 30),
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
                          margin: EdgeInsets.only(left: 5),
                          padding: EdgeInsets.all(17),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColor.LighGreyColor,
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),

                          child: Text(CommonText.clear.toUpperCase(),textAlign: TextAlign.center, style: textStyle.RegularBold.copyWith(color: Colors.black,fontWeight: FontWeight.w700,),
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
      ),
    );
  }
}
