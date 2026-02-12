import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kosom_chat_gpt/feature/auth/data/model/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final _dio = Dio(
    BaseOptions(validateStatus: (status) => status != null && status < 500),
  );

  Future<Either<String, LoginResponseModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await _dio.post(
        'https://api-onway.opream.net/api/v1/auth/login',
        data: {'identifier': email, 'password': password, 'playerId': 'string'},
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final returnedData = LoginResponseModel.fromJson(response.data);
        if (returnedData.data?.accessToken != null) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', returnedData.data!.accessToken!);
        }
        return Right(returnedData);
      } else {
        log('error occured ${response.data}');
        return Left(response.data['message'] ?? 'unknown error');
      }
    } catch (e) {
      log('catch error:: ${e.toString()}');
      return Left(e.toString());
    }
  }

  Future<Either<String, dynamic>> getMe({required String token}) async {
    try {
      final response = await _dio.get(
        'https://api-onway.opream.net/api/v1/auth/get-me',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Right(response.data);
      } else {
        log('GetMe error: ${response.data}');
        return Left(response.data['message'] ?? 'Unknown error');
      }
    } catch (e) {
      log('GetMe catch error: $e');
      return Left(e.toString());
    }
  }

  // ===== REFRESH TOKEN =====
  Future<Either<String, LoginResponseModel>> refreshToken({
    required String refreshToken,
  }) async {
    try {
      final response = await _dio.post(
        'https://api-onway.opream.net/api/v1/auth/refresh-token',
        data: {'refreshToken': refreshToken},
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final returnedData = LoginResponseModel.fromJson(response.data);
        return Right(returnedData);
      } else {
        log('RefreshToken error: ${response.data}');
        return Left(response.data['message'] ?? 'Unknown error');
      }
    } catch (e) {
      log('RefreshToken catch error: $e');
      return Left(e.toString());
    }
  }
}
