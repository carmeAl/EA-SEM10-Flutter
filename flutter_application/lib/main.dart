import 'package:flutter/material.dart';
import 'package:flutter_application/src/app.dart';
import 'package:flutter_application/src/login_screen.dart';

void main() => runApp( const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material Login',
      home:LoginScreen(),
    );
  }
}

