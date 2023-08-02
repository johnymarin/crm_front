// To parse this JSON data, do
//
//     final cities = citiesFromJson(jsonString);

import 'dart:convert';

List<CityForListing> citiesFromJson(String str) => List<CityForListing>
    .from(json.decode(str).map((x) => CityForListing.fromJson(x)));

String cityListToJson(List<CityForListing> data) => json.encode(List<dynamic>
    .from(data.map((x) => x.toJson())));

class CityForListing {
  CityForListing({
    required this.id,
    required this.name,
    required this.timezone,
  });

  int id;
  String name;
  String timezone;

  factory CityForListing
      .fromJson(Map<String, dynamic> json) => CityForListing(
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



// To parse this JSON data, do
//
//     final cityDetail = cityDetailFromJson(jsonString);
CityDetail cityDetailFromJson(String str) => CityDetail
    .fromJson(json.decode(str));

String cityDetailToJson(CityDetail data) => json.encode(data.toJson());

class CityDetail {
  CityDetail({
    required this.id,
    required this.name,
    required this.timezone,
  });

  int id;
  String name;
  String timezone;

  factory CityDetail.fromJson(Map<String, dynamic> json) => CityDetail(
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

// To parse this JSON data, do
//
//     final cityCreate = cityCreateFromJson(jsonString);


CityToCreate cityCreateFromJson(String str) => CityToCreate
    .fromJson(json.decode(str));

String cityCreateToJson(CityToCreate data) => json.encode(data.toJson());

class CityToCreate {
  CityToCreate({
    required this.name,
    required this.timezone,
  });

  String name;
  String timezone;

  factory CityToCreate.fromJson(Map<String, dynamic> json) => CityToCreate(
    name: json["name"],
    timezone: json["timezone"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "timezone": timezone,
  };
}

// To parse this JSON data, do
//
//     final cityDetail = cityDetailFromJson(jsonString);
CityCreated cityCreatedFromJson(String str) => CityCreated
    .fromJson(json.decode(str));

String cityCreatedToJson(CityCreated data) => json.encode(data.toJson());

class CityCreated {
  CityCreated({
    required this.id,
    required this.name,
    required this.timezone,
  });

  int id;
  String name;
  String timezone;

  factory CityCreated.fromJson(Map<String, dynamic> json) => CityCreated(
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
