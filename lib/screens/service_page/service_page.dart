import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:veregoodapps/networking/api_service/api_service.dart';

import '../../constant/color.dart';

import '../../model/product.dart';
import '../../model/product.dart';
import '../error_screens/error_screen.dart';
import '../product_details_page/product_details_page.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            color: appbar,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Category name",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.search_rounded,
                  size: 22,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Icon(
                    Icons.shopping_cart,
                    size: 22,
                  ),
                )
              ],
            ),
          ),
          Expanded(child: cardPage()),
        ],
      ),
    );
  }

  Widget cardPage() {
    return FutureBuilder<List<ProductList>>(
        future: ApiService.getProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.72, crossAxisCount: 2),
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: (){

                      Get.to(()=>ProductDetails(snapshot.data![index]));


                    },

                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Hero(
                              tag: "HERO",
                              child: CachedNetworkImage(
                                height: 100,
                                imageUrl: snapshot.data![index].image.toString(),
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Center(
                                        child: CircularProgressIndicator(
                                            value: downloadProgress.progress)),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          Text(
                            snapshot.data![index].title.toString(),
                            style: TextStyle(color: Colors.black,fontSize: 16),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(),
                                  child: Text("\$${snapshot.data![index].price}",
                                      style: TextStyle(color: Colors.black,fontSize: 18)),
                                ),
                                Container(
                                  padding: EdgeInsets.all(2),
                                  height: 20,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.green,
                                  ),

                                  child: FittedBox(child: Text("10% off")),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text("Free delivery",
                                style: TextStyle(color: Colors.green,fontSize: 16)),
                          ),

                          Align(
                            alignment: Alignment.bottomRight,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(appbar),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      ),
                                ),

                              ),
                              onPressed: () {},
                              child: Text('Buy'),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: snapshot.data!.length);
          } else if (snapshot.hasError) {
            print(snapshot.hasError.toString());
            return ErrorScreen();
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
