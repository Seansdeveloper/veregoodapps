import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:veregoodapps/screens/cart_page/cart_page.dart';
import 'package:veregoodapps/screens/category_skills.dart';
import 'package:veregoodapps/screens/explore_screen/ExploreScreen.dart';
import 'package:veregoodapps/screens/home_screen/home.dart';
import 'package:veregoodapps/screens/mobile_authitcation_screen/login.dart';
import 'package:veregoodapps/screens/profile_page/user_profile.dart';
import 'package:veregoodapps/widget/bottomNavigationbar.dart';
import 'controler/controller.dart';
import 'controler/landing_page_controller.dart';
import 'data/navigation_model.dart';

class HomeScreen extends StatefulWidget {
  dynamic index;

  HomeScreen(this.index, {Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _controller = ScrollController();
  int selectBtn = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final LandingPageController landingPageController =
  Get.put(LandingPageController(), permanent: false);

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(() {
          return Scaffold(
            extendBody: true,
            bottomNavigationBar: CurvedNavigationBar(
              buttonBackgroundColor: Color.fromRGBO(36, 94, 171, 1),
              backgroundColor: Colors.transparent,
              color: Colors.white,
              height: 60,
              index: widget.index,
              key: _bottomNavigationKey,
              items: <Widget>[
                Image.asset(
                  navBtn[0].imagePath,
                  color: landingPageController.tabIndex.value==0?Colors.white:null,
                  scale: 2.5,
                ),
                Image.asset(
                  navBtn[1].imagePath,
                  color:landingPageController.tabIndex.value==1?Colors.white:null,
                  scale: 2.5,
                ),
                Image.asset(
                  navBtn[2].imagePath,
                  color: landingPageController.tabIndex.value==2?Colors.white:null,
                  scale: 2.5,
                ),
                Image.asset(
                  navBtn[3].imagePath,
                  color: landingPageController.tabIndex.value==3?Colors.white:null,
                  scale: 2.5,
                ),
              ],
              onTap: landingPageController.changeTabIndex,
            ),
            resizeToAvoidBottomInset: false,
            backgroundColor: const Color.fromRGBO(36, 94, 171, 1),
            appBar:landingPageController.tabIndex.value==0?PreferredSize(
              preferredSize: Size.fromHeight(65),
              child: Padding(
                  padding:
                  const EdgeInsets.only(
                      top: 10, left: 10, right: 10,bottom: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: const TextStyle(fontSize: 22.0, color: Colors
                              .black),
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)),
                                  borderSide:
                                  BorderSide(color: Colors.white, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintStyle: const TextStyle(
                                color: Colors.black,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: const Icon(
                                Icons.search_rounded,
                                color: Colors.black,
                              ),
                              suffixIcon: const Icon(
                                Icons.mic,
                                color: Colors.black,
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                          onTap: () {
                            if (auth.currentUser == null) {
                              Get.to(() => LoginScreen());
                            }
                            else{
                              Get.to(() => CartPage());
                            }
                          },
                          child: Icon(
                            Icons.shopping_cart,
                            size: 30,
                            color: Colors.white,
                          ))
                    ],
                  )),
            ):null,
            body: IndexedStack(
              index: landingPageController.tabIndex.value,
              children: [
                HomePage(),
                UserProfile(),
                ExploreScreen(),
                CategoryDetails(),
              ],
            ),
          );
        }));
  }


}
