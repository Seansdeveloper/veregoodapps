class Profile {
  String? name;
  String? email;
  String? mobileNumber;
  String? countryCode;

  Profile({this.name, this.email, this.mobileNumber, this.countryCode});

  Profile.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    countryCode = json['country_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile_number'] = this.mobileNumber;
    data['country_code'] = this.countryCode;
    return data;
  }
}