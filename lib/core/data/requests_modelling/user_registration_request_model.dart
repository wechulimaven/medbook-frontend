// To parse this JSON data, do
//
//     final patientsModel = patientsModelFromJson(jsonString);

import 'dart:convert';

PatientsModel patientsModelFromJson(String str) =>
    PatientsModel.fromJson(json.decode(str));

String patientsModelToJson(PatientsModel data) => json.encode(data.toJson());

class PatientsModel {
  String? patientName;
  String? dob;
  String? phone;
  String? gender;
  String? service;

  PatientsModel({
    this.patientName,
    this.dob,
    this.phone,
    this.gender,
    this.service,
  });

  PatientsModel copyWith({
    String? patientName,
    String? dob,
    String? phone,
    String? gender,
    String? service,
  }) =>
      PatientsModel(
        patientName: patientName ?? this.patientName,
        dob: dob ?? this.dob,
        phone: phone ?? this.phone,
        gender: gender ?? this.gender,
        service: service ?? this.service,
      );

  factory PatientsModel.fromJson(Map<String, dynamic> json) => PatientsModel(
        patientName: json["patient_name"],
        dob: json["dob"],
        phone: json["phone"],
        gender: json["gender"],
        service: json["service"],
      );

  Map<String, dynamic> toJson() => {
        "patient_name": patientName,
        "dob": dob,
        "gender": gender,
        "service": service,
      };
}
