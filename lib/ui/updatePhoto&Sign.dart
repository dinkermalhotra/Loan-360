import 'package:Loan360Cloud/common/appColor.dart';
import 'package:Loan360Cloud/common/commonAppBar.dart';
import 'package:Loan360Cloud/common/commonDialog.dart';
import 'package:Loan360Cloud/common/commonText.dart';
import 'package:Loan360Cloud/common/drawer.dart';
import 'package:Loan360Cloud/ui/signature.dart';
import 'package:Loan360Cloud/ui/statementOfAccountSearch.dart';
import 'package:Loan360Cloud/ui/updateAddress.dart';
import 'package:flutter/material.dart';
import 'package:Loan360Cloud/common/textStyle.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';


bool? Visible= false;
var decodeMap;
class UpdatePhotoSign extends StatefulWidget {
  UpdatePhotoSign({Key? key,Map? decode,bool? visible}){
    decodeMap = decode;
    Visible = visible;
  }

  @override
  State<UpdatePhotoSign> createState() => _UpdatePhotoSignState();
}

class _UpdatePhotoSignState extends State<UpdatePhotoSign> {
 GlobalKey<ScaffoldState> updatePhotoSignKey = GlobalKey();
  static List<Customer>? _dropdownCustomer = [];
 List<String> dropdownData= [];
 String? customerDropDownValue;
 String?  _errorText;
 String? loanId;
 String? customerId;

 final _customer = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(decodeMap!=null){
      dropdownData.clear();
      dropdownData!.add('Select');
      customerDropDownValue = dropdownData![0];
      print("decodeMap");
      print(decodeMap!['loanUserName']??"");
      dropdownData.add(decodeMap!['loanUserName']);
      loanId = decodeMap!['loanId']??"";
      customerId = decodeMap!['customerId']??"";

    }
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Scaffold(
      key:  updatePhotoSignKey,
      drawer: Drawer(
        child: DrawerScreen(),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: appBar(appBarName:CommonText.updatePhotoSignTitle.toString(),
           onPressed: (){
          if (updatePhotoSignKey.currentState != null) {
            if (updatePhotoSignKey.currentState!.isDrawerOpen) {
              updatePhotoSignKey.currentState!.closeDrawer();
            } else {
              updatePhotoSignKey.currentState!.openDrawer();
            }
          }
        }),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 15,right: 15,top:30,),
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

                            decoration:const InputDecoration(
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
                      Get.to(()=> StatementAccountSearch(callback: "upPhotoAndSign",));

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
              visible:Visible!,
              child: Container(
                margin: EdgeInsets.only(left: 20,top:10,),
                alignment: Alignment.centerLeft,
                child:  decodeMap!=null
                    ? Text("Customer Name: "+ decodeMap!['loanUserName']?? '',style: textStyle.RegularBold.copyWith(color: Colors.black))
                    : Text("",style: textStyle.RegularBold.copyWith(color: Colors.black)),
              ),
            ),

            Container(
              height: 70,
              margin: EdgeInsets.only(left: 15,right: 15,top:20,),
              child: Column(
                children: [
                  CommonAstrickText(CommonText.customer),


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
                                  hintStyle: TextStyle(color: Colors.grey),
                                  errorText: _errorText,
                                ),
                                isEmpty: customerDropDownValue == null,
                                child:  DropdownButton<String>(
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color:AppColor.GreyColor,
                                    size: 20.09,
                                  ),
                                  value: customerDropDownValue,
                                  isDense: true,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      customerDropDownValue = newValue!;
                                     // customerName.text = mobileController!.dropdownData!.toString();
                                    });
                                  },
                                  items: dropdownData!.map((String? value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value!.toString(),style: textStyle.Regular.copyWith()),
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
              margin: EdgeInsets.only(top: 30,left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                          Dialog(
                               shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(20.0)),
                            child: Container(
                                height: 200,
                                child: customGalleryDialog(onCamera,onGallery)),
                          ),
                        );

                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 5),
                        padding: EdgeInsets.all(17),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.ThemeColor,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        child: Text(CommonText.photo.toUpperCase(),textAlign: TextAlign.center, style: textStyle.RegularBold.copyWith(color: Colors.white,fontWeight: FontWeight.w700,),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child:InkWell(
                      onTap: (){
                        showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(20.0)),
                              child: Container(
                                  height: 250,
                                  child: customSignDialog(onCamera,onGallery,onSingature)),
                            ),
                      );


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

                        child: Text(CommonText.signature.toUpperCase(),textAlign: TextAlign.center, style: textStyle.RegularBold.copyWith(color: Colors.black,fontWeight: FontWeight.w700,),
                        ),
                      ),
                    ),
                  )

                ],
              ),
            ),
            InkWell(
              onTap: (){

              },
              child: Container(
                margin: EdgeInsets.only(top: 30,),
                child: Text(CommonText.reset.toUpperCase(),textAlign: TextAlign.center, style: textStyle.RegularBold.copyWith(color:AppColor.ThemeColor,fontWeight: FontWeight.w700,),            ),
              ),
            ),



          ],
        ),

      ),
    );
  }

  void onCamera(){
    loadImage();
  }

 void onGallery(){
   loadGallery();
 }



 void onSingature(){
    Get.to(()=> Signature());

 }
 final ImagePicker _picker = ImagePicker();
 Future loadImage() async {



   // Capture a photo
   final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

   setState(() {
     if (photo != null) {
       //_image = File(pickedFile.path);

       print('_image: ${photo.path}');
     } else {
       print('No image selected');
     }
   });
 }

 Future loadGallery() async {



   // Capture a photo
   final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);

   setState(() {
     if (photo != null) {
       //_image = File(pickedFile.path);

       print('_image: ${photo.path}');
     } else {
       print('No image selected');
     }
   });
 }

}
