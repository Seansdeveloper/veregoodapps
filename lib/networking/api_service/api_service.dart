import 'dart:convert';

import 'package:get/route_manager.dart';
import 'package:veregoodapps/model/check_user/check_usser.dart';
import 'package:http/http.dart';
import 'package:veregoodapps/model/banner/banner.dart';
import 'package:veregoodapps/model/collection/collection.dart';
import '../../Screens/mobile_authitcation_screen/profile_page.dart';
import '../../Screens/onborading_screen/onborading_screen.dart';


import '../../helpers/shared_preferences_helper.dart';
import '../../homeScreen.dart';
import '../../model/CreateProfile.dart';
import '../../model/category/category.dart';
import '../../model/category/sub_category.dart';
import '../../model/product.dart';
import '../../model/product_list/product_list.dart';


class ApiService {


  /// getting banner in home screen
  static Future<List<headline>> getBanner() async {
    Response response = await get(Uri.parse(
        "http://38.130.130.45:8000/api/veregood/banner/?device=mobile"));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map(((e) => headline.fromJson(e))).toList();
    } else
      throw Exception(response.reasonPhrase);
  }






  // static Future<List<ProductList>> getProduct() async {
  //   Response response =
  //       await get(Uri.parse("https://fakestoreapi.com/products"));
  //   if (response.statusCode == 200) {
  //     final List result = jsonDecode(response.body);
  //     return result.map(((e) => ProductList.fromJson(e))).toList();
  //   } else
  //     throw Exception(response.reasonPhrase);
  // }




  /// if user already present with thi mobile number
  static Future<dynamic> createLoginState(String MobileNumber) async {
    Response response = await get(Uri.parse(
        "http://38.130.130.45:8000/api/veregood/check-user/?mobile_number=" +
            MobileNumber));
    if (response.statusCode == 200) {
      print(response.body);
      return Get.offAll(() => HomeScreen(0));

    } else {

      return Get.offAll(() => ProfilePage());
    }
  }




  /// get collection list
  static Future<List<Collections>> getCollection() async {
    Response response = await get(
        Uri.parse("http://38.130.130.45:8000/api/veregood/collection/"));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map(((e) => Collections.fromJson(e))).toList();
    } else
      throw Exception(response.reasonPhrase);
  }



  /// if user is  get  updated data or not  this api  work
  static Future<CreateProfile> updatedata(
      String name, String email, String mobileNumber) async {
    final Response response = await post(
      Uri.parse('http://38.130.130.45:8000/api/veregood/register/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'username': mobileNumber,
        'country_code': "+91",
      }),
    );

    if (response.statusCode == 200) {
      Get.to(() => SliderLayoutView());
      return CreateProfile.fromJson(json.decode(response.body));
    } else {
      Get.snackbar(
        "updated faild",
        "Oops... somethings is wrong",
        snackPosition: SnackPosition.BOTTOM,
      );
      throw Exception('Failed to update profile.');
    }
  }



  /// the api  will get data collection list with id

  static Future<List<ProductData>> getData(String data) async {
    try {
      final Response response = await post(
        Uri.parse('http://38.130.130.45:8000/api/veregood/collection/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'id': data,
        }),
      );

      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body);
        return result.map((e) => ProductData.fromJson(e)).toList();
      }
    } catch (e, stacktrace) {
      print(stacktrace.toString());
    }
    throw Exception('Failed to update profile.');
  }

  /// this will return

  /// data return sub category
  static Future<List<SubCategory>> getCategoryData(String data) async {
    Response response = await get(Uri.parse(
        "http://38.130.130.45:8000/api/veregood/collection/?id=" + data));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map(((e) => SubCategory.fromJson(e))).toList();
    } else
      throw Exception(response.reasonPhrase);
  }




  /// return data with getList colletion
  static Future<List<Category>> getListCategory() async {
    try {
      final Response response = await put(
        Uri.parse('http://38.130.130.45:8000/api/veregood/category/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{}),
      );

      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body);
        return result.map((e) => Category.fromJson(e)).toList();
      }
    } catch (e, stacktrace) {
      print(stacktrace.toString());
    }
    throw Exception('Failed to update profile.');
  }




  /// this api return category data
  static Future<List> getCategory(String data) async {
    try {
      final Response response = await post(
        Uri.parse('http://38.130.130.45:8000/api/veregood/category/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'id': data,
        }),
      );

      if (response.statusCode == 200) {
        // var data = jsonDecode(response.body);
        // print(list);
        // Map<String, dynamic> data = new Map<String, dynamic>.from(json.decode(response.body));
        // final List result = jsonDecode(response.body);
        List data = json.decode(response.body);
        // List<dynamic> categoryProduct = map["category_product"];
        final _data = List<dynamic>.from(
          data.map<dynamic>(
                (dynamic item) => item,
          ),
        );

        return _data ;
      }
    } catch (e, stacktrace) {
      print(stacktrace.toString());
    }
    throw Exception('Failed to update profile.');
  }




  /// add to cart api
  static Future<List<CheckUser>> getUser(String mobile) async {
    Response response= await get(Uri.parse("http://38.130.130.45:8000/api/veregood/check-user/?mobile_number="+mobile,

        ));
    if(response.statusCode==200){
      final List result=jsonDecode(response.body) ;
      return result.map(((e) => CheckUser.fromJson(e))).toList();

    }
    else
      throw Exception(response.reasonPhrase);
  }


   /// API GET ADDRESS APP










}
