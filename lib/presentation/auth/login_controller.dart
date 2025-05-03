import 'package:store_flutter/application/usecases/login_usecases.dart';

class LoginController {
  final LoginUsecase loginUsecase;
  LoginController(this.loginUsecase);
  Future login(String username, String password) async {
    print("llegue" + username);
    final response = await loginUsecase.login(username, password);
    print("llegue" + response.data.person.address);

    if (response.success) {
      print("uno mas" + response.data.person.firstName);

      // Navigate to the home page
      return response;
    } else {
      // Show an error message
    }
  }
}
