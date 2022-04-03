import 'package:flutter/material.dart';
import 'package:foody/screens/Basket_screen.dart';
import 'package:foody/screens/Checkout.dart';
import 'package:foody/screens/MenuScreen.dart';
import 'package:foody/screens/SmartVillage_Screen.dart';
import 'package:foody/screens/User_screen.dart';
import 'package:foody/screens/Wallet_Screen.dart';
import 'package:foody/screens/YourOrder_Screen.dart';
import 'package:foody/screens/contactus_screen.dart';
import 'package:foody/screens/search_screen.dart';
import 'package:foody/screens/notifications_screen.dart';
import 'package:foody/screens/splash_screen.dart';
import 'package:foody/screens/track_orders.dart';
import 'package:foody/screens/tracking_screen.dart';
import 'package:foody/screens/welcome_screen.dart';
import 'package:foody/screens/login_screen.dart';
import 'package:foody/screens/registration_screen.dart';
import 'package:foody/screens/rating_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:foody/screens/home_screen.dart';
import 'package:foody/screens/empty_screen.dart';
import 'package:foody/screens/User_screen.dart';
import 'package:foody/screens/foodDetails_screen.dart';
import 'package:provider/provider.dart';
import 'components/my_orders_data.dart';
import 'components/notifications_data.dart';

void main() => runApp(Foody());

class Foody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyOrders>(
          create: (_) => MyOrders(),
        ),
        ChangeNotifierProvider<MyNotificationsData>(
          create: (_) => MyNotificationsData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Urbanist',
        ),
        initialRoute: SplashScreen.id,
        routes: {
          SplashScreen.id: (context) => SplashScreen(),
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          UserPage.id: (context) => UserPage(),
          ContactUsScreen.id: (context) => ContactUsScreen(),
          HomePage.id: (context) => HomePage(),
          SmartVillageScreen.id: (context) => SmartVillageScreen(),
          // EmptyPage.id: (context) => EmptyPage(),
          WalletScreen.id: (context) => WalletScreen(),
          OrderScreen.id: (context) => OrderScreen(),
          TrackOrdersScreen.id: (context) => TrackOrdersScreen(),
          FoodDetails.id: (context) =>
              FoodDetails(imagePath: 'images/Contact_us.png'),
          NotificationsScreen.id: (context) => NotificationsScreen(),
          BasketScreen.id: (context) => BasketScreen(),
          CheckoutScreen.id: (context) => CheckoutScreen(),
          RatingScreen.id: (context) => RatingScreen(),

          SearchPage.id: (context) => SearchPage(),
          TrackingScreen.id: (context) => TrackingScreen(),
          YourOrderScreen.id: (context) => YourOrderScreen(),
        },
      ),
    );
  }
}
