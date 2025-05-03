import 'package:store_flutter/data/datasources/auth_remote_data_source.dart';
import 'package:store_flutter/data/models/response.dart';
import 'package:store_flutter/data/models/user.dart';
import 'package:store_flutter/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl(this.remoteDataSource);
  @override
  Future<ApiResponse<UserModels>> login(String email, String password) async {
    return remoteDataSource.login(email, password);
  }
}
