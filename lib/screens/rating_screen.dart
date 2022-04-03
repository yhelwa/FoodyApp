import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foody/components/rounded_button.dart';
import 'package:foody/screens/single_multi_screen.dart';
import 'package:intl/intl.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../constants.dart';

class Ratings {
  final String imagePath;
  final String title;
  final int rating;

  Ratings(this.imagePath, this.title, this.rating);
}

class RatingScreen extends StatefulWidget {
  static const String id = 'rating_screen';

  final int orderID = -1;
  RatingScreen({orderID = -1});

  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  // final Note = TextEditingController();

  final List<Ratings> ratingsList = [
    Ratings("images/p1.jpg", "Chicken Soup", 3),
    Ratings("images/p1.jpg", "Mini Sandwich", 2),
    Ratings("images/p1.jpg", "Chicken Soup", 3),
    Ratings("images/p1.jpg", "Chicken Soup", 3),
    Ratings("images/p1.jpg", "Chicken Soup", 3),
  ];
  @override
  Widget build(BuildContext context) {
    double deviceSizeHeight = MediaQuery.of(context).size.height;
    double deviceSizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: RichText(
                                text: TextSpan(
                                  text: ' What do you think about ...',
                                  style: new TextStyle(
                                      fontSize: deviceSizeHeight * .022,
                                      fontFamily: 'Urbanist-Bold',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: deviceSizeHeight * 0.55,
                    child: ListView.builder(
                        itemCount: ratingsList.length,
                        itemBuilder: (BuildContext context, int index) =>
                            buildTripCard(context, index)),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      text: 'Write feedback (Optional)',
                      style: new TextStyle(
                          fontSize: deviceSizeHeight * .022,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
                hintText: "Write Feedback Here",
                // hintStyle: TextStyle(color: Colors.black26),
                fillColor: Colors.white,
                filled: true,
              ),
              maxLength: 100,
            ),
            RoundedButton(
                color: kOrangeColorInHex,
                title: "Submit Feedback",
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }

  Widget buildTripCard(BuildContext context, int index) {
    final ratings = ratingsList[index];
    double emotion = 3.5;
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: ratings.title,
                        style: new TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star_rounded,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        emotion = rating;
                        print(emotion);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    emotionCalc(emotion),
                    RichText(
                      text: TextSpan(
                        text: ' Chicken Soup',
                        style: new TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Icon emotionCalc(double rating) {
    if (rating < 3.5)
      return Icon(
        Icons.sentiment_very_dissatisfied_outlined,
        color: Colors.red,
      );
    else if (rating > 3.5)
      return Icon(
        Icons.sentiment_very_satisfied_outlined,
        color: Colors.green,
      );
    else
      return Icon(
        Icons.sentiment_neutral_outlined,
        color: Colors.grey,
      );
  }
}
