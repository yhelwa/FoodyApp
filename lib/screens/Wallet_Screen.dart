import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

class Wallet {
  final DateTime date;
  final double budget;

  Wallet(this.date, this.budget);
}

class WalletScreen extends StatefulWidget {
  static const String id = 'wallet_screen';

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final List<Wallet> walletList = [
    Wallet(DateTime.now(), 5.00),
    Wallet(DateTime.now(), -10.00),
    Wallet(DateTime.now(), 10.00)
  ];

  // Color myColor = (Wallet.budget < 0) ? Colors.red : Colors.green;

  @override
  Widget build(BuildContext context) {
    double deviceSizeHeight = MediaQuery.of(context).size.height;
    double deviceSizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      body: Container(
        child: Column(
          children: [
            Container(
              width: deviceSizeWidth * 0.95,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: kOrangeColorInHex,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      child: RichText(
                        text: TextSpan(
                          //   style: Theme.of(context).textTheme.body1,

                          children: [
                            new TextSpan(
                              text: '   My Balance\n\n',
                              style: new TextStyle(fontSize: 20),
                            ),
                            new TextSpan(
                              text: "   " +
                                  "${walletList[0].budget.toStringAsFixed(2) + 'EGP'}",
                              style: new TextStyle(
                                  fontSize: deviceSizeHeight * 0.028),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                  itemCount: walletList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      buildTripCard(context, index)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTripCard(BuildContext context, int index) {
    double deviceSizeHeight = MediaQuery.of(context).size.height;
    double deviceSizeWidth = MediaQuery.of(context).size.width;
    final wallet = walletList[index];
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
                        "${DateFormat('dd MMM yyyy').format(wallet.date).toString()}",
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: deviceSizeHeight * 0.023,
                          fontFamily: 'Urbanist-Bold',
                        ),
                      ),
                      // Spacer(),
                      // Spacer(),
                      Text(
                        "${wallet.budget.toStringAsFixed(2) + 'EGP'}",
                        style: TextStyle(
                          color:
                              (wallet.budget < 0) ? Colors.red : Colors.green,
                          fontSize: deviceSizeHeight * 0.023,
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
