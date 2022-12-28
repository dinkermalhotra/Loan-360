



import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonDialog.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:Loan360Cloud/ui/statementOfAccountSearch.dart';
import 'package:Loan360Cloud/ui/updateAddress.dart';
import 'package:easy_signature_pad/easy_signature_pad.dart';
import 'package:flutter/material.dart';
import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';


class Signature extends StatefulWidget {
  const Signature({Key? key}) : super(key: key);

  @override
  State<Signature> createState() => _SignatureState();
}

class _SignatureState extends State<Signature> {
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
      return Scaffold(
        appBar: AppBar(
           automaticallyImplyLeading: false,
         title: appBar(appBarName:CommonText.signatureTitle.toString(),
       ),
    ),
      body: Container(
        child: Column(
          children: [

            Container(
              margin: EdgeInsets.only(left: 10,right: 10),

              height: 300,
              child: Card(
                child: EasySignaturePad(
                  onChanged: (image) {
                   // setImage(image);
                  },
                  height: size.width ~/ 2,
                  width: size.width ~/ 1,
                  penColor: Colors.black,
                  strokeWidth: 1.0,
                  borderRadius: 10.0,
                  borderColor: Colors.white,
                  backgroundColor: Colors.white,
                  transparentImage: false,
                  transparentSignaturePad: false,
                  hideClearSignatureIcon: true,
                ),
              ),
            ),

            Container(
                  margin: EdgeInsets.only(top: 30,left: 15,right: 15),
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
                            child: Text("Save",textAlign: TextAlign.center, style: textStyle.RegularBold.copyWith(color: Colors.white,fontWeight: FontWeight.w700,),
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
                                borderRadius: BorderRadius.all(Radius.circular(40)),
                                border: Border.all(color: Colors.blueAccent)

                              //borderRadius: BorderRadius.all(Radius.circular(40)),
                            ),

                            child: Text("Clear",textAlign: TextAlign.center, style: textStyle.RegularBold.copyWith(color: Colors.black,fontWeight: FontWeight.w700,),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                )
          ],
        ),
      ),
    );
  }
}
