







import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constant/color.dart';
import '../../controler/controller.dart';
import '../cart_page/cart_page.dart';
import '../mobile_authitcation_screen/login.dart';

class Appbar extends StatelessWidget {
  final String content;


  Appbar(this.content);

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      color: appbar,
      child: Padding(
        padding: const EdgeInsets.only(top: 15,right: 5,left: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(content,style: TextStyle(fontSize: 22,color:Colors.white),),
            Row(children: [
              Icon(Icons.search,size: 30,color:Colors.white),
              SizedBox(width: 10,),
              GestureDetector(
                  onTap: () {
                    if (auth.currentUser == null) {
                      Get.to(() => LoginScreen());
                    }
                    else{
                      Get.to(() => CartPage());
                    }
                  },
                  child: Icon(Icons.shopping_cart,size: 30,color:Colors.white))
            ],)
          ],
        ),
      ),
    );
  }

}
