// To parse this JSON data, do
//
//     final typeservc = typeservcFromJson(jsonString);

import 'dart:convert';

Typeservc typeservcFromJson(String str) => Typeservc.fromJson(json.decode(str));

String typeservcToJson(Typeservc data) => json.encode(data.toJson());

class Typeservc {
  int code;
  List<Datum> data;
  String msg;

  Typeservc({
    required this.code,
    required this.data,
    required this.msg,
  });

  factory Typeservc.fromJson(Map<String, dynamic> json) => Typeservc(
    code: json["code"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "msg": msg,
  };
}

class Datum {
  int id;
  String name;
  int idSection;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.id,
    required this.name,
    required this.idSection,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["Name"],
    idSection: json["id_section"],
    status: json["Status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "Name": name,
    "id_section": idSection,
    "Status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
