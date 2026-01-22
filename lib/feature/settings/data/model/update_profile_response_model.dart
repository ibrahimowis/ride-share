// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

UpdateProfile welcomeFromJson(String str) =>
    UpdateProfile.fromJson(json.decode(str));

String welcomeToJson(UpdateProfile data) => json.encode(data.toJson());

class UpdateProfile {
  String fullName;
  String nationalId;
  String gender;
  String phoneNumber;
  DateTime dateOfBirth;
  String nationalImage;
  String profileImage;

  UpdateProfile({
    required this.fullName,
    required this.nationalId,
    required this.gender,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.nationalImage,
    required this.profileImage,
  });

  factory UpdateProfile.fromJson(Map<String, dynamic> json) => UpdateProfile(
    fullName: json["fullName"],
    nationalId: json["nationalId"],
    gender: json["gender"],
    phoneNumber: json["phoneNumber"],
    dateOfBirth: DateTime.parse(json["dateOfBirth"]),
    nationalImage: json["national_image"],
    profileImage: json["profile_image"],
  );

  Map<String, dynamic> toJson() => {
    "fullName": fullName,
    "nationalId": nationalId,
    "gender": gender,
    "phoneNumber": phoneNumber,
    "dateOfBirth":
        "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
    "national_image": nationalImage,
    "profile_image": profileImage,
  };
}
