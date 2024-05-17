// signin.dart
import 'package:flutter/material.dart';

import 'usuario.dart';

class SigninPage extends StatefulWidget {
  final List<Usuario> usuarios;

  SigninPage({Key? key, required this.usuarios}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registrar usuario:',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            SizedBox(height: 16.0),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Telefono'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Fecha de nacimiento'),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                _signin();
                Navigator.pop(context);
              },
              child: Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }

  void _signin() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    String telefono = _phoneController.text;
    String fechaNacimiento = _ageController.text;

    if (username.isNotEmpty && password.isNotEmpty && telefono.isNotEmpty && fechaNacimiento.isNotEmpty) {
      Usuario nuevoUsuario = Usuario(username, password, telefono, fechaNacimiento);
      setState(() {
        widget.usuarios.add(nuevoUsuario);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Usuario registrado: $username'),
          duration: Duration(seconds: 3),
        ),
      );
      
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Todos los campos son obligatorios'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
