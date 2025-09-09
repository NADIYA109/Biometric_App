import 'package:biometric_app/auth_service.dart';
import 'package:biometric_app/home_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget{
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  @override
  void initState() {
    super.initState();
    authInit();
  }
  Future<void> authInit() async {
    bool check =  await AuthService().authenticateLocally();
         if(check){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
         }

  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Auth Page'),
      ),
      body: Center(
        child: IconButton(onPressed: () async{
          authInit();
        }, icon: Icon(Icons.fingerprint, size: 30)),
      ),

    );
  }
}