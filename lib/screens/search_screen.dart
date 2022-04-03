import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SearchPage extends StatefulWidget {
  static String id = "search_screen";
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Material(
              elevation: 2,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  filled: true,
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: 'Looking for ..',
                  hintStyle: TextStyle(
                    color: Colors.black26,
                  ),
                  fillColor: Colors.white,
                ),
              ),
            ),
          ),
          Lottie.asset('LottieFiles/64018-searching-data.json')
        ],
      ),
    );
  }
}
