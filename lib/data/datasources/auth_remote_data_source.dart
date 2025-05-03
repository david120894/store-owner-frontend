import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_flutter/data/models/response.dart';
import 'package:store_flutter/data/models/user.dart';

class AuthRemoteDataSource {
  final http.Client client;
  AuthRemoteDataSource(this.client);
  Future<ApiResponse<UserModels>> login(
    String username,
    String password,
  ) async {
    print("casi lleque username" + username);
    print("casi llegue password" + password);
    final response = await client.post(
      // Uri.parse('http://localhost:8081/api/v1/login'),
      Uri.parse('http://192.168.1.119:8081/api/v1/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      final jsonMap = jsonDecode(response.body);
      print(jsonMap);
      print(response);
      return ApiResponse<UserModels>.fromJson(
        jsonMap,
        (data) => UserModels.fromJson(data),
      );
    } else {
      throw Exception('Failed to login');
    }
  }
}
