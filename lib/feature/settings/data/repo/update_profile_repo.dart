import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateProfileRepo {
  final dio_ = Dio(
    BaseOptions(
      validateStatus: (status) => status != null && status < 500,
      headers: {'Accept': 'application/json'},
    ),
  );

  Future<Either<String, String>> updateDate({
    String? fullName,
    String? phoneNumber,
    String? gender,
    String? dateOfBirth,
    File? profileimage,
    File? nationalImage,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        if (fullName != null) 'fullName': fullName,
        if (phoneNumber != null) 'phoneNumber': phoneNumber,
        if (gender != null) 'gender': gender,
        if (dateOfBirth != null) 'dateOfBirth': dateOfBirth,
        if (profileimage != null && profileimage.existsSync())
          'profile_image': await MultipartFile.fromFile(
            profileimage.path,
            filename: profileimage.path.split('/').last,
          ),
        if (nationalImage != null && nationalImage.existsSync())
          'national_image': await MultipartFile.fromFile(
            nationalImage.path,
            filename: nationalImage.path.split('/').last,
          ),
      });

      // initiate instance from the shared preferences
      final prefs = await SharedPreferences.getInstance();
      // Get token from shared preferences
      String? accessToken = await prefs.getString('token');

      log("start debug");
      var response = await dio_.post(
        'https://api-onway.opream.net/api/v1/auth/update-profile',
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            'Authorization': 'Bearer ${accessToken ?? ""}',
          },
        ),
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        log('Response data: ${response.data}');

        return Right('profile updated successfully');
      } else {
        log('Error occurred: ${response.data}');
        return Left(
          response.data != null
              ? response.data['message'] ?? response.data.toString()
              : 'UnKnown error',
        );
      }
    } catch (e) {
      log('Exception during updateProfile: $e');
      print('Exception during updateProfile:$e');
      return Left(e.toString());
    }
  }
}
