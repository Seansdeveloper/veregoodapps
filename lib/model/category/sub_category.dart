class SubCategory {
  int? id;
  String? icon;
  String? image;
  bool? isActive;
  String? name;
  String? slug;
  int? lft;
  int? rght;
  int? treeId;
  int? level;
  int? parent;

  SubCategory(
      {this.id,
        this.icon,
        this.image,
        this.isActive,
        this.name,
        this.slug,
        this.lft,
        this.rght,
        this.treeId,
        this.level,
        this.parent});

  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    image = json['image'];
    isActive = json['is_active'];
    name = json['name'];
    slug = json['slug'];
    lft = json['lft'];
    rght = json['rght'];
    treeId = json['tree_id'];
    level = json['level'];
    parent = json['parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['icon'] = this.icon;
    data['image'] = this.image;
    data['is_active'] = this.isActive;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['lft'] = this.lft;
    data['rght'] = this.rght;
    data['tree_id'] = this.treeId;
    data['level'] = this.level;
    data['parent'] = this.parent;
    return data;
  }
}