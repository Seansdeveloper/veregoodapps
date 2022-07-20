







import 'dart:convert';

import 'package:get/route_manager.dart';
import 'package:veregoodapps/model/check_user/check_usser.dart';
import 'package:http/http.dart';
import 'package:veregoodapps/model/banner/banner.dart';

import '../../homeScreen.dart';
import '../../model/CreateProfile.dart';
import '../../model/product.dart';
import '../../screens/mobile_authitcation_screen/profile_page.dart';
import '../../screens/onborading_screen/onborading_screen.dart';



class ApiService{



  static Future<List<headline>> getBanner() async {
    Response response= await get(Uri.parse("http://38.130.130.45:8000/api/veregood/banner/?device=mobile"));
    if(response.statusCode==200){
      final List result=jsonDecode(response.body) ;
      return result.map(((e) => headline.fromJson(e))).toList();

    }
    else
      throw Exception(response.reasonPhrase);
  }

 static Future<List<ProductList>> getProduct() async {
   Response response= await get(Uri.parse("https://fakestoreapi.com/products"));
   if(response.statusCode==200){
     final List result=jsonDecode(response.body) ;
     return result.map(((e) => ProductList.fromJson(e))).toList();

   }
   else
     throw Exception(response.reasonPhrase);
 }
static  Future<dynamic> createLoginState(String MobileNumber) async {
  Response response= await get(Uri.parse("http://38.130.130.45:8000/api/veregood/check-user/?mobile_number="+MobileNumber));
  if (response.statusCode == 200) {
     print(response.body);
     return Get.offAll(()=>HomeScreen(0));
   } else {
    return Get.offAll(() => ProfilePage());

   }
 }
 static Future<CreateProfile> updatedata(String name,String email,String mobileNumber,String countryCode) async {
   final Response response = await post(
       Uri.parse( 'http://38.130.130.45:8000/api/veregood/register/'),
     headers: <String, String>{
       'Content-Type': 'application/json; charset=UTF-8',
     },
     body: jsonEncode(<String, String>{
       'name': name,
       'email': email,
       'mobileNumber': mobileNumber,
       'countryCode': countryCode,
     }),
   );

   if (response.statusCode == 200) {
     Get.to(()=>SliderLayoutView());
     return CreateProfile.fromJson(json.decode(response.body));
   } else {
     throw Exception('Failed to update profile.');
   }
 }



 }