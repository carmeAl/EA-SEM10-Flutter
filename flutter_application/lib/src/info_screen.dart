import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application/infrastructure/models/subject.dart';



class InfoScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 156, 216, 242),
      appBar: AppBar(
          title: Text('INFORMATION'),
          shadowColor: Color.fromRGBO(0, 0, 128, 4),
          backgroundColor: Color.fromRGBO(0, 0, 128, 4)),
      body: Text("Hey there we are EA students, here we are presenting you our first flutter app"),
    );}
  }