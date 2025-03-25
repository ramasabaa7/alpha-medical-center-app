import 'dart:convert';

PatientDetailsModel patientDetailsModelFromJson(String str) => PatientDetailsModel.fromJson(json.decode(str));

String patientDetailsModelToJson(PatientDetailsModel data) => json.encode(data.toJson());

class PatientDetailsModel {
  int code;
  List<Datum> data;
  String msg;
  PatientDetailsModel({
    required this.code,
    required this.data,
    required this.msg,
  });

  factory PatientDetailsModel.fromJson(Map<String, dynamic> json) => PatientDetailsModel(
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
  String idPersonal;
  String fullName;
  int age;
  String phonenumber;
  String address;
  DateTime createdAt;
  DateTime updatedAt;
  int ambulancecases;

  Datum({
    required this.id,
    required this.idPersonal,
    required this.fullName,
    required this.age,
    required this.phonenumber,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
    required this.ambulancecases,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    idPersonal: json["IDPersonal"],
    fullName: json["FullName"],
    age: json["age"],
    phonenumber: json["phonenumber"],
    address: json["address"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    ambulancecases: json["ambulancecases"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "IDPersonal": idPersonal,
    "FullName": fullName,
    "age": age,
    "phonenumber": phonenumber,
    "address": address,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "ambulancecases": ambulancecases,
  };
}
