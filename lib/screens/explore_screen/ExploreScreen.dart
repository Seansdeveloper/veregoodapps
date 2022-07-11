




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../constant/image.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,  // Added
      initialIndex: 0,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 15,right: 5,left: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Explore",style: TextStyle(fontSize: 22),),
                  Row(children: [
                    Icon(Icons.search,size: 30,),
                    SizedBox(width: 10,),
                    Icon(Icons.shopping_cart,size: 30,)
                  ],)
                ],
              ),
            ),
          ),
          TabBar(
            tabs: [ Text("New In",style: TextStyle(fontSize: 18),),  Text("Popular",style: TextStyle(fontSize: 18))],
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).backgroundColor,
              child: TabBarView(
                children: <Widget>[
                  Gridview(),
                 Center(child: Text("NO FILE FOUND",style: TextStyle(fontSize: 25),)),
                ],
              ),
            ),
          ),
        ],
      ),
    );



  }
Widget  Gridview() {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.8),
    itemBuilder: (_, index) => Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),

      child: Stack(
        children: [
          Image.asset(Imagess.imageCap[index]),
          Positioned.fill(child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Cap product",style: TextStyle(fontSize: 18,color: Colors.black),),
                Text("Skin care",style: TextStyle(fontSize: 18,color: Colors.black),),
              ],
            ),
          ))
        ],
      ),
    ),
    itemCount: 8,
  );
}
}
