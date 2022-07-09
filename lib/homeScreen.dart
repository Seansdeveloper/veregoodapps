import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:veregoodapps/screens/product_details_page/product_details_page.dart';
import 'data/navigation_model.dart';
import 'generated/assets.dart';

class HomeScreen extends StatefulWidget {
  dynamic index;

  HomeScreen(this.index, {Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   ScrollController _controller=ScrollController();
  late Position position;
   int selectBtn = 0;
   GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
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
        child: Scaffold(


          bottomNavigationBar:   CurvedNavigationBar(
            buttonBackgroundColor: Color.fromRGBO(36, 94, 171, 1),

            backgroundColor: Colors.transparent,
                 color:Colors.white,
                 height: 60,
     index: widget.index,
     key: _bottomNavigationKey,
     items:  <Widget>[
       Image.asset(
         navBtn[0].imagePath,
         color:  Colors.red,
         scale: 2,
       ),
       Image.asset(
         navBtn[1].imagePath,
         color: Colors.red,
         scale: 2,
       ),
       Image.asset(
         navBtn[2].imagePath,
         color:Colors.red,
         scale: 2,
       ),
       Image.asset(
         navBtn[3].imagePath,
         color:  Colors.red,
         scale: 2,
       ),
     ],
     onTap: (index) {
       setState(() {});
     },
   ),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(36, 94, 171, 1),
      body:  Column(
        children: <Widget>[
          Padding(
            padding:
            const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
            child: TextField(
              style: const TextStyle(fontSize: 22.0, color: Colors.black),
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.white, width: 2)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Search",
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
          Container(
            height: 38,
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
              child:SingleChildScrollView(
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
                          itemCount: 6,
                          itemBuilder: (context, i) {
                            return categories("categories");
                          }),
                    ),
                    CarouselSlider(

                      options: CarouselOptions( height: 200,
                        aspectRatio: 16/9,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,),

                      items: [Assets.assetsRefer,Assets.assetsRefer,Assets.assetsRefer,Assets.assetsRefer].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(color: Colors.transparent),
                                child: GestureDetector(
                                    child: Image.asset(i, fit: BoxFit.fill),
                                    onTap: () {

                                    }));
                          },
                        );
                      }).toList(),
                    ),

                    service(),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                         Padding(
                          padding:  EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                          child: Text("Best Selling product" ,style:TextStyle(fontSize: 22),),
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                          child: Text("See all " ,style:TextStyle(fontSize: 15),),
                        ),
                      ],
                    ),
                    bestSeller(),
                    accessories(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }

  Widget categories(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: GestureDetector(
        onTap: (){

      },
        child: Column(
          children: [

            CircleAvatar(
              radius: 30.0,
              backgroundColor: Colors.transparent,
              child: ClipRRect(
                child: Image.asset(Assets.assetsProductitem,fit: BoxFit.fill,),
              ),
            ),
            SizedBox(height: 5,),
            Text(text ,style: TextStyle(fontSize: 14),)
          ],
        ),
      ),
    );
  }
  Widget service(){
    return Row(
      children:  [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding:  EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              child: Text("Service" ,style:TextStyle(fontSize: 22),),

            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.red,
              child: Wrap(
                children:  [
                  Padding(
                    padding: const EdgeInsets.only(left: 8,right: 8,top: 5),
                    child: Column(
                      children: [
                        CircleAvatar(radius: 35,backgroundColor: Colors.blue,
                          child: Image.asset(Assets.assetsBodyguard),
                        ),
                        Text("bodygurad")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8,right: 8,top: 5),
                    child: Column(
                      children: [
                        CircleAvatar(radius: 35,backgroundColor: Colors.blue,
                          child: Image.asset(Assets.assetsBodyguard),
                        ),
                        Text("bodygurad")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8,right: 8,top: 5),
                    child: Column(
                      children: [
                        CircleAvatar(radius: 35,backgroundColor: Colors.blue,
                          child: Image.asset(Assets.assetsBodyguard),
                        ),
                        Text("bodygurad")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8,right: 8,top: 5),
                    child: Column(
                      children: [
                        CircleAvatar(radius: 35,backgroundColor: Colors.blue,
                          child: Image.asset(Assets.assetsBodyguard),
                        ),
                        Text("bodygurad")
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Expanded(
          child: Container(
            height: 243,
            color: Colors.white,
            child: Image.asset(Assets.assetsShoeman2),

          ),
        ),

      ],
    );
  }


  Widget bestSeller(){
    return  Container(
      height: 500,
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,childAspectRatio: 0.9,
        children:  List<Widget>.generate(4, (index) {
          return  GridTile(
            child:  InkWell(
              onTap: () {
                Get.to(()=>ProductDetails());
              },
              child: Card(
                  color: Colors.blue.shade200,
                  child: Padding(
                    padding:EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(Assets.assetsShoeman2,height: 140,alignment: Alignment.center,),
                        Text("Shoe Collection" ,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        Text("Sports wear" ,style: TextStyle(fontSize: 15))

                      ],
                    ),
                  )
              ),
            ),
          );
        }),
      ),
    );
  }

 Widget accessories(){
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Column(children: [
        Image.asset(Assets.assetsShop,height: 150,width:double.infinity,)
      ],),
    );
 }

}
