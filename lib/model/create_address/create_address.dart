class CreateAddress {
  int? id;
  String? flatNo;
  String? address;
  String? city;
  String? state;
  String? country;
  String? location;
  String? user;

  CreateAddress(
      {this.id,
        this.flatNo,
        this.address,
        this.city,
        this.state,
        this.country,
        this.location,
        this.user});

  CreateAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    flatNo = json['flat_no'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    location = json['location'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['flat_no'] = this.flatNo;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['location'] = this.location;
    data['user'] = this.user;
    return data;
  }
}