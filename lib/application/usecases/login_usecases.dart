import 'package:store_flutter/data/models/response.dart';
import 'package:store_flutter/data/models/user.dart';
import 'package:store_flutter/domain/repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository repository;
  LoginUsecase(this.repository);
  Future<ApiResponse<UserModels>> login(String username, String password) {
    print('hola' + username);
    return repository.login(username, password);
  }
}
