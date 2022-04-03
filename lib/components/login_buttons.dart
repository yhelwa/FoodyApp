import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:foody/constants.dart';

class LoginButtons extends StatelessWidget {
  LoginButtons();

  @override
  Widget build(BuildContext context) {
    List<Widget> mySocials = [];
    mySocials.add(
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: AppleAuthButton(
            text: 'Apple',
            style: kAuthButtonStyle,
            onPressed: () {},
            darkMode: false,
          ),
        ),
      ),
    );
    mySocials.add(
      Expanded(
        child: GoogleAuthButton(
          text: 'Google',
          style: kAuthButtonStyle,
          onPressed: () {},
          darkMode: false,
        ),
      ),
    );
    mySocials.add(
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: FacebookAuthButton(
            text: 'Facebook',
            style: kAuthButtonStyle,
            onPressed: () {},
            darkMode: false,
          ),
        ),
      ),
    );
    return Row(
      children: mySocials,
    );
  }
}
/*
GestureDetector(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(width: 0.75),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              myIcon,
              SizedBox(
                width: 5.0,
              ),
              Text(
                myTitle,
                style: GoogleFonts.openSansCondensed(
                    fontWeight: FontWeight.bold, color: Colors.black54),
              )
            ],
          ),
        ),
      ),
    );
*/
