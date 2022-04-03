import 'package:flutter/material.dart';
import 'package:foody/components/my_orders_data.dart';
import 'package:foody/components/order_tile.dart';
import 'package:foody/constants.dart';
import 'package:foody/screens/rating_screen.dart';
import 'package:provider/provider.dart';
import 'package:foody/components/notifications_data.dart';
import 'package:intl/intl.dart';
import 'package:foody/components/notification_tile.dart';

class NotificationsScreen extends StatefulWidget {
  static const String id = 'notifications_screen';

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  Map<String, int> promoCodes = {'XYZ': 50, 'SUMMER2021': 40, 'FOODY25': 25};

  int noOfUnreadNotifications = 0;
  OrderTile dummyOrderTile = OrderTile(
    orderID: -1,
    price: -1,
    date: '1 Jan 1',
    status: 'Not Order',
    time: DateFormat.jm().format(DateTime.now()),
  );

  void fillOrders(BuildContext context) {
    Provider.of<MyNotificationsData>(context).setOrders(
      Provider.of<MyOrders>(context).getCurrentOrder,
      Provider.of<MyOrders>(context).getPreviousOrderTiles,
    );
  }

  void fillPromoCodes(BuildContext context) {
    Provider.of<MyNotificationsData>(context).setPromoCodes(promoCodes);
  }

  List<NotificationTile> makeNotificationsTiles(BuildContext context) {
    List<OrderTile> previousOrders =
        Provider.of<MyOrders>(context).getPreviousOrderTiles;
    List<NotificationTile> myNotificationTiles = previousOrders
        .map(
          (order) => NotificationTile(
            orderOrPromo: 'O',
            ctx: context,
            myTime: order.time,
            currentOrder: order,
            readOrUnread: Provider.of<MyNotificationsData>(context)
                .getOrderState(order.orderID),
          ),
        )
        .toList();

    return myNotificationTiles;
  }

  List<NotificationTile> makePromoCodesNotificationsTiles(
      BuildContext context) {
    List<NotificationTile> myNotificationTiles = [];
    promoCodes.forEach((key, value) {
      myNotificationTiles.add(
        NotificationTile(
          ctx: context,
          orderOrPromo: 'P',
          myTime: dummyOrderTile.time,
          currentOrder: dummyOrderTile,
          discountPercentage: value,
          promoCode: key,
        ),
      );
    });

    return myNotificationTiles;
  }

  @override
  Widget build(BuildContext context) {
    double deviceSizeHeight = MediaQuery.of(context).size.height;
    double deviceSizeWidth = MediaQuery.of(context).size.width;
    fillOrders(context);
    fillPromoCodes(context);
    makeNotificationsTiles(context);
    noOfUnreadNotifications =
        Provider.of<MyNotificationsData>(context).getNoOfUnreadNotifications;
    OrderTile currentOrder = Provider.of<MyOrders>(context).getCurrentOrder;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Just now',
                style: kLightTextStyle.copyWith(
                  fontSize: deviceSizeHeight * .017,
                ),
              ),
              NotificationTile(
                currentOrder: currentOrder,
                ctx: context,
                myTime: DateFormat.jm().format(DateTime.now()),
                orderOrPromo: 'O',
              ),
              Text(
                'Today',
                style: kLightTextStyle.copyWith(
                  fontSize: deviceSizeHeight * .017,
                ),
              ),
              ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                children: makePromoCodesNotificationsTiles(context),
              ),
              Text(
                'Recently',
                style: kLightTextStyle.copyWith(
                  fontSize: deviceSizeHeight * .017,
                ),
              ),
              ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                children: makeNotificationsTiles(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
