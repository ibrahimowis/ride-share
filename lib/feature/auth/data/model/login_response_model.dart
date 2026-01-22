class LoginResponseModel {
  final bool? success;
  final String? message;
  final LoginData? data;

  LoginResponseModel({this.success, this.message, this.data});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? LoginData.fromJson(json['data']) : null,
    );
  }
}

class LoginData {
  final User? user;
  final String? accessToken;
  final String? refreshToken;
  final String? tokenType;
  final String? expiresIn;
  final String? refreshExpiresIn;
  final String? status;
  final List<String>? roles;

  LoginData({
    this.user,
    this.accessToken,
    this.refreshToken,
    this.tokenType,
    this.expiresIn,
    this.refreshExpiresIn,
    this.status,
    this.roles,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      tokenType: json['token_type'],
      expiresIn: json['expires_in'],
      refreshExpiresIn: json['refresh_expires_in'],
      status: json['status'],
      roles: json['roles'] != null ? List<String>.from(json['roles']) : null,
    );
  }
}

class User {
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final int? id;
  final String? email;
  final String? fullName;
  final String? nationalId;
  final String? gender;
  final String? phoneNumber;
  final String? status;
  final String? statusChangedAt;
  final int? statusChangedBy;
  final List<String>? roles;
  final String? nationalImageUrl;
  final String? profileImageUrl;
  final String? dateOfBirth;
  final String? signature;
  final List<String>? playerIds;
  final num? balance;
  final num? reservedBalance;
  final num? availableBalance;
  final int? tokenVersion;
  final DriverProfile? driverProfile;
  final bool? isSeeded;

  User({
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.id,
    this.email,
    this.fullName,
    this.nationalId,
    this.gender,
    this.phoneNumber,
    this.status,
    this.statusChangedAt,
    this.statusChangedBy,
    this.roles,
    this.nationalImageUrl,
    this.profileImageUrl,
    this.dateOfBirth,
    this.signature,
    this.playerIds,
    this.balance,
    this.reservedBalance,
    this.availableBalance,
    this.tokenVersion,
    this.driverProfile,
    this.isSeeded,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      deletedAt: json['deletedAt'],
      id: json['id'],
      email: json['email'],
      fullName: json['fullName'],
      nationalId: json['nationalId'],
      gender: json['gender'],
      phoneNumber: json['phoneNumber'],
      status: json['status'],
      statusChangedAt: json['statusChangedAt'],
      statusChangedBy: json['statusChangedBy'],
      roles: json['roles'] != null ? List<String>.from(json['roles']) : null,
      nationalImageUrl: json['nationalImageUrl'],
      profileImageUrl: json['profileImageUrl'],
      dateOfBirth: json['dateOfBirth'],
      signature: json['signature'],
      playerIds: json['playerIds'] != null
          ? List<String>.from(json['playerIds'])
          : null,
      balance: json['balance'],
      reservedBalance: json['reservedBalance'],
      availableBalance: json['availableBalance'],
      tokenVersion: json['tokenVersion'],
      driverProfile: json['driverProfile'] != null
          ? DriverProfile.fromJson(json['driverProfile'])
          : null,
      isSeeded: json['isSeeded'],
    );
  }
}

class DriverProfile {
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final int? id;
  final String? status;
  final String? address;
  final String? statusChangedAt;
  final int? statusChangedBy;
  final num? averageRating;
  final num? totalReviews;
  final String? driverPhoto;
  final String? driverLicensePhoto;
  final num? balance;
  final Vehicle? vehicle;

  DriverProfile({
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.id,
    this.status,
    this.address,
    this.statusChangedAt,
    this.statusChangedBy,
    this.averageRating,
    this.totalReviews,
    this.driverPhoto,
    this.driverLicensePhoto,
    this.balance,
    this.vehicle,
  });

  factory DriverProfile.fromJson(Map<String, dynamic> json) {
    return DriverProfile(
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      deletedAt: json['deletedAt'],
      id: json['id'],
      status: json['status'],
      address: json['address'],
      statusChangedAt: json['statusChangedAt'],
      statusChangedBy: json['statusChangedBy'],
      averageRating: json['averageRating'],
      totalReviews: json['totalReviews'],
      driverPhoto: json['driverPhoto'],
      driverLicensePhoto: json['driverLicensePhoto'],
      balance: json['balance'],
      vehicle: json['vehicle'] != null
          ? Vehicle.fromJson(json['vehicle'])
          : null,
    );
  }
}

class Vehicle {
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final int? id;
  final String? vehicleType;
  final int? seatNumber;
  final String? make;
  final String? model;
  final String? licensePlateNumber;
  final String? licensePlatePhoto;
  final String? carPhoto;
  final String? license;

  Vehicle({
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.id,
    this.vehicleType,
    this.seatNumber,
    this.make,
    this.model,
    this.licensePlateNumber,
    this.licensePlatePhoto,
    this.carPhoto,
    this.license,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      deletedAt: json['deletedAt'],
      id: json['id'],
      vehicleType: json['vehicleType'],
      seatNumber: json['seatNumber'],
      make: json['make'],
      model: json['model'],
      licensePlateNumber: json['licensePlateNumber'],
      licensePlatePhoto: json['licensePlatePhoto'],
      carPhoto: json['carPhoto'],
      license: json['license'],
    );
  }
}
