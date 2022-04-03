import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foody/components/notifications_data.dart';
import 'package:foody/constants.dart';
import 'package:foody/screens/YourOrder_Screen.dart';
import 'package:foody/screens/rating_screen.dart';
import 'package:intl/intl.dart';
import 'package:foody/components/order_tile.dart';
import 'package:provider/provider.dart';
import 'package:foody/components/my_orders_data.dart';
import 'package:foody/screens/tracking_screen.dart';

String inLineText(BuildContext context, OrderTile currentOrderTile) {
  String status = currentOrderTile.status;
  String myText = '';
  if (status == 'Preparing') {
    myText = 'Your order has been confirmed';
  } else if (status == 'Out to delivery') {
    myText = 'Your order is out to delivery now';
  } else if (status == 'Waiting') {
    myText = 'Delivery boy is waiting you';
  } else if (status == 'Delivered') {
    myText = 'Your order has been delivered successfully';
  }
  return myText;
}

String inLinePromoCode(String promoCode, int amount) {
  return 'Order now with promo code "$promoCode" and get %$amount discount!';
}

String actionText(String orderOrPromo, OrderTile currentOrderTile) {
  String myText = '';
  if (orderOrPromo == 'O') {
    String status = currentOrderTile.status;

    if (status == 'Delivered') {
      myText = 'Rate your order';
    } else {
      myText = 'Track Order';
    }
  } else {
    myText = 'Copy promo code';
  }
  return myText;
}

class NotificationTile extends StatelessWidget {
  final String myTime;
  final String orderOrPromo;
  final OrderTile currentOrder;
  final String promoCode;
  final int discountPercentage;
  final String readOrUnread;
  final BuildContext ctx;

  NotificationTile({
    required this.myTime,
    required this.orderOrPromo,
    required this.currentOrder,
    required this.ctx,
    this.promoCode = 'XYZ',
    this.discountPercentage = 0,
    this.readOrUnread = 'U',
  });

  void doYourFunction(context) {
    if (orderOrPromo == 'O') {
      if (currentOrder.status == 'Delivered') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RatingScreen(
              orderID: currentOrder.orderID,
            ),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => YourOrderScreen(
              orderID: currentOrder.orderID,
            ),
          ),
        );
      }
    } else {
      Clipboard.setData(ClipboardData(text: promoCode)).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Promo code copied to clipboard")));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyNotificationsData>(
      builder: (mainCTX, value, child) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () {
            Provider.of<MyNotificationsData>(context, listen: false)
                .markAllAsRead();
          },
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            side: BorderSide(
                width: 0.5, color: Colors.black12, style: BorderStyle.solid),
          ),
          trailing: (readOrUnread == 'U')
              ? Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: CircleAvatar(
                    radius: 6.0,
                    backgroundColor: kOrangeColorInHex,
                  ),
                )
              : Container(),
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  myTime,
                  style: kLightTextStyle.copyWith(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Urbanist-Bold',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Text(
                    (orderOrPromo == 'O')
                        ? inLineText(context, currentOrder)
                        : inLinePromoCode(promoCode, discountPercentage),
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: GestureDetector(
                    onTap: () {
                      doYourFunction(context);
                    },
                    child: Text(
                      actionText(orderOrPromo, currentOrder),
                      style: TextStyle(
                        fontFamily: 'Urbanist-Bold',
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0,
                        color: kOrangeColorInHex,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
