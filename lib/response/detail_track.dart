// To parse this JSON data, do
//
//     final detailTrack = detailTrackFromJson(jsonString);

import 'dart:convert';

DetailTrack detailTrackFromJson(String str) => DetailTrack.fromJson(json.decode(str));

String detailTrackToJson(DetailTrack data) => json.encode(data.toJson());

class DetailTrack {
  DetailTrack({
    this.idPost,
    this.post,
    this.date,
    this.arrivetime,
    this.leavingtime,
    this.latitude,
    this.longitude,
    this.location,
    this.idUser,
  });

  int? idPost;
  String? post;
  DateTime? date;
  String? arrivetime;
  String? leavingtime;
  double? latitude;
  double? longitude;
  String? location;
  int? idUser;

  factory DetailTrack.fromJson(Map<String, dynamic> json) => DetailTrack(
    idPost: json["id_post"],
    post: json["post"],
    date: DateTime.parse(json["date"]),
    arrivetime: json["arrivetime"],
    leavingtime: json["leavingtime"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    location: json["location"],
    idUser: json["id_user"],
  );

  Map<String, dynamic> toJson() => {
    "id_post": idPost,
    "post": post,
    "date": date?.toIso8601String(),
    "arrivetime": arrivetime,
    "leavingtime": leavingtime,
    "latitude": latitude,
    "longitude": longitude,
    "location": location,
    "id_user": idUser,
  };
}
