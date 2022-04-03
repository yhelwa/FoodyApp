import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foody/components/notifications_data.dart';
import 'package:foody/constants.dart';
import 'package:flutter/material.dart';
import 'package:foody/constants.dart';
import 'package:foody/screens/User_screen.dart';
import 'package:foody/screens/contactus_screen.dart';
import 'package:foody/constants.dart';
import 'package:foody/components/profile_widgets.dart';
import 'package:foody/screens/empty_screen.dart';
import 'package:foody/screens/search_screen.dart';
import 'package:foody/screens/track_orders.dart';
import 'package:foody/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'Wallet_Screen.dart';
import 'package:foody/components/order_tile.dart';
import 'package:intl/intl.dart';
import 'package:foody/components/my_orders_data.dart';
import 'package:foody/screens/notifications_screen.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget body = OrderScreen();
  int noOfUnreadNotifications = 0;

  @override
  Widget build(BuildContext context) {
    final section;
    noOfUnreadNotifications =
        Provider.of<MyNotificationsData>(context).getNoOfUnreadNotifications;
    //noOfUnreadNotifications = Provider.of<MyNotificationsData>(context).getNoOfUnreadNotifications;

    double deviceSizeHeight = MediaQuery.of(context).size.height;
    double deviceSizeWidth = MediaQuery.of(context).size.width;

    /// You can easily control the section for example inside the initState where you check
    /// if the user logged in, or other related logic

    return Scaffold(
      appBar: AppBar(
        actions: [
          (title == "Menu")
              ? IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SearchPage.id);
                    print("aywaa");
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ))
              : Container(),
        ],
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xfffafafa),
        title: GestureDetector(
          onTap: () {
            if (title.contains('building')) {}
          },
          child: new Text(
            title,
            style: title.toLowerCase().contains('building')
                ? TextStyle(
                    color: Colors.black26,
                    fontSize: 15.0,
                    fontFamily: 'Urbanist-Bold',
                    fontWeight: FontWeight.w600,
                  )
                : TextStyle(
                    color: Colors.black,
                    fontFamily: 'Urbanist-Bold',
                    fontWeight: FontWeight.w600,
                  ),
          ),
        ),
      ),

      /// Drawer/////////////////////////////////////
      drawer: Drawer(
        child: new ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 180.0, top: 8),
              child: CircleAvatar(
                  radius: 50, backgroundImage: AssetImage('images/logo1.png')),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 0),
              child: Text(
                'Mohammed Ahmed',
                style: TextStyle(
                  // color: Colors.black,
                  fontSize: deviceSizeHeight * .017,
                  // fontFamily: 'Urbanist-Bold',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 8, bottom: 8),
              child: Text(
                '+20 111 222 3333',
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: deviceSizeHeight * .017,
                  // fontFamily: 'Urbanist-Bold',
                  // fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Divider(
              indent: 20,
              endIndent: 20,
            ),
            Padding(padding: EdgeInsets.only(top: 8)),
            ListTile(
                title: Text("Menu"),
                leading: Icon(Icons.flip_to_front),
                onTap: () {
                  setState(() {
                    Navigator.pop(context);
                    title = "🏘️ 16-A Building";
                    body = OrderScreen();
                  });
                }),
            ListTile(
                title: Text("Your Wallet"),
                leading: FaIcon(FontAwesomeIcons.wallet),
                onTap: () {
                  setState(() {
                    Navigator.pop(context);
                    title = "Wallet";
                    body = WalletScreen();
                  });
                }),
            ListTile(
                title: Text("Profile"),
                leading: FaIcon(FontAwesomeIcons.user),
                onTap: () {
                  setState(() {
                    Navigator.pop(context);
                    title = "Profile";
                    body = UserPage();
                  });
                  /*Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UserPage()));
                    */
                }),
            ListTile(
                title: Text("Track Orders"),
                leading: FaIcon(FontAwesomeIcons.listUl),
                onTap: () {
                  setState(() {
                    Navigator.pop(context);
                    title = "My Orders";
                    body = TrackOrdersScreen();
                  });
                }),
            ListTile(
                title: Text("Notifications"),
                leading: FaIcon(FontAwesomeIcons.bell),
                trailing: CircleAvatar(
                  radius: 12.0,
                  child: Text(
                    noOfUnreadNotifications.toString(),
                    style: TextStyle(
                      color: (noOfUnreadNotifications == 0)
                          ? kLightWhiteColor
                          : Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Urbanist-Bold',
                    ),
                  ),
                  backgroundColor: (noOfUnreadNotifications == 0)
                      ? kLightWhiteColor
                      : kOrangeColorInHex,
                ),
                onTap: () {
                  setState(() {
                    Navigator.pop(context);
                    title = "Notifications";
                    body = NotificationsScreen();
                  });
                }),
            ListTile(
              title: Text("Contact Us"),
              onTap: () {
                setState(() {
                  title = "Contact Us";
                  Navigator.pop(context);
                  body = ContactUsScreen();
                });
              },
              leading: FaIcon(FontAwesomeIcons.headset),
            ),
            _createFooterItem(
              icon: Icons.logout,
              text: 'Logout',
              onTap: () {
                setState(() {
                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginScreen.id, (route) => false);
                });
              },
            )
          ],
        ),
      ),
      body: Container(
        child: body,
      ),
    );
  }
}

Widget _createFooterItem(
    {required IconData icon,
    required String text,
    required GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon, color: Colors.black26),
        Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text(
            text,
            style: TextStyle(color: Colors.black26),
          ),
        )
      ],
    ),
    onTap: onTap,
  );
}
