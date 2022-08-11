import 'package:veregoodapps/model/product_list/product_data.dart';

class ProductData {
  int? id;
  Product? product;
  int? collection;

  ProductData({this.id, this.product, this.collection});

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    collection = json['collection'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['collection'] = this.collection;
    return data;
  }
}

