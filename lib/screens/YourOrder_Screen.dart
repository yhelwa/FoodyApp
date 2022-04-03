import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:foody/components/order_tile.dart';
import 'package:provider/provider.dart';
import 'package:foody/components/my_orders_data.dart';

import '../constants.dart';

double sum = 0;

class Order {
  final int quantity;
  final String title;

  Order(this.quantity, this.title);
}

class YourOrderScreen extends StatefulWidget {
  static const String id = 'your_order_screen';
  final int orderID;
  YourOrderScreen({this.orderID = -1});

  @override
  _YourOrderScreenState createState() => _YourOrderScreenState();
}

class _YourOrderScreenState extends State<YourOrderScreen> {
  List<Order> orderList = [Order(2, "Chicken fillet"), Order(5, "Mini Soup")];
  String now = DateFormat.jm().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    OrderTile currentOrder =
        Provider.of<MyOrders>(context).getOrderByID(widget.orderID);
    double deviceSizeHeight = MediaQuery.of(context).size.height;
    double deviceSizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLightWhiteColor,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Order ID #${currentOrder.orderID}',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Urbanist-Bold',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                currentOrder.date,
                style: kLightTextStyle,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xfffafafa),
      body: ListView(
        children: [
          Container(
            width: deviceSizeWidth * 0.95,
            height: deviceSizeHeight * 0.75,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: kOrangeColorInHex, // border color
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "Preparing Order",
                                style: new TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 21.0),
                              child: RichText(
                                text: TextSpan(
                                  text: now,
                                  style: new TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: deviceSizeHeight * 0.10,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: VerticalDivider(
                              color: kOrangeColorInHex,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: kOrangeColorInHex, // border color
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "Out to deliver",
                                style: new TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 21.0),
                              child: RichText(
                                text: TextSpan(
                                  text: now,
                                  style: new TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: deviceSizeHeight * 0.10,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: VerticalDivider(
                              color: kOrangeColorInHex,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xffb1b1b1)),
                                    color: Color(0xffececec),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "Delivery boy is waiting for you",
                                style: new TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 21.0),
                              child: RichText(
                                text: TextSpan(
                                  text: now,
                                  style: new TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: deviceSizeHeight * 0.10,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: VerticalDivider(
                              color: kOrangeColorInHex,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xffb1b1b1)),
                                    color: Color(0xffececec),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "Delivered!",
                                style: new TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 21.0),
                              child: RichText(
                                text: TextSpan(
                                  text: now,
                                  style: new TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RichText(
                    text: TextSpan(
                      text: 'Ordered Items',
                      style: new TextStyle(
                          fontSize: 20,
                          fontFamily: 'Urbanist-Bold',
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        itemCount: orderList.length,
                        itemBuilder: (BuildContext context, int index) =>
                            buildTripCard(context, index)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                  child: RichText(
                    text: TextSpan(
                      text: 'Delivery Address',
                      style: new TextStyle(
                          fontSize: 20,
                          fontFamily: 'Urbanist-Bold',
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: RichText(
                    text: TextSpan(
                      text: "B - 2 (Delivery notes)",
                      style: new TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: deviceSizeWidth * 0.95,
            child: Column(children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20),
                    child: RichText(
                      text: TextSpan(
                        text: 'Payment Method',
                        style: new TextStyle(
                            fontSize: 20,
                            fontFamily: 'Urbanist-Bold',
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              //  child: Column,
            ]),
          ),
          Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10),
                  child: RichText(
                    text: TextSpan(
                      text: 'Cash',
                      style: new TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: deviceSizeWidth * 0.95,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Payment Summary',
                              style: new TextStyle(
                                  fontSize: 20,
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
                            fontSize: 14.0,
                            fontFamily: 'Urbanist-Bold',
                          ),
                        ),
                        // Spacer(),
                        // Spacer(),
                        Text(
                          "${sum.toStringAsFixed(2)}",
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
                            fontSize: 14.0,
                            fontFamily: 'Urbanist-Bold',
                          ),
                        ),
                        // Spacer(),
                        // Spacer(),
                        Text(
                          "${sum.toStringAsFixed(2)}",
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
                            fontSize: 14.0,
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
                          "Wallet",
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 14.0,
                            fontFamily: 'Urbanist-Bold',
                          ),
                        ),
                        // Spacer(),
                        // Spacer(),
                        Text(
                          "${'' + sum.toStringAsFixed(2)}",
                        ),

                        // Spacer(),
                      ],
                    ),
                  ),
                  Divider(),
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
                            fontSize: 14.0,
                            fontFamily: 'Urbanist-Bold',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // Spacer(),
                        // Spacer(),
                        Text(
                          "${'EGP ' + sum.toStringAsFixed(2)}",
                          style: TextStyle(
                            // color: Colors.black38,
                            fontSize: 14.0,
                            fontFamily: 'Urbanist-Bold',
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        // Spacer(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Material(
                      // color: kOrangeColorInHex,
                      borderRadius: BorderRadius.circular(10.0),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 01),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        onPressed: () {
                          // Navigator.pushNamedAndRemoveUntil(
                          //     context, HomePage.id, (route) => false);
                        },
                        hoverColor: Colors.black,
                        minWidth: deviceSizeWidth * .95,
                        // minWidth: 200.0,
                        height: 47.0,
                        child: Text(
                          "Need help?",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTripCard(BuildContext context, int index) {
    final order = orderList[index];
    print(sum);
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "x" + order.quantity.toString(),
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 14.0,
                      fontFamily: 'Urbanist-Bold',
                    ),
                  ),
                  Text(
                    " " + order.title,
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 14.0,
                      fontFamily: 'Urbanist-Bold',
                    ),
                  ),
                  // Spacer(),
                  // Spacer(),

                  // Spacer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
