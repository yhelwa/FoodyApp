import 'package:flutter/material.dart';
import 'package:foody/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foody/screens/home_screen.dart';
import 'package:intl/intl.dart';
import 'package:foody/components/order_tile.dart';
import 'package:provider/provider.dart';
import 'package:foody/components/my_orders_data.dart';

class TrackOrdersScreen extends StatefulWidget {
  static const String id = 'track_orders_screen';

  @override
  _TrackOrdersScreenState createState() => _TrackOrdersScreenState();
}

class _TrackOrdersScreenState extends State<TrackOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Current Order',
                style: kLightTextStyle,
              ),
              Provider.of<MyOrders>(context).getCurrentOrder,
              Text(
                'Previous Orders',
                style: kLightTextStyle,
              ),
              Column(
                children: Provider.of<MyOrders>(context).getPreviousOrderTiles,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
