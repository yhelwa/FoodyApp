import 'package:flutter/material.dart';
import 'package:foody/constants.dart';
import 'package:foody/screens/login_screen.dart';
import 'package:foody/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateToWelcome();
  }

  _navigateToWelcome() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Navigator.pushNamed(context, LoginScreen.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: kOrangeColorInHex,
        child: Image.asset('images/logo2.png'),
      ),
    );
  }
}
