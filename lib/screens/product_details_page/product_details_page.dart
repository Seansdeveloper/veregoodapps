import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constant/color.dart';
import '../../constant/image.dart';
import '../cart_page/cart_page.dart';

class ProductDetails extends StatefulWidget {
  final String? imageSho;

  ProductDetails(this.imageSho);

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
                      Icons.arrow_back,
                      size: 28,
                    )),
                Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: 22,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.to(()=>CartPage());
                      },
                      child: Icon(
                        Icons.shopping_cart,
                        size: 22,
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
              Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(228, 228, 228, 0.9),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5))),
                  child: Image.asset(widget.imageSho!)),
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
                              child: Image.asset(Imagess.imageShoes[index]));
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 10),
                    child: Text(
                      "Beats solo wired headphones",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, bottom: 5),
                    child: Text(
                      "\$34.99",
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
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.  Lorem Ipsum is simply.Lorem Ipsum is simply dummy text of the printing and typesetting industry.  Lorem Ipsum is simply.",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Divider(
                    thickness: 2.5,
                    color: Color.fromRGBO(231, 231, 231, 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5, right: 5),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'Deliver To : ',
                              style: TextStyle(fontSize: 16)),
                          TextSpan(
                              text:
                                  'Lorem Ipsum is simply dummy text of the printing and type.',
                              style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
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
                              color: Theme.of(context).cardColor.withOpacity(0.5),
                              offset: Offset(1.0, 1.0), //(x,y)
                              blurRadius: 1.0,
                            ),
                          ]),
                      child: FittedBox(child: Text("change")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 5),
                    child: Divider(
                      thickness: 2.5,
                      color: Color.fromRGBO(231, 231, 231, 1),
                    ),
                  ),
               Padding(
                 padding: const EdgeInsets.only(
                     left: 5, right: 5,bottom: 5),
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
                 ],),
               ),

               Padding(
                 padding: const EdgeInsets.only(
                     left: 5, right: 5,bottom: 10),
                 child: SizedBox(
                   height: 200,
                   child: ListView.builder(
                     scrollDirection: Axis.horizontal,
                     itemCount: 7,
                       itemBuilder: (context,i){
                     return Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Container(
                           height: 150,
                         width: 140,
                          margin: EdgeInsets.only(right: 10),
                          color: Colors.white,
                          child: Image.asset(Imagess.imageCap[i],height: 120,width: 120,)
                         ),
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

  bottomNavigationBar(){
    return Row(
      children: [
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width/2,
          color: Colors.red,
          padding: EdgeInsets.all(10),
          child: FittedBox(child: Text("Add to Cart")),
        ),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width/2,
          color: appbar,
          padding: EdgeInsets.all(10),
          child: FittedBox(child: Text("Buy Now")),
        )
      ],
    );
  }




}
