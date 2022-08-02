class Collections {
  int? id;
  String? title;
  String? slug;
  String? icon;
  String? image;
  bool? isActive;

  Collections(
      {this.id, this.title, this.slug, this.icon, this.image, this.isActive});

  Collections.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    icon = json['icon']==null?"": icon = json['icon'];
    image = json['image'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['icon'] = this.icon;
    data['image'] = this.image;
    data['is_active'] = this.isActive;
    return data;
  }
}