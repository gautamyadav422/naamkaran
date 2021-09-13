//
// import 'dart:convert';
//
// List<GirlsResponse> personResponseFromJson(String str) => List<GirlsResponse>.from(json.decode(str).map((x) => GirlsResponse.fromJson(x)));
//
// String personResponseToJson(List<GirlsResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class GirlsResponse {
//   GirlsResponse({
//     required this.id,
//     required this.categoryId,
//     required this.name,
//     required this.meaning,
//     required this.gender,
//   });
//
//   String id;
//   String categoryId;
//   String name;
//   String meaning;
//   String gender;
//
//   factory GirlsResponse.fromJson(Map<String, dynamic> json) => GirlsResponse(
//     id: json["id"],
//     categoryId: json["category_id"],
//     name: json["name"],
//     meaning: json["meaning"],
//     gender: json["gender"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "category_id": categoryId,
//     "name": name,
//     "meaning": meaning,
//     "gender": gender,
//   };
// }
