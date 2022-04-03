import 'package:flutter/material.dart';
import 'package:foody/constants.dart';
import 'package:foody/screens/rating_screen.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderTile extends StatelessWidget {
  final int orderID;
  final int price;
  final String date;
  final String status;
  final String time;

  OrderTile({
    required this.orderID,
    required this.price,
    required this.date,
    required this.status,
    required this.time,
  });

  int compareTo(String bDate) {
    String tempDate1 =
        DateFormat('y M d').format((DateFormat('d MMM y').parse(date)));
    List<int> myDate = tempDate1.split(' ').map(int.parse).toList();
    String tempDate2 =
        DateFormat('y M d').format((DateFormat('d MMM y').parse(bDate)));
    List<int> passedDate = tempDate2.split(' ').map(int.parse).toList();

    if (myDate[0] == passedDate[0]) {
      //same year
      if (myDate[1] == passedDate[1]) {
        //same month
        if (myDate[2] == passedDate[2]) {
          //same day
          return 0;
        } else if (myDate[2] < passedDate[2]) {
          return 1;
        } else {
          return -1;
        }
      } else if (myDate[1] < passedDate[1]) {
        return 1;
      } else {
        return -1;
      }
    } else if (myDate[0] < passedDate[0]) {
      return 1;
    } else {
      return -1;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color color = (status == 'Delivered') ? Colors.green : Colors.black;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          if ((status == 'Delivered')) {
            Navigator.pushNamed(context, RatingScreen.id);
          }
        },
        child: ListTile(
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            side: BorderSide(
                width: 0.5, color: Colors.black12, style: BorderStyle.solid),
          ),
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order ID: #' + orderID.toString(),
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Urbanist-Bold',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: FaIcon(
                          FontAwesomeIcons.wallet,
                          size: 12.0,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Text(
                        price.toString() + 'EGP',
                        style: TextStyle(
                          fontFamily: 'Urbanist-Bold',
                          fontWeight: FontWeight.w600,
                          fontSize: 15.0,
                          color: kOrangeColorInHex,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black38,
                  thickness: 0.6,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Status',
                            style: kLightTextStyle.copyWith(
                              fontSize: 12.0,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            status,
                            style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: 'Urbanist-Bold',
                              fontWeight: FontWeight.w600,
                              color: color,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 80.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Date',
                              style: kLightTextStyle.copyWith(
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              date,
                              style: TextStyle(
                                fontSize: 12.0,
                                fontFamily: 'Urbanist-Bold',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
