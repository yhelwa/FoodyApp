import 'package:flutter/material.dart';
import 'package:foody/components/notifications_data.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:foody/components/my_orders_data.dart';
import 'package:foody/components/order_tile.dart';
import 'package:foody/constants.dart';

class TrackingScreen extends StatefulWidget {
  static const String id = 'tracking_screen';

  final int orderID;
  TrackingScreen({this.orderID = -1});

  @override
  _TrackingScreenState createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  @override
  Widget build(BuildContext context) {
    OrderTile currentOrder =
        Provider.of<MyOrders>(context).getOrderByID(widget.orderID);
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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: kOrangeColorInHex,
      ),
    );
  }
}
