import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.idUser,
    this.username,
    this.email,
    this.name,
    this.address,
    this.division,
    this.role,
    this.picture,
  });

  int?  idUser;
  String? username;
  String? email;
  String? name;
  String? address;
  String? division;
  String? role;
  String? picture;

  factory User.fromJson(Map<String, dynamic> json) => User(
    idUser: json["id_user"],
    username: json["username"],
    email: json["email"],
    name: json["name"],
    address: json["address"],
    division: json["division"],
    role: json["role"],
    picture: json["picture"],
  );

  Map<String, dynamic> toJson() => {
    "id_user": idUser,
    "username": username,
    "email": email,
    "name": name,
    "address": address,
    "division": division,
    "role": role,
    "picture": picture,
  };
}
