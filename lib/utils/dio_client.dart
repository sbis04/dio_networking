import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_networking/models/user.dart';

class DioClient {
  Dio _dio = Dio();

  final _baseUrl = 'https://reqres.in/api';

  Future<User> getUser({required int id}) async {
    Response userData = await _dio.get(_baseUrl + '/users/$id');

    print('User Info: ${userData.data}');

    User user = User.fromJson(userData.data);

    return user;
  }
}
