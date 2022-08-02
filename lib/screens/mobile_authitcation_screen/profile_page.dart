

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:veregoodapps/homeScreen.dart';
import 'package:veregoodapps/networking/api_service/api_service.dart';
import 'package:veregoodapps/screens/onborading_screen/onborading_screen.dart';

import '../../auth_file/user_controller.dart';
import '../../constant/color.dart';
import '../../controler/text_controller.dart';
import '../../generated/assets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  bool _status = false;
  final FocusNode myFocusNode = FocusNode();

  final Name = Get.put(TextController());
  final email = Get.put(TextController());
  final mobileNumber = Get.put(TextController());
  final countryCode = Get.put(TextController());
  final myController = Get.put(UserController());
  final controller = Get.find<TextController>();



  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appbar,
      body: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 90),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(
                      240,
                      207,
                      3,
                      1,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 100),
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                color: Theme.of(context).backgroundColor,
              ),
              child: ListView(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text("Create Your Profile",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Poppins-Regular",
                        )),
                  ),

                  Center(
                    child: Stack(fit: StackFit.loose, children: <Widget>[
                      CircleAvatar(
                        radius: 70,
                        backgroundColor:Color(0xffF5F5F5),
                        child: image == null?Image.asset(Assets.assetsPerson):ClipOval(child: Image.file(image!,   fit: BoxFit.cover,)),
                      ),
                      Padding(
                          padding:
                              const EdgeInsets.only(top: 90.0, right: 100.0),
                          child: GestureDetector(
                            onTap: (){
                              pickImage();
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 20.0,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                            ),
                          )),
                    ]),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 30,top: 30),
                    child: Row(
                      children: [
                        Flexible(
                          
                          child: TextField(
                              controller: controller.nameTextController,
                              decoration: InputDecoration(
                                fillColor: Color(0xffF5F5F5),
                                filled: true,
                                hintText: "First Name".tr,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffF5F5F5), width: 0),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffF5F5F5), width: 0),
                                    borderRadius: BorderRadius.circular(14)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffF5F5F5), width: 0),
                                    borderRadius: BorderRadius.circular(14)),
                              ),
                              enabled: !_status,
                              autofocus: !_status,
                              onChanged: (value) {}),
                        ),
                        SizedBox(width: 10,),
                        Flexible(
                          child: TextField(

                              decoration: InputDecoration(
                                fillColor: Color(0xffF5F5F5),
                                filled: true,
                                hintText: "Last Name".tr,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffF5F5F5), width: 0),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffF5F5F5), width: 0),
                                    borderRadius: BorderRadius.circular(14)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffF5F5F5), width: 0),
                                    borderRadius: BorderRadius.circular(14)),
                              ),
                              enabled: !_status,
                              autofocus: !_status,
                              onChanged: (value) {}),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: TextField(
                        controller: controller.mobileNumberTextController,
                        decoration: InputDecoration(
                          fillColor: Color(0xffF5F5F5),
                          filled: true,
                          hintText: "Mobile Number".tr,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffF5F5F5), width: 0),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffF5F5F5), width: 0),
                              borderRadius: BorderRadius.circular(14)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffF5F5F5), width: 0),
                              borderRadius: BorderRadius.circular(14)),
                        ),
                        enabled: !_status,
                        autofocus: !_status,
                        onChanged: (value) {}),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: TextField(
                        controller: controller.emailTextController,
                        decoration: InputDecoration(
                          hintText: "Enter the Email Id".tr,
                          fillColor: Color(0xffF5F5F5),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffF5F5F5), width: 0),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffF5F5F5), width: 0),
                              borderRadius: BorderRadius.circular(14)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffF5F5F5), width: 0),
                              borderRadius: BorderRadius.circular(14)),
                        ),
                        enabled: !_status,
                        autofocus: !_status,
                        onChanged: (value) {}),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: TextField(
                        decoration: InputDecoration(
                          hintText: "Date of birth ".tr,
                          fillColor: Color(0xffF5F5F5),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffF5F5F5), width: 0),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffF5F5F5), width: 0),
                              borderRadius: BorderRadius.circular(14)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffF5F5F5), width: 0),
                              borderRadius: BorderRadius.circular(14)),
                        ),
                        enabled: !_status,
                        autofocus: !_status,
                        onChanged: (value) {}),
                  ),



                  GestureDetector(
                    onTap: (){
                      if(controller.nameTextController.value.text.isNotEmpty||controller.emailTextController.value.text.isNotEmpty||controller.mobileNumberTextController
                          .value.text.isNotEmpty){
                        ApiService.updatedata(controller.nameTextController.value.text
                          ,controller.emailTextController.value.text
                          ,controller.mobileNumberTextController
                              .value.text,);
                      }
                     else{
                        Get.snackbar(
                          "updated faild",
                          "Oops.. pls fill the details",
                          snackPosition: SnackPosition.BOTTOM,
                        );


    }

                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 80,right: 80),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:appbar,

                      ),

                      child: Text("Submit",textAlign: TextAlign.center,style: TextStyle(fontSize: 22,color: Colors.white,),),
                    ),
                  )


                ],
              )
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }



}
