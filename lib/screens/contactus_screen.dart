import 'package:flutter/material.dart';
import 'package:foody/components/rounded_button2.dart';

import '../constants.dart';

class ContactUsScreen extends StatefulWidget {
  static const String id = 'contact_us';

  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xfffafafa),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('images/Contact_us.png'),
                ),
              ),
              Card(
                // elevation: 10,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 8),
                            child: RichText(
                              text: TextSpan(
                                //   style: Theme.of(context).textTheme.body1,
                                children: <TextSpan>[
                                  new TextSpan(
                                      text: 'Get in touch\n\n',
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  new TextSpan(
                                    text: 'Your email address',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(12),
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2)),
                                ),
                                hintText: "Ex: AhmedMohamed@exmp.com",
                                hintStyle: TextStyle(color: Colors.black26),
                                fillColor: Color(0xfff7f7f7),
                                filled: true,
                              ),
                              keyboardType: TextInputType.visiblePassword,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 8),
                            child: RichText(
                              text: TextSpan(
                                //   style: Theme.of(context).textTheme.body1,
                                children: <TextSpan>[
                                  new TextSpan(
                                    text: 'Your Message',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(12),
                            height: 100,
                            child: TextField(
                              maxLines: 5,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2)),
                                ),
                                hintText: "Enter a message here...",
                                hintStyle: TextStyle(color: Colors.black26),
                                fillColor: Color(0xfff7f7f7),
                                filled: true,
                              ),
                              keyboardType: TextInputType.visiblePassword,
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: RoundedButton2(
                        title: 'Send Message',
                        color: kOrangeColorInHex,
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Card(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 8),
                      child: RichText(
                        text: TextSpan(
                          //   style: Theme.of(context).textTheme.body1,

                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.phone_outlined,
                                size: 14,
                                color: kOrangeColorInHex,
                              ),
                            ),
                            new TextSpan(
                              text: '   Phone number\n\n',
                              style: new TextStyle(color: Colors.black),
                            ),
                            new TextSpan(
                              text: '   +20 111 222 3333',
                              style: TextStyle(color: Colors.black26),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Card(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                    child: RichText(
                      text: TextSpan(
                        //   style: Theme.of(context).textTheme.body1,

                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.location_on_outlined,
                              size: 14,
                              color: kOrangeColorInHex,
                            ),
                          ),
                          new TextSpan(
                              text: '   Company address\n\n',
                              style: new TextStyle(color: Colors.black)),
                          new TextSpan(
                            text:
                                '   Smart Village, 4th district, Building number x',
                            style: TextStyle(color: Colors.black26),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Card(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 8),
                      child: RichText(
                        text: TextSpan(
                          //   style: Theme.of(context).textTheme.body1,

                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.phone_outlined,
                                size: 14,
                                color: kOrangeColorInHex,
                              ),
                            ),
                            new TextSpan(
                                text: '    Email address\n\n',
                                style: new TextStyle(color: Colors.black)),
                            new TextSpan(
                              text: '     example@example.com',
                              style: TextStyle(color: Colors.black26),
                            ),
                          ],
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
