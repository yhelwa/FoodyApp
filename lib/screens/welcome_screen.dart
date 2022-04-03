import 'package:flutter/material.dart';
import 'package:foody/screens/login_screen.dart';
import 'package:foody/screens/registration_screen.dart';
import 'package:foody/screens/contactus_screen.dart';
import 'package:foody/screens/User_screen.dart';
import 'package:foody/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  child: Image.asset('images/logo1.png'),
                  height: 150.0,
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              RoundedButton(
                title: 'Log In',
                color: Color(0xFFFCB74C),
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
              ),
              RoundedButton(
                title: 'Register',
                color: Color(0xFFFCB74C),
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
              ),
              RoundedButton(
                title: 'Profile Page',
                color: Color(0xFFFCB74C),
                onPressed: () {
                  Navigator.pushNamed(context, UserPage.id);
                },
              ),
              RoundedButton(
                title: 'Contact Us',
                color: Color(0xFFFCB74C),
                onPressed: () {
                  Navigator.pushNamed(context, ContactUsScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
