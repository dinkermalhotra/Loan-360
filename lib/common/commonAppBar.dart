import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:flutter/cupertino.dart';
import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

Widget  appBar({String? appBarName, Callback? onPressed}){
  return Row(
    children: [
     Container(
        child: IconButton(
          onPressed: onPressed,
          icon: Image.asset("assets/menu.png",height: 20,width: 20,),
        ),
      ),
       Container(
         alignment:Alignment.topLeft,
           child: Text(appBarName!,textAlign: TextAlign.left,style: textStyle.Heading2.copyWith(),),
       ),

    ],
  );
}

Widget WithoutAstrickText(String text){
  return Container(
    child: Row(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(text,style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),
        ),

      ],
    ),
  );
}

Widget CommonAstrickText(String text){
  return Container(
    child: Row(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(text,style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor)),
        ),
        Container(
          child: Icon(
            Icons.star,size: 10,color: Colors.red,
          ),
        )
      ],
    ),
  );
}