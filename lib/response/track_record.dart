import 'dart:convert';

TrackRecordResponse trackRecordResponseFromJson(String str) => TrackRecordResponse.fromJson(json.decode(str));

String trackRecordResponseToJson(TrackRecordResponse data) => json.encode(data.toJson());

class TrackRecordResponse {
  TrackRecordResponse({
    this.idPost,
    this.date,
    this.location,
  });

  int? idPost;
  DateTime? date;
  String? location;

  factory TrackRecordResponse.fromJson(Map<String, dynamic> json) => TrackRecordResponse(
    idPost: json["id_post"],
    date: DateTime.parse(json["date"]),
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "id_post": idPost,
    "date": date?.toIso8601String(),
    "location": location,
  };
}
