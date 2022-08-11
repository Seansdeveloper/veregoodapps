import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:veregoodapps/screens/service_page/service_page.dart';

import '../constant/string.dart';
import 'constant_ui/appbar.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).backgroundColor,
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
         children: [
          Appbar("Category"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text("Fashion", style: TextStyle(fontSize: 22)),
          ),
          categoryList(Strings.fashion),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text("Electronics", style: TextStyle(fontSize: 22)),
          ),
          categoryList(Strings.Electronics),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text("Commercial", style: TextStyle(fontSize: 22)),
          ),
          categoryList(Strings.Commercial),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text("Home", style: TextStyle(fontSize: 22)),
          ),
          categoryList(Strings.Home),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text("Travel", style: TextStyle(fontSize: 22)),
          ),
          categoryList(Strings.Travel),
        ],
      ),
    );
  }

  Widget categoryList(List data) {
    return Padding(

      padding: const EdgeInsets.only(top: 10, bottom: 10,right: 10,left: 10),
      child: Wrap(
          runSpacing: 10,
          spacing: 6,
          children: data
              .map((e) => GestureDetector(
                    onTap: () => Get.to(() => ServicePage()),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xff64A37B),
                          radius: 35,
                        ),
                        SizedBox(
                            width: 80,
                            child: Text(
                              e.toString(),
                              textAlign: TextAlign.center,
                              softWrap: true,
                            ))
                      ],
                    ),
                  ))
              .toList()),
    );
  }
}
