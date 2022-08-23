import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../../constant/string.dart';
import '../../controler/controller.dart';
import '../../generated/assets.dart';
import '../../widget/list_view.dart';
import '../constant_ui/appbar.dart';
import '../mobile_authitcation_screen/profile_page.dart';


class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}



class _UserProfileState extends State<UserProfile> {



  @override
void initState()  {

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
    return Column(
    mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Appbar("MyAccount"),
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).backgroundColor,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 120,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,top: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 45,
                                backgroundColor: Colors.grey,
                                child: Image.asset(
                                  Assets.assetsPerson,
                                  fit: BoxFit.cover,
                                ),

                              ),
                              Positioned.fill(child: Align(
                                alignment: Alignment.bottomRight,
                                child: InkWell(
                                  onTap:() {
                                    pickImage();
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 10,
                                    child: Icon(Icons.camera_alt,size: 14,color: Colors.black,),
                                  ),
                                ),
                              ))
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20,left: 20,right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Saurav singh",style: TextStyle(fontSize: 18),),
                                      InkWell(
                                        onTap: (){
                                          Get.to(()=>ProfilePage());
                                        },
                                        child: CircleAvatar(
                                          radius: 15,
                                          backgroundColor: Colors.white,
                                          child: Icon(Icons.edit,size: 18,),

                                        ),
                                      )
                                    ],
                                  ),
                                  Text("seans@aaitpro.com"),
                                  Text("+91-000000000"),
                                ],
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2.5,
                  ),

                  SizedBox(
                    height: 480,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: Strings.acountList.length,
                        itemBuilder:(
                            context,i){
                      return InkWell(
                        onTap: (){
                          authController.signOut();
                        },
                          child: ListField(Strings.acountList[i]));
                    }),
                  ),

                  InkWell(
                    onTap: (){
                     // Condition();
                      if (kDebugMode) {
                        print("FAQ'S");

                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0,bottom: 5),
                      child: Text("FAQ'S"),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      // Condition();
                      if (kDebugMode) {
                        print("ABOUT US");

                      }},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0,bottom: 5),
                      child: Text("ABOUT US"),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      // Condition();

                      if (kDebugMode) {
                      print("TEAMS & CONDITION");

                    }
                    },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0,bottom: 5),
                        child: Text("TEAMS & CONDITION"),
                      ),
                    ),
                  InkWell(
                    onTap: (){
                      // Condition();
                      if (kDebugMode) {
                        print("PRIVACY POLICY");

                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0,bottom: 5),
                      child: Text("PRIVACY POLICY"),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  )

                ],
              ),
            ),
          ),
        )
      ],
    );
  }



}
