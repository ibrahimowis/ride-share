import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kosom_chat_gpt/feature/auth/data/model/login_response_model.dart';

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
        return Right(returnedData);
        //TODO: look at this success
      } else {
        log('error occured ${response.data}');
        return Left(response.data['message']);
      }
    } catch (e) {
      log('catch error:: ${e.toString()}');
      return Left(e.toString());
    }
  }
}
