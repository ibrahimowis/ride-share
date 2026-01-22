import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class UpdateProfile {
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
    String? nationalId,
    String? dateOfBirth,
    File? profileimage,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        if (fullName != null) 'fullName': fullName,
        if (phoneNumber != null) 'phoneNumber': phoneNumber,
        if (gender != null) 'gender': gender,
        if (nationalId != null) 'nationalId': nationalId,
        if (dateOfBirth != null) 'dateOfBirth': dateOfBirth,
        if (profileimage != null && profileimage.existsSync())
          'profile_image': await MultipartFile.fromFile(
            profileimage.path,
            filename: profileimage.path.split('/').last,
          ),
      });
      var response = await dio_.post(
        'https://api-onway.opream.net/api/v1/auth/update-profile',
        data: formData,
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Right('profile updated successfully');
      } else {
        return Left(
          response.data != null
              ? response.data['message'] ?? response.data.toString()
              : 'UnKnown error',
        );
      }
    } catch (e) {
      print('Exception during updateProfile:$e');
      return Left(e.toString());
    }
  }
}
