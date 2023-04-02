import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatelessWidget {
  final nameController=TextEditingController();
  final surnameController=TextEditingController();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
    backgroundColor: Color.fromARGB(255, 156, 216, 242),
    appBar: AppBar(title: Text('REGISTER'), shadowColor: Color.fromRGBO(0, 0, 128,4),backgroundColor: Color.fromRGBO(0, 0, 128,4)),
    body: Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Name'),
            validator: (value) {
              if (value=="" || value==null) {
                return 'Please introduce your name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: surnameController,
            decoration: InputDecoration(labelText: 'Surname'),
            validator: (value) {
              if (value=="" || value==null) {
                return 'Please introduce your name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value=="") {
                return 'Please introduce your email';
              }
              return null;
            },
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: (value) {
              if (value=="") {
                return 'Please introduce a password';
              }
              return null;
            },
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: ()async {
                var response=await Dio().post("http://192.168.56.1:3002/auth/login",data:
                    {"name": nameController.text,"surname":surnameController.text, "email": emailController.text,"password":passwordController.text});
                if (response.statusCode == 200) {
                  Navigator.pushNamed(context, '/list_screen');
                } else {
                  print("Drama");
                }
              },
                /*
                if(register(nameController.text, surnameController.text, emailController.text, passwordController.text)==true){
                  Navigator.pushNamed(context, '/register_screen');
                }
                */
              child: Text('Register'),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(0, 0, 128,4))),
            ),
          ),
        ],
      ),
    ),
  );
  
  }
  Future register(String name, String surname, String email, String password) async {
    var response=await Dio().post("http://192.168.56.1:3002/auth/login",data:
                    {"name": name,"surname":surname, "email": email,"password":password});

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
}
}
