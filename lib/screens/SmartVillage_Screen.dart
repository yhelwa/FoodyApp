import 'package:flutter/material.dart';
import 'package:foody/components/rounded_button.dart';
import 'package:foody/constants.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'empty_screen.dart';
import 'home_screen.dart';

class SmartVillageScreen extends StatefulWidget {
  static const String id = 'smart_village_screen';

  @override
  _SmartVillageScreenState createState() => _SmartVillageScreenState();
}

class _SmartVillageScreenState extends State<SmartVillageScreen> {
  @override
  Widget build(BuildContext context) {
    double deviceSizeHeight = MediaQuery.of(context).size.height;
    double deviceSizeWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfffafafa),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: deviceSizeHeight * .015,
                ),
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 60.0,
                    child: Image.asset('images/logo1.png'),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'Where is your building in Smart Village?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: deviceSizeHeight * .025,
                          fontFamily: 'Urbanist-Bold',
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'We deliver inside Smart Village only',
                      style: TextStyle(
                        color: Colors.black38,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                        child: Container(
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              prefixIcon: new Icon(Icons.search,
                                  color: Color(0xffc5c5c5)),
                              hintText: "Enter Building",
                              hintStyle: TextStyle(color: Color(0xffc5c5c5)),
                              fillColor: Color(0xffebebeb),
                              filled: true,
                            ),
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: buildings.length,
                        itemBuilder: (BuildContext context, int index) =>
                            buildingCard(context, index)),
                  ],
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.all(10),
            child: RoundedButton(
              title: 'Explore Menu',
              color: kOrangeColorInHex,
              onPressed: () {
                showModalBottomSheet(
                    backgroundColor: Color(0xfffafafa),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    context: context,
                    builder: ((builder) => customisedBottomSheet(context)));
              },
            )),
      ),
    );
  }

  // var isSelected = [false, false, false, false];
  bool selected = false;

  Widget buildingCard(BuildContext context, int index) {
    double deviceSizeHeight = MediaQuery.of(context).size.height;
    double deviceSizeWidth = MediaQuery.of(context).size.width;
    return new Container(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: Card(
          shape: selected
              ? new RoundedRectangleBorder(
                  side: new BorderSide(color: kOrangeColorInHex, width: 0.5),
                  borderRadius: BorderRadius.circular(4.0))
              : new RoundedRectangleBorder(
                  side: new BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(4.0)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                  child: Row(children: <Widget>[
                    Text(
                      buildings[index],
                      style: new TextStyle(fontSize: deviceSizeHeight * 0.017),
                    ),
                    Spacer(),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final List<String> buildings = [
  "A - 1",
  "A - 2",
  "A - 3",
  "A - 4 ",
];

Widget customisedBottomSheet(BuildContext context) {
  double deviceSizeHeight = MediaQuery.of(context).size.height;
  double deviceSizeWidth = MediaQuery.of(context).size.width;
  return Container(
    height: deviceSizeHeight * 0.35,
    width: deviceSizeWidth,
//margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 40),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text("When menu do you want to see?",
              style: TextStyle(
                color: Colors.black,
                fontSize: deviceSizeHeight * 0.022,
                fontFamily: 'Urbanist-Bold',
                fontWeight: FontWeight.w600,
              )),
        ),
        // SizedBox(height: deviceSizeHeight * .04),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              child: new InkWell(
                onTap: () {
                  Navigator.pushNamed(context, HomePage.id);
                  print("tapped");
                },
                child: Container(
                  height: deviceSizeHeight * 0.1,
                  width: deviceSizeWidth * 0.9,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: RichText(
                      text: TextSpan(
                        //   style: Theme.of(context).textTheme.body1,
                        children: <TextSpan>[
                          new TextSpan(
                              text: 'Breakfast Menu\n',
                              style: new TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          new TextSpan(
                            text: 'Oriental Sandwich, Croissant, Juice',
                            style: TextStyle(color: Colors.black38),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              child: new InkWell(
                onTap: () {
                  print("tapped");
                },
                child: Container(
                  width: deviceSizeWidth * 0.9,
                  height: deviceSizeHeight * 0.12,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: RichText(
                      text: TextSpan(
                        //   style: Theme.of(context).textTheme.body1,
                        children: <TextSpan>[
                          new TextSpan(
                              text: 'Lunch Menu\n',
                              style: new TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          new TextSpan(
                            text:
                                'Appetizer, Soup, Main Dishes, Burger, Sandwich, Salad',
                            style: TextStyle(color: Colors.black38),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
