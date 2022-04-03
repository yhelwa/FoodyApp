import 'package:flutter/material.dart';
import 'package:foody/components/order_tile.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:foody/components/my_orders_data.dart';

class MyNotificationsData extends ChangeNotifier {
  int _noOfUnreadNotifications = 0;
  Map<int, String> _ordersIDs = {};
  Map<String, String> _promoCodes = {};

  void setOrders(OrderTile currentOrder, List<OrderTile> previousOrders) {
    _ordersIDs[currentOrder.orderID] = 'U';
    for (int i = 0; i < previousOrders.length; i++) {
      _ordersIDs[previousOrders[i].orderID] = 'U';
    }
  }

  void setPromoCodes(Map<String, int> promoCodes) {
    promoCodes.forEach((key, value) {
      _promoCodes[key] = 'U';
    });
  }

  getPromoCodeState(String promoCode) {
    String myState = '';
    if (_promoCodes.containsKey(promoCode)) {
      myState = _ordersIDs[promoCode]!;
    }
    return myState;
  }

  String getOrderState(int orderID) {
    String myState = '';
    if (_ordersIDs.containsKey(orderID)) {
      myState = _ordersIDs[orderID]!;
    }
    return myState;
  }

  void removeNotificationFromOrder(int orderID) {
    if (_ordersIDs.containsKey(orderID)) {
      if (_ordersIDs[orderID] == 'U') {
        _noOfUnreadNotifications--;
        _ordersIDs.update(orderID, (value) => 'R');
        notifyListeners();
      }
    }
  }

  void removeNotificationFromPromoCode(String promoCode) {
    if (_promoCodes.containsKey(promoCode)) {
      if (_promoCodes[promoCode] == 'U') {
        _noOfUnreadNotifications--;
        _promoCodes.update(promoCode, (value) => 'R');
        notifyListeners();
      }
    }
  }

  int get getNoOfUnreadNotifications {
    _noOfUnreadNotifications = 0;
    _ordersIDs.forEach((key, value) {
      if (value == 'U') {
        _noOfUnreadNotifications++;
      }
    });
    _promoCodes.forEach((key, value) {
      if (value == 'U') {
        _noOfUnreadNotifications++;
      }
    });
    int dummy = _noOfUnreadNotifications;
    return dummy;
  }

  void printOrdersMap() {
    _ordersIDs.forEach((key, value) {
      print('OrderID: $key, Read: $value');
    });
    print('Number of unread notifications now: $_noOfUnreadNotifications');
  }

  void markAllAsRead() {
    _ordersIDs.forEach((key, value) {
      value = 'R';
    });
    _promoCodes.forEach((key, value) {
      value = 'R';
    });
    _noOfUnreadNotifications = 0;
    notifyListeners();
  }
}
