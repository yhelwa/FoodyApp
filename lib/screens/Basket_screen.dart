import 'package:flutter/material.dart';
import 'package:foody/components/rounded_button.dart';
import 'package:foody/screens/home_screen.dart';
import 'package:intl/intl.dart';

import '../constants.dart';
import 'Checkout.dart';

class Basket {
  final String imagePath;
  final String title;
  final double budget;

  Basket(this.imagePath, this.title, this.budget);
}

double sum = 0;

class BasketScreen extends StatefulWidget {
  static const String id = 'basket_screen';

  @override
  _BasketScreenState createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  final List<Basket> basketList = [
    Basket('images/photo1.jpg', "Mini Sandwich", 104),
    Basket('images/photo1.jpg', "Burger", 60),
    Basket('images/photo1.jpg', "Mini Sandwich", 120),
  ];

  @override
  Widget build(BuildContext context) {
    double deviceSizeHeight = MediaQuery.of(context).size.height;
    double deviceSizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: ListView.builder(
                        itemCount: basketList.length,
                        itemBuilder: (BuildContext context, int index) =>
                            buildTripCard(context, index)),
                  ),
                ),
                Container(
                  width: deviceSizeWidth * 0.95,
                  child: Card(
                    // elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    color: Color(0xfffbf4e9),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Have a promo code?",
                            style: TextStyle(
                              // color: Colors.black38,
                              fontSize: deviceSizeHeight * .017,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Spacer(),
                          // Spacer(),
                          TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  isScrollControlled: true,

                                  // backgroundColor: Color(0xfffafafa),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  context: context,
                                  builder: ((builder) => SingleChildScrollView(
                                          child: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom),
                                        child: customisedBottomSheet(context),
                                      ))));
                            },
                            child: Text(
                              "Add promo code",
                              style: TextStyle(
                                // fontSize: 14.0,
                                fontWeight: FontWeight.bold,

                                color: kOrangeColorInHex,
                              ),
                            ),
                          ),
                          // Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Payment Summary\n',
                                    style: new TextStyle(
                                        fontSize: deviceSizeHeight * .022,
                                        fontFamily: 'Urbanist-Bold',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                // basket.title,
                                "Subtotal",
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: deviceSizeHeight * .017,
                                  fontFamily: 'Urbanist-Bold',
                                ),
                              ),
                              // Spacer(),
                              // Spacer(),
                              Text(
                                "${'EGP' + sum.toStringAsFixed(2)}",
                              ),

                              // Spacer(),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                // basket.title,
                                "Delivery fee",
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: deviceSizeHeight * .017,
                                  fontFamily: 'Urbanist-Bold',
                                ),
                              ),
                              // Spacer(),
                              // Spacer(),
                              Text(
                                "${'EGP ' + sum.toStringAsFixed(2)}",
                              ),

                              // Spacer(),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                // basket.title,
                                "Discount",
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: deviceSizeHeight * .017,
                                  fontFamily: 'Urbanist-Bold',
                                ),
                              ),
                              // Spacer(),
                              // Spacer(),
                              Text(
                                "${'' + sum.toStringAsFixed(2)}",
                                style: TextStyle(color: Colors.green),
                              ),

                              // Spacer(),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                // basket.title,
                                "Total amount",
                                style: TextStyle(
                                  // color: Colors.black38,
                                  fontSize: deviceSizeHeight * .017,
                                  fontFamily: 'Urbanist-Bold',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              // Spacer(),
                              // Spacer(),
                              Text(
                                "${'EGP ' + sum.toStringAsFixed(2)}",
                              ),

                              // Spacer(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: deviceSizeHeight * .04),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  // color: kOrangeColorInHex,
                  borderRadius: BorderRadius.circular(10.0),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: kOrangeColorInHex, width: 01),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, HomePage.id, (route) => false);
                    },
                    hoverColor: Colors.black,
                    minWidth: deviceSizeWidth * .45,
                    // minWidth: 200.0,
                    height: 47.0,
                    child: Text(
                      "Add items",
                      style: TextStyle(
                        color: kOrangeColorInHex,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: kOrangeColorInHex,
                  borderRadius: BorderRadius.circular(10.0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, CheckoutScreen.id);
                    },
                    hoverColor: Colors.black,
                    minWidth: deviceSizeWidth * .45,
                    height: 42.0,
                    child: Text(
                      "Checkout",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }

  Widget buildTripCard(BuildContext context, int index) {
    double deviceSizeHeight = MediaQuery.of(context).size.height;
    double deviceSizeWidth = MediaQuery.of(context).size.width;
    final basket = basketList[index];
    sum += basket.budget;
    print(sum);
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        basket.title,
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: deviceSizeHeight * .017,
                          fontFamily: 'Urbanist-Bold',
                        ),
                      ),
                      // Spacer(),
                      // Spacer(),
                      Text(
                        "${basket.budget.toStringAsFixed(2) + 'EGP'}",
                        style: TextStyle(
                          color:
                              (basket.budget < 0) ? Colors.red : Colors.green,
                          fontSize: deviceSizeHeight * .017,
                        ),
                      ),
                      // Spacer(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget customisedBottomSheet(BuildContext context) {
  double deviceSizeHeight = MediaQuery.of(context).size.height;
  double deviceSizeWidth = MediaQuery.of(context).size.width;
  return Container(
    height: deviceSizeHeight * .5,
    // width: deviceSizeWidth,
//margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 40),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(
                "Add Promo Code",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: deviceSizeHeight * .022,
                  fontFamily: 'Urbanist-Bold',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        // SizedBox(height: deviceSizeHeight * .04),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: deviceSizeWidth * 0.9,
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                  hintText: "Enter promo code here",
                  hintStyle: TextStyle(color: Colors.black26),
                  fillColor: Color(0xffededed),
                  filled: true,
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text("Or use",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: deviceSizeHeight * .022,
                    fontFamily: 'Urbanist-Bold',
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: new InkWell(
                onTap: () {
                  print("tapped");
                },
                child: Container(
                  width: deviceSizeWidth * 0.9,
                  // height: 50.0,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: RichText(
                      text: TextSpan(
                        //   style: Theme.of(context).textTheme.body1,
                        children: <TextSpan>[
                          new TextSpan(
                              text: 'XML2021\n',
                              style: new TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          new TextSpan(
                            text: 'Get 50% Discount on your first order',
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
        ),
        RoundedButton(
          color: kOrangeColorInHex,
          title: "Add promo",
          onPressed: () {
            Navigator.pop(context, true);
          },
        )
      ],
    ),
  );
}
