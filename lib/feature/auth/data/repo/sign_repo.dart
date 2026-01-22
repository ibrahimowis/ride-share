import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SignRepo {
  final _dio = Dio(
    BaseOptions(
      validateStatus: (status) => status != null && status < 500,
      headers: {'Accept': 'application/json'},
    ),
  );

  Future<Either<String, String>> signUp({
    required String email,
    required String fullName,
    required String password,
    required String playerId,
    File? nationalImage,
    File? profileImage,
    String? dataOfBirth,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        'fullName': fullName,
        'email': email,
        'password': password,
        'playerId': playerId,
        if (dataOfBirth != null) 'data_of_birth': dataOfBirth,
        if (profileImage != null && profileImage.existsSync())
          'profile_image': await MultipartFile.fromFile(
            profileImage.path,
            filename: profileImage.path.split('/').last,
          ),
        if (nationalImage != null && nationalImage.existsSync())
          'national_image': await MultipartFile.fromFile(
            nationalImage.path,
            filename: nationalImage.path.split('/').last,
          ),
      });
      var response = await _dio.post(
        'https://api-onway.opream.net/api/v1/auth/sign-up',
        data: formData,
      );

      print('=== SignUp Request Debug ===');
      print('Status code: ${response.statusCode}');
      print('Response headers: ${response.headers}');
      print('Response data: ${response.data}');
      print('=============================');

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Right('Registration successful');
      } else {
        final errorMessage = response.data != null
            ? response.data.toString()
            : 'Unknown error';
        return Left(errorMessage);
      }
    } catch (e) {
      print('Exception during SignUp: $e');
      return Left(e.toString());
    }
  }
}
