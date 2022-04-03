import 'package:foody/constants.dart';
import 'package:flutter/material.dart';
import 'package:foody/components/rounded_button.dart';
import 'package:foody/screens/home_screen.dart';
import 'package:foody/screens/registration_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foody/components/login_buttons.dart';
import 'SmartVillage_Screen.dart';
import 'empty_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  String? phone;
  String? password;
  bool _obscureText = true;
  Icon myIcon = Icon(Icons.visibility_off);

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceSizeHeight = MediaQuery.of(context).size.height;
    double deviceSizeWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: deviceSizeHeight * .017,
                  ),
                  Hero(
                    tag: 'logo',
                    child: Container(
                      height: 30.0,
                      child: Image.asset('images/logo1.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      'Welcome Back!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: deviceSizeHeight * .024,
                        fontFamily: 'Urbanist-Bold',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              ListView(
                shrinkWrap: true,
                reverse: true,
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      //Do something with the user input.
                      phone = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      labelText: 'Phone',
                      hintText: 'Enter your phone number',
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    obscureText: _obscureText,
                    onChanged: (value) {
                      //Do something with the user input.
                      password = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _toggle();
                            myIcon = _obscureText
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility);
                          });
                        },
                        child: myIcon,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  RoundedButton(
                    title: 'Login',
                    color: kOrangeColorInHex,
                    onPressed: () async {
                      Navigator.pushNamed(context, SmartVillageScreen.id);
                      setState(() {
                        showSpinner = true;
                      });
                      if ((phone == '' || password == '') ||
                          (phone == null || password == null)) {
                        setState(() {
                          showSpinner = false;
                          // Alert(
                          //   context: context,
                          //   style: alertStyle,
                          //   type: AlertType.info,
                          //   title: "Login error",
                          //   desc: "Fill all the fields.",
                          //   buttons: [
                          //     DialogButton(
                          //       child: Text(
                          //         "Ok",
                          //         style: TextStyle(
                          //             color: Colors.white, fontSize: 20),
                          //       ),
                          //       onPressed: () => Navigator.pop(context),
                          //       color: Color.fromRGBO(0, 179, 134, 1.0),
                          //       radius: BorderRadius.circular(0.0),
                          //     ),
                          //   ],
                          // ).show();
                        });
                      } else {
                        try {
                          //Login using phone and password
                          /*
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        setState(() {
                          showSpinner = false;
                        });
                        //Navigator.pushNamed(context, ChatScreen.id);
                      }
                      */
                          setState(() {
                            showSpinner = false;
                          });
                        } catch (e) {
                          setState(() {
                            showSpinner = false;
                            Alert(
                              context: context,
                              style: alertStyle,
                              type: AlertType.info,
                              title: "Login error",
                              desc:
                                  "Either your email address, your password or maybe both are wrong.",
                              buttons: [
                                DialogButton(
                                  child: Text(
                                    "Ok",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: deviceSizeHeight * .022),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  color: Color.fromRGBO(0, 179, 134, 1.0),
                                  radius: BorderRadius.circular(0.0),
                                ),
                              ],
                            ).show();
                          });
                        }
                      }
                    },
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide.none,
                    ),
                    elevation: 0.0,
                    color: kLightGreyColorInHex,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'I don\'t have an account',
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          GestureDetector(
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                color: kOrangeColorInHex,
                                fontFamily: 'Urbanist-Bold',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RegistrationScreen.id);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: deviceSizeHeight * .017,
                  ),
                  Center(
                    child: Text(
                      'or continue with',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  SizedBox(
                    height: deviceSizeHeight * .017,
                  ),
                  LoginButtons(),
                ].reversed.toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
