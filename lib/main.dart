// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/usuario.dart';
import 'theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'screens/product_screen.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => ShoppingCart(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  final List<Usuario> usuarios = [];

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme(selectedColor: 2).theme(),
      debugShowCheckedModeBanner: false,
      home: LoginPage(usuarios: usuarios),
    );
  }
}
