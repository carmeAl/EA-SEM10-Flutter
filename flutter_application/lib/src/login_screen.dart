import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application/src/list_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _nombre;
  late String _email;
  late String _password;
  final passwordController=TextEditingController();
  final emailController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 90.0
        ),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const CircleAvatar(
                radius: 100.0,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('images/logo.png'),
              ),
              const Text(
                'Login',
                style: TextStyle(
                  fontFamily: 'NerkoOne',
                  fontSize: 50.0
                )

              ),
              const Text(
                'Ingrese sus credenciales',
                style: TextStyle(
                  fontFamily: 'NerkoOne',
                  fontSize: 20.0
                )

              ),
              const SizedBox(
                width: 160.0,
                height: 15.0,
                child: Divider(
                  color: Colors.blueGrey
                ),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  suffixIcon: const Icon(
                    Icons.email
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  )
                ),
                onSubmitted: (valor){
                  _email=valor;
                  print('El email es $_email');
                },
              ),
              const Divider(
                height: 18.0,
              ),
              TextField(
                controller:passwordController,
                enableInteractiveSelection: true,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  labelText: 'Password',
                  suffixIcon: const Icon(
                    Icons.lock_outline
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  )
                ),
                onSubmitted: (valor){
                  _password=valor;
                  print('El password es $_password');
                },
              ),
              const Divider(
                height: 18.0,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.lightBlueAccent,
                    textStyle: const TextStyle(
                      fontFamily: 'NerkoOne',
                      fontSize: 30.0, 
                    )
                  ),
                  onPressed: () async { 
                    try{var response=await Dio().post("http://192.168.1.54:3000/auth/login",data:
                    {"email":emailController.text,"password":passwordController.text});
                    if(response.statusCode==200){
                      Navigator.of(context).push(MaterialPageRoute<void>(builder: (BuildContext context){
                        return const ListScreen();
                      }));
                    }}
                    catch(e){
                      print("Error"+e.toString());
                    }
                    
                    print('diste clic');
                  },
                  child: const Text('Sign in'),
                  )
                  
              ),
              
            ],
          )
        ]

      ),
    );
  }
}