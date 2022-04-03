import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedButton2 extends StatelessWidget {
  final Color color;
  final String title;
  final VoidCallback onPressed;

  RoundedButton2(
      {required this.color, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
        child: MaterialButton(
          onPressed: onPressed,
          hoverColor: Colors.black,
          minWidth: 350.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
