// To parse this JSON data, do
//
//     final cities = citiesFromJson(jsonString);

import 'dart:convert';

List<Cities> citiesFromJson(String str) => List<Cities>.from(json.decode(str).map((x) => Cities.fromJson(x)));

String citiesToJson(List<Cities> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cities {
  Cities({
    required this.id,
    required this.name,
    required this.timezone,
  });

  int id;
  String name;
  String timezone;

  factory Cities.fromJson(Map<String, dynamic> json) => Cities(
    id: json["id"],
    name: json["name"],
    timezone: json["timezone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "timezone": timezone,
  };
}
