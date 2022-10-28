import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget customFileSelectDialog(){
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.black,width: 1),
    ),
    padding: EdgeInsets.all(10),


    child: Column(
     // mainAxisAlignment: MainAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text('Select File ',style: textStyle.Heading2.copyWith(),),

        ),
        Container(
          margin: EdgeInsets.only(top: 20,left: 10),
          child: Row(
            children: [
              Container(
                child: Image.asset('assets/camera.png',height: 20,width: 20,),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text('Camera ',style: textStyle.Regular.copyWith(),),

              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20,left: 10),
          child: Row(
            children: [
              Container(
                child: Image.asset('assets/upload_file.png',height: 20,width: 20,),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text('Upload File ',style: textStyle.Regular.copyWith(),),

              ),
            ],
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 20),
          // width: 320,
          child: Divider(
            thickness: 2.0,
            color: AppColor.LighGreyColor,
          ),
        ),

        InkWell(
          onTap: (){
            Get.back();
          },
          child: Container(
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            child: Text('CANCEL ',style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor),),

          ),
        ),
        /*Container(
          child: Divider(
            thickness: ,
          ),
        )*/



      ],
    ),

  );
}

Widget customGalleryDialog(){
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.black,width: 1),
    ),
    padding: EdgeInsets.all(10),


    child: Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text('Select Photo ',style: textStyle.Heading2.copyWith(),),

        ),
        Container(
          margin: EdgeInsets.only(top: 20,left: 10),
          child: Row(
            children: [
              Container(
                child: Image.asset('assets/camera.png',height: 20,width: 20,),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text('Camera ',style: textStyle.Regular.copyWith(),),

              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20,left: 10),
          child: Row(
            children: [
              Container(
                child: Image.asset('assets/update_photo.png',height: 20,width: 20,color: Colors.black,),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text('Gallery',style: textStyle.Regular.copyWith(),),

              ),
            ],
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 20),
          // width: 320,
          child: Divider(
            thickness: 2.0,
            color: AppColor.LighGreyColor,
          ),
        ),

        InkWell(
          onTap: (){
            Get.back();
          },
          child: Container(
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            child: Text('CANCEL ',style: textStyle.RegularBold.copyWith(color: AppColor.GreyColor),),

          ),
        ),
        /*Container(
          child: Divider(
            thickness: ,
          ),
        )*/



      ],
    ),

  );

}

/*

Widget customRadioDialog(){
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text('Gender', style: TextStyle(fontSize: 18)),
        Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: RadioListTile(
                      value: 0,
                      groupValue: _groupValue,
                      title: Text("Male"),
                      onChanged: (newValue) =>
                          setState(() => _groupValue = newValue),
                      activeColor: Colors.red,
                      selected: false,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: RadioListTile(
                      value: 1,
                      groupValue: _groupValue,
                      title: Text("Female"),
                      onChanged: (newValue) =>
                          setState(() => _groupValue = newValue),
                      activeColor: Colors.red,
                      selected: false,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  ),

}*/
