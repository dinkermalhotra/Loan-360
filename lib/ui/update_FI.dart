
import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:Loan360Cloud/ui/updateAddress.dart';
import 'package:flutter/material.dart';

class UpdateFI extends StatefulWidget {
  const UpdateFI({Key? key}) : super(key: key);

  @override
  State<UpdateFI> createState() => _UpdateFIState();
}

class _UpdateFIState extends State<UpdateFI> {

  static List<Address>? _dropdownAddress = [];

  final formKey = new GlobalKey<FormState>();

  // var controller = new MaskedTextController(mask: '(000) 000 0000');

  String?  _errorText;
  final _address = TextEditingController();
  Address? _dropdownAddressValue;
  bool? isMan = false;
  // TextEditingController phoneController = new TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dropdownAddress!.add(Address(addressCode: 'Select'));
    _dropdownAddressValue = _dropdownAddress![0];

    //_dropdownValue = _dropdownItems![0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Text('Update FI'),

        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Container(
                  child: Image.asset("assets/updated.png",height: 20,width: 20,),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Text("Update",style: textStyle.Regular.copyWith(color: AppColor.greenColor),),
                ),

                
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 70,
                margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                child:Column(
                  children: [

                    WithoutAstrickText(CommonText.residenceReport),
                    Container(
                      child: const TextField(
                        obscureText: true,
                        textAlign: TextAlign.left,
                        decoration:  InputDecoration(
                          border: InputBorder.none,
                          hintText: '0',
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
              Container(
                height: 70,
                margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                child:Column(
                  children: [

                    WithoutAstrickText(CommonText.applicationRefNo),
                    Container(
                      child: const TextField(
                        obscureText: true,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '0',
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

              Container(
                height: 70,
                margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                child:Column(
                  children: [

                    WithoutAstrickText(CommonText.agencyName),
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

                    WithoutAstrickText(CommonText.applicationName),
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

                    WithoutAstrickText(CommonText.residenceAddress),
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
              /*Container(
                height: 70,
                margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                child:Column(
                  children: [

                    WithoutAstrickText(CommonText.addressConfirmed),
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
              ),*/


              Container(
                height: 70,
                margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                child: Column(
                  children: [
                    WithoutAstrickText(CommonText.addressConfirmed),
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
                    WithoutAstrickText(CommonText.landMark),
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

                    WithoutAstrickText(CommonText.dateOfVisit),
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

                    WithoutAstrickText(CommonText.timeOfVisit),
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
                margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                //alignment:Alignment.topLeft,
                child: Text(CommonText.uploadFIinformation,textAlign: TextAlign.left,style: textStyle.Regular.copyWith(),),
              ),

              Container(
                height: 70,
                margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                child:Column(
                  children: [

                    WithoutAstrickText(CommonText.personContacted),
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

                    WithoutAstrickText(CommonText.relationApplicant),
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

                    WithoutAstrickText(CommonText.dobApplicant),
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

                    WithoutAstrickText(CommonText.yearLived),
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
                    WithoutAstrickText(CommonText.residential),
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
                    WithoutAstrickText(CommonText.education),
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
                    CommonAstrickText(CommonText.result),
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
                    CommonAstrickText(CommonText.microPhoneLang),
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

                    WithoutAstrickText(CommonText.remarks),
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
                margin: EdgeInsets.only(left: 15,right: 15,top:20,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            child: Image.asset("assets/add_contact.png",height: 20,width: 20,),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child:Text("ADD LOCAL CONTACTS",style: textStyle.Regular.copyWith(color: AppColor.ThemeColor),) ,
                          )
                        ],
                      ),
                    ),

                    Container(
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                               decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.ThemeColor,
                            ),
                            child:Image.asset("assets/voice.png",height: 30,width: 30,fit: BoxFit.fill,color: Colors.white)
                          ),

                         /* Container(
                            child: Image.asset("assets/mic.png",height: 50,width: 50,fit: BoxFit.fill,),
                          ),*/
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child:  Image.asset("assets/cross.png",height: 50,width: 50,fit: BoxFit.fill,),                          )
                        ],
                      ),
                    )



                  ],
                ),
              ),



              button()

            ],
          ),
        ),
      ),
    );
  }
  Widget button(){
    return Container(
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
    );
  }
}
