import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> with TickerProviderStateMixin {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final appLogo = CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 50,
      child: Image.asset('assets/app_icon.png'),
    );

    final welcomeText = Padding(
        padding: EdgeInsets.only(left: 40, right: 40),
        child: Text(
          'Hello there!',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
              fontSize: 50),
        ));

    final loginText = Padding(
        padding: EdgeInsets.only(left: 35, right: 35),
        child: Text(
          'Please sign in to continue',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.grey[700],
              fontSize: 25),
        ));

    final googleButton = Padding(
        padding: EdgeInsets.only(left: 35, right: 35),
        child: SizedBox(
          height: 70,
          child: RaisedButton.icon(
              onPressed: _initiateAuth,
              color: Colors.white,
              splashColor: Colors.blue[100],
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(100)),
              icon: Padding(
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, left: 5, right: 15),
                  child: Image.asset('assets/sign_in_icon.png')),
              label: Text(
                'Sign in with Google',
                style: TextStyle(color: Colors.grey[700], fontSize: 22),
              )),
        ));

    return new Scaffold(
        body: AnimatedBackground(
      behaviour: BubblesBehaviour(),
      vsync: this,
      child: Center(
        child: ListView(
          padding: EdgeInsets.only(left: 25, right: 25),
          children: <Widget>[
            SizedBox(height: 125),
            appLogo,
            SizedBox(height: 75),
            welcomeText,
            loginText,
            SizedBox(height: 100),
            googleButton
          ],
        ),
      ),
    ));
  }

  void _initiateAuth() {
    _auth.currentUser().then((FirebaseUser user) {
      if (user != null) {
        _processUser(user);
      } else {
        _handleSignIn().then((FirebaseUser user) {
          _processUser(user);
        }).catchError((e) => print(e));
      }
    }).catchError((e) => print(e));
  }

  void _processUser(FirebaseUser user) {
    print(user);
  }

  Future<FirebaseUser> _handleSignIn() async {
    print('Signing in with Google');
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    FirebaseUser user = await _auth.signInWithGoogle(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return user;
  }
}
