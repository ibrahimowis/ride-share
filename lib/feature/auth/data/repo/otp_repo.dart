import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class OtpRepo {
  final dio_ = Dio(
    BaseOptions(
      validateStatus: (status) => status != null && status < 500,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );
  Future<Either<String, String>> otp({
    required String email,
    required String otpCode,
    required bool isFromForgetPassword,
  }) async {
    try {
      var response = await dio_.post(
        'https://api-onway.opream.net/api/v1/auth/verify-otp',
        data: {
          'email': email,
          'otpCode': otpCode,
          'isFromForgetPassword': isFromForgetPassword,
        },
      );
      log(response.data.toString());
      final status = response.statusCode ?? 0;
      if (status >= 200 && status < 300) {
        return Right('otp verified successfully');
      } else {
        log(response.data.toString());

        return Left(response.data['message'] ?? 'Error');
      }
    } catch (e) {
      log(e.toString());
      return Left(e.toString());
    }
  }
}
