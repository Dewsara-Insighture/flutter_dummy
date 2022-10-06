import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  late String name;
  late String position;
  late String avatarImg;
  late String teamName;
  late String email;
  late String contactNo;
  //Named Parameters. One of the good ways to assign values
  User(
      {required this.name,
      required this.position,
      required this.avatarImg,
      required this.teamName,
      required this.email,
      required this.contactNo});

  // Map toJson() => {
  //   'name' : name ,
  //   'position' : position,
  //   'avatarImg' : avatarImg
  // };
  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        position: json["position"],
        avatarImg: json["avatarImg"],
        teamName: json["teamName"],
        email: json["email"],
        contactNo: json["contactNo"],
      );

  Map<String, dynamic> toJson() => {
        name: name,
        position: position,
        avatarImg: avatarImg,
        teamName: teamName,
        email: email,
        contactNo: contactNo,
      };
}
