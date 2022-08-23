import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant/image.dart';
import '../../constant/string.dart';
import '../../generated/assets.dart';
import '../../model/banner/banner.dart';
import '../../model/category/category.dart';
import '../../model/collection/collection.dart';
import '../../model/product_list/product_list.dart';
import '../../networking/api_service/api_service.dart';
import '../../networking/service/location_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 30,
          padding: const EdgeInsets.only(left: 10),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(240, 207, 3, 1),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5))),
          child: Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.black,
              ),
              FutureBuilder<String>(
                  future: CurrentLocation.currentPosition(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      Text("please provide the location");
                    } else if (snapshot.hasData) {
                      return Text(snapshot.data!);
                    }
                    return Text("Loading....");
                  }),
            ],
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
                    child: FutureBuilder<List<Category>>(
                      future: ApiService.getListCategory(),
                      builder: (context, snapshot) {
                        if(snapshot.hasError){
                             Text("something is wrong");
                        }
                        else if(snapshot.hasData){
                          return  ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: Strings.categories.length,
                                itemBuilder: (context, i) {
                                  return GestureDetector(
                                      onTap: (){


                                      },
                                      child: categories(snapshot.data![i].name.toString(), snapshot.data![i].icon.toString()));
                                });
                        }
                        return CircularProgressIndicator();

                      }
                    ),
                  ),
                  FutureBuilder<List<headline>>(
                      future: ApiService.getBanner(),
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
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                            ),
                            items: snapshot.data!.map((i) {
                              return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration:
                                      BoxDecoration(color: Colors.transparent),
                                  child: GestureDetector(
                                      child: CachedNetworkImage(
                                        imageUrl: "http://38.130.130.45:8000"+
                                            i.image!,
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                      onTap: () {}));
                            }).toList(),
                          );
                        } else if (snapshot.hasError) {
                          Text("${snapshot.hasError.toString()}");
                        }
                        return Center(child: CircularProgressIndicator());
                      }),
                  service(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(
                          "Best Selling Products",
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
                  // FutureBuilder<List<Collections>>(
                  //   future: null,
                  //   builder: (context, snapshot) {
                  //     if(snapshot.hasData){
                  //       return
                  //     }
                  //     else if(snapshot.hasError)
                  //       {
                  //         Text("no offers find");
                  //       }
                  //
                  //     return Text("Loding...");
                  //   }
                  // ),
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
                child:  CachedNetworkImage(
                  imageUrl: "http://38.130.130.45:8000"+
                      categoi.toString(),
                  imageBuilder:
                      (context, imageProvider) =>
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                  placeholder: (context, url) => Center(
                      child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error),
                ),
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
        SizedBox(
          height: 200,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: Wrap(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 5),
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
                        padding:
                            const EdgeInsets.only(left: 14, right: 6, top: 5),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.blue,
                              child: Image.asset(Assets.assetsSpace,
                                  fit: BoxFit.contain),
                            ),
                            Text("Rent")
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 5),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.blue,
                              child: Image.asset(
                                Assets.assetsRent,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            Text("HouseRent")
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 14, right: 6, top: 5),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.blue,
                              child: Image.asset(Assets.assetsGoodiepay),
                            ),
                            Text("Goodiepay")
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                          height: 200,
                          width: 200,
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(Assets.assetsRent),
                              Text(
                                "Enjoy renting services if you need any help you can enjoy you",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget bestSeller() {
    return FutureBuilder<List<ProductData>>(
        future: ApiService.getData("best-selling"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              height:
                  (MediaQuery.of(context).orientation == Orientation.landscape)
                      ? 220
                      : 450,
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: (MediaQuery.of(context).orientation ==
                        Orientation.landscape)
                    ? 4
                    : 2,
                childAspectRatio: 0.8,
                children: List<Widget>.generate(snapshot.data!.length, (index) {
                  return GridTile(
                    child: InkWell(
                      onTap: () {
                        // Get.to(() => ProductDetails(s));
                      },
                      child: Card(
                          color: Colors.blue.shade200,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: "http://38.130.130.45:8000"+
                                      snapshot.data![index].product!.image
                                          .toString(),
                                  imageBuilder:
                                      (context, imageProvider) =>
                                      Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                  placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),

                                Text(
                                  snapshot.data![index].product!.title
                                      .toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    snapshot.data![index].product!.price
                                        .toString(),
                                    maxLines: 2,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(fontSize: 15))
                              ],
                            ),
                          )),
                    ),
                  );
                }),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("error");
          }
          return CircularProgressIndicator();
        });
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
              height:
                  (MediaQuery.of(context).orientation == Orientation.landscape)
                      ? 300
                      : 450,
              child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: (MediaQuery.of(context).orientation ==
                          Orientation.landscape)
                      ? 4
                      : 2,
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
                  }))),
        ],
      ),
    );
  }
}
