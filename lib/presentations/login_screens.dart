import 'package:flutter/material.dart';
import 'package:store_flutter/presentation/auth/login_controller.dart';

class LoginScreens extends StatefulWidget {
  final LoginController loginController;

  const LoginScreens({super.key, required this.loginController});

  @override
  State<LoginScreens> createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void _login() async {
    final username = _username.text;
    final password = _password.text;

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Por favor completa todos los campos'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 15),
              Text("Cargando..."),
            ],
          ),
        );
      },
    );

    try {
      final result = await widget.loginController.login(username, password);
      print('Usuario: ${result.data.username}');
      Navigator.pop(context); // Cierra el diálogo de carga

      if (result.success) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(result.message)));
      }
    } catch (e) {
      Navigator.pop(context); // Cierra el diálogo de carga si hay error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error de conexión o credenciales inválidas')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tienda Vicky',
                style: TextStyle(
                  color: Colors.amberAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent, // Hace el AppBar transparente
        elevation: 0, // Elimina la sombra del AppBar
        //   flexibleSpace: Container(
        //     decoration: BoxDecoration(
        //       image: DecorationImage(
        //         image: AssetImage('assets/images/head.png'),
        //         fit:
        //             BoxFit
        //                 .fitWidth, // Esto asegura que la imagen ocupe todo el espacio
        //       ),
        //     ),
        //   ),
      ),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0XFFAA60C8),
              Color(0XFFD69ADE),
              Color(0XFFEABDE6),
              Color(0XFFFFDFEF),
            ],
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Center(
                      child: Image.asset('assets/images/image.png'),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(right: 20, left: 20, bottom: 15),
                    child: TextFormField(
                      controller: _username,
                      decoration: InputDecoration(
                        labelText: 'usuario',
                        prefixIcon: Icon(Icons.supervised_user_circle_rounded),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(right: 20, left: 20, bottom: 15),
                    child: TextFormField(
                      controller: _password,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: 'password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 15),
                    child: ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(216, 155, 204, 209),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Iniciar sesión",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
