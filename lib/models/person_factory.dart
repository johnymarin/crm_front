// To parse this JSON data, do
//
//     final personForList = personForListFromJson(jsonString);

import 'dart:convert';

List<PersonForList> personForListFromJson(String str) => List<PersonForList>.from(json.decode(str).map((x) => PersonForList.fromJson(x)));

String personForListToJson(List<PersonForList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PersonForList {
  PersonForList({
    required this.personId,
    required this.nationalIdType,
    required this.nationalId,
    required this.personType,
  });

  int personId;
  String nationalIdType;
  String nationalId;
  String personType;

  factory PersonForList.fromJson(Map<String, dynamic> json) => PersonForList(
    personId: json["person_id"],
    nationalIdType: json["national_id_type"],
    nationalId: json["national_id"],
    personType: json["person_type"],
  );

  Map<String, dynamic> toJson() => {
    "person_id": personId,
    "national_id_type": nationalIdType,
    "national_id": nationalId,
    "person_type": personType,
  };
}



// To parse this JSON data, do
//
//     final personForRetrieve = personForRetrieveFromJson(jsonString);



PersonForRetrieve personForRetrieveFromJson(String str) => PersonForRetrieve.fromJson(json.decode(str));

String personForRetrieveToJson(PersonForRetrieve data) => json.encode(data.toJson());

class PersonForRetrieve {
  PersonForRetrieve({
    required this.personId,
    required this.nationalIdType,
    required this.nationalId,
    required this.personType,
  });

  int personId;
  String nationalIdType;
  String nationalId;
  String personType;

  factory PersonForRetrieve.fromJson(Map<String, dynamic> json) => PersonForRetrieve(
    personId: json["person_id"],
    nationalIdType: json["national_id_type"],
    nationalId: json["national_id"],
    personType: json["person_type"],
  );

  Map<String, dynamic> toJson() => {
    "person_id": personId,
    "national_id_type": nationalIdType,
    "national_id": nationalId,
    "person_type": personType,
  };
}





// To parse this JSON data, do
//
//     final personForCreate = personForCreateFromJson(jsonString);




PersonForCreate personForCreateFromJson(String str) => PersonForCreate.fromJson(json.decode(str));

String personForCreateToJson(PersonForCreate data) => json.encode(data.toJson());

class PersonForCreate {
  PersonForCreate({
    required this.nationalIdType,
    required this.nationalId,
    required this.personType,
  });

  String nationalIdType;
  String nationalId;
  String personType;

  factory PersonForCreate.fromJson(Map<String, dynamic> json) => PersonForCreate(
    nationalIdType: json["national_id_type"],
    nationalId: json["national_id"],
    personType: json["person_type"],
  );

  Map<String, dynamic> toJson() => {
    "national_id_type": nationalIdType,
    "national_id": nationalId,
    "person_type": personType,
  };
}






// To parse this JSON data, do
//
//     final personCreated = personCreatedFromJson(jsonString);



PersonCreated personCreatedFromJson(String str) => PersonCreated.fromJson(json.decode(str));

String personCreatedToJson(PersonCreated data) => json.encode(data.toJson());

class PersonCreated {
  PersonCreated({
    required this.personId,
    required this.nationalIdType,
    required this.nationalId,
    required this.personType,
  });

  int personId;
  String nationalIdType;
  String nationalId;
  String personType;

  factory PersonCreated.fromJson(Map<String, dynamic> json) => PersonCreated(
    personId: json["person_id"],
    nationalIdType: json["national_id_type"],
    nationalId: json["national_id"],
    personType: json["person_type"],
  );

  Map<String, dynamic> toJson() => {
    "person_id": personId,
    "national_id_type": nationalIdType,
    "national_id": nationalId,
    "person_type": personType,
  };
}
