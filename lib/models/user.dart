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
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['name'],
        position: json['position'],
        avatarImg: json['avatarImg'],
        teamName: json['teamName'],
        email: json['email'],
        contactNo: json['contactNo']);
  }
}
