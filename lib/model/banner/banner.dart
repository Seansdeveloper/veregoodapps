

class headline {
  int? id;
  String? image;
  bool? isActive;
  bool? mobile;
  bool? web;

  headline({this.id,  this.image, this.isActive, this.mobile, this.web});

  headline.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'] as String;
    isActive = json['is_active'];
    mobile = json['mobile'];
    web = json['web'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['is_active'] = this.isActive;
    data['mobile'] = this.mobile;
    data['web'] = this.web;
    return data;
  }
}