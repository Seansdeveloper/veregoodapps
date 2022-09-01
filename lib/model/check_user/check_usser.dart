import 'package:veregoodapps/model/check_user/profile.dart';

class CheckUser {
  Profile? profile;
  String? token;

  CheckUser({this.profile, this.token});

  CheckUser.fromJson(Map<String, dynamic> json) {
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    data['token'] = this.token;
     return data;
  }
}