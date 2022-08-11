class Product {
  int? id;
  String? title;
  String? sku;
  String? image;
  String? thumbnail;
  String? shortDescription;
  String? currency;
  String? price;
  String? rating;
  bool? hasColor;
  bool? hasVariation;
  String? productType;
  bool? isActive;
  bool? inStock;
  int? quantity;
  String? pageLayout;
  bool? isApproved;
  bool? draft;
  String? startDate;
  String? endDate;
  String? store;
  String? mainCategory;
  int? category;
  String? brand;

  Product(
      {this.id,
        this.title,
        this.sku,
        this.image,
        this.thumbnail,
        this.shortDescription,
        this.currency,
        this.price,
        this.rating,
        this.hasColor,
        this.hasVariation,
        this.productType,
        this.isActive,
        this.inStock,
        this.quantity,
        this.pageLayout,
        this.isApproved,
        this.draft,
        this.startDate,
        this.endDate,
        this.store,
        this.mainCategory,
        this.category,
        this.brand});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    sku = json['sku'];
    image = json['image'];
    thumbnail = json['thumbnail'];
    shortDescription = json['short_description'];
    currency = json['currency'];
    price = json['price'];
    rating = json['rating'];
    hasColor = json['has_color'];
    hasVariation = json['has_variation'];
    productType = json['product_type'];
    isActive = json['is_active'];
    inStock = json['in_stock'];
    quantity = json['quantity'];
    pageLayout = json['page_layout'];
    isApproved = json['is_approved'];
    draft = json['draft'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    store = json['store'];
    mainCategory = json['main_category'];
    category = json['category'];
    brand = json['brand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['sku'] = this.sku;
    data['image'] = this.image;
    data['thumbnail'] = this.thumbnail;
    data['short_description'] = this.shortDescription;
    data['currency'] = this.currency;
    data['price'] = this.price;
    data['rating'] = this.rating;
    data['has_color'] = this.hasColor;
    data['has_variation'] = this.hasVariation;
    data['product_type'] = this.productType;
    data['is_active'] = this.isActive;
    data['in_stock'] = this.inStock;
    data['quantity'] = this.quantity;
    data['page_layout'] = this.pageLayout;
    data['is_approved'] = this.isApproved;
    data['draft'] = this.draft;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['store'] = this.store;
    data['main_category'] = this.mainCategory;
    data['category'] = this.category;
    data['brand'] = this.brand;
    return data;
  }
}