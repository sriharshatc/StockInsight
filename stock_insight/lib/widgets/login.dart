import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => new LoginState();
}

class LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: new CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 50,
        child: Image.asset('assets/app_icon.png'),
      ),
    );

    return new Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[logo],
        ),
      ),
    );
  }
}
