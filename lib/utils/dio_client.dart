import 'package:dio/dio.dart';
import 'package:dio_networking/models/user.dart';
import 'package:dio_networking/models/user_info.dart';
import 'package:dio_networking/utils/logging.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://reqres.in/api',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  )..interceptors.add(Logging());

  Future<User?> getUser({required String id}) async {
    User? user;

    try {
      Response userData = await _dio.get('/users/$id');

      print('User Info: ${userData.data}');

      user = User.fromJson(userData.data);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }

    return user;
  }

  Future<UserInfo?> createUser({required UserInfo userInfo}) async {
    UserInfo? retrievedUser;

    try {
      Response response = await _dio.post(
        '/users',
        data: userInfo.toJson(),
      );

      print('User created: ${response.data}');

      retrievedUser = UserInfo.fromJson(response.data);
    } catch (e) {
      print('Error creating user: $e');
    }

    return retrievedUser;
  }

  Future<UserInfo?> updateUser({
    required UserInfo userInfo,
    required String id,
  }) async {
    UserInfo? updatedUser;

    try {
      Response response = await _dio.put(
        '/users/$id',
        data: userInfo.toJson(),
      );

      print('User updated: ${response.data}');

      updatedUser = UserInfo.fromJson(response.data);
    } catch (e) {
      print('Error updating user: $e');
    }

    return updatedUser;
  }

  Future<void> deleteUser({required String id}) async {
    try {
      await _dio.delete('/users/$id');
      print('User deleted!');
    } catch (e) {
      print('Error deleting user: $e');
    }
  }
}
