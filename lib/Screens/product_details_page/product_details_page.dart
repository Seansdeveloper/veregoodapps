import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:veregoodapps/controler/controller.dart';
import 'package:veregoodapps/model/product.dart';
import '../../constant/string.dart';
import '../../model/category/category_product_list.dart';
import '../../networking/service/location_service.dart';
import '../../constant/color.dart';
import '../../constant/image.dart';
import '../cart_page/cart_page.dart';
import '../delivery_address.dart';
import '../mobile_authitcation_screen/login.dart';

class ProductDetails extends StatefulWidget {
  final ProductList? categoryProduct;
  final int? index;

  ProductDetails(this.categoryProduct, this.index);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {








  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      bottomNavigationBar: bottomNavigationBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            height: 60,
            color: appbar,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 28,
                      color: Colors.white,
                    )),
                Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: 22,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => CartPage());
                      },
                      child: Icon(
                        Icons.shopping_cart,
                        size: 22,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: "HERO" + [widget.index].toString(),
                child: CachedNetworkImage(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  imageUrl: widget.categoryProduct!.image.toString(),
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress)),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, top: 10),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.share, color: Colors.grey),
                      )),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: 'Color :'),
                              TextSpan(
                                  text: 'Red',
                                  style: TextStyle(color: Colors.red)),
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: 'Avaiables :'),
                              TextSpan(text: '14'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: Imagess.imageShoes.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 100,
                            height: 100,
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl: widget.categoryProduct!.image.toString(),
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Center(
                                        child: CircularProgressIndicator(
                                            value: downloadProgress.progress)),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 10),
                    child: Text(
                      widget.categoryProduct!.title.toString(),
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, bottom: 5),
                    child: Text(
                      "\$${widget.categoryProduct!.price}",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, bottom: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Color.fromRGBO(240, 207, 3, 1),
                        ),
                        Icon(
                          Icons.star,
                          color: Color.fromRGBO(240, 207, 3, 1),
                        ),
                        Icon(
                          Icons.star_border,
                          color: Color.fromRGBO(240, 207, 3, 1),
                        ),
                        Icon(
                          Icons.star_border,
                          color: Color.fromRGBO(240, 207, 3, 1),
                        ),
                        Icon(
                          Icons.star_border,
                          color: Color.fromRGBO(240, 207, 3, 1),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 2.5,
                    color: Color.fromRGBO(231, 231, 231, 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, bottom: 5),
                    child: Text(
                      "Size",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, bottom: 10),
                    child: SizedBox(
                        height: 35,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, i) {
                              List text = ["S", "M", "L"];
                              return Container(
                                height: 35,
                                width: 35,
                                margin: EdgeInsets.only(left: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1, color: Colors.black),
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor),
                                child: FittedBox(child: Text(text[i])),
                              );
                            })),
                  ),
                  Divider(
                    thickness: 2.5,
                    color: Color.fromRGBO(231, 231, 231, 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 5, top: 5, left: 5, right: 5),
                    child: Text(
                      "Product Details",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 5, top: 5, left: 5, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Type",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "Wireless",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 5, top: 2, left: 5, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Bluetooth version",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "5",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 5, top: 2, left: 5, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "WireLess Range",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "10 m",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 5, top: 10, left: 5, right: 5),
                    child: Text(
                      "Description",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 10, left: 5, right: 5),
                    child: Text(
                      widget.categoryProduct!.description.toString(),
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Divider(
                    thickness: 2.5,
                    color: Color.fromRGBO(231, 231, 231, 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: FutureBuilder<String>(
                        future: CurrentLocation.currentPosition(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            Text("please provide the location");
                          } else if (snapshot.hasData) {
                            return Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'Deliver To : ',
                                      style: TextStyle(fontSize: 16)),
                                  TextSpan(
                                      text:
                                          snapshot.data,
                                      style: TextStyle(fontSize: 12)),
                                ],
                              ),
                            );
                          }
                          return Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Deliver To : ',
                                    style: TextStyle(fontSize: 16)),
                                TextSpan(
                                    text:
                                        'Loading...',
                                    style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          );
                        }),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 40,
                      width: 90,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Theme.of(context).backgroundColor,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Theme.of(context).cardColor.withOpacity(0.5),
                              offset: Offset(1.0, 1.0), //(x,y)
                              blurRadius: 1.0,
                            ),
                          ]),
                      child: FittedBox(child: Text("change")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                    child: Divider(
                      thickness: 2.5,
                      color: Color.fromRGBO(231, 231, 231, 1),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Similar Product",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 5, right: 5, bottom: 10),
                    child: SizedBox(
                      height: 200,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 7,
                          itemBuilder: (context, i) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 150,
                                    width: 140,
                                    margin: EdgeInsets.only(right: 10),
                                    color: Colors.white,
                                    child: Image.asset(
                                      Imagess.imageCap[i],
                                      height: 120,
                                      width: 120,
                                    )),
                                Text(
                                  "Product Name",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "\$100",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            );
                          }),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  bottomNavigationBar() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (auth.currentUser == null) {
              Get.to(() => LoginScreen());
            }
            else{

              Strings.productList.add(widget.categoryProduct!);
              print(Strings.productList);
              Get.snackbar(
                "Add to cart",
                "Item is added in cart",
                snackPosition: SnackPosition.BOTTOM
              );
            }
          },
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width / 2,
            color: Colors.red,
            padding: EdgeInsets.all(10),
            child: FittedBox(child: Text("Add to Cart")),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (auth.currentUser == null) {
              Get.to(() => LoginScreen());
            }
            else{
              Get.to(() => AddAddress());
            }
          },
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width / 2,
            color: appbar,
            padding: EdgeInsets.all(10),
            child: FittedBox(child: Text("Buy Now")),
          ),
        )
      ],
    );
  }
}
