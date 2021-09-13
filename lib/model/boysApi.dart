
import 'dart:convert';

List<PersonResponse> personResponseFromJson(String str) => List<PersonResponse>.from(json.decode(str).map((x) => PersonResponse.fromJson(x)));

String personResponseToJson(List<PersonResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PersonResponse {
  PersonResponse({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.meaning,
    required this.gender,
  });

  String id;
  String categoryId;
  String name;
  String meaning;
  String gender;

  factory PersonResponse.fromJson(Map<String, dynamic> json) => PersonResponse(
    id: json["id"],
    categoryId: json["category_id"],
    name: json["name"],
    meaning: json["meaning"],
    gender: json["gender"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "name": name,
    "meaning": meaning,
    "gender": gender,
  };
}
