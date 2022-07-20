import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constant/image.dart';
import '../../constant/string.dart';
import '../../generated/assets.dart';
import '../../model/banner/banner.dart';
import '../../networking/api_service/api_service.dart';
import '../product_details_page/product_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 30,
          width: MediaQuery.of(context).size.width,
          color: const Color.fromRGBO(240, 207, 3, 1),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                InkWell(
                    onTap: () async {
                      Position position = await Geolocator.getCurrentPosition(
                          desiredAccuracy: LocationAccuracy.high);
                      print(position);
                    },
                    child: Icon(
                      Icons.location_on,
                      color: Colors.black,
                    )),
                const Text("India"),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: Strings.categories.length,
                        itemBuilder: (context, i) {
                          return categories(Strings.categories[i],Imagess.Categoies[i]);
                        }),
                  ),
                  FutureBuilder<List<headline>>(
                    future:ApiService.getBanner(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return CarouselSlider(
                          options: CarouselOptions(
                            height: 200,
                            aspectRatio: 16 / 9,
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration: Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                          ),
                          items:snapshot.data!.map((i) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(color: Colors.transparent),
                                child: GestureDetector(
                                    child: CachedNetworkImage(
                                      imageUrl: "http://38.130.130.45:8000"+i.image!,
                                      imageBuilder: (context, imageProvider) => Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                              colorFilter:
                                              ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
                                        ),
                                      ),
                                      placeholder: (context, url) => CircularProgressIndicator(),
                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                    ),
                                    onTap: () {}));
                          }).toList(),
                        );
                      }
                      else if(snapshot.hasError){
                        Text("${snapshot.hasError.toString()}");

                      }
                      return Center(child: CircularProgressIndicator());
                    }
                  ),
                  service(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(
                          "Best Selling product",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(
                          "See all ",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  bestSeller(),
                  accessories(context),
                  upToDeals()
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget categories(String text, categoi) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: GestureDetector(
        onTap: () {},
        child: Column(
          children: [
            ClipOval(
              child: SizedBox.fromSize(
                size: Size.fromRadius(30), // Image radius
                child: Image.asset(categoi, fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }

  Widget service() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Text(
            "Service",
            style: TextStyle(fontSize: 22),
          ),
        ),
        Row(

          children: [

            Container(
              height: 200,
              width: 200,
              color: Colors.red,
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 5),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.blue,
                          child: Image.asset(Assets.assetsBodyguard,
                              fit: BoxFit.contain),
                        ),
                        Text("bodygurad")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 5),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.blue,
                          child: Image.asset(Assets.assetsParking,
                              fit: BoxFit.contain),
                        ),
                        Text("Rent")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 5),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.blue,
                          child: Image.asset(
                            Assets.assetsStorage,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        Text("HouseRent")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 5),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.blue,
                          child: Image.asset(Assets.assetsBodyguard),
                        ),
                        Text("Pay")
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: 200,
                color: Colors.white,
                child: Image.asset(Assets.assetsShoeman2),
              ),
            ),
          ],
        ),

      ],
    );
  }

  Widget bestSeller() {
    return FutureBuilder<Object>(
      future: null,
      builder: (context, snapshot) {
        return Container(
          height: 450,
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 0.9,
            children: List<Widget>.generate(4, (index) {
              return GridTile(
                child: InkWell(
                  onTap: () {
                    Get.to(() => ProductDetails(Imagess.imageShoes[index]));
                  },
                  child: Card(
                      color: Colors.blue.shade200,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              Imagess.imageShoes[index],
                              height: 140,
                              alignment: Alignment.center,
                            ),
                            Text(
                              "Shoe Collection",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text("Sports wear", style: TextStyle(fontSize: 15))
                          ],
                        ),
                      )),
                ),
              );
            }),
          ),
        );
      }
    );
  }

  Widget accessories(context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              color: Colors.orangeAccent,
              child: Image.asset(
                Assets.assetsBackground,
                height: 150,
                width: double.infinity,
              )),
          Padding(
            padding: EdgeInsets.only(top: 2, left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Accessories",
                  style: TextStyle(fontSize: 20),
                ),
                Text("See all"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text("Shoes,bag,glasses"),
          ),
        ],
      ),
    );
  }

  upToDeals() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Up to 50% off- Deal of the day",
            style: TextStyle(fontSize: 22),
          ),
          Container(
              height: 450,
              child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  children: List<Widget>.generate(4, (index) {
                    return GridTile(
                      child: Card(
                        color: Colors.blue.shade200,
                        child: Image.asset(
                          Imagess.image[index],
                          height: 140,
                          alignment: Alignment.center,
                        ),
                      ),
                    );
                  })))
        ],
      ),
    );
  }
}
