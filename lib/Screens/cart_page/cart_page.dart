import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../../constant/color.dart';
import '../../constant/image.dart';
import '../../constant/string.dart';
import '../../generated/assets.dart';
import '../../model/product.dart';
import '../../networking/service/location_service.dart';
import '../delivery_address.dart';
import '../error_screens/error_screen.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int value=1;



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,  // Added
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: SafeArea(
            child: Container(
              color: appbar,
              padding: EdgeInsets.only(top: 16,left: 5,right: 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                         onTap:(){ Get.back();},
                          child: Icon(Icons.arrow_back,size: 25,color: Colors.white,)),
                      Icon(Icons.search,size: 25,color: Colors.white,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  TabBar(
                    tabs: [ Text("My cart",style: TextStyle(fontSize: 18),),  Text("Buy Now",style: TextStyle(fontSize: 18)),Text("Wishlist",style: TextStyle(fontSize: 18),)],
                  ),
                ],
              ),
            ),
          ),
        ),
body: TabBarView(
  children: <Widget>[
    Strings.productList.isNotEmpty?
     MyCartPage():Center(child: Text("NO DATA FOUND",style: TextStyle(fontSize: 28),)),
    Center(child: Text("NO DATA FOUND",style: TextStyle(fontSize: 28),)),
    Center(child: Text("NO DATA FOUND",style: TextStyle(fontSize: 28),))

  ],
),
      ),
    );
  }





  MyCartPage(){
    return Column(
      children: [
        Container(
          height: 30,
          width: MediaQuery.of(context).size.width,
          color: const Color.fromRGBO(240, 207, 3, 1),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.black,
                ),
                FutureBuilder<String>(
                    future: CurrentLocation.currentPosition(),
                    builder: (context, snapshot) {
                      if(snapshot.hasError){
                        Text("please provide the location");
                      }
                      else if(snapshot.hasData){
                        return Text(snapshot.data!);
                      }
                      return Text("Loading....");
                    }

                ),
              ],
            ),
          ),
        ),
        Expanded(
       child: SingleChildScrollView(
           child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        children: Strings.productList.map((i) {
          return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 2.0),
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 2,top: 10,bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(child: Image.network(i.image.toString(), fit: BoxFit.fill,width: 120,height: 120,)),
                    Flexible(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 2,left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Flexible(child: Text(i.title.toString(),maxLines: 2,style: TextStyle(color: Colors.black,))),
                                GestureDetector(
                                  onTap:(){
                                    setState(() {
                                      Strings.productList.remove(i);
                                    });

          },
                                    child: Icon(Icons.delete,color: Colors.black,))
                               ],
                             ),
                            Text(i.description.toString(),style: TextStyle(color: Colors.black.withOpacity(0.5),fontSize: 13)),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5,top: 5),
                              child: Text("in stock",style: TextStyle(color: Colors.green,fontSize: 14,)),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap:(){
                                        setState(() {
                                          if(value!=0)
                                            {
                                              value--;
                                            }

                                        });

                                      },
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                          margin: EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(width: 0.5,color: Colors.black.withOpacity(0.5))
                                        ),
                                       child:Icon(Icons.remove,color: Colors.black,size: 12,)
                                      ),
                                    ),
                                    Text("$value",style: TextStyle(color: Colors.black,)),
                                    GestureDetector(
                                      onTap:(){
                                        setState(() {
                                          if(value>=0)
                                          {
                                            value++;
                                          }

                                        });
                                      },
                                      child: Container(
                                          height: 25,
                                          width: 25,
                                          margin: EdgeInsets.symmetric(horizontal: 10),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(width: 0.5,color: Colors.black.withOpacity(0.5))
                                          ),
                                          child:Icon(Icons.add,color: Colors.blue,size: 15,)
                                      ),
                                    ),
                                  ],
                                ),
                                Text("\$ ${i.price.toString()}" ,style: TextStyle(fontSize: 18,color: Colors.black),)


                              ],
                            )

                          ],
                        ),
                      ),
                    )

                  ],
                ),
              ));
        }).toList(),
      ),


    Padding(
      padding: EdgeInsets.only(top: 10,left: 5),
      child: Text("Price Details",style: TextStyle(fontSize: 18),),
    ),
      Padding(
        padding: const EdgeInsets.only(
            bottom: 5, top: 5, left: 5, right: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Price${Strings.productList.length}",
              style: TextStyle(fontSize: 12),
            ),
            Text(
              "\$1092",
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
              "Discount",
              style: TextStyle(fontSize: 12),
            ),
            Text(
              "-\$19.88",
              style: TextStyle(fontSize: 12,color: Colors.green),
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
              "Delivery Charges",
              style: TextStyle(fontSize: 12),
            ),
            Text(
              "Free",
              style: TextStyle(fontSize: 12,color: Colors.green),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10,bottom: 10),
        child: Row(
          children: List.generate(150~/2, (index) => Expanded(
            child: Container(
              color: index%2==0?Colors.transparent
                  :Colors.grey,
              height: 1,
            ),
          )),
        ),
      ),
   Padding(
     padding: const EdgeInsets.only(left: 10, right: 10),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Text("total Amount"),
         Text("\$50.00")
       ],
     ),
   ),

      InkWell(
        onTap:()=> Get.to(() => AddAddress()),
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(30),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: appbar,
            borderRadius: BorderRadius.circular(10)
          ),
          child: FittedBox(child: Text("Proceed To Buy(${Strings.productList.length} item)")),
        ),
      )



    ],
    )

       ),

        ),


]
    );
  }
}
