import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../constant/string.dart';
import '../Screens/service_page/service_page.dart';
import '../model/category/category.dart';
import '../model/category/category_product_list.dart';
import '../model/category/sub_category.dart';
import '../networking/api_service/api_service.dart';
import 'constant_ui/appbar.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({Key? key}) : super(key: key);

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          Appbar("Category"),
          Expanded(
            child: FutureBuilder<List<Category>>(
                future: ApiService.getListCategory(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                    snapshot.data![index].name.toString(),
                                    style: TextStyle(fontSize: 22)),
                              ),
                              categoryList(snapshot.data![index].subCategory!),
                            ],
                          );
                        });

                    //   // crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Appbar("Category"),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(horizontal: 10),
                    //       child: Text(snapshot.data., style: TextStyle(fontSize: 22)),
                    //     ),
                    //     categoryList(Strings.fashion),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(horizontal: 10),
                    //       child: Text("Electronics", style: TextStyle(fontSize: 22)),
                    //     ),
                    //     categoryList(Strings.Electronics),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(horizontal: 10),
                    //       child: Text("Commercial", style: TextStyle(fontSize: 22)),
                    //     ),
                    //     categoryList(Strings.Commercial),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(horizontal: 10),
                    //       child: Text("Home", style: TextStyle(fontSize: 22)),
                    //     ),
                    //     categoryList(Strings.Home),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(horizontal: 10),
                    //       child: Text("Travel", style: TextStyle(fontSize: 22)),
                    //     ),
                    //     categoryList(Strings.Travel),
                    //   ],
                    // );
                  } else if (snapshot.hasError) {
                    return Text("somethings is wrong");
                  }
                  return Center(child: CircularProgressIndicator());
                }),
          ),
        ],
      ),
    );
  }

  Widget categoryList(List<SubCategory> subCategory) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
      child: Wrap(
          runSpacing: 10,
          spacing: 6,
          children: subCategory
              .map((e) => GestureDetector(
                    onTap: () => Get.to(()=> ServicePage()),

                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xff64A37B),
                          radius: 35,
                        ),
                        SizedBox(
                            width: 80,
                            child: Text(
                              e.name.toString(),
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
