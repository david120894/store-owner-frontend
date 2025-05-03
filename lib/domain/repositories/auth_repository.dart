import 'package:store_flutter/data/models/response.dart';
import 'package:store_flutter/data/models/user.dart';

abstract class AuthRepository {
  Future<ApiResponse<UserModels>> login(String email, String password);
}
