import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:veregoodapps/screens/cart_page/cart_page.dart';
import 'package:veregoodapps/screens/home_screen/home.dart';
import 'package:veregoodapps/screens/mobile_authitcation_screen/profile_page.dart';
import 'package:veregoodapps/screens/product_details_page/product_details_page.dart';
import 'package:veregoodapps/screens/profile_page/profile_page.dart';
import 'package:veregoodapps/screens/service_page/service_page.dart';
import 'constant/image.dart';
import 'controler/landing_page_controller.dart';
import 'controler/text_controller.dart';
import 'data/navigation_model.dart';
import 'generated/assets.dart';

class HomeScreen extends StatefulWidget {
  dynamic index;

  HomeScreen(this.index, {Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _controller = ScrollController();
  late Position position;
  int selectBtn = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final LandingPageController landingPageController =
  Get.put(LandingPageController(), permanent: false);

  @override
  initState() {
    super.initState();
    Future<Position> locateUser() async {
      return Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    }
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
                  color: Colors.red,
                  scale: 2,
                ),
                Image.asset(
                  navBtn[1].imagePath,
                  color: Colors.red,
                  scale: 2,
                ),
                Image.asset(
                  navBtn[2].imagePath,
                  color: Colors.red,
                  scale: 2,
                ),
                Image.asset(
                  navBtn[3].imagePath,
                  color: Colors.red,
                  scale: 2,
                ),
              ],
              onTap: landingPageController.changeTabIndex,
            ),
            resizeToAvoidBottomInset: false,
            backgroundColor: const Color.fromRGBO(36, 94, 171, 1),
            appBar:landingPageController.tabIndex.value!=3? PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: Padding(
                  padding:
                  const EdgeInsets.only(
                      top: 30, left: 10, right: 10, bottom: 10),
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
                            Get.to(() => CartPage());
                          },
                          child: Icon(
                            Icons.shopping_cart,
                            size: 25,
                          ))
                    ],
                  )),
            ):null,
            body: IndexedStack(
              index: landingPageController.tabIndex.value,
              children: [
                HomePage(),
                Text("second page"),
                ServicePage(),
                UserProfile(),
              ],
            ),
          );
        }));
  }


}
