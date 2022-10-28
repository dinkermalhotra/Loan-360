import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:Loan360Cloud/ui/updateAddress.dart';
import 'package:flutter/material.dart';

class DocumentAttachment extends StatefulWidget {
  const DocumentAttachment({Key? key}) : super(key: key);

  @override
  State<DocumentAttachment> createState() => _DocumentAttachmentState();
}

class _DocumentAttachmentState extends State<DocumentAttachment> {

  static List<Address>? _dropdownAddress = [];
  static final GlobalKey<ScaffoldState> _key = GlobalKey();
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
            alignment:Alignment.topLeft,
            child: Text(CommonText.documentAttachment,style: textStyle.Heading2.copyWith(),)),
      ),
      body: Container(
        child: Column(
          children: [

            Container(
              height: 70,
              margin: EdgeInsets.only(left: 15,right: 15,top:20,),
              child: Column(
                children: [
                  WithoutAstrickText(CommonText.childDocument),
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
                  CommonAstrickText(CommonText.originalPhoto),
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

                  WithoutAstrickText(CommonText.expireOn),
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
              margin: EdgeInsets.only(left: 15,right: 15,top:10,),
              child: Row(
                children: [
                  Container(
                    child: Image.asset("assets/upload.png",height: 20,width: 20,),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5,),
                    child: Text(CommonText.chooseFile,style: textStyle.RegularBold.copyWith(color: AppColor.ThemeColor),),
                  )
                ],
              ),
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
                          value: isMan,
                          onChanged: (value) {
                            setState(() {
                              isMan = value!;

                            });
                          }),
                    ),
                    Text("Sign On Document",style: textStyle.RegularBold.copyWith()),

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
                          value: isMan,
                          onChanged: (value) {
                            setState(() {
                              isMan = value!;

                            });
                          }),
                    ),
                    Text("Original Seen & Verified",style: textStyle.RegularBold.copyWith()),

                  ]),

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
    );
  }
}
