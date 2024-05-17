// login.dart
import 'package:flutter/material.dart';

import 'home2.dart';
import 'signin.dart';
import 'usuario.dart';

class LoginPage extends StatefulWidget {
  final List<Usuario> usuarios;

  const LoginPage({Key? key, required this.usuarios}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';
  bool _loginExitoso = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Proyecto final Web',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 90.0,
              width: 90,
              child: Image.asset(
                "assets/images/logoBuap.png",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 8.0),
            Text(
              _errorMessage,
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(height: 14.0),
            ElevatedButton(
              onPressed: () {
                _login();
                if (_loginExitoso) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home2()),
                  );
                }
              },
              child: Text('Ingresar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SigninPage(usuarios: widget.usuarios)),
                );
              },
              child: Text('Crear cuenta'),
            ),
          ],
        ),
      ),
    );
  }

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Verificar si el nombre de usuario y la contraseña coinciden con algún usuario registrado
    bool encontrado = false;
    for (var usuario in widget.usuarios) {
      if (usuario.nombre == username && usuario.contrasena == password) {
        encontrado = true;
        break;
      }
    }

    if (encontrado) {
      setState(() {
        _loginExitoso = true;
        _errorMessage = '';
      });
      print('Login exitoso');
    } else {
      setState(() {
        _loginExitoso = false;
        _errorMessage = 'Usuario o contraseña incorrectos. Inténtalo de nuevo.';
      });
    }
  }
}
