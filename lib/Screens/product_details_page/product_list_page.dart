




import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constant/color.dart';
import '../../controler/controller.dart';
import '../../model/category/category_product_list.dart';
import '../cart_page/cart_page.dart';
import '../mobile_authitcation_screen/login.dart';

class ProductsList extends StatefulWidget {
  final String id;
  const ProductsList(this.id, {Key? key}) : super(key: key);

  @override
  State<ProductsList> createState() => _ProductsListState();
}




class _ProductsListState extends State<ProductsList> {

  @override
  void initState() {


    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
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
                          style: TextStyle(fontSize: 18,  color: Colors.white,),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.search_rounded,
                        size: 22,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                         child: Icon(
                          Icons.shopping_cart,
                          size: 22,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                //   Expanded(child:
                //
                //   //
                //   // FutureBuilder<List<L>>(
                //   //   future: ApiService.getCategory(widget.categoryProductValue),
                //   //   builder: (context, snapshot) {
                //   //     if(snapshot.hasError){
                //   //      Text("opoos somethings  is wrong");
                //   //     }
                //   //       else if(snapshot.hasData) {
                //   //       return cardPage(snapshot.data![0].categoryProduct!);
                //   //     }
                //   //       return Center(child:CircularProgressIndicator());
                //   //   }
                //   // )),
              ],
            ),
          ),

        )
    );
  }

  Widget cardPage(List<CategoryProduct> categoryProduct) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.72, crossAxisCount: 2),
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: (){
              //Get.to(duration: Duration(milliseconds: 700),()=>ProductDetails(categoryProduct[index],index));
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
                      tag: "HERO"+[index].toString(),
                      child: CachedNetworkImage(
                        height: 100,
                        imageUrl:categoryProduct[index].image.toString(),
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
                    categoryProduct[index].title.toString(),
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
                          child: Text("\$${categoryProduct[index].price.toString()}",
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
                      onPressed: () {
                        if (auth.currentUser == null) {
                          Get.to(() => LoginScreen());
                        }
                        else{
                          Get.to(() => CartPage());
                        }

                      },
                      child: Text('Buy'),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: categoryProduct.length);
  }
}
