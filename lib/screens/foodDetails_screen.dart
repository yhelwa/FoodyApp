import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:awesome_select/awesome_select.dart';
import 'package:foody/components/rounded_button.dart';
import 'package:foody/constants.dart';
import 'package:foody/screens/Basket_screen.dart';
import 'package:foody/screens/single_multi_screen.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class ContactModel {
  String name;
  bool isSelected;

  ContactModel(this.name, this.isSelected);
}

class FoodDetails extends StatefulWidget {
  final String imagePath;
  static const String id = 'food_details';

  const FoodDetails({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  _FoodDetailsState createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  var number = 1;
  List<String> size = ['Small', 'Medium', 'Large'];
  List<Content> sideDish = [
    Content('Spicy'),
    Content('Cheese Sauce'),
    Content('Pepperoni'),
    Content('Extra Chicken'),
  ];
  List<Content> extra = [
    Content('Spicy'),
    Content('Cheese Sauce'),
    Content('Pepperoni'),
    Content('Extra Chicken'),
  ];
  final Note = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double deviceSizeHeight = MediaQuery.of(context).size.height;
    double deviceSizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      body: Stack(children: [
        ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('images/p1.jpg'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                children: [
                  MaterialButton(
                    elevation: 0,
                    shape: CircleBorder(
                        side: BorderSide(color: Colors.black26, width: 3)),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        if (number > 1) number--;
                      });
                    },
                    child: Icon(
                      FontAwesomeIcons.minus,
                      size: deviceSizeHeight * .022,
                      color: Colors.black26,
                    ),
                  ),
                  Text(
                    number.toString(),
                    style: TextStyle(fontSize: deviceSizeHeight * .03),
                  ),
                  MaterialButton(
                    elevation: 0,
                    shape: CircleBorder(
                        side: BorderSide(color: kOrangeColorInHex, width: 3)),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        number++;
                      });
                    },
                    child: Icon(
                      FontAwesomeIcons.plus,
                      size: deviceSizeHeight * .022,
                      color: kOrangeColorInHex,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Mini Sandwiches",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "A7san sandwich fi masr,A7san sandwich fi masr,A7san sandwich fi masr,A7san sandwich fi masr ",
                style: TextStyle(color: Colors.black26),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, bottom: 10),
                          child: Text(
                            "Size",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: SizedBox(
                        height: deviceSizeHeight * .3,
                        child: SingleSelectionPage(size, Colors.white),
                      ),

                      //  child: Column,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.white,
                child: Column(children: [
                  ExpansionTile(
                    iconColor: Colors.black,
                    collapsedIconColor: Colors.black,
                    trailing: FaIcon(
                      FontAwesomeIcons.chevronDown,
                      color: Colors.black,
                    ),
                    children: [
                      SizedBox(
                        height: deviceSizeHeight * .35,
                        child: MultiSelectionExample(sideDish),
                      )
                    ],
                    title: Text(
                      "Side Dish",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.white,
                child: Column(children: [
                  ExpansionTile(
                    iconColor: Colors.black,
                    collapsedIconColor: Colors.black,
                    trailing: FaIcon(
                      FontAwesomeIcons.chevronDown,
                      color: Colors.black,
                    ),
                    children: [
                      SizedBox(
                        height: deviceSizeHeight * .35,
                        child: MultiSelectionExample(sideDish),
                      )
                    ],
                    title: Text(
                      "Extra",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Extra Note"),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 70, left: 10, right: 10),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  controller: Note,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black26,
                          )),
                      filled: true,
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'Without Mashroom please',
                      hintStyle: TextStyle(
                        color: Colors.black26,
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black26,
                      ),
                      fillColor: Colors.white38),
                ),
              ),
            )
          ],
        ),
        Positioned(
            bottom: 0,
            left: deviceSizeWidth * .05,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(10.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, BasketScreen.id);
                  },
                  hoverColor: Colors.black,
                  minWidth: deviceSizeWidth * .7,
                  height: deviceSizeHeight * .042,
                  child: Container(
                    width: deviceSizeWidth * .8,
                    child: Row(
                      children: [
                        Text(
                          " 58.00 EGP ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        Text(
                          " Add to basket ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ]),
    );
  }
}
