import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:foody/components/profile_widgets.dart';
import 'package:foody/components/rounded_button.dart';
import 'package:foody/constants.dart';

class UserPage extends StatefulWidget {
  static const String id = 'profile_screen';

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final name = TextEditingController();
  final company = TextEditingController();
  final birthDate = TextEditingController();
  final gender = TextEditingController();
  final phoneNumber = TextEditingController();
  final emailAddress = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double deviceSizeHeight = MediaQuery.of(context).size.height;
    double deviceSizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   elevation: 0,
      //   centerTitle: true,
      //   iconTheme: IconThemeData(color: Colors.black),
      //   backgroundColor: Color(0xfffafafa),
      //   title: new Text(
      //     "Profile",
      //     style: TextStyle(color: Colors.black),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 8.0),
        child: ListView(
          children: [
            ProfileWidget(
              imagePath: 'images/logo1.png',
              onClicked: () async {},
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Personal Details",
              style: TextStyle(
                  color: Colors.black38, fontSize: deviceSizeHeight * 0.017),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 15),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  //    validator: validateName,
                  controller: name,
                  decoration: InputDecoration(
                    focusedBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    filled: true,
                    enabledBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    labelText: 'Name',
                    hintText: 'Enter your name',
                    hintStyle: TextStyle(
                      color: Colors.black26,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.black26,
                    ),
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 15),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  //    validator: validateName,
                  controller: company,
                  decoration: InputDecoration(
                    focusedBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    labelText: 'Company',
                    hintText: 'Enter you company name',
                    labelStyle: TextStyle(
                      color: Colors.black26,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.black26,
                    ),
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 15),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  //    validator: validateName,
                  controller: birthDate,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    labelText: 'Birthdate',
                    hintText: 'Enter your Birthdate',
                    hintStyle: TextStyle(
                      color: Colors.black26,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.black26,
                    ),
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 15, bottom: 10),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  //    validator: validateName,
                  controller: gender,
                  decoration: InputDecoration(
                    focusedBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    filled: true,
                    enabledBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    labelText: 'Gender',
                    hintText: 'Enter your Gender',
                    hintStyle: TextStyle(
                      color: Colors.black26,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.black26,
                    ),
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
            Text(
              "Account Settings",
              style: TextStyle(
                  color: Colors.black38, fontSize: deviceSizeHeight * 0.017),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 15),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  //    validator: validateName,
                  controller: phoneNumber,
                  decoration: InputDecoration(
                    focusedBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    filled: true,
                    enabledBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    labelText: 'Phone Number',
                    hintText: 'Enter your Phone Number',
                    hintStyle: TextStyle(
                      color: Colors.black26,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.black26,
                    ),
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 15),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  //    validator: validateName,
                  controller: emailAddress,
                  decoration: InputDecoration(
                    focusedBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    filled: true,
                    enabledBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    labelText: 'Email Address',
                    hintText: 'Enter your Email',
                    labelStyle: TextStyle(
                      color: Colors.black26,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.black26,
                    ),
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, right: 10, bottom: 30),
              child: Material(
                color: Color(0xfffafafa),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: kOrangeColorInHex)),
                  onPressed: () {
                    print("change password");
                  },
                  minWidth: deviceSizeHeight * 0.2,
                  height: deviceSizeHeight * 0.05,
                  child: Text(
                    "Change Password",
                    style: TextStyle(
                      color: kOrangeColorInHex,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.all(10),
          child: RoundedButton(
            title: "Save Changes",
            color: kOrangeColorInHex,
            onPressed: () {
              print("Saved!");
            },
          )),
    );
  }
}
