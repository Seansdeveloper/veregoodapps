import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../constant/color.dart';
import '../../constant/image.dart';
import '../../generated/assets.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int value=2;




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
                      Icon(Icons.arrow_back,size: 25,),
                      Icon(Icons.search,size: 25,),
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
    MyCartPage(),
       Column(
        children: <Widget>[new Text("Cart Page")],
      ),
     Column(
      children: <Widget>[new Text("Wishlist")],
    )
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
       child: SingleChildScrollView(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        children: Imagess.imageShoes.map((i) {
          return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 2.0),
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 2,top: 10,bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(child: Image.asset(i, fit: BoxFit.fill,width: 120,height: 120,)),
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("Beats shoes with Lether",style: TextStyle(color: Colors.black,)),
                               Icon(Icons.delete,color: Colors.black,)
                             ],
                           ),
                          Text("product features..",style: TextStyle(color: Colors.black.withOpacity(0.5),fontSize: 13)),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text("in stock",style: TextStyle(color: Colors.green,fontSize: 14,)),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap:(){
                                      value--;
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
                                      value--;
                                    },
                                    child: Container(
                                        height: 25,
                                        width: 25,
                                        margin: EdgeInsets.symmetric(horizontal: 10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(width: 0.5,color: Colors.black.withOpacity(0.5))
                                        ),
                                        child:Icon(Icons.add,color: Colors.black,size: 12,)
                                    ),
                                  ),
                                ],
                              ),
                              Text("\$34.99" ,style: TextStyle(fontSize: 18,color: Colors.black),)


                            ],
                          )

                        ],
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
              "Price(10 item)",
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

      Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(30),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: appbar,
          borderRadius: BorderRadius.circular(10)
        ),  
        child: FittedBox(child: Text("Proceed To Buy (10 Items)")),
      )



    ],
    )

       ),

        ),


]
    );
  }
}
